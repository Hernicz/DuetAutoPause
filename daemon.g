; You need to put "  global ext1=0  " in config.g   <<<<<<<<<<<<<<<<<<<<<< THIS
; Code is better :)

; G4 P50 means wait 50 miliseconds (0.05 s)


if state.status = "processing" && sensors.endstops[0].triggered
	while true
		if iterations < 60 && sensors.endstops[0].triggered
			continue
			G4 P50
		if iterations = 60 && sensors.endstops[0].triggered
			M25
			set global.ext1=1
		else
			break


if state.status == "paused" && {global.ext1} = 1
	while true
		if iterations < 60 && !sensors.endstops[0].triggered
			continue
			G4 P50
		if iterations = 60 && !sensors.endstops[0].triggered
			M24
			set global.ext1=0
		else
			break
