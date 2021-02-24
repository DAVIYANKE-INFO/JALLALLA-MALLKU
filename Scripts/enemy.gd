extends KinematicBody2D

var speed = 50
var velocity = Vector2()
export var direction = -1
export var detects_cliffs = true

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	$RayCast2D.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$RayCast2D.enabled = detects_cliffs
#	if detects_cliffs:
#		set_modulate(Color(1.2,0.5,1))
	
func _physics_process(delta):
	
	if is_on_wall() or not $RayCast2D.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h 
		$RayCast2D.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	velocity.y += 20
	
	velocity.x = speed * direction	

	velocity = move_and_slide(velocity,Vector2.UP)


func _on_Area2D_body_entered(body):
	$AnimatedSprite.play("squashed")
	speed = 0
	set_collision_layer_bit(4,false)
	set_collision_mask_bit(0,false)
	$Area2D.set_collision_layer_bit(4,false)
	$Area2D.set_collision_mask_bit(0,false)
	$Area2D2.set_collision_layer_bit(4,false)
	$Area2D2.set_collision_mask_bit(0,false)
	$Timer.start(1)
	body.bounce()
	$SoundSquash.play()


func _on_Area2D2_body_entered(body):
	#print("auuu")
	#get_tree().change_scene("res://piso.tscn")
	body.ouch(position.x)

func _on_Timer_timeout():
	queue_free()
