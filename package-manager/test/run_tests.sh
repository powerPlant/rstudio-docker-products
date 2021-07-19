#!/bin/bash

# start package manager
/opt/rstudio-pm/bin/rstudio-pm --config /etc/rstudio-pm/rstudio-pm.gcfg 2>/tmp/startup.log 

# install goss

GOSS_FILE=${GOSS_FILE:-/tmp/goss.yaml}
GOSS_VARS=${GOSS_VARS:-/tmp/goss_vars.yaml}
GOSS_VERSION=${GOSS_VERSION:-0.3.8}
GOSS_MAX_CONCURRENT=${GOSS_MAX_CONCURRENT:-50}

# default to empty var file (since vars are not necessary)
if [ ! -f "$GOSS_VARS" ]; then
  touch $GOSS_VARS
fi

# install goss to tmp location and make executable
curl -sL https://github.com/aelsabbahy/goss/releases/download/v$GOSS_VERSION/goss-linux-amd64 -o /tmp/goss \
  && chmod +x /tmp/goss \
  && GOSS=/tmp/goss

GOSS_FILE=$GOSS_FILE GOSS_VARS=$GOSS_VARS $GOSS v --format documentation --max-concurrent $GOSS_MAX_CONCURRENT
