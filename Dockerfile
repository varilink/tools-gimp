FROM debian:bookworm
LABEL maintainer="david.williamson@varilink.co.uk"
ARG UID=1000

RUN                                                                            \
  apt-get update                                                            && \
  apt-get install --yes --no-install-recommends                                \
    gimp                                                                    && \
    useradd --create-home --uid ${UID} gimp

USER ${UID}
WORKDIR /gimp

COPY docker-entrypoint.sh /
ENTRYPOINT [ "bash", "/docker-entrypoint.sh" ]
