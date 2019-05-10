#!/bin/sh

template="TemplateRobotProject"

die(){
  echo "error: $1"
  exit 1
}

usage() {
  echo -e "usage: $(basename $0) <name>\nDon't append .X, it will be automatically added"
  exit 1
}

test -d "$template.X" || die "couldn't find $template.X"
test $# -eq 1 || usage
name="$1"

echo "cleaning template"
pushd $template.X >/dev/null
make clean >/dev/null
popd >/dev/null

echo "creating $name.X"
cp -r $template.X $name.X
sed -i "s/$template/$name/g" $name.X/nbproject/*.{mk,xml}
sed -i "s/$template/$name/g" $name.X/main.c

echo "finished"
