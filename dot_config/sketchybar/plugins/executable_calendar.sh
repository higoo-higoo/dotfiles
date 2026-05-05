#!/bin/sh

events=$(gcalcli agenda --calendar Normal --tsv --nostarted --details location)

# ヘッダーを除き、start_timeが空でない最初の予定を抽出
next_event=$(echo "$events" | awk -F'\t' 'NR>1 && $2 != "" {print $1 " " $2 " - " $5; exit}')

# sketchybarで表示（item_nameはsketchybarの設定に合わせて変更）
sketchybar --set calendar_item label="$next_event"
