; You need to put "  global SensorTriggered=2  " in config.g
; Code is crappy, may contain errors but it works.


if state.status = "processing" && sensors.endstops[0].triggered
 while true
  if iterations < 20 && sensors.endstops[0].triggered
   continue
   G4 P50
   M400
  if iterations = 20 && sensors.endstops[0].triggered
   M25
   set global.SensorTriggered=1
  else
   break
 else
  if state.status = "processing" && !sensors.endstops[0].triggered
  break
 continue


if state.status == "paused" && {global.SensorTriggered} = 1
 while true
  if iterations < 20 && !sensors.endstops[0].triggered
   continue
   G4 P50
   M400
  if iterations = 20 && !sensors.endstops[0].triggered
   M24
   set global.SensorTriggered=0
  else
   break
