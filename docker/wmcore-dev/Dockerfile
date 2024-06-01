# FROM --platform=linux/amd64 registry.cern.ch/cmsweb/alma-base:alma9-20240305
FROM --platform=linux/amd64 gitlab-registry.cern.ch/linuxsupport/alma9-base:latest

# Install cern repo
RUN dnf install -y 'dnf-command(config-manager)' && \
    dnf config-manager --add-repo https://linuxsoft.cern.ch/cern/alma/9/devel/x86_64/os

# Install epel-repo
RUN dnf upgrade -y && \
    dnf install -y epel-release && \
    dnf clean all

# Install basic tools
RUN dnf upgrade -y && \
    dnf install -y gcc git vim libcurl-devel \
        python3 python3-devel python3-pip \
        mariadb-connector-c-devel cmake && \
    dnf clean all

# Install wlcg repo and gfal2
RUN dnf install -y http://linuxsoft.cern.ch/wlcg/el9/x86_64/wlcg-repo-1.0.0-1.el9.noarch.rpm && \
    dnf -y install python3-gfal2 python3-gfal2-util gfal2-plugin-http gfal2-plugin-dcap gfal2-plugin-file \
	gfal2-plugin-srm gfal2-plugin-xrootd gfal2-plugin-gridftp gfal2-plugin-sftp && \
    dnf clean all

# Tools for getting proxies
RUN dnf install -y wlcg-voms-cms voms-clients-cpp && \
    dnf clean all

WORKDIR /home/cmsbld

RUN git clone https://github.com/dmwm/WMCore

# Remove gfal2 from requirements to use RPM gfal2
RUN sed '/gfal2/d' /home/cmsbld/WMCore/requirements.txt > /home/cmsbld/WMCore/requirements-dev.txt

RUN pip3 install --no-cache-dir --upgrade pip setuptools wheel && \
    pip3 install --no-cache-dir --ignore-installed -r /home/cmsbld/WMCore/requirements-dev.txt

ADD TestScripts /home/cmsbld/TestScripts
ADD ContainerScripts /home/cmsbld/ContainerScripts
ADD entrypoint.sh /entrypoint.sh

ENV X509_HOST_CERT=/data/certs/servicecert.pem
ENV X509_HOST_KEY=/data/certs/servicekey.pem
ENV X509_USER_CERT=/data/certs/servicecert.pem
ENV X509_USER_KEY=/data/certs/servicekey.pem

ENTRYPOINT ["/entrypoint.sh"]
