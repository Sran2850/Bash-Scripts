#! /usr/bin/bash
selected=$(xclip -o -selection primary)

query=$(curl -s "https://api.dictionaryapi.dev/api/v2/entries/en_US/$selected")

definition=$(echo "$query" | jq -r '[.[].meanings[] | {pos: .partOfSpeech, def: .definitions[].definition}] | .[:3].[] | "\n\(.pos): \(.def)"')

notify-send -t 6000 "$selected" "$definition"
