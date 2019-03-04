FROM bash:5.0 as builder

# Download the documentation
ADD https://docs.python.org/3.6/archives/python-3.6.8-docs-html.zip /home

# Unpack the documentation
RUN unzip -q /home/python-3.6.8-docs-html.zip -d /home

# Grant read and execute permits to others on python-3.6.8-docs-html directory
RUN chmod -R o+rx /home/python-3.6.8-docs-html

FROM httpd:2.4-alpine

# Copy the result obtained in builder stage
COPY --from=builder /home/python-3.6.8-docs-html /usr/local/apache2/htdocs
