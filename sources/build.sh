# source venv/bin/activate
set -e

mkdir -p ../fonts ../fonts/ttf ../fonts/otf ../fonts/woff2


echo "GENERATING TTFs"
fontmake -g RedRose.glyphs -o ttf -i --output-dir ../fonts/ttf -a

echo "POST PROCESSING TTFs"
for f in ../fonts/ttf/*.ttf
do
	#echo 'Processing $f'
	gftools fix-dsig --autofix $f
	gftools fix-hinting $f
	mv $f.fix $f
done

echo "GENERATING WOFFs"
ttfs=$(ls ../fonts/*/*.ttf)
for ttf in $ttfs; do
    woff2_compress $ttf
done

woff2s=$(ls ../fonts/*/*.woff2)
for woff2 in $woff2s; do
    mv $woff2 ../fonts/woff2/$(basename $woff2)
done

echo "GENERATING OTFs"
fontmake -g RedRose.glyphs -o otf -i --output-dir ../fonts/otf -a

echo "POST PROCESSING OTFs"
for f in ../fonts/otf/*.otf
do
	gftools fix-dsig --autofix $f
done

# Clean up
rm -r instance_ufo
rm -r master_ufo
