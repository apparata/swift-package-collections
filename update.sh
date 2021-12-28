#!/bin/sh

set -Eeuo pipefail

## Change directory to the directory that the script is in.
cd "$(dirname ${BASH_SOURCE[0]})"

if [[ $# -eq 0 ]] ; then
    printf "Enter personal Github auth token: " 
    read -s GITHUB_AUTH_TOKEN
    printf "\n"
else
    GITHUB_AUTH_TOKEN=$1
fi

echo "This is going to take a while, so be patient."

INPUT_FILES="Input/*"
for INPUT_FILE_PATH in $INPUT_FILES
do
    FILE=`basename "$INPUT_FILE_PATH"`
    echo "Generating info for packages in ${FILE} from Github..."
    package-collection-generate "Input/${FILE}" "Unsigned/${FILE}" --auth-token $GITHUB_AUTH_TOKEN
done

UNSIGNED_FILES="Unsigned/*"
for UNSIGNED_FILE_PATH in $UNSIGNED_FILES
do
    FILE=`basename "$UNSIGNED_FILE_PATH"`
    echo "Signing ${FILE}..."
    package-collection-sign "Unsigned/${FILE}" "${FILE}" key.pem swift_package.cer
done
