#!/bin/sh
docker start vespa-bug-repro || \
    docker run --rm --detach \
        --name vespa-bug-repro \
        --volume .:/vespa-bug-repro \
        --publish 8080:8080 --publish 19071:19071 \
        vespaengine/vespa:8.224.19 || exit 1

# shellcheck disable=SC2088
docker exec -it vespa-bug-repro sh -c '~/bin/vespa-deploy prepare /vespa-bug-repro/vespa && ~/bin/vespa-deploy activate && ~/bin/vespa feed /vespa/bug-repro/data.json'
