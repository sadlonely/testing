from libqtile import bar, qtile, widget
from libqtile.config import Screen


def create_image_widget(filename, margin=0, background=None, mouse_callbacks=None):
    return widget.Image(
        filename=filename,
        margin=margin,
        background=background,
        mouse_callbacks=mouse_callbacks,
    )


def search():
    qtile.cmd_spawn("rofi -show drun")


def power():
    qtile.cmd_spawn("sh -c ~/.config/rofi/scripts/power")


screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(length=15, background="#0F1212"),
                create_image_widget(
                    "~/.config/qtile/assets/logo.png",
                    margin=2,
                    background="#0F1212",
                    mouse_callbacks={"Button1": power},
                ),
                create_image_widget("~/.config/qtile/assets/sep_1.png"),
                widget.GroupBox(
                    fontsize=24,
                    borderwidth=3,
                    highlight_method="block",
                    active="#607767",
                    block_highlight_text_color="#B2BEBC",
                    highlight_color="#D0DAF0",
                    inactive="#0F1212",
                    foreground="#4B427E",
                    background="#202222",
                    this_current_screen_border="#202222",
                    this_screen_border="#202222",
                    other_current_screen_border="#202222",
                    other_screen_border="#202222",
                    urgent_border="#202222",
                    rounded=True,
                    disable_drag=True,
                ),
                widget.Spacer(length=8, background="#202222"),
                create_image_widget("~/.config/qtile/assets/sep_2.png"),
                create_image_widget(
                    "~/.config/qtile/assets/layout.png", background="#202222"
                ),
                widget.CurrentLayout(
                    background="#202222",
                    foreground="#607767",
                    fmt="{}",
                    font="JetBrains Mono Bold",
                    fontsize=13,
                ),
                create_image_widget("~/.config/qtile/assets/sep_3.png"),
                create_image_widget(
                    "~/.config/qtile/assets/search.png",
                    margin=2,
                    background="#0F1212",
                    mouse_callbacks={"Button1": search},
                ),
                widget.TextBox(
                    fmt="Search",
                    background="#0F1212",
                    font="JetBrains Mono Bold",
                    fontsize=13,
                    foreground="#607767",
                    mouse_callbacks={"Button1": search},
                ),
                create_image_widget("~/.config/qtile/assets/sep_4.png"),
                widget.WindowName(
                    background="#202222",
                    format="{name}",
                    font="JetBrains Mono Bold",
                    fontsize=13,
                    foreground="#607767",
                    empty_group_string="Desktop",
                ),
                create_image_widget("~/.config/qtile/assets/sep_5.png"),
                widget.Systray(
                    background="#0F1212",
                    fontsize=2,
                ),
                widget.TextBox(text=" ", background="#0F1212"),
                create_image_widget(
                    "~/.config/qtile/assets/sep_1.png", background="#202222"
                ),
                create_image_widget(
                    "~/.config/qtile/assets/Misc/ram.png", background="#202222"
                ),
                widget.Spacer(length=-7, background="#202222"),
                widget.Memory(
                    background="#202222",
                    format="{MemUsed: .0f}{mm} /{MemTotal: .0f}{mm}",
                    foreground="#607767",
                    font="JetBrains Mono Bold",
                    fontsize=13,
                    update_interval=5,
                ),
                create_image_widget("~/.config/qtile/assets/sep_6.png"),
                widget.Spacer(length=8, background="#202222"),
                widget.Net(
                    interface="enp2s0",
                    format="{down} ↓↑ {up}",
                    foreground="#607767",
                    background="#202222",
                    font="JetBrains Mono Bold",
                    fontsize=13,
                ),
                create_image_widget("~/.config/qtile/assets/sep_6.png"),
                widget.Spacer(length=8, background="#202222"),
                widget.Volume(
                    font="JetBrains Mono Bold",
                    fontsize=13,
                    theme_path="~/.config/qtile/assets/Volume/",
                    emoji=True,
                    background="#202222",
                ),
                widget.Spacer(length=-5, background="#202222"),
                widget.Volume(
                    font="JetBrains Mono Bold",
                    fontsize=13,
                    background="#202222",
                    foreground="#607767",
                ),
                create_image_widget(
                    "~/.config/qtile/assets/sep_3.png", background="#202222"
                ),
                widget.Clock(
                    format="%I:%M %p",
                    background="#0F1212",
                    foreground="#607767",
                    font="JetBrains Mono Bold",
                    fontsize=13,
                ),
                widget.Spacer(length=18, background="#0F1212"),
            ],
            30,
            border_color="#0F1212",
            border_width=[0, 0, 0, 0],
            margin=[15, 60, 6, 60],
        ),
    ),
]
