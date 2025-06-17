#!/bin/sh
if [ -z "${out_name}" ]; then
  echo "Ошибка: Переменная окружения 'out_name' не установлена." >&2
  exit 1
fi
node sub.mjs
npx remotion render
mkdir result
mv out/CaptionedVideo.mp4 result/${out_name}.mp4