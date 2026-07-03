FROM            docker.io/redhat/ubi9:9.8-1781496985
RUN             dnf module disable nodejs -y && \
                dnf module enable nodejs:22 -y && \
                dnf install -y nodejs && \
                dnf clean all
RUN             useradd -u 1000 roboshop 
RUN             mkdir /app && chown -R roboshop:roboshop /app
WORKDIR         /app
USER            roboshop
ADD             ./ /app/
ENTRYPOINT      ["node", "/app/server.js"]
EXPOSE          8080