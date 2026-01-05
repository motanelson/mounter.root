a=$(cat $1)
for b in $a
do
    mkdir $b
    chmod 777 $b
done
a=$(cat $2)
for b in $a
do
    printf "" > $b
    chmod 777 $b
done
