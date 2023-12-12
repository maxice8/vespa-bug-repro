FROM busybox as builder

# Create a directory for your files
RUN mkdir /vespa-bug-repro

# Copy your files into the image
COPY vespa /vespa-bug-repro/vespa
COPY data.json /vespa-bug-repro/data.json
COPY --chmod=750 entrypoint.sh /vespa-bug-repro/entrypoint.sh

FROM vespaengine/vespa as runner

COPY --from=builder /vespa-bug-repro /vespa-bug-repro

EXPOSE 8080
EXPOSE 19071

# Set the entrypoint
ENTRYPOINT ["/vespa-bug-repro/entrypoint.sh"]