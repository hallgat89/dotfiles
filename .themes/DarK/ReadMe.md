A dark and classic theme suite for classic X11 desktops.

![alt text](https://gitlab.com/sixsixfive/DarK/raw/master/preview.png)

## Features:

* Designed to stay in the background (no bling bling)
* Highlight color is Recolorable
* Lightweight, fast and simple
  * Oldschool/classic tabs
  * tiny files (No gradients or shapes)
* Full HiDPI support
* Plenty of App themes

### What themes are included?

* GTK1 colorscheme
* GTK2 theme
* GTK3 theme
* Qt5ct colorscheme
* Metacity
* Xfwm
* IceWM
* Openbox
* Xfce-notify
* XfDashboard
* Chromium/Chrome scrollbar extension
* GtkSourceView
* Mallit
* Onboard
* Plank
* SLiM
* WinAMP(QMMP/Audacious)
* Xfce-terminal

### System Requirements:

* Gtk 2 >= 2.4 (per default it requires the murrine and pixmap engine)
* Gtk 3 >= 3.20

Optional:

* [DarK-icons](https://gitlab.com/sixsixfive/DarK-icons)

## FAQ:

### Howto install?

#### Deb-like

```
apt install fakeroot libfile-fcntllock-perl debhelper findutils --no-install-recommends
make deb
dpkg -i dark-theme_*.deb && apt install -f --no-install-recommends
```

#### SuSE, GeckoLinux

```
zypper install fakeroot rpmbuild findutils
make rpm
zypper install --no-recommends dark-theme*.rpm
```

#### On other distributions

```
make PREFIX=/usr
```

### Howto change the GTK-theme color and settings?

Just run the [config.sh](https://gitlab.com/sixsixfive/DarK/blob/master/DarK/config.sh) script! eg:

```
cd __SYSPREFIX__/share/themes/DarK
sh config.sh
```

If you just want to change the themes color you can also run the [.changecolor.sh](https://gitlab.com/sixsixfive/DarK/blob/master/DarK/.changecolor.sh)

### Howto disable the GTK overlay scrollbars in X11

Note:

* Deb-like: SYSCONFIGDIR = /etc, XSESSIONCONFDIR = $(SYSCONFDIR)/X11/Xsession.d
* SuSE: SYSCONFIGDIR = /etc, XSESSIONCONFDIR = $(SYSCONFDIR)/X11/xinit/xinitrc.d

```
printf '\nexport GTK_OVERLAY_SCROLLING=0\nexport LIBOVERLAY_SCROLLBAR=0'>> $__XSESSIONCONFDIR__/99_disable_gtk_overlay_scrollbars
```

For root applications eg Synaptic
```
printf '\nGTK_OVERLAY_SCROLLING=0\nLIBOVERLAY_SCROLLBAR=0'>> __$ SYSCONFIGDIR__/environment
```

### Howto set the GTK themes on Icewm or Openbox

for GTK create a file ~/.gtkrc with something like:

```
include "$__SYSPREFIX__/share/themes/DarK/gtk/gtkrc"
```

for GTK2 create a file ~/.gtkrc-2.0 with something like:

```
gtk-theme-name="DarK"
```

for GTK3 create a file ${XDG_CONFIG_HOME}/gtk-3.0/settings.ini with something like:

```
[Settings]
gtk-theme-name=DarK
```

### GTK2 HiDPI notes

the theme includes a fake HiDPI theme for GTK2 that doubles all GTK2 borders, paddings. But unlike the GTK3 theme this needs some additional tweaks:

#### double the GTK2 icon size 

* this can be done with [gtk2-settings](https://developer.gnome.org/gtk2/stable/GtkSettings.html#GtkSettings--gtk-icon-sizes)
* on Xfce(@GTK2):

```
xfconf-query -c xsettings -p /Gtk/IconSizes -s "gtk-menu=32,32:gtk-small-toolbar=48,48:gtk-large-toolbar=48,48:gtk-dnd=96,96:gtk-button=48,48:gtk-dialog=96,96:gtk-panel=48,48:panel-applications-menu=48,48:panel-tasklist-menu=64,64:panel-menu=48,48:panel-directory-menu=48,48:panel-launcher-menu=48,48:panel-window-menu=48,48:panel-menu-bar=48,48:ev-icon-size-annot-window=32,32:webkit-media-button-size=48,48"
```

#### double your GTK2 font dpi (eg:192)

* again, this can be done with [gtk2-settings](https://developer.gnome.org/gtk2/stable/GtkSettings.html#GtkSettings--gtk-xft-dpi)
* on Xfce(@GTK2):

```
xfconf-query -c xsettings -p /Xft/DPI -s "192"
```

## Issues:

### The GTK 3 theme is missing checkboxes, arrows...

You have to install the included icon theme "DarK-theme-icons" into your $SYSPREFIX!

### I toggled the GTK AppMenu support but menubars are still on the windows

You also need to enable the GTK appmenu modules eg:

create a file 99_gtkappmenu in /etc/X11/Xsession.d containing:

```
if [ -n "$GTK_MODULES" ]; then
    GTK_MODULES="${GTK_MODULES}:appmenu-gtk-module"
else
    GTK_MODULES="appmenu-gtk-module"
fi
```

and reboot.

### Some GTK2 apps have missing icons GIMP <=2.10, Pidgin

If you don't use the [Dark](https://gitlab.com/sixsixfive/DarK-icons)-icons make sure you disable the iconoverrides with the config script or in the settings.ini! 

### Icons are unavailable in IceWM

Your IceWM needs to have PNG support otherwise you can create xpm files with the [icons_xpm.sh](https://gitlab.com/sixsixfive/DarK/blob/master/DarK/Extras/App_themes/icewm/DarK/icons_xpm.sh) script.

PS: Keep in mind that not all icons are loaded from the themes folder the dark icon theme folder mus be part of the IconPath key in your preferences file.

PPS: the theme only supports 16px icons so make sure you set all IconSizes in your preferences to 16px!

### Tuxgitar has white text and white background ###

Probably an issue with SWT you can add a workaround by adding the following to your gtk.css

```
scrolledwindow.frame>textview>text,
scrolledwindow.frame>widget,
widget>widget frame{
background-color:inherit;}

frame>label{
color:@fg_color;}
```

Note: there exist better working Qt-Ports.
