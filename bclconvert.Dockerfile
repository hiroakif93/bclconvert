FROM oraclelinux:8

# If BCL Convert is updated, please update “BCL_RPM.”
ARG BCL_RPM="bcl-convert-4.2.7-2.el8.x86_64.rpm"
ARG BCL_URL="https://webdata.illumina.com/downloads/software/bcl-convert/${BCL_RPM}"

RUN dnf -y update && \
    dnf -y install \
      wget \
      tar \
      gzip \
      libxml2 \
      libxslt \
      numactl \
      which \
      hostname \
      procps-ng \
      git \
      vim && \
    dnf clean all && \
    rm -rf /var/cache/dnf

WORKDIR /opt

COPY Dummy.csv /opt/Dummy.csv

RUN wget -O /opt/bcl-convert.rpm "${BCL_URL}" && \
    dnf -y install /opt/bcl-convert.rpm && \
    rm -f /opt/bcl-convert.rpm && \
    dnf clean all && \
    rm -rf /var/cache/dnf

WORKDIR /data

ENTRYPOINT ["bcl-convert"]
