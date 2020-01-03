#!/bin/bash
set -e
_dir=`dirname "$(readlink -f "${0}")"`
_basedir=${_dir}
cd ${_basedir}
if [ -f ${_basedir}/dark-theme*.rpm ]; then
    rm -f ${_basedir}/darktheme*.rpm
fi
if [ -f ${_basedir}/dark-theme.spec ]; then
    rm -f ${_basedir}/dark-theme.spec
fi
if [ -d ${_basedir}/dark-theme ]; then
    rm -rf ${_basedir}/dark-theme
fi
mkdir -p ${_basedir}/dark-theme/usr/share/themes
cp -R ${_basedir}/DarK ${_basedir}/dark-theme/usr/share/themes/DarK
mkdir -p ${_basedir}/dark-theme/usr/share/icons
for _dir in $$(find ${_basedir}/icons -mindepth 1 -maxdepth 1 -type d); do \
	cp -R $$_dir ${_basedir}/dark-theme/usr/share/icons/;\
done;	
#extras
cp -R ${_basedir}/debian_symlinks/* ${_basedir}/dark-theme
mkdir -p ${_basedir}/dark-theme/etc/X11/xinit/xinitrc.d
mv ${_basedir}/dark-theme/etc/X11/Xsession.d/* ${_basedir}/dark-theme/etc/X11/xinit/xinitrc.d/
rm -rf ${_basedir}/dark-theme/etc/X11/Xsession.d

#creating the spec file:
cat <<\EOFALL> ${_basedir}/dark-theme.spec
Buildroot: BUILDROOT
Name: dark-theme
Version: 20191010003128
Release: 1
Summary: Minimalism at its finest.
License: CC-BY-SA_V4
Requires: findutils, coreutils, dmz-icon-theme-cursors
Provides: dark-theme = %version, mate-themes, xfwm4-themes, gnome-themes-accessibility, gnome-themes-accessibility-gtk2
Obsoletes: dark-theme <= %version
Recommends: libgtk-2_0-0, libgtk-3-0, libgdk_pixbuf-2_0-0, gtk2-engine-mist, plank, onboard, tint2, qt5ct, audacious, qmmp, obconf, libcanberra-gtk2-module, libcanberra-gtk3-module, yad, kdialog
Group: System/X11
BuildArch: noarch

%define _rpmdir ../
%define _unpackaged_files_terminate_build 0
%define _source_payload w0.gzdio
%define _binary_payload w0.gzdio
%description
Plain and simple dark theme

%post
#remove the old backup
if [ -d "/usr/share/themes/DarK/backup" ]; then
	rm -rf /usr/share/themes/DarK/backup
fi

%postun
#remove the backup files
if [ -d "/usr/share/themes/DarK/backup" ]; then
	rm -rf /usr/share/themes/DarK/backup
fi
if [ "$(readlink /etc/gtk/gtkrc)" = "gtkrc.dark" ]; then
	rm -f /etc/gtk/gtkrc
fi
if [ "$(readlink /etc/gtk-2.0/settings.ini)" = "settings.ini.dark" ]; then
	rm -f /etc/gtk-2.0/settings.ini
fi
if [ "$(readlink /etc/gtk-3.0/settings.ini)" = "settings.ini.dark" ]; then
	rm -f /etc/gtk-3.0/settings.ini
fi

%files
%defattr(-,root,root,-)
#%doc COPYING ReadMe.md LICENSE
%{_datadir}/*
%{_sysconfdir}/*
EOFALL

rpmbuild -bb --buildroot=${_basedir}/dark-theme ${_basedir}/dark-theme.spec
if [ -f ${_basedir}/../noarch/dark-theme*.rpm ]; then
	mv ${_basedir}/../noarch/dark-theme*.rpm ${_basedir}
	rm -rf ${_basedir}/../noarch ${_basedir}/dark-theme.spec
fi
