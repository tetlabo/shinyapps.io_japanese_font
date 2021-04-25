#!/bin/bash

### shinyapps.ioでグラフの日本語表示をするためのスクリプト
### Author: Kenta Tanaka (https://mana.bi/)
### 以下の記事を参考 (ほぼ丸パクり) にしました
### https://ziomatrix18.blog.fc2.com/blog-entry-853.html
###
### 使い方
### Shinyアプリ内で以下のように実行してください
### download.file("https://raw.githubusercontent.com/ltl-manabi/shinyapps.io_japanese_font/master/use_3_font.sh", destfile = "use_3_font.sh")
### system("bash ./use_3_font.sh")


mkdir ~/tmp
cd ~/tmp

# IPAexフォントの設定
curl -O -L https://moji.or.jp/wp-content/ipafont/IPAexfont/IPAexfont00401.zip
unzip IPAexfont00401.zip
mkdir -p ~/.fonts/ipa
cp ./IPAexfont00401/*.ttf ~/.fonts/ipa

# 源ノフォントの設定
curl -O -L https://github.com/adobe-fonts/source-han-sans/releases/download/2.003R/SourceHanSans.ttc
curl -O -L https://github.com/adobe-fonts/source-han-serif/releases/download/1.001R/SourceHanSerif.ttc
mkdir -p ~/.fonts/sourcehan
cp ./SourceHan*.ttc ~/.fonts/sourcehan

# Notoフォントの設定
curl -O -L https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip
curl -O -L https://noto-website-2.storage.googleapis.com/pkgs/NotoSerifCJKjp-hinted.zip
unzip -d NotoSansCJKjp-hinted NotoSansCJKjp-hinted.zip
unzip -d NotoSerifCJKjp-hinted NotoSerifCJKjp-hinted.zip
mkdir -p ~/.fonts/noto
cp ./NotoSansCJKjp-hinted/*.otf ~/.fonts/noto
cp ./NotoSerifCJKjp-hinted/*.otf ~/.fonts/noto

# フォントキャッシュの更新
fc-cache -f ~/.fonts
