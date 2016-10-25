FROM phusion/passenger-customizable:0.9.18
ENV HOME /root

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV PYTHONIOENCODING UTF-8
ENV TERM xterm

COPY code/requirements.txt /tmp/
COPY conf/requirements.txt /tmp/requirements2.txt

RUN apt-get update

RUN /pd_build/utilities.sh && \
        /pd_build/python.sh && \
        /pd_build/nodejs.sh && \
        rm -f /etc/service/nginx/down && \ 
        apt-get install -y python-setuptools && \
        easy_install pip && \
        pip install apt-mirror-updater && \
        apt-mirror-updater -a --update-package-lists && \
        npm install -g less && \
        apt-get install -y --no-install-recommends \
                                python-setuptools python-dev build-essential \
                                libpq-dev libxml2-dev libxslt1-dev \
                                libsasl2-dev libldap2-dev libssl-dev \
                                nano ruby2.2-dev libjpeg-dev libjpeg8-dev \
                                swig

RUN pip install --requirement /tmp/requirements.txt
RUN pip install --requirement /tmp/requirements2.txt

RUN locale-gen es_AR.UTF-8 && \
    locale-gen es_CL.UTF-8 && \
    locale-gen es_US.UTF-8 && \
    update-locale


RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install odoo source code at startup
RUN mkdir -p /etc/my_init.d
ADD atoinit.sh /etc/my_init.d/atoinit.sh
RUN chmod +x /etc/my_init.d/atoinit.sh

RUN mkdir /home/app/conf && mkdir /home/app/code

VOLUME /home/app/code
VOLUME /home/app/conf
WORKDIR /home/app/code

EXPOSE 8069 3000 80

CMD ["/sbin/my_init"]