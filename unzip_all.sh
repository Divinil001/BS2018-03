 #!/bin/bash

# find -type f -name "*.zip" -exec echo '{}' $(dirname '{}') $(pwd) \; -exec echo '{}' \;

find -type f -name "*.zip" -exec bash -c 'x="{}" ; echo "x:" "$x" ; echo "Trying to enter dir" "$(dirname $x)" ; cd "$(dirname "$x")" ; echo "Current path:" $(pwd) ; echo "Trying to unzip" $x ; unzip ${x##*/} ; rm ${x##*/}' \;