import shutil
from pathlib import Path, PurePath
import os
pf = Path(os.getcwd()).parent.absolute()
if os.path.isdir(PurePath(pf,'Source','ObsidianPortable_online')):
  shutil.rmtree(PurePath(pf,'Source','ObsidianPortable_online'))
shutil.copytree(PurePath(pf,'Source','ObsidianPortable'), PurePath(pf,'Source','ObsidianPortable_online'))
shutil.rmtree(PurePath(pf,'Source','ObsidianPortable_online','App','Obsidian-386'))
shutil.rmtree(PurePath(pf,'Source','ObsidianPortable_online','App','Obsidian-amd64'))
shutil.rmtree(PurePath(pf,'Source','ObsidianPortable_online','App','Obsidian-arm64'))
shutil.copyfile(PurePath(pf,'Online','ObsidianPortable','installer.ini'),PurePath(pf,'Source','ObsidianPortable_online','App','AppInfo','installer.ini'))
shutil.copyfile(PurePath(pf,'Online','ObsidianPortable','PortableApps.comInstallerCustom.nsh'),PurePath(pf,'Source','ObsidianPortable_online','Other','Source','PortableApps.comInstallerCustom.nsh'))
