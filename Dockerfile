FROM amd64/alpine:latest

LABEL maintainer="minmxren <renmingxv@gmail.com>"

ARG FRP_VERSION_ARG
ENV FRP_VERSION=${FRP_VERSION_ARG}


RUN cd /root \
    &&  wget --no-check-certificate -c https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    &&  tar zxvf frp_${FRP_VERSION}_linux_amd64.tar.gz  \
    &&  cd frp_${FRP_VERSION}_linux_amd64/ \
    &&  cp frps frpc /usr/bin/ \
    &&  mkdir -p /etc/frp \
    &&  cp frpc.toml frps.toml /etc/frp \
    &&  cd /root \
    &&  rm frp_${FRP_VERSION}_linux_amd64.tar.gz \
    &&  rm -rf frp_${FRP_VERSION}_linux_amd64/
