#   _____    ________ ______      _     _______  _____  _        _______ 
#  (____ \  (_______/|  ___ \    | |   (_______)(_____)| |      (_______)
#   _   \ \    ____  | |   | |    \ \   _          _   | |       _____   
#  | |   | |  (___ \ | |   | |     \ \ | |        | |  | |      |  ___)  
#  | |__/ /  _____) )| |   | | _____) )| |_____  _| |_ | |_____ | |_____ 
#  |_____/  (______/ |_|   |_|(______/  \______)(_____)|_______)|_______)
                                                                      
from modules.keys import keys, mod
from modules.groups import groups
from modules.layouts import layouts, floating_layout
from modules.mouse import mouse
from modules.hooks import *
import os
from modules.screens import screens
from libqtile.dgroups import simple_key_binder

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

wmname = "Qtile"
