#!/bin/sh
# Start Vespa
/usr/local/bin/start-container.sh &

# Sleep a few seconds to let it start
/bin/echo "Waiting 5 seconds for Vespa to start"
/bin/sleep 5

# Feed it the ApplicationPackage
/opt/vespa/bin/vespa deploy --wait 120 /vespa-bug-repro/vespa

# Feed the data
/opt/vespa/bin/vespa feed --wait 120 /vespa-bug-repro/data.json

# Sleep forever
exec /bin/tail -f /dev/null