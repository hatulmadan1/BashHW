#!/bin/bash
mkdir ~/test &> /dev/null 

ls -a --indicator-style=slash /etc > ~/test/list

ls -d  ~/../etc/*/ | wc -l >> ~/test/list
ls -a .?* | wc -l >> ~/test/list

mkdir ~/test/links &> /dev/null

ln ~/test/list ~/test/links/list_hlink &> /dev/null

ln -s ~/test/list ~/test/links/list_slink &> /dev/null

echo $(
find . -samefile ~/test/links/list_hlink | wc -l 
find . -samefile ~/test/list | wc -l 
find . -samefile ~/test/links/list_slink | wc -l)

wc -l ~/test/list >> ~/test/links/list_hlink

cmp -s ~/test/list ~/test/links/list_hlink && echo 9 YES

mv ~/test/list ~/test/list1

cmp -s ~/test/links/list_hlink ~/test/links/list_slink && echo 11 YES

ln ~/test/list1 ~/list_link &> /dev/null

ls -a -R /etc | grep '.conf$' > ~/list_conf

ls -a -R --indicator-style=slash /etc | grep '.d/$' > ~/list_d

cat ~/list_conf > ~/list_conf_d
cat ~/list_d >> ~/list_conf_d

mkdir ~/test/.sub &> /dev/null

cp ~/list_conf_d ~/test/.sub

cp -b ~/list_conf_d ~/test/.sub

ls -a -R ~/test

man man > ~/man.txt

split -b 1K ~/man.txt

mkdir ~/man.dir &> /dev/null

cp ~/x?? ~/man.dir

cat ~/man.dir/x?? > ~/man.dir/man.txt

cmp -s ~/man.txt ~/man.dir/man.txt && echo 25 YES

echo 'dkjgbehbgvsekb' | cat - ~/man.txt > tmp && mv tmp ~/man.txt
echo 'khgberkhgbekhbvg' >> ~/man.txt

diff ~/man.txt ~/man.dir/man.txt >  mandiff

mv ~/mandiff ~/man.dir

patch -R ~/man.dir/man.txt ~/man.dir/mandiff &> /dev/null

cmp -s ~/man.txt ~/man.dir/man.txt && echo 30 YES
