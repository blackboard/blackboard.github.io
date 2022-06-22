#!/bin/bash

# md2pdf.sh converts .md files to .pdf files found in and below target jekyll directory where the .md file contains "pdf: true" in it's frontmatter
# 
# Setup:
#   $ brew install MacTex (or system comparable LaTeX commandline tool)
#   $ brew install pandoc
#   $ cd jekyll directory
#   $ place a copy of md2pdf.sh at the top level of your project
#   $ chmod 755 md2pdf.sh
#   Edit all pages on which you want to support PDFs:
#   Add to the frontmatter:
#        pdf: true
#        geometry: "left=2cm,right=2cm,top=2cm,bottom=2.5cm"
#        header-includes:
#          - \usepackage{fvextra}
#          - \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\{\}}
#          - \usepackage[obeyspaces,spaces,hyphens]{xurl}
#        ---
#   Add to page above title (e.g.: # cURL Demo):
#        {% assign sluggedName = page.name | replace: '.md' %}
#        <div class="download-btn-placement"><br>modified: {{ page.last_modified_at | date: '%b-%d-%y' }} &nbsp;&nbsp; 
#        <a href="/assets/pdfs{{page.dir}}{{sluggedName}}.pdf" target="_blank"><img class="download-button" src="/assets/img/download.png" height="30px"></a></div>
# with a placeholder something like <!-- sluggedName -->
#
# Use:
#   1. Before building the jekyll site:
#       $./mk2pdf.sh
#           This will take all .md files containing "pdf: true" in their frontmatter 
#           and convert them to PDFs in the top level /assets/pdfs project directory
#
#           NOTE: You must manually clean up any files where the /assets path
#                 was changed - follow the logs... :-)
#
#       Then commit the PDFs to the repo along with any other files/changes 
# NOTE: You do not have to recommit the .md files - if git says you do, and the content has not changed, then you missed undoing a prep change made above.
#
#   2. Build and test the site:
#       $ bundle exec jekyll serve
#   Done!

mdFileArray=()
pdfFileArray=()
changedAssetsArray=()
rootPath=`pwd`
counter=0

echo "`date`: Starting conversion of .md files to .pdf!" | tee ./md2pdf-log.txt

echo "`date`: Building array of .md files..." | tee -a ./md2pdf-log.txt
#building array accounting for odd filenames

IFS=
while read -r file; do
    # ls "$file"
    # file="${file:1}"
    mdFileArray+=("$file")
done < <(find . -name '*.md')

#get size of array
mdFileArraySize=${#mdFileArray[@]}
echo "`date`: There are $mdFileArraySize .md files to process..." | tee -a  ./md2pdf-log.txt

# echo "mdFileArray Contents:"
# for i in "${mdFileArray[@]}"
# do :
#     ((cnt=cnt+1))
#     echo "$cnt: $i"
# done

counter=0
#process each file in the mdFileArray
echo "Generating PDF files..."
for mdFile in "${mdFileArray[@]}"
do :
    mdFile="${mdFile:1}"
    fullPath="$rootPath$mdFile"
    # echo "FULLPATH: $fullPath"
    if grep --quiet "pdf: true" $fullPath; then
        # echo "Converting to PDF: $fullPath"
        ((counter=counter+1))
        echo -ne "Processing .pdf file: $counter!"\\r

        INPUT="$fullPath"
        TARGET="$rootPath/assets/pdfs$mdFile"
        #what is the pdf path?

        pdfPath=${TARGET%/*}
        # echo "PDFPATH: $pdfPath"
        #make it if it doesn't exist
        mkdir -p "$pdfPath"
        fileNoExtension=$(basename "${TARGET%.*}")
        #need to take pdfPath and add just filename.pdf for the TARGET.
        TARGET="$pdfPath/$fileNoExtension.pdf"
        # TARGET=${TARGET%.*}
        # TARGET="$TARGET.pdf"
        # echo "TARGET PDF: $TARGET"
        pdfFileArray+=("$TARGET")
        
        #temporarially remove PDF BLOCK for processing...
        sed -i '' -E '/^<!-- BOF PDF BLOCK -->/,/^<!-- EOF PDF BLOCK -->/{/^<!-- BOF PDF BLOCK -->/!{/^\<!-- EOF PDF BLOCK -->/!d;};}' "$INPUT"

        # temporarially augment /assets so pandoc can handle /asset links
        sed -i '' -E "s~/assets~$rootPath/assets~g" "$INPUT"
        if grep --quiet "$rootPath" "$INPUT"; then
            # echo "ROOT PATH ADDED TO ASSETS PATH: $INPUT"  | tee -a  ./md2pdf-log.txt
            changedAssetsArray+=("$INPUT")
        fi
        # now generate the pdf
        pandoc -o "$TARGET" "$INPUT" --pdf-engine=/Library/TeX/texbin/pdflatex

        #Reinsert PDF BLOCK
        sed -i '' -E '/<!-- BOF PDF BLOCK -->/r pdf-block.txt' "$INPUT";
    fi
done

# now undo the temp /assets change
echo "" | tee -a  ./md2pdf-log.txt
echo "Converted PDFs:" | tee -a  ./md2pdf-log.txt
cnt=0
for i in "${pdfFileArray[@]}"
do :
    ((cnt=cnt+1))
    echo "$cnt: $i" | tee -a ./md2pdf-log.txt
done

echo "" | tee -a ./md2pdf-log.txt
cnt=0
for changedAssetsPath in "${changedAssetsArray[@]}"
do :
    TARGET=${changedAssetsPath%.*}
    ((cnt=cnt+1))
    echo "$cnt: $TARGET.md"
done
echo "" | tee -a ./md2pdf-log.txt 
echo "IMPORTANT!!!" | tee -a ./md2pdf-log.txt 
echo "Before the next commit and Jekyll build globally search and replace \"$rootPath/assets\" with \"/assets\" on the above files." | tee -a ./md2pdf-log.txt 
   
echo "MD to PDF Conversion completed!" | tee -a ./md2pdf-log.txt 