extends Area2D

signal  coin_collected

func _on_Area2D_body_entered(body):
	#queue_free()
	$AnimationPlayer.play("bounce")
	#body.add_coin()
	emit_signal("coin_collected")
	set_collision_layer_bit(0,false)
	$SoundCoinCollected.play()

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()

