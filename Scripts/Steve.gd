extends KinematicBody2D

var velocity = Vector2(0,0)
var coins = 0
const SPEED = 200
const GRAVITY = 30
const JUMPFORCE = -900

var vidas = 5

func _physics_process(delta):
	
	if Input.is_action_pressed("moverderecha") || Input.is_action_pressed("right"):
		if Input.is_action_pressed("correr"):
			velocity.x = SPEED+100
			$Sprite.play("run")
			$Sprite.flip_h = false
		else:
			velocity.x = SPEED
			$Sprite.play("walk")
			$Sprite.flip_h = false
		
	elif Input.is_action_pressed("moverizquierda") || Input.is_action_pressed("left"):
		if Input.is_action_pressed("correr"):
			velocity.x = -(SPEED+100)
			$Sprite.play("run")
			$Sprite.flip_h = true
		else:
			velocity.x = -SPEED
			$Sprite.play("walk")
			$Sprite.flip_h = true
	else:
		$Sprite.play("idle")
	
	if not is_on_floor():
		$Sprite.play("air")
		
		
	velocity.y = velocity.y + GRAVITY
	
	if (Input.is_action_just_pressed("saltar") || Input.is_action_just_pressed("jump")) and is_on_floor():
		velocity.y = JUMPFORCE
		$SoundJump.play()
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)
	
#	if coins == 3:
#		get_tree().change_scene("res://piso.tscn")




func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://fin_juego.tscn")


#func add_coin():
#	coins = coins + 1
#	print("coins--> ", coins)

func bounce():
	velocity.y = JUMPFORCE * 0.7

func ouch(var enemyposx):
	set_modulate(Color(1,0.3,0.3,0.3))
	velocity.y = JUMPFORCE * 0.5
	
	if position.x < enemyposx:
		velocity.x = -800
	elif position.x > enemyposx:
		velocity.x = 800
	Input.action_release("left")
	Input.action_release("right")

	$Timer.start()
	if vidas==5:
		get_node('../CanvasLayer/Node2D3/vida1').visible=false
	if vidas==4:
		get_node('../CanvasLayer/Node2D3/vida2').visible=false
	if vidas==3:
		get_node('../CanvasLayer/Node2D3/vida3').visible=false
	if vidas==2:
		get_node('../CanvasLayer/Node2D3/vida4').visible=false
	if vidas==1:
		get_node('../CanvasLayer/Node2D3/vida5').visible=false
	vidas=vidas-1
	if vidas==0:
		$Timer2.start()
		
	

func _on_Timer_timeout():
	#get_tree().change_scene("res://fin_juego.tscn")
	set_modulate(Color(1,1,1,1))


func _on_Timer2_timeout():
	get_tree().change_scene("res://fin_juego.tscn")
