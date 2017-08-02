#!/bin/sh
# Convert SawFish theme to IceWM
# need ImagaMagick

echo "Copy titles"
cp title-1-active.xpm titleAS.xpm 
cp title-1-inactive.xpm titleIS.xpm
cp title-1-active.xpm titleAB.xpm
cp title-1-inactive.xpm titleIB.xpm
cp title-2-active.xpm titleAP.xpm
cp title-2-inactive.xpm titleIP.xpm
cp title-3-active.xpm titleAT.xpm
cp title-3-inactive.xpm titleIT.xpm
cp title-4-active.xpm titleAM.xpm
cp title-4-inactive.xpm titleIM.xpm

echo "Convert buttons"
convert -append shade-active.xpm shade-pressed.xpm menuButtonA.xpm
convert -append shade-inactive.xpm shade-inactive.xpm menuButtonI.xpm
convert -append hide-active.xpm hide-pressed.xpm minimizeA.xpm
convert -append hide-inactive.xpm hide-inactive.xpm minimizeI.xpm
convert -append close-active.xpm close-pressed.xpm closeA.xpm
convert -append close-inactive.xpm close-inactive.xpm closeI.xpm
convert -append maximize-active.xpm maximize-pressed.xpm maximizeA.xpm
convert -append maximize-inactive.xpm maximize-inactive.xpm maximizeI.xpm

echo "Make restore buttons"
convert -flop maximizeA.xpm restoreA.xpm
convert -flop maximizeI.xpm restoreI.xpm

mkdir -p taskbar
cd taskbar

echo "Making taskbar buttons"
convert -size 48x24 gradient:#EEE-#888 taskbarbg.xpm
convert -size 48x22 gradient:#EEE-#999 taskbuttonbg.xpm
convert -size 48x22 gradient:#999-#EEE taskbuttonminimized.xpm

echo "Making taskbuttonactive"
convert -crop 2x16+0+2 -resize 48x22! ../titleAT.xpm taskbuttonactive.xpm

echo "Making right"
convert -crop 12x16+0+2 -resize 12x22! ../titleAM.xpm right.xpm

echo "Making Start text"
convert -size 38x22 xc:black -fill white \
   -font /usr/X11R6/lib/X11/fonts/TTF/luxisbi.ttf -pointsize 12 \
   -draw 'gravity center text 0,0 "Start"' start.xpm 

echo "Append taskbuttonactive + right"
convert +append taskbuttonactive.xpm right.xpm linux1.xpm

echo "Compose start"
composite -compose plus -geometry +14+0 start.xpm linux1.xpm linux2.xpm

echo "Compose tux"
composite -compose over -geometry +2+2 tux.xpm linux2.xpm linux.xpm 

