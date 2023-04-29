set -e

if [ $# -eq 0 ]; then

  for scm in $(ls *.scm); do

    cat $scm | gimp --no-interface --batch -

  done

else

  for scm in $@; do

    cat $scm.scm | gimp --no-interface --batch -

  done

fi
