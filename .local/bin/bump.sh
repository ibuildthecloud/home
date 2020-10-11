#!/bin/bash
set -e

declare -A UPDATES

for BUMP; do
    while read REPO COMMIT; do 
        if [[ $REPO != *"${BUMP}"* ]]; then
            continue
        fi

        if [ -z "${COMMIT}" ]; then
            continue
        fi

        NEW_COMMIT=$(git ls-remote https://$REPO HEAD | awk '{print $1}')
        if [[ $COMMIT != $NEW_COMMIT ]]; then
            UPDATES[$REPO]=$NEW_COMMIT
        fi
    done < go.mod
done

echo $UPDATES
for REPO in "${!UPDATES[@]}"; do
    NEW_COMMIT="${UPDATES[$REPO]}"
    echo Updating $REPO to commit $NEW_COMMIT
    go get ${REPO}@${NEW_COMMIT:-master}
done
