#!/bin/bash
set -e

cd $(dirname $0)

dconf load /org/compiz/ < settings/compiz.settings
gconftool-2 -s  --type boolean /apps/compiz/general/allscreens/options/click_to_focus 0
gconftool-2 -s  --type boolean /apps/compiz/general/allscreens/options/autoraise 0

#dconf write /org/gnome/desktop/input-sources/xkb-options '['\''altwin:swap_alt_win'\'']'
dconf write /org/gnome/desktop/input-sources/xkb-options '['\'''\'']'
dconf write /org/gnome/settings-daemon/plugins/media-keys/terminal '"<Control><Alt>z"'
dconf write /org/gnome/desktop/background/picture-options '"none"'
dconf write /org/gnome/desktop/background/primary-color '"#000000"'

gconftool-2 -s  --type string /apps/gnome-do/preferences/Do/Platform/Common/AbstractKeyBindingService/Summon_Do '<Super>space'

gconftool-2 -s  --type string /apps/gnome-terminal/keybindings/prev_tab '<Shift>Left'
gconftool-2 -s  --type string /apps/gnome-terminal/keybindings/next_tab '<Shift>Right'
gconftool-2 -s  --type string /apps/gnome-terminal/profiles/Default/scrollbar_position hidden
gconftool-2 -s  --type bool /apps/gnome-terminal/profiles/Default/use_theme_colors 0
gconftool-2 -s  --type string /apps/gnome-terminal/profiles/Default/bold_color '#FFFFFFFFFFFF'
gconftool-2 -s  --type string /apps/gnome-terminal/profiles/Default/bold_color_same_as_fg 1
gconftool-2 -s  --type string /apps/gnome-terminal/profiles/Default/background_color '#000000000000'
gconftool-2 -s  --type string /apps/gnome-terminal/profiles/Default/foreground_color '#FFFFFFFFFFFF'
gconftool-2 -s  --type string /apps/gnome-terminal/profiles/Default/palette '#000000000000:#CCCC00000000:#4E4E9A9A0606:#C4C4A0A00000:#34346565A4A4:#757550507B7B:#060698209A9A:#D3D3D7D7CFCF:#555557575353:#EFEF29292929:#8A8AE2E23434:#FCFCE9E94F4F:#72729F9FCFCF:#ADAD7F7FA8A8:#3434E2E2E2E2:#EEEEEEEEECEC'
