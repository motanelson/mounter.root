printf "\033c\033[40;37m\n"
p=tree
g=$3
h=initrd
j=/mnt/root/
k=/mnt
umount $j 2> /dev/null
mkdir $j 2> /dev/null
dd if=/dev/zero of=$h bs=1M count=$g status=progress
chmod 777 $h
echo '.........................................'
mkfs.ext2 $h
chmod 777 $h
chmod 777 $j
mount -o loop $h $j 
a=$(cat $1)
for b in $a
do
    mkdir $k/$b
    chmod 777 $k/$b
done
echo '.........................................'
a=$(cat $2)
for b in $a
do
    printf "" > $k/$b
    chmod 777 $k/$b
done
echo '.........................................'
echo $p
$p $j
printf "\033[40;37m\npress enter to exit mount ? \n"
read x
echo '.........................................'

umount $j 2> /dev/null
rm $h.gz 2> /dev/null
gzip $h
