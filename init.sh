current_dir=$(dirname "$0")
input_dir=${current_dir}/input
filename=$(basename ${input_dir}/*.pdf)


if [[ $filename = *" "* ]];
then
    echo "---------------------------"
    echo "No spaces in input filname!"
    echo "---------------------------"
    exit 0
fi

cd input

if (( $(ls -l | wc -l) > 2 ));
then
    echo "-----------------------------------------------------"
    echo "xtra-notes currently only supports 1 file at a time."
    echo "-----------------------------------------------------"
    exit 0
fi
pages=$(pdfinfo ${filename}  | awk "/^Pages:/ {print $4}" | sed s/"Pages: "//)
for i in pages 
do
    echo $pages
done