## Organise files by filetype into correct folders

for file in {*.jpg,*.png,*.jpeg,*.gif}; do
folder=$(basename "/images")
mkdir -p "$folder" && mv "$file" "$folder"
done

for file in *.js; do
folder=$(basename "/js")
#conditional to not move gulpfile.js as it is required in the root directory in order to run gulp
if [ "$file" != "gulpfile.js" ]
then
mkdir -p "$folder" && mv "$file" "$folder"
fi
done

for file in *.css; do
folder=$(basename "/css")
mkdir -p "$folder" && mv "$file" "$folder"
done

for file in *.ttf,*.otf,*.woff,*ott; do
folder=$(basename "/fonts")
mkdir -p "$folder" && mv "$file" "$folder"
done
