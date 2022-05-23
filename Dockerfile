 
FROM ubuntu:latest
RUN apt-get update && apt-get upgrade -y
## Grab-site dependancies:
RUN  apt-get install --no-install-recommends -y \
    wget ca-certificates git build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev libffi-dev libxml2-dev \
    libxslt1-dev libre2-dev pkg-config
#
RUN apt-get install -y byobu screen tmux nano vim

# Clone grab-site repo:
RUN mkdir -vp "/grabsite" \
    && chmod -vR 'u=rwX,g=rwX,o=rX' '/grabsite'
RUN git clone "http://github.com/ArchiveTeam/grab-site.git" "/grabsite/ArchiveTeam.grab-site/"

# Create non-root user:
RUN groupadd grabsite --gid 1000 && \
    useradd --no-log-init --uid 1000 -g grabsite grabsite

# Copy in scripts:
COPY --chown=1000:1000 "gs-install.sh" "/grabsite/gs-install.sh"
COPY --chown=1000:1000 "entrypoint.sh" "/grabsite/entrypoint.sh"
COPY --chown=1000:1000 "pause_resume_grab_sites.sh" "pause_resume_grab_sites.sh"

# Assign ownership and permissions:
RUN chown -vR '1000:1000' '/grabsite' \
    && chmod -vR 'u=rwX,g=rwX,o=rX' '/grabsite' \
    && chmod -v  'u=rwx,g=rwx,o=r' '/grabsite/entrypoint.sh' "/grabsite/gs-install.sh" "pause_resume_grab_sites.sh" \
    && ls -lahFQn "/" "/grabsite"

USER 1000:1000
# Perform non-root grab-site install:
RUN "/grabsite/gs-install.sh"

WORKDIR "/grabsite/download"
ENTRYPOINT [ "/grabsite/entrypoint.sh" ]
VOLUME "/grabsite/download"
VOLUME "/grabsite/cmd/"
EXPOSE "29000"
LABEL description="grab-site"
