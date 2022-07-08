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
#       ...
#       doctitle: <the text you are using as the title in your # tag> (See example in README.md)
#       pdf: true
#       ---
#
#   and two returns after frontmatterclose before your doc title.
#   here is an example:
#       ---
#       layout: post
#       title: "Java Demo"
#       id: rest_apis-learn-examples-java-demo
#       categories: Learn Rest
#       author: Scott Hurrey
#       doctitle: "Demo using Java"
#       pdf: true
#       ---
#       
#       
#       # Demo using Java
#       ... your content follows ...

# Use:
#   1. Create a new branch 
#   2. Before building the jekyll site:
#      $./mk2pdf.sh or $./mk2pdf.sh <path to a single .md file>
#      This will take all .md files containing "pdf: true" in their frontmatter 
#      and convert them to PDFs in the top level /assets/pdfs project directory
#
#      NOTE: You should recommit your .md file(s) as PDF generation related frontmatter and pdf download links are added. :-)
#
#   2.   Then commit your PDF to your repo 
#
#   3. Build and test the site:
#       $ bundle exec jekyll serve
#
#   4. File a PR with blackboard/blackboard.github.io
#   5. Merge
#   6. Done!


if [ $# -eq 0 ]; then
    echo "No arguments provided"
else
    echo "PROCESS THIS FILE: $1"
    fileARG=$1
fi # end args check

if [ ! -z "$fileARG" ]; then
    echo "processing a single file"
    PSF=true
else
    echo "get 'em all!"
    PSF=false
fi # end PSF (Process Single File) setting

mdFileArray=()
pdfFileArray=()
pdfCreateFailArray=()
# changedAssetsArray=()
rootPath=`pwd`
counter=0
nl=$'\n'
sluggedNameTag="{% assign sluggedName = page.name | replace: '.md' %}"

#for reference only...
# geometry: "left=2cm,right=2cm,top=2cm,bottom=2.5cm"
# header-includes: |
#     \usepackage{fvextra}
#     \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\{\}}
#     \usepackage[obeyspaces,spaces,hyphens]{xurl}
#     \usepackage{hyperref}
# 
# pdfHREF = <a href="/assets/pdfs{{page.dir}}{{sluggedName}}.pdf" target="_blank"><img class="download-button" src="/assets/img/download.png" height="30px"></a> 

echo "`date`: Starting conversion of .md files to .pdf!" | tee ./md2pdf-log.txt

echo "`date`: Building array of .md files..." | tee -a ./md2pdf-log.txt
#building array accounting for odd filenames

if $PSF; then
    mdFileArray+=("$fileARG")
else
    IFS=
    while read -r file; do
        # ls "$file"
        # file="${file:1}"
        mdFileArray+=("$file")
    done < <(find . -name '*.md')
fi # end building mdFileArray

#get size of array
mdFileArraySize=${#mdFileArray[@]}
echo "`date`: There are $mdFileArraySize .md files to process..." | tee -a  ./md2pdf-log.txt

AUTOSKIP=false
AOWP=0
read -t 15 -r -e -p "Auto skip all existing PDFs?(n||<Y>)" AS
[ -z "${AS}" ] && AUTOSKIP=true
if [[ $AS == "n" || $AS == "N" || $AS == "no" || $AS == "No" ]] 
then
    AUTOSKIP=false
else
    AUTOSKIP=true
fi #end autoskip setting

counter=0
#process each file in the mdFileArray
echo "Generating PDF files..."
for mdFile in "${mdFileArray[@]}"
do :
    mdFile="${mdFile:1}"
    fullPath="$rootPath$mdFile"
    # echo "FULLPATH: $fullPath"
    if grep --quiet "pdf: true" "$fullPath"; then
        # echo "Converting to PDF: $mdFile"
        ((counter=counter+1))
        echo -ne " $counter::Processing .PDF for $mdFile!"\\r

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


        OWB=false
        NWB=false
        WRITETARGET=false
        if [ -e "$TARGET" ] 
        then
            if ! $AUTOSKIP
            then
                read -t 15 -r -e -p "$TARGET exists. Overwrite?(<N>||y)" OWP
                [ -z "${OWP}" ] && OWP=0
                if [[ $OWP == "y" || $OWP == "Y" || $OWP == "yes" || $OWP == "Yes" ]] 
                then
                    OWB=true
                else
                    OWB=false
                fi # end OWB (OverWriteBinary) setting
            fi # end autoskip overwrite per file...
        else
            NWB=true
        fi # end found target, process?

        if $OWB
        then
            echo "" 
            echo "OVERWRITING, $TARGET EXISTS, " >> ./md2pdf-log.txt
            WRITETARGET=true
        elif $NWB 
        then
            echo "" 
            echo "WRITING NEW $TARGET" >>  ./md2pdf-log.txt
                WRITETARGET=true
        else
            echo "" 
            echo "$TARGET EXISTS, SKIPPING TO NEXT FILE, " | tee -a  ./md2pdf-log.txt
            WRITETARGET=false
        fi
        

        if $WRITETARGET
        then
            #do PDF STUFF!
            # setup to work with the document
            #we know there is pdf: true in the frontmatter, otherwise we wouldn't be here
            
            documentSlugLine=$(awk '/sluggedName/{ print NR; exit }' $INPUT)
            # echo "DOCUMENT_SLUG_LINE: $documentSlugLine"
            documentTitleLine=$(awk '/doctitle: /{ print NR; exit }' $INPUT)
            # echo "DOCUMENT_TITLE_LINE: $documentTitleLine" 
            documentTitle=$(awk "NR == $documentTitleLine" $INPUT)
            # echo "DOCUMENTTITLE: $documentTitle" 
            pdfTrueLine=$(awk '/pdf: true/{ print NR; exit }' $INPUT)
            # echo "PDF_TRUE_LINE: $pdfTrueLine" 

            # echo "Checking for PDF Geometry..."
            documentGeometryLine=$(awk '/geometry: /{ print NR; exit }' $INPUT)
            # echo "DOCUMENT_GEOMETRY_LINE: $documentGeometryLine"
            if [ -z "$documentGeometryLine" ]; 
            then
                # echo "NO GEOMETRY -- ADDING..." | tee -a ./md2pdf-log.txt
                geometryInsertLine="$(($pdfTrueLine+1))"
                # echo "GEOMETRY_INSERT_LINE: $geometryInsertLine"
                sed -i '' "$geometryInsertLine"'i\
  \\\usepackage{hyperref}'"${nl}" "$INPUT"
                sed -i '' "$geometryInsertLine"'i\
  \\\DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\\\\\{\\\}}'"${nl}" "$INPUT" #\\\{\}
                sed -i '' "$geometryInsertLine"'i\
  \\\usepackage[obeyspaces,spaces,hyphens]{xurl}'"${nl}" "$INPUT"
                sed -i '' "$geometryInsertLine"'i\
  \\\usepackage{fvextra}'"${nl}" "$INPUT"
                sed -i '' "$geometryInsertLine"'i\
header-includes: |'"${nl}" "$INPUT"
                sed -i '' "$geometryInsertLine"'i\ 
geometry: \"left=2cm,right=2cm,top=2cm,bottom=2.5cm\"'"${nl}" "$INPUT"
                # echo "PDF GEOMETRY NOT FOUND - ADDED..." | tee -a ./md2pdf-log.txt                
            fi

            titleText=$(echo $documentTitle | awk -F'"' '{print $2}')
            # echo "TITLE_TEXT: $titleText" 
            titleTextLine=$(grep -n "$titleText" $INPUT | awk 'FNR == 2 {gsub(":","");gsub("#","");print $1}')
            echo "TITLE_TEXT_LINE: $titleTextLine"
            
            # Temporarially remove sluggedname assignment if it exists for PDF processing...
            if grep --quiet "sluggedName" "$INPUT"; 
            then
                # echo "Removing Slugline for PDF rendering..." | tee -a ./md2pdf-log.txt
                sed -i '' -e "s/$sluggedNameTag//g" "$INPUT"
            fi

            # Temprorarially remove PDF HREF if it exists
            if grep --quiet '<a href="/assets/pdfs{{page.dir}}{{sluggedName}}.pdf"' "$INPUT"; then
                # echo "Removing PDF HREF for PDF rendering..." | tee -a ./md2pdf-log.txt
                sed -i '' -e 's,<a href="/assets/pdfs{{page.dir}}{{sluggedName}}.pdf" target="_blank"><img class="download-button" src="/assets/img/download.png" height="30px"></a>,,g' "$INPUT"
            fi

            # temporarially augment /assets so pandoc can handle /asset links
            sed -i '' -E "s~/assets~$rootPath/assets~g" "$INPUT"
            if grep --quiet "$rootPath" "$INPUT"; 
            then
                echo "ROOT PATH(S) ADDED TO ASSETS PATH: $mdFile"  >> ./md2pdf-log.txt
                # changedAssetsArray+=("$INPUT")
            fi
            # now generate the pdf
            createPDFSuccess=false
            # if pandoc -o "$TARGET" "$INPUT" --pdf-engine=/Library/TeX/texbin/pdflatex; 
            if pandoc -o "$TARGET" "$INPUT" --pdf-engine=/Library/TeX/texbin/xelatex; 
            then
                 echo "Successfully created PDF. Add slugName and PDF HREF." >> ./md2pdf-log.txt
                 createPDFSuccess=true
                 pdfFileArray+=("$TARGET")
            else
                echo “Failure creating PDF, Reverting md to original. Pandoc exit status: $?” | tee -a  ./md2pdf-log.txt
                pdfCreateFailArray+=("$INPUT")
            fi
            # echo "PANDOC COMMAND: pandoc -o "$TARGET" "$INPUT" --pdf-engine=/Library/TeX/texbin/pdflatex"
            
            if $createPDFSuccess; then
                # Insert sluggedName assignment
                # echo "Insert sluggline... $mdFile" | tee -a  ./md2pdf-log.txt
                # echo "$titleTextLine"
                slugInsertPoint="$(($titleTextLine-1))"
                # echo "SLUG_INSERTION_POINT: $slugInsertPoint"
                # echo "SLUG_TEXT: $sluggedNameTag"
                sed -i '' "$slugInsertPoint s,.*,$sluggedNameTag," "$INPUT"

                # Reinsert PDF HREF
                if ! grep --quiet 'a href="/assets/pdfs' "$INPUT" ; then
                    # echo "ADD PDF DOWNLOAD LINK on $titleTextLine" | tee -a  ./md2pdf-log.txt
                    href="<a href=\"/assets/pdfs{{page.dir}}{{sluggedName}}.pdf\" target=\"_blank\"><img class=\"download-button\" src=\"/assets/img/download.png\" height=\"30px\"></a>"
                    sed -i '' "$titleTextLine"'c\
'"# $titleText $href ${nl}" "$INPUT"
                fi
            fi
            
            #undo asset path
            if grep --quiet "$rootPath" "$INPUT"; then
                # echo "REMOVING ROOT PATH FROM ASSETS PATH"
                sed -i '' -E "s~$rootPath/assets~/assets~g" "$INPUT"
            fi
            #done
        fi
    fi
done

echo "" | tee -a  ./md2pdf-log.txt
cnt=0
pdfFileArraySize=${#pdfFileArray[@]}
if [[ $pdfFileArraySize -gt 0 ]]
then
    echo "Converted PDFs:" | tee -a  ./md2pdf-log.txt

    for i in "${pdfFileArray[@]}"
    do :
        ((cnt=cnt+1))
        echo "$cnt: $i" | tee -a ./md2pdf-log.txt
    done
else
    echo "" | tee -a ./md2pdf-log.txt
    echo "No PDFs were created." | tee -a ./md2pdf-log.txt
fi

pdfCreateFailArraySize=${#pdfCreateFailArray[@]}
if [[ $pdfCreateFailArraySize -gt 0 ]]
then
    echo "" | tee -a ./md2pdf-log.txt
    echo "Failed PDFs:" | tee -a  ./md2pdf-log.txt

    cnt=0
    for pdfFail in "${pdfCreateFailArray[@]}"
    do :
        TARGET=${pdfCreateFailArray%.*}
        ((cnt=cnt+1))
        echo "$cnt: MD Failed to convert: $TARGET.md" | tee md2pdf-log.txt
    done
fi


echo "" | tee -a ./md2pdf-log.txt 
echo "MD to PDF Conversion completed!" | tee -a ./md2pdf-log.txt 