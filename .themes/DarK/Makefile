PREFIX = /usr/local
THEME = DarK
DESTDIR = $(PREFIX)
SYSCONFDIR = /etc
XSESSIONCONFDIR = $(SYSCONFDIR)/X11/Xsession.d
GTKTHEMEDIR = $(PREFIX)/share/themes
ICONTHEMEDIR = $(PREFIX)/share/icons
####EXTRAS! -FIXME! but no priority!
#CHROMEEXTDIR = $(PREFIX)/share/chromium/extensions
GTKSOURCEVIEW2THEMEDIR = $(PREFIX)/share/gtksourceview-2.0/styles
GTKSOURCEVIEW3THEMEDIR = $(PREFIX)/share/gtksourceview-3.0/styles
ICEWMTHEMEDIR = $(PREFIX)/share/icewm/themes
MALLITHEMEDIR = $(PREFIX)/share/maliit/plugins/org/maliit/styles
MATEPANELTHEMEDIR = $(PREFIX)/share/mate-panel/layouts
MATEWINDOWAPPLETSTHEMEDIR = $(ICONTHEMEDIR)/mate-window-applets
ONBOARDTEHEMEDIR = $(PREFIX)/share/onboard/themes
PLANKTHEMEDIR = $(PREFIX)/share/plank/themes
QT5CTDIR = $(PREFIX)/share/qt5ct
SLIMTHEMEDIR = $(PREFIX)/share/slim/themes
TINT2THEMEDIR = $(PREFIX)/share/tint2
AUDACIOUSTHEMEDIR = $(PREFIX)/share/Skins
QMMPTHEMEDIR = $(PREFIX)/share/qmmp/skins
XFCE4TERMINALTHEMEDIR = $(PREFIX)/share/xfce4/terminal/colorschemes
GIMP2THEMEDIR = $(PREFIX)/share/gimp/2.0/themes

.PHONY: install installextras installx11conf uninstall uninstallextras uninstallx11conf deb
info:
	@echo ""
	@echo "run \"make deb\" to build a debian unstable package that contains everything"
	@echo ""
	@echo "run \"make rpm\" to build a SuSE Tumbleweed package that contains everything"
	@echo ""
	@echo "run \"make install\" to install the $(THEME)-theme to $(PREFIX)"
	@echo "run \"make uninstall\" to uninstall the $(THEME)-theme from $(PREFIX)"
	@echo ""
	@echo "!!!The following are also available but completly unspported!!!"
	@echo "run \"make installextras\" to install all the subthemes to $(PREFIX)"
	@echo "run \"make installx11conf\" to install all the X11confs to $(SYSCONFDIR)"
	@echo "run \"make uninstallextras\" to uninstall all subthemes from $(PREFIX)"
	@echo "run \"make uninstallx11conf\" to uninstall all X11confs from $(SYSCONFDIR)"
	@echo ""

.ONESHELL:
SHELL = /bin/bash
#.SHELLFLAGS = -ex
#bashism here, so force bash!
install:
#BASETHEME
	for _dir in $$(find DarK -type d -not -type f -not -type l); do \
		install -d "$${_dir/DarK/$(GTKTHEMEDIR)/DarK}" ;\
	done;
	for _file in $$(find DarK -type f -not -type d -not -type l); do \
		install -D "$$_file" "$${_file/DarK/$(GTKTHEMEDIR)/DarK}" ;\
	done;
	for _link in $$(find DarK -type l); do \
		cp -P  "$$_file" "$${_file/DarK/$(GTKTHEMEDIR)/DarK}" ;\
	done;
#BASEICONS
	for _dir in $$(find icons -type d -not -type f -not -type l); do \
		install -d "$${_dir/icons/$(ICONTHEMEDIR)}" ;\
	done;
	for _file in $$(find icons -type f -not -type d -not -type l); do \
		install -D "$$_file" "$${_file/icons/$(ICONTHEMEDIR)}" ;\
	done;
	for _link in $$(find icons -type l); do \
		cp -P  "$$_link" "$${_link/icons/$(ICONTHEMEDIR)}" ;\
	done;
installextras:
#installs everything except the chromium scrollbar extension
#HIDPIBASE
	ln -s $(GTKTHEMEDIR)/DarK/Extras/Sub_themes/DarK@2 $(GTKTHEMEDIR)/DarK@2
