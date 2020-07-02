## Building fonts
Generate the fonts with Fontmake using the build script for it. It includes fixes on hinting among others.

Firstly, you will need to install gftools by doing the following:

```
# create a virtualenv
python3 -m venv venv
# activate virtualenv
source venv/bin/activate

# install the requirements
pip install -r requirements.txt

```

Once gftools is installed, we can run the following commanf to generate the fonts:

```
sh build.sh
```
