#!/bin/bash

DEVICE=/org/kde/KWin/InputDevice/event21

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
