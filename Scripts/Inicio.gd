extends Node2D


func _ready():
	#$AnimationPlayer.play("fade_out")
	#get_tree().change_scene("res://juego.tscn")
	pass
func _on_Timer_timeout():
	get_tree().change_scene("res://juego.tscn")
