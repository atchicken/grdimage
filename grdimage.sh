#!/bin/bash

ncFile=./netcdf4.nc
psFile=./grdimage.ps
cptFile=./color.cpt

gmt makecpt -Crainbow -Z -D -T-5/40/1 > $cptFile
gmt grdimage $ncFile -JM15c -Ba30f10g20/a20f10g10:."Global Temperature":WSne -R0/360/-60/60 -C$cptFile -P -K  > $psFile
gmt pscoast -J -B -R -W -P -K -O >> $psFile
gmt psscale -C$cptFile -Dx16/3/6/0.5 -Ba10f5::/:"deg C": -O >> $psFile

gmt ps2raster $psFile -E100 -Tg
