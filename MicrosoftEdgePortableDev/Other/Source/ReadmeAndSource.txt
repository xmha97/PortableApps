Microsoft Edge Portable Launcher
===============================
Copyright 2004-2021 John T. Haller of PortableApps.com
Copyright 2008-2010 Dan Bugglin

Website: https://portableapps.com/go/MicrosoftEdgePortable

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

ABOUT GOOGLE CHROME PORTABLE
============================
The Microsoft Edge Portable Launcher allows you to run Edge from a removable drive
whose letter changes as you move it to another computer.  The browser and the
profile can be entirely self-contained on the drive and then used on any Windows
computer.  Specific configuration changes are made to the edge.rdf so that
your extensions will still work as the drive letter changes.


LICENSE
=======
This code is released under the GPL. You can find the full code here:

https://sourceforge.net/projects/portableapps/files/Source/Microsoft%20Edge/Launcher/

If you use the launcher or code in your own product, please give
proper and prominent attribution.


INSTALLATION / DIRECTORY STRUCTURE
==================================
By default, the program expects the following directory structure:

-\ <--- Directory with MicrosoftEdgePortable.exe
	+\App\
		+\Edge-bin\
	+\Data\
		+\profile\
		+\settings\
		

GOOGLECHROMEPORTABLE.INI CONFIGURATION
======================================
The MicrosoftEdgePortable.exe launcher will look for MicrosoftEdgePortable.ini
within its directory.  If you are happy with the default options, it is not necessary,
though.  There is an example INI included with this package to get you started within
the Other\Source directory.  Note that it will not work from this location as it must
be placed in the same directory as MicrosoftEdgePortable.exe.  The INI file format
and options are described within the INI file.


CURRENT LIMITATIONS
===================
Passwords Not Saved Between PCs By Default: Microsoft Edge stores passwords in such a way that they are encrypted in a way tied to current PC. While the passwords are not kept or left behind on the PC itself, they won't be retrievable when you move to a new PC. We've added password portability as an advanced option, though, which you can enable by reading the help.html file.

Certificates Not Portable: Microsoft Edge has no certificate manager. It uses Windows' certificates manager. So, any certificates you install through the Microsoft Edge interface are stored on the current local machine and will not travel with you. Thus, you should not use any private certificates with Microsoft Edge except on your own PC.

Some Settings/Extensions Locked Per PC: Microsoft Edge locks specific settings to a given PC. Details are included in this post. This behavior is by design by the Edge team. If you would like this changed, please file a bug with the Edge team. A suggested workaround is to sign in to Microsoft to restore all settings and extensions and to use an extension such as Session Buddy to maintain your session state as you move PCs. Note that PortableApps.com has not evaluated this extension.