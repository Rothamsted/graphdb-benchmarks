# Merges *clean.csv files into one
set -e
base_names=`ls *clean* | sed -E s/'_[a-z]+_clean.csv$'//gi | sort | uniq`

for name in $base_names
do
  (head -n 1 $name.csv; tail -n +2 --quiet $name*.csv | sort | uniq ) \
  | sponge $name.csv
  
  rm -f $name*clean.csv 
done