#Appthemes
	install -d $(GTKTHEMEDIR)
	install -d $(GTKSOURCEVIEW2THEMEDIR)
	install -d $(ICEWMTHEMEDIR)
	install -d $(MALLITHEMEDIR)
	install -d $(MATEPANELTHEMEDIR)
	install -d $(MATEPANELTHEMEDIR)
	install -d $(ICONTHEMEDIR)/mate-window-applets
	install -d $(ONBOARDTEHEMEDIR)
	install -d $(PLANKTHEMEDIR)
	install -d $(QT5CTDIR)/colors
	install -d $(SLIMTHEMEDIR)
	install -d $(TINT2THEMEDIR)
	install -d $(AUDACIOUSTHEMEDIR)
	install -d $(QMMPTHEMEDIR)
	install -d $(XFCE4TERMINALTHEMEDIR)
	install -d $(GIMP2THEMEDIR)
	ln -s $(GTKTHEMEDIR)/DarK/Extras/App_themes/gtksourceview/Dark.xml $(GTKSOURCEVIEW2THEMEDIR)/Dark.xml
	ln -s $(GTKTHEMEDIR)/DarK/Extras/App_themes/icewm/Dark $(ICEWMTHEMEDIR)/Dark
	ln -s $(GTKTHEMEDIR)/DarK/Extras/App_themes/mallit/Dark $(MALLITHEMEDIR)/Dark
	ln -s $(GTKTHEMEDIR)/DarK/Extras/App_themes/mate-panel/layouts/dark-tweak.layout $(MATEPANELTHEMEDIR)/dark-tweak.layout
	ln -s $(GTKTHEMEDIR)/DarK/Extras/App_themes/mate-panel/layouts/dark-tweak.panel $(MATEPANELTHEMEDIR)/dark-tweak.panel
	ln -s $(GTKTHEMEDIR)/DarK/Extras/App_themes/mate-window-applets/DarK $(ICONTHEMEDIR)/mate-window-applets/DarK
	ln -s $(GTKTHEMEDIR)/DarK/Extras/App_themes/mate-window-applets/DarK@2 $(ICONTHEMEDIR)/mate-window-applets/DarK@2
	ln -s $(GTKTHEMEDIR)/DarK/Extras/App_themes/onboard/DarK.colors $(ONBOARDTEHEMEDIR)/DarK.colors
	ln -s $(GTKTHEMEDIR)/DarK/Extras/App_themes/onboard/DarK.theme $(ONBOARDTEHEMEDIR)/DarK.theme
	ln -s $(GTKTHEMEDIR)/DarK/Extras/App_themes/onboard/DarK@2.theme $(ONBOARDTEHEMEDIR)/DarK@2.theme
	ln -s $(GTKTHEMEDIR)/DarK/Extras/App_themes/plank/DarK $(PLANKTHEMEDIR)/DarK
	ln -s $(GTKTHEMEDIR)/DarK/Extras/App_themes/plank/DarK@2 $(PLANKTHEMEDIR)/DarK@2
	ln -s $(GTKTHEMEDIR)/DarK/Extras/App_themes/Qt5ct/colors/DarK.conf $(QT5CTDIR)/colors/DarK.conf
	ln -s $(GTKTHEMEDIR)/DarK/Extras/App_themes/SLiM/DarK $(SLIMTHEMEDIR)/DarK
	ln -s $(GTKTHEMEDIR)/DarK/Extras/App_themes/tint2/DarK.tint2rc $(TINT2THEMEDIR)/DarK.tint2rc
	ln -s $(GTKTHEMEDIR)/DarK/Extras/App_themes/WinAMP/DarK $(AUDACIOUSTHEMEDIR)/DarK
	ln -s $(GTKTHEMEDIR)/DarK/Extras/App_themes/WinAMP/DarK $(QMMPTHEMEDIR)/DarK
	ln -s $(GTKTHEMEDIR)/DarK/Extras/App_themes/xfce-terminal/DarK.theme $(XFCE4TERMINALTHEMEDIR)/DarK.theme
	ln -s $(GTKTHEMEDIR)/DarK $(GIMP2THEMEDIR)/DarK
installx11conf:
	install -D $(CURDIR)/debian_symlinks/etc/X11/Xsession.d/99_enable_canberra_dark $(XSESSIONCONFDIR)/99_enable_canberra_dark
	install -D $(CURDIR)/debian_symlinks/etc/X11/Xsession.d/99_enable_pidgin_theme_dark $(XSESSIONCONFDIR)/99_enable_pidgin_theme_dark

#full package
deb:
	fakeroot debian/rules binary
rpm:
	chmod +x $(CURDIR)/.buildsuserpm.sh
	fakeroot sh -c $(CURDIR)/.buildsuserpm.sh

uninstall:
	rm -rf $(GTKTHEMEDIR)/$(THEME)
	rm -rf $(ICONTHEMEDIR)/$(THEME)-theme-icons
#Appthemes
uninstallextras:
	rm -rf $(GTKTHEMEDIR)/DarK@2
	rm -f $(GTKSOURCEVIEW2THEMEDIR)/Dark.xml
	rm -rf $(ICEWMTHEMEDIR)/Dark
	rm -rf $(MALLITHEMEDIR)/Dark
	rm -f $(MATEPANELTHEMEDIR)/dark-tweak.layout
	rm -f $(MATEPANELTHEMEDIR)/dark-tweak.panel
	rm -rf $(ICONTHEMEDIR)/mate-window-applets/DarK
	rm -rf $(ICONTHEMEDIR)/mate-window-applets/DarK@2
	rm -f $(ONBOARDTEHEMEDIR)/DarK.colors
	rm -f $(ONBOARDTEHEMEDIR)/DarK.theme
	rm -f $(ONBOARDTEHEMEDIR)/DarK@2.theme
	rm -rf $(PLANKTHEMEDIR)/DarK
	rm -rf $(PLANKTHEMEDIR)/DarK@2
	rm -f $(QT5COLORDIR)/colors/DarK.conf
	rm -rf $(SLIMTHEMEDIR)/DarK
	rm -f $(TINT2THEMEDIR)/DarK.tint2rc
	rm -rf $(AUDACIOUSTHEMEDIR)/DarK
	rm -rf $(QMMPTHEMEDIR)/DarK
	rm -f $(XFCE4TERMINALTHEMEDIR)/DarK.theme
	rm -rf $(GIMP2THEMEDIR)/DarK
uninstallx11conf:
	rm -f $(XSESSIONCONFDIR)/99_enable_canberra_dark
	rm -f $(XSESSIONCONFDIR)/99_enable_pidgin_theme_dark
