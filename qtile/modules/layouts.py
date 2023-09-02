from libqtile import layout
from libqtile.config import Match

layouts = [
    layout.Columns(
        margin=[10, 10, 10, 10],
        border_focus="#1F1D2E",
        border_normal="#1F1D2E",
        border_width=0,
    ),
    layout.Max(
        border_focus="#1F1D2E",
        border_normal="#1F1D2E",
        margin=10,
        border_width=0,
    ),
    layout.Floating(
        border_focus="#1F1D2E",
        border_normal="#1F1D2E",
        margin=10,
        border_width=0,
    ),
    layout.Matrix(
        border_focus="#1F1D2E",
        border_normal="#1F1D2E",
        margin=10,
        border_width=0,
    ),
    layout.MonadTall(
        border_focus="#1F1D2E",
        border_normal="#1F1D2E",
        margin=10,
        border_width=0,
    ),
    layout.MonadWide(
        border_focus="#1F1D2E",
        border_normal="#1F1D2E",
        margin=10,
        border_width=0,
    ),
    layout.Tile(
        border_focus="#1F1D2E",
        border_normal="#1F1D2E",
    ),
]

floating_layout = layout.Floating(
    border_focus="#1F1D2E",
    border_normal="#1F1D2E",
    border_width=0,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
)
