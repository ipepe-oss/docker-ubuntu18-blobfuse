#!/bin/bash

set -euo pipefail
set -o errexit
set -o errtrace
IFS=$'\n\t'

# mount our blobstore
test ${AZURE_MOUNT_POINT}
# rm -rf ${AZURE_MOUNT_POINT}
mkdir -p ${AZURE_MOUNT_POINT}

echo Before mounting command

blobfuse ${AZURE_MOUNT_POINT} --use-https=true --tmp-path=/tmp/blobfuse/${AZURE_STORAGE_ACCOUNT} --container-name=${AZURE_STORAGE_ACCOUNT_CONTAINER} -o allow_other
echo blobfuse ${AZURE_MOUNT_POINT} --use-https=true --tmp-path=/tmp/blobfuse/${AZURE_STORAGE_ACCOUNT} --container-name=${AZURE_STORAGE_ACCOUNT_CONTAINER} -o allow_other


echo Finished mounting with
echo $?

tail -f /dev/null
