# Depends on niri, fuzzel, jq, and some normal Linux tools.

ID_COMMA_TITLE=$(niri msg -j windows | jq -r '.[] | [.id, .title] | @csv' | fuzzel --width 150 --dmenu | cut -d, -f1)
if [ ! -z "$ID_COMMA_TITLE" ]; then
    niri msg action focus-window --id "$ID_COMMA_TITLE"
fi
