current_dir=$(dirname "$0")               #CURRENT DIRECTORY
input_dir=${current_dir}/input            #STORE DIRECTORY OF /input FOLDER
filename=$(basename ${input_dir}/*.pdf)   #GET THE FILENAME OF PDF IN /input FOLDER


if [[ $filename = *" "* ]];               #CHECK TO SEE IF THERE IS A SPACE IN THE INPUT FILENAME
then
    echo "---------------------------"
    echo "No spaces in input filname!"
    echo "---------------------------"
    exit 0
fi

cd input                                  #ENTERING INPUT DIRECTORY FOR FUTURE COMMANDS

if (( $(ls -l | wc -l) > 2 ));            #CHECK TO SEE IF THERE IS ONLY 1 FILE IN /input FOLDER
then
    echo "-----------------------------------------------------"
    echo "xtra-notes currently only supports 1 file at a time."
    echo "-----------------------------------------------------"
    exit 0
fi
pages=$(pdfinfo ${filename}  | awk "/^Pages:/ {print $4}" | sed s/"Pages: "//)  #CREATE VARIABLE WITH NUMBER OF PAGES IN FILE
for i in pages 
do
done