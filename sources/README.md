## Building fonts
Generate the fonts first from glyphsapp then run the fix-hinting.sh script.

Firstly, you will need to install gftools by doing the following:

```
# create a virtualenv
python3 -m venv venv
# activate virtualenv
source venv/bin/activate

# install gftools
pip install git+https://www.github.com/googlefonts/tools

```

Once gftools is installed, we can run the following commanf to fix the family's hinting:

```
sh fix-hinting.sh
```
