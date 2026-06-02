#!/bin/bash

DEVICE=/org/kde/KWin/InputDevice/event21

STATE=$(busctl --user get-property \
  org.kde.KWin \
  "$DEVICE" \
  org.kde.KWin.InputDevice \
  pointerAccelerationProfileAdaptive | awk '{print $2}')

if [ "$STATE" = "true" ]; then
    busctl --user set-property \
      org.kde.KWin \
      "$DEVICE" \
      org.kde.KWin.InputDevice \
      pointerAccelerationProfileAdaptive b false

    busctl --user set-property \
      org.kde.KWin \
      "$DEVICE" \
      org.kde.KWin.InputDevice \
      pointerAccelerationProfileFlat b true
else
    busctl --user set-property \
      org.kde.KWin \
      "$DEVICE" \
      org.kde.KWin.InputDevice \
      pointerAccelerationProfileAdaptive b true

    busctl --user set-property \
      org.kde.KWin \
      "$DEVICE" \
      org.kde.KWin.InputDevice \
      pointerAccelerationProfileFlat b false
fi
