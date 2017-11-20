find . -name "*.tex" -exec iconv -f WINDOWS-1252 -t UTF-8 {} -o {}.ren \; -a -exec mv {}.ren {} \;
