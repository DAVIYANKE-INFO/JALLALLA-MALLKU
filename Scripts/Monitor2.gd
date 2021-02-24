extends CanvasLayer


func _physics_process(delta):
	$MarginContainer/HBoxContainer/VBoxContainer/Stat01.text = "FPS: " + str(Performance.get_monitor(Performance.TIME_FPS))
	$MarginContainer/HBoxContainer/VBoxContainer/Stat02.text = "Memory Static: " + str(round(Performance.get_monitor(Performance.MEMORY_STATIC)/1024/1024))
