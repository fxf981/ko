FROM alpine:edge

ADD fei.sh /fei.sh
ADD xr /usr/local/bin/xr

RUN apk update && \
    apk add -f --no-cache ca-certificates wget bash && \
    chmod 777 /fei.sh && \
    chmod 777 /usr/local/bin/xr

CMD /fei.sh
