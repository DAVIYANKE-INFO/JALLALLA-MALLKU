extends Node2D

var datos_partida = {
	nivel=0,
	uno=false,
	dos=false,
	tres=false,
	cuatro=false,
	cinco=false
	}
func _ready():
# ++++++++++++PARA LOS NIVELES CANDADOS+++++++++++++++++++++++
	#global.cargar_partida(global.nivel_actual)
	var cargar = File.new()
	if(!cargar.file_exists("user://database.json")):
		#print("NO HAY PARTIDAS GUARDADAS")
		return
	
	cargar.open("user://database.json",File.READ)
	
	var datos_cargar = datos_partida
	#var todos_datos
	while(!cargar.eof_reached()):
		var dato_provis = parse_json(cargar.get_line())
		if(dato_provis!=null):
			datos_cargar = dato_provis
	cargar.close()
	Global.cargar_partida(datos_cargar.nivel)
	var nivel_1=get_node("/root/Node2D/TextureButton")
	nivel_1.disabled=Global.uno_1
	var nivel_2=get_node("/root/Node2D/TextureButton2")
	nivel_2.disabled=Global.dos_2
	var nivel_3=get_node("/root/Node2D/TextureButton3")
	nivel_3.disabled=Global.tres_3
	var nivel_4=get_node("/root/Node2D/TextureButton4")
	nivel_4.disabled=Global.cuatro_4
	var nivel_5=get_node("/root/Node2D/TextureButton5")
	nivel_5.disabled=Global.cinco_5
# +++++++++++ FIN PARA LOS NIVELES CANDADOS+++++++++++++++++++


func _on_TextureButton_button_up():
	Global.tiempito = 60
	get_tree().change_scene("res://piso.tscn")

func _on_TextureButton2_button_up():
	Global.tiempito = 55
	get_tree().change_scene("res://piso2.tscn")


func _on_TextureButton3_button_up():
	Global.tiempito = 50
	get_tree().change_scene("res://piso3.tscn")


func _on_TextureButton4_button_up():
	Global.tiempito = 45
	get_tree().change_scene("res://piso4.tscn")


func _on_TextureButton5_button_up():
	Global.tiempito = 40	
	get_tree().change_scene("res://piso5.tscn")
