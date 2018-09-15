style"menubar"{
xthickness=0
ythickness=1
GtkMenuBar::shadow-type=GTK_SHADOW_NONE
GtkMenuBar::internal-padding=3
bg[NORMAL]=shade(0.7,@bg_color)
bg[PRELIGHT]=shade(0.7,@bg_color)
bg[SELECTED]=shade(0.7,@bg_color)
bg[ACTIVE]=shade(0.7,@bg_color)
bg[INSENSITIVE]=shade(0.7,@bg_color)
engine"pixmap"{
image{
function=SHADOW
shadow=NONE
orientation=HORIZONTAL
file="images/shadowbottom.xpm"
border={0,0,0,1}
stretch=TRUE}}}
class"GtkMenuBar"style"menubar"

style"toolbarmenubar"{
xthickness=0
ythickness=0
GtkMenuBar::shadow-type=GTK_SHADOW_NONE
engine"pixmap"{
image{
function=SHADOW
shadow=NONE
orientation=HORIZONTAL
file="images/none.xpm"
border={0,0,0,1}
stretch=TRUE}
image{
function=SHADOW
shadow=NONE
orientation=VERTICAL
file="images/none.xpm"
border={1,0,0,0}
stretch=TRUE}}}
widget_class"*.GtkToolbar*GtkMenuBar"style"toolbarmenubar"

style"menubaritem"{
GtkMenuItem::selected-shadow-type=GTK_SHADOW_NONE
GtkMenuItem::horizontal-padding=5
bg[NORMAL]=shade(0.9,@bg_color)
bg[PRELIGHT]=shade(0.9,@bg_color)
bg[SELECTED]=shade(0.9,@bg_color)
bg[ACTIVE]=shade(0.9,@bg_color)
fg[INSENSITIVE]=shade(0.5,@fg_color)
fg[PRELIGHT]=@fg_color
fg[SELECTED]=@fg_color
fg[ACTIVE]=@fg_color
engine"pixmap"{
image{
function=BOX
state=PRELIGHT
file="images/menuitemprelight.xpm"
border={4,4,0,3}
stretch=TRUE
overlay_file="images/menuitemprelight.png"
overlay_border={4,4,0,2}
overlay_stretch=TRUE}}}
widget_class"*.<GtkMenuBar>*<GtkMenuItem>"style"menubaritem"
widget_class"*.<GtkMenuBar>*<GtkMenuItem>*<GtkLabel>"style"menubaritem"

widget_class"*.<GtkMenuBar>*<GtkMenuItem>*<GtkLabel>"style"mistrender"