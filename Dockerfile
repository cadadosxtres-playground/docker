FROM ubuntu:latest

# Install necessary packages (example: you can adjust based on your needs)
RUN apt-get update && apt-get install -y \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Create a user with the same UID and GID as the host
ARG UID
ARG GID
RUN groupadd -g ${GID} usergroup && \
    useradd -m -u ${UID} -g usergroup -s /bin/bash user && \
    echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    chown -R ${UID}:${GID} /home/user

# Switch to the created user
USER user
WORKDIR /home/user

# Any additional setup or application code

ENTRYPOINT [ "/bin/bash" ]