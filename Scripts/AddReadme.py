import shutil
from pathlib import Path
import os

# Get the root directory
pf = Path(os.getcwd()).parent.absolute()
rootdir = pf / 'Source'

# Iterate through subdirectories in Source
for f in rootdir.iterdir():
    if f.is_dir():  # Ensure it's a directory
        appdir = f / 'App'
        dst_file = appdir / 'Readme.txt'

        # Ensure App directory exists
        if appdir.exists():
            # Remove existing Readme.txt if it exists
            if dst_file.exists():
                dst_file.unlink()

            # Copy new Readme.txt
            shutil.copyfile(pf / 'Template' / 'Readme.txt', dst_file)
