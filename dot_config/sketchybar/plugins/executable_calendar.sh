#!/bin/sh

events=$(gcalcli agenda --calendar higyuki1101@gmail.com --calendar yuki.higuchi@cte-agri.com  --tsv --nostarted --details location)

# ヘッダーを除き、start_timeが空でない最初の予定を抽出
next_event=$(echo "$events" | awk -F'\t' 'NR>1 && $2 != "" {print $1 " " $2 " - " $5; exit}')

# 個人情報を含む文字列はリポジトリに置かず、ローカルのTSVで置換する。
# 例: ~/.config/sketchybar/calendar_aliases.tsv
#   実際の住所<TAB>自宅
alias_file=${SKETCHYBAR_CALENDAR_ALIASES:-"$HOME/.config/sketchybar/calendar_aliases.tsv"}
if [ -r "$alias_file" ] && [ -n "$next_event" ]; then
  next_event=$(printf '%s\n' "$next_event" | awk -F'\t' '
    function replace_all(s, old, new,    out, p) {
      out = ""
      while ((p = index(s, old)) > 0) {
        out = out substr(s, 1, p - 1) new
        s = substr(s, p + length(old))
      }
      return out s
    }
    NR == FNR {
      if ($0 == "" || substr($0, 1, 1) == "#") next
      from[++n] = $1
      to[n] = $2
      next
    }
    {
      s = $0
      for (i = 1; i <= n; i++) {
        if (from[i] != "") s = replace_all(s, from[i], to[i])
      }
      print s
    }
  ' "$alias_file" -)
fi

# sketchybarで表示（item_nameはsketchybarの設定に合わせて変更）
sketchybar --set calendar_item label="$next_event"
