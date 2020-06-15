FROM nginx:1.15.8
LABEL maintainer="erika.pauwels@gmail.com"

ENV ENABLE_ENDPOINT_SELECTOR false
ENV DEFAULT_SPARQL_ENDPOINT http://localhost/sparql

COPY index.html /usr/share/nginx/html/
COPY default.conf /etc/nginx/conf.d/default.conf
COPY startup.sh /
RUN chmod +x /startup.sh

ENTRYPOINT ["/startup.sh"]

CMD ["nginx", "-g", "daemon off;"]
