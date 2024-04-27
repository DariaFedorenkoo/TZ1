func() {
  for obj in $(ls $1)
  do
    if [ -d $1/$obj ]
    then
      func $1/$obj $2
    else
      check=$(find $2 -name $obj | wc -l)
      if [ $check -eq 1 ]
      then
        name=$obj
        while [ $check -eq 1 ]
        do
          name+="z"
          check=$(find $2 -name $name | wc -l)
        done
        mv $2/$obj $2/$name
      fi
      cp $1/$obj $2
    fi
  done
}

mkdir $2
func $1 $2