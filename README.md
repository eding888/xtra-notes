# xtra-notes
A simple bash script which allows you to append a pdf page of your choosing to every page of a pdf. Perfect for a specific user: An individual who takes notes on a handwritten tablet by uploading lecture slides to it and marking it up.

Inspired by jvscholz's video: https://www.youtube.com/watch?v=IZX-cDR6IQM&t=214s

In this video he showcases his way of taking notes in which he marks up lecture slides on his tablet. However, a limitation I saw was that there is limited space in each slide to write notes/comments. This script was created to solve this problem
by allowing users to add whatever they want after each slide/page, whether that be a blank page, lined paper, flowcharts, etc.

REQUIRES PDFtk TO WORK. DOWNLOAD IT HERE: https://www.pdflabs.com/tools/pdftk-server/
DO NOT MOVE ANY DIRECTORIES FROM THE MAIN DIRECTORY AND ONLY RUN THE SCRIPT WITHIN THE MAIN DIRECTORY

Instructions:
1. Clone the repository to wherever you want on your computer.
2. Open up your terminal and navigate to this directory.
3. Run chmod +x init.sh. This esnures that the script is executable on your computer.
4. Go into the file directory and open up /input. This is going to be where you put your lecture slides/notes/whatever else you want. MAKE SURE THIS FILE IS A PDF. I have not added support for multiple files yet.
5. Open up /target. This is going to be the pdf that is added after every page in your input file. The default is a blank page, but you can make it whatever you want. Make sure it is named "target.pdf".
6. Initalize the script with ./init.sh.

Enjoy :)
