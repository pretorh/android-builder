docker build -t pretorh/android-builder-base .

for file in Dockerfile.* ; do
    number=$(echo $file | sed -e 's#Dockerfile.##')
    docker build -t pretorh/android-builder-$number -f $file .
done
