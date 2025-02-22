FROM codingblocks/judge-worker-base

# Install bash, Node.js, and MySQL
RUN apk add --no-cache bash
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.11/main/ nodejs=12.22.6-r0 npm=12.22.6-r0
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.11/main/ mysql=10.4.22-r0 mysql-client=10.4.22-r0

# Initialize MySQL data directory
RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld && \
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

# so that mysql starts on port 3306 (default port)
# this line comments `skip-networking` line in the below file
# if we do not comment this `skip-networking`, mysql server will start on port 0
RUN sed -i '/skip-networking/d' /etc/my.cnf.d/mariadb-server.cnf

# Copy the custom script and make it executable
COPY ./compile.sh /bin/compile.sh
COPY ./pre-run /bin/pre-run
COPY ./run.sh /bin/run.sh

RUN chmod 777 /bin/compile.sh; \
    chmod 777 /bin/run.sh

RUN npm install --prefix /bin/pre-run
