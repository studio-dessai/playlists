# create a markdown file
# TODO: replace existing file
# TODO: only create a file if term was found
# TODO: create ./results" directory if it doesn't exist
StrForName="${1// /_}" ;
touch ./results/didweplay-"$StrForName".md ;
for filename in ../20*.md ; do
  if cat $filename | grep -i "$1" ; then
    # append filename
    echo $filename >> ./results/didweplay-"$StrForName".md ;
    # if search term found, apend corresponding line
    cat $filename | grep -i "$1" >> ./results/didweplay-"$StrForName".md ;
  fi
done
# TODO: output stats in both the file and the terminal
echo "Donskies! Results in ./results/didweplay-$StrForName.md"