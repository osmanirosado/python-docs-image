FROM bash:latest as builder

ARG version=3.8.2

WORKDIR /home

# Build URL of documentation archive and download it
# https://docs.python.org/3.8/archives/python-3.8.2-docs-html.zip
RUN m_version=$(echo ${version} | sed -r -e 's/^([0-9]+\.[0-9]+)\.[0-9]+/\1/') && \
    wget -O archive.zip https://docs.python.org/${m_version}/archives/python-${version}-docs-html.zip

# Unpack the documentation
RUN mkdir docs && unzip -q archive.zip -d docs

# Grant read and execute permits to others on docs directory
RUN chmod -R o+rx docs

FROM httpd:alpine

# Copy the result obtained in builder stage
COPY --from=builder /home/docs /usr/local/apache2/htdocs
