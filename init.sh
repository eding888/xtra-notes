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

cd ..                                     #STEPPING BACK TO MAIN DIRECTORY

for i in $(seq $pages);                                                     #LOOP WHICH ADDS target.pdf AFTER EVERY PAGE
do
    pdftk ./input/$filename cat $i output "$i.pdf"                          #$i.pdf IS THE TEMPORARY FILE FOR THE INDIVIDUAL PAGE
    if [[ $i -eq 1 ]];
    then
        pdftk "$i.pdf" ./target/"target.pdf" cat output "latest.pdf"        #1st Iteration: Combine the initial page with target into latest.pdf
    else
        mv latest.pdf previous.pdf                                          #Additional Iterations: latest.pdf gets turned into previous, the new page (i.pdf) is added into the new latest.pdf
        pdftk "previous.pdf" "$i.pdf" cat output "latest.pdf"
        rm previous.pdf                                                     #previous.pdf is deleted and the new latest is now previous
        mv latest.pdf previous.pdf
        pdftk "previous.pdf" ./target/"target.pdf" cat output "latest.pdf"  #target.pdf is appended and previous.pdf is deleted
        rm previous.pdf
    fi
    rm $i.pdf
done

newname=$(echo $filename | sed s/".pdf"//)                                  #STORE NEW NAME FOR OUPUT FILE (original name + xtra.pdf)
mv latest.pdf "$newname-xtra.pdf"
mv "$newname-xtra.pdf" ./output                                             #RENAME FILE AND PUT INTO /ouput
