# TODO: only create a file if term was found
# TODO: create ./results" directory if it doesn't exist
# TODO: output more stats in both the file and the terminal

# replace space(s) for paths
StrForName="${1// /_}" ;

# create result file path to reuse
ResultPath="./results/didweplay-$StrForName.md" ;

# remove previous results; ignore non-existent files with -f flag
rm -f "$ResultPath" ;

# create a markdown file
touch "$ResultPath" ;

# analyse
for filename in ../20*.md ; do
  if cat $filename | grep -i "$1" ; then
    # -i flag is for "case insensitive"
    # append filename
    echo $filename >> "$ResultPath" ;
    # if search term found, append corresponding line
    cat $filename | grep -i "$1" >> "$ResultPath" ;
  fi
done

# give feedback
echo "Donskies! Results are listed in $ResultPath" ;
echo "Number of occurrences:" ;
# count number of lines that contain the search term as proxy for number of occurences
cat $ResultPath | grep -i "$1" | wc -l