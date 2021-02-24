extends Button



func _on_Button_pressed():
	#get_tree().change_scene("https://www.google.com")
	OS.shell_open("https://www.facebook.com/daviyanke123/")


func _on_TouchScreenButton_pressed():
	get_tree().change_scene("res://ganar.tscn")


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Niveles.tscn")


func _on_TextureButton2_pressed():
	OS.shell_open("https://www.facebook.com/daviyanke123/")
