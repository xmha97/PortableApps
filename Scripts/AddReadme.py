import shutil
from pathlib import Path, PurePath
import os
pf = Path(os.getcwd()).parent.absolute()
rootdir = PurePath(pf,'Source')
for f in os.scandir(rootdir):
  appdir = PurePath(f,'App')
  dst_file = PurePath(appdir,'Readme.txt')
  os.remove(dst_file)
  shutil.copyfile(PurePath(pf,'Template','Readme.txt'),dst_file)
