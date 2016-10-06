# TODO: replace existing file
# TODO: only create a file if term was found
# TODO: create ./results" directory if it doesn't exist
# TODO: output more stats in both the file and the terminal

# replace space(s) for paths
StrForName="${1// /_}" ;

# create a markdown file
touch ./results/didweplay-"$StrForName".md ;

# analyse
for filename in ../20*.md ; do
  if cat $filename | grep -i "$1" ; then
    # append filename
    echo $filename >> ./results/didweplay-"$StrForName".md ;
    # if search term found, append corresponding line
    cat $filename | grep -i "$1" >> ./results/didweplay-"$StrForName".md ;
  fi
done

# give feedback
echo "Donskies! Results in ./results/didweplay-$StrForName.md" ;
echo "Number of occurrences:" ;
cat ./results/didweplay-"$StrForName".md | grep -i "$1" | wc -l