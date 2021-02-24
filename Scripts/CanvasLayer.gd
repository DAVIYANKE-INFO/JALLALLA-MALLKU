extends CanvasLayer

var coins = 0
var plata = 0
#var vids = 5
var tiempo = Global.tiempito

func _ready():
	$Label2.text = String(plata)

#func _physics_process(delta):
#	if coins == 3:
#		get_tree().change_scene("res://ganar.tscn")

func _on_Area2D2_coin_collected():
	coins = coins + 1
	_ready()
	$Node2D2/Spritebarbijo.visible=true
	$Node2D/Spritebarbijo.visible=false
	$armar/Panel3/armarbarbijo.visible=true
	_verifica()
#	if coins == 7:
#		get_tree().change_scene("res://ganar.tscn")


func _on_Area2D_coin_collected():
	coins = coins + 1
	_ready()
	$Node2D2/Spritegel.visible=true
	$Node2D/Spritegel.visible=false
	$armar/Panel3/armargel.visible=true
	_verifica()
#	if coins == 7:
#		get_tree().change_scene("res://ganar.tscn")


func _on_Area2D3_coin_collected():
	coins = coins + 1
	_ready()
	$Node2D2/Spritejabon.visible=true
	$Node2D/Spritejabon.visible=false
	$armar/Panel3/armarjabon.visible=true
	_verifica()
#	if coins == 7:
#		get_tree().change_scene("res://ganar.tscn")


func _on_Area2D4_coin_collected():
	coins = coins + 1
	_ready()
	$Node2D2/Spriteguantes.visible=true
	$Node2D/Spriteguantes.visible=false
	$armar/Panel3/armarguantes.visible=true
	_verifica()
#	if coins == 7:
#		get_tree().change_scene("res://ganar.tscn")


func _on_Area2D5_coin_collected():
	coins = coins + 1
	_ready()
	$Node2D2/Spritemascara.visible=true
	$Node2D/Spritemascara.visible=false
	$armar/Panel3/armarmascara.visible=true
	_verifica()
#	if coins == 7:
#		get_tree().change_scene("res://ganar.tscn")


func _on_Area2D6_coin_collected():
	coins = coins + 1
	_ready()
	$Node2D2/Spritetraje.visible=true
	$Node2D/Spritetraje.visible=false
	$armar/Panel3/armartraje.visible=true
	$armar/Panel3/fondo.visible=false
	_verifica()
#	if coins == 7:
#		get_tree().change_scene("res://ganar.tscn")


func _on_Area2D7_coin_collected():
	coins = coins + 1
	_ready()
	$Node2D2/Spritelentes.visible=true
	$Node2D/Spritelentes.visible=false
	$armar/Panel3/armarlentes.visible=true
	_verifica()
#	if coins == 7:
#		get_tree().change_scene("res://ganar.tscn")


func _verifica():
	if coins == 7:
		#get_tree().change_scene("res://ganar.tscn")
		ganar()


func _on_Timer_timeout():
	if tiempo >0:
		tiempo = tiempo - 1
		update_tiempo()
	else:
		get_tree().change_scene("res://fin_juego.tscn")

func update_tiempo():
	#get_tree().get_nodes_in_group("tiempo")[0].text = String(tiempo)
	$tiempo.text = "00:"+String(tiempo)


func _on_Area2D123_coin_collected():
	plata = plata + 1
	_ready()


func _on_plata1_coin_collected():
	plata = plata + 1
	_ready()
	
func ganar():
	print("NIVEL --->  ",Global.nivel_actual)
#	$Ganar.scale = Vector2(1,1)
#	$Ganar.show()
#	$Ganar/AnimationPlayer.play("ganar")
#	yield($Ganar/AnimationPlayer,"animation_finished")
	#GANASTE EL JUEGO
	if Global.nivel_actual == 5 :
		get_tree().change_scene("res://ganar.tscn")
		
	else :
		get_tree().change_scene("res://Niveles.tscn")
	
	if Global.nivel_actual!=5:
		Global.guardar_partida(Global.nivel_actual+1)
	else:
		Global.guardar_partida(Global.nivel_actual)

