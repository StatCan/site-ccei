ARG BASE_IMAGE=wcms/stc-default
FROM $BASE_IMAGE

COPY tasks/ /etc/periodic/

RUN chmod -R +x /etc/periodic/

CMD ["crond", "-f", "-d", "8"]
