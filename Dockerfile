FROM jtcressy/powercli_docker
COPY ./scripts /scripts
WORKDIR /scripts
RUN tdnf install cronie -y
COPY crontab /etc/cron.d/vmware-collector
RUN chmod 0644 /etc/cron.d/vmware-collector
RUN touch /var/log/cron.log
ENV INFLUX_DB_PORT 8086
CMD crond && tail -f /var/log/cron.log