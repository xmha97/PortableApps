import shutil
from pathlib import Path, PurePath
import os
pf = Path(os.getcwd()).parent.absolute()
if os.path.isdir(PurePath(pf,'Source','ObsidianPortableLegacyWin7_online')):
  shutil.rmtree(PurePath(pf,'Source','ObsidianPortableLegacyWin7_online'))
shutil.copytree(PurePath(pf,'Source','ObsidianPortableLegacyWin7'), PurePath(pf,'Source','ObsidianPortableLegacyWin7_online'))
shutil.rmtree(PurePath(pf,'Source','ObsidianPortableLegacyWin7_online','App','Obsidian-386'))
shutil.rmtree(PurePath(pf,'Source','ObsidianPortableLegacyWin7_online','App','Obsidian-amd64'))
shutil.rmtree(PurePath(pf,'Source','ObsidianPortableLegacyWin7_online','App','Obsidian-arm64'))
shutil.copyfile(PurePath(pf,'AppConfigs','ObsidianPortableLegacyWin7','installer.ini'),PurePath(pf,'Source','ObsidianPortableLegacyWin7_online','App','AppInfo','installer.ini'))
