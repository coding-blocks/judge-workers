FROM codingblocks/judge-worker-base

RUN apk add --no-cache openjdk8 bash
ENV PATH="/usr/lib/jvm/java-1.8-openjdk/bin:${PATH}"

RUN apk add --no-cache bash && \
    apk add --no-cache -t build-dependencies wget && \
    cd /usr/lib && \
    wget https://github.com/JetBrains/kotlin/releases/download/v1.2.70-eap-4/kotlin-compiler-1.2.70-eap-4.zip && \
    unzip kotlin-compiler-*.zip && \
    rm kotlin-compiler-*.zip && \
    rm kotlinc/bin/*.bat && \
    apk del --no-cache build-dependencies
ENV PATH=$PATH:/usr/lib/kotlinc/bin

COPY ./compile.sh /bin/compile.sh
COPY ./run.sh /bin/run.sh

RUN chmod 777 /bin/compile.sh; \
    chmod 777 /bin/run.sh
