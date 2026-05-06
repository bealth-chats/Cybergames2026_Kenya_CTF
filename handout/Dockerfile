FROM ubuntu:22.04 AS builder
RUN apt-get update && apt-get install -y \
    git python3 curl xz-utils pkg-config build-essential lsb-release \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /src
COPY build.sh challenge.patch ./
RUN chmod +x ./build.sh
RUN ./build.sh


FROM ubuntu:22.04
RUN apt-get update && apt-get install -y socat \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -u 1000 -s /usr/sbin/nologin pwn

COPY --from=builder /src/v8/out.gn/compact-map-fast/d8 /opt/d8
COPY --from=builder /src/v8/out.gn/compact-map-fast/snapshot_blob.bin /opt/snapshot_blob.bin

COPY challenge.js /opt/challenge.js
COPY run_remote.sh /opt/run_remote.sh
RUN chmod +x /opt/run_remote.sh
COPY flag.txt /flag.txt

RUN chmod 0755 /opt/d8 /opt/run_remote.sh \
 && chmod 0444 /opt/challenge.js /opt/snapshot_blob.bin \
 && chown root:pwn /flag.txt && chmod 0440 /flag.txt

USER pwn
EXPOSE 1337
CMD ["socat","-T60","TCP-LISTEN:1337,reuseaddr,fork","EXEC:/opt/run_remote.sh,stderr"]
