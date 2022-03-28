FROM ubuntu:20.04
RUN apt-get update \
    && apt-get install -y curl gnupg2 software-properties-common libcurl3-gnutls libgnutls30
RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN apt-add-repository https://packages.microsoft.com/ubuntu/20.04/prod
RUN apt-get update && apt-get install -y blobfuse

# CMD ["blobfuse", "--help"]

ENV AZURE_MOUNT_POINT=/mnt/azure
ENV AZURE_STORAGE_ACCOUNT, AZURE_STORAGE_ACCESS_KEY, AZURE_STORAGE_ACCOUNT_CONTAINER
COPY mount-blobfuse.sh /
RUN chmod 755 /mount-blobfuse.sh
ENTRYPOINT ["/mount-blobfuse.sh"]
