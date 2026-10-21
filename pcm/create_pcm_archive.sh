#!/bin/sh
# Original packaging workflow: (c) 2024 @Bouni (MIT License).
set -eu
cd "$(dirname "$0")/.."

python3 - "$@" <<'PY'
import hashlib
import json
import os
from pathlib import Path
import re
import sys
import tempfile
from zipfile import ZipFile, ZIP_DEFLATED

version = sys.argv[1] if len(sys.argv) > 1 else "0.0.0"
if not re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9._+-]*", version):
    sys.exit("Invalid version: use letters, numbers, dots, underscores, plus signs, or hyphens.")

metadata = json.loads(Path("pcm/metadata.template.json").read_text(encoding="utf-8"))
metadata["versions"][0]["version"] = version
package_id = metadata["identifier"].replace(".", "_")
model_dir = "${KICAD10_3RD_PARTY}/3dmodels/" + package_id
libraries = {path.stem for path in Path("footprints").glob("*.pretty")}
destination = Path("pcm") / f"ts-kicad-lib-{version}.zip"

with tempfile.TemporaryDirectory(prefix="ts-kicad-pcm-", dir="pcm") as temporary:
    archive_path = Path(temporary) / destination.name
    with ZipFile(archive_path, "w", ZIP_DEFLATED) as archive:
        for directory in ("footprints", "symbols", "3dmodels"):
            if not Path(directory).is_dir():
                sys.exit(f"Missing content directory: {directory}")
            for path in sorted(Path(directory).rglob("*")):
                # KiCad editors leave git-ignored .bak files next to libraries.
                if not path.is_file() or path.suffix == ".bak":
                    continue
                if path.suffix in (".kicad_mod", ".kicad_sym"):
                    text = path.read_text(encoding="utf-8")
                    text = text.replace("${TECSMITH_3DMODEL_DIR}", model_dir)
                    # PCM adds this prefix to library nicknames by default.
                    text = re.sub(
                        r'(\(property "Footprint" ")([^":]+):',
                        lambda match: match[1] + ("PCM_" if match[2] in libraries else "") + match[2] + ":",
                        text,
                    )
                    archive.writestr(path.as_posix(), text)
                else:
                    archive.write(path, path.as_posix())
        archive.write("pcm/icon.png", "resources/icon.png")
        archive.writestr("metadata.json", json.dumps(metadata, indent=4) + "\n")
        install_size = sum(info.file_size for info in archive.infolist())
    archive_path.replace(destination)

values = {
    "VERSION": version,
    "DOWNLOAD_SHA256": hashlib.sha256(destination.read_bytes()).hexdigest(),
    "DOWNLOAD_SIZE": destination.stat().st_size,
    "DOWNLOAD_URL": f"https://github.com/tecsmith/ts-kicad-lib/releases/download/{version}/{destination.name}",
    "INSTALL_SIZE": install_size,
    "KICAD_VERSION": metadata["versions"][0]["kicad_version"],
    "PROJECT_NAME": metadata["name"],
}
if os.environ.get("GITHUB_ENV"):
    with open(os.environ["GITHUB_ENV"], "a", encoding="utf-8") as environment:
        environment.writelines(f"{key}={value}\n" for key, value in values.items())
print(f"Created {destination} ({values['DOWNLOAD_SIZE']} bytes)")
PY
