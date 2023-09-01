#   ______  ______    _____   _     _  ______      _
#  / _____)(_____ \  / ___ \ | |   | |(_____ \    | |
#  | /  ___  _____) )| |   | || |   | | _____) )    \ \
#  | | (___)(_____ ( | |   | || |   | ||  ____/      \ \
#  | \____/|      | || |___| || |___| || |       _____) )
#  \_____/       |_| \_____/  \______||_|      (______/


from libqtile.config import Key, Group
from libqtile.command import lazy
from .keys import keys, mod

azerty_keys = [
    "ampersand",
    "eacute",
    "quotedbl",
    "apostrophe",
    "parenleft",
    "minus",
    "egrave",
    "underscore",
]

groups = [Group(f"{i+1}", label="󰏃") for i in range(8)]

for idx, group in enumerate(groups):
    azerty_key = azerty_keys[idx]
    keys.extend(
        [
            Key(
                [mod],
                azerty_key,
                lazy.group[group.name].toscreen(),
                desc=f"Switch to group {group.name}",
            ),
            Key(
                [mod, "shift"],
                azerty_key,
                lazy.window.togroup(group.name, switch_group=True),
                desc=f"Switch to & move focused window to group {group.name}",
            ),
        ]
    )
