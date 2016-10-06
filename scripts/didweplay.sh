# create a markdown file
# TODO: replace existing file
# TODO: only create a file if term was found
# TODO: create ./results" directory if it doesn't exist
# TODO: deal with spaces, i.e. search for "Four Tet"
touch ./results/didweplay-''$1''.md ;
for filename in ../20*.md ;
  # append filename
  # TODO: only append file name where search term was found
  do echo $filename >> ./results/didweplay-''$1''.md ;
  # if search term found, apend corresponding line
  cat $filename | grep -i ''$1'' >> ./results/didweplay-''$1''.md ;
done
# TODO: output stats in both the file and the terminal
echo "Donskies! Results in ./results/didweplay-$1.md"