import shutil
from pathlib import Path, PurePath
import os
pf = Path(os.getcwd()).parent.absolute()
rootdir = PurePath(pf,'Source')
for f in os.scandir(rootdir):
  datadir = PurePath(f,'Data')
  if os.path.isdir(datadir):
    shutil.rmtree(datadir)
