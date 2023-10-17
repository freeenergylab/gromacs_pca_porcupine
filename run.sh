#!/bin/bash
# refer to https://www3.mpibpc.mpg.de/groups/de_groot/compbio1/p4/index.html
#wget http://www3.mpibpc.mpg.de/groups/de_groot/compbio1/p4/148L.pdb

wget http://www3.mpibpc.mpg.de/groups/de_groot/compbio1/p4/ref.pdb
wget http://www3.mpibpc.mpg.de/groups/de_groot/compbio1/p4/md1_backbone.xtc

gmx trjconv -s ref.pdb -f md1_backbone.xtc -o md1.pdb -e 1000
pymol md1.pdb

gmx covar -s ref.pdb -f md1_backbone.xtc
xmgrace eigenval.xvg

gmx covar -s ref.pdb -f md1_backbone.xtc -o largest_eigenval.xvg -last 30
xmgrace largest_eigenval.xvg

gmx anaeig -s ref.pdb -f md1_backbone.xtc -filt filter1.pdb -first 1 -last 1 -skip 100
pymol filter1.pdb

gmx anaeig -s ref.pdb -f md1_backbone.xtc -extr extreme1.pdb -first 1 -last 1 -nframes 30
pymol extreme1.pdb

gmx anaeig -s ref.pdb -f md1_backbone.xtc -proj -first 1 -last 6
xmgrace -nxy proj.xvg

gmx anaeig -s ref.pdb -f md1_backbone.xtc -2d -first 1 -last 2
xmgrace 2dproj.xvg
