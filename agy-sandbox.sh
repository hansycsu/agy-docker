#!/usr/bin/env bash

LOCAL_WORKSPACE="${1:-$(pwd)}"
LOCAL_WORKSPACE="$(cd "$LOCAL_WORKSPACE" 2>/dev/null && pwd || echo "$LOCAL_WORKSPACE")"

sudo docker run -it --rm \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v "$LOCAL_WORKSPACE:/workspace" \
  -v ~/.agy-gemini:/home/ubuntu/.gemini \
  agy-sandbox bash
