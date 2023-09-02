from modules.keys import keys, mod
from modules.groups import groups
from modules.layouts import layouts, floating_layout
from modules.mouse import mouse
from modules.hooks import autostart
from modules.widgets import screens

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

auto_minimize = True

wl_input_rules = None

wmname = "Qtile"
