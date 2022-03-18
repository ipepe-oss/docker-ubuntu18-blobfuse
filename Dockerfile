FROM ubuntu:20.04
RUN apt-get update \
    && apt-get install -y wget apt-utils curl gnupg2 software-properties-common
RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN apt-add-repository https://packages.microsoft.com/ubuntu/20.04/prod
RUN apt-get update
RUN apt-get install -y blobfuse

# CMD ["apt-cache", "search", "blob"]
CMD ["arch"]


# # install blobfuse
# RUN apt-get update \
#     && apt-get install -y wget apt-utils \
#     && wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb \
#     && dpkg -i packages-microsoft-prod.deb \
#     && apt-get remove -y wget \
#     && apt-get update \
#     && apt-get install -y --no-install-recommends fuse blobfuse libcurl3-gnutls libgnutls30 \
#     && rm -rf /var/lib/apt/lists/*
# #
# # COPY mount-blobfuse.sh /
# # RUN chmod 755 /mount-blobfuse.sh
# # ENTRYPOINT ["/mount-blobfuse.sh"]
