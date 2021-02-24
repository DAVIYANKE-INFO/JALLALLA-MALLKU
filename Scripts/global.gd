extends Node2D

var tiempito

var nivel = 0


#//////////////////////////////////////////////////////////////////////////////////////
var nivel_actual=1

var uno_1=true
var dos_2=true
var tres_3=true
var cuatro_4=true
var cinco_5=true

var datos_partida = {
	nivel=0,
	uno=false,
	dos=false,
	tres=false,
	cuatro=false,
	cinco=false,
	}
#//////////////////////////////////////////////////////////////////////////////////////

#func cambia_escenita(scene):
#	self.scale = Vector2(1,1)
#	$anim.play("fade_in")
#	yield($anim,"animation_finished")
#	get_tree().change_scene(scene)
#	$anim.play("fade_out")
#	yield($anim,"animation_finished")
#	self.scale = Vector2(0,0)
	
func _ready():
#	self.scale = Vector2(0,0)
	#//////////////////////////////////////////////////////////////////////////////////////
	var path =Directory.new()
	if(!path.dir_exists("user://")):
		path.open("user://")
		path.make_dir("user://")
	var inicio = File.new()
	if(!inicio.file_exists("user://database.json")):
		var saves=File.new()
		saves.open("user://database.json",File.WRITE)
		var datos_guardar=datos_partida
		datos_guardar.nivel=1
		datos_guardar.uno=uno_1
		datos_guardar.dos=dos_2
		datos_guardar.tres=tres_3
		datos_guardar.cuatro=cuatro_4
		datos_guardar.cinco=cinco_5
	
		saves.store_line(to_json(datos_guardar))
		saves.close()
#//////////////////////////////////////////////////////////////////////////////////////

#//////////////////////////////////////////////////////////////////////////////////////
func guardar_partida(var numero):
	print("NIVEL --->  ",numero)
	var save=File.new()
	save.open("user://database.json",File.WRITE)
	var datos_guardar=datos_partida
	datos_guardar.nivel=numero
	
	datos_guardar.uno=uno_1
	datos_guardar.dos=dos_2
	datos_guardar.tres=tres_3
	datos_guardar.cuatro=cuatro_4
	datos_guardar.cinco=cinco_5
	
	if(numero==1):
		datos_guardar.uno=false
	if(numero==2):
		datos_guardar.dos=false
	if(numero==3):
		datos_guardar.tres=false
	if(numero==4):
		datos_guardar.cuatro=false
	if(numero==5):
		datos_guardar.cinco=false
	
	save.store_line(to_json(datos_guardar))
	save.close()
#//////////////////////////////////////////////////////////////////////////////////////

#//////////////////////////////////////////////////////////////////////////////////////
func cargar_partida(var numero):
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
	nivel_actual=numero
	uno_1=datos_cargar.uno
	dos_2=datos_cargar.dos
	tres_3=datos_cargar.tres
	cuatro_4=datos_cargar.cuatro
	cinco_5=datos_cargar.cinco

	
	if(numero==1):
		uno_1=false
	if(numero==2):
		dos_2=false
	if(numero==3):
		tres_3=false
	if(numero==4):
		cuatro_4=false
	if(numero==5):
		cinco_5=false

#//////////////////////////////////////////////////////////////////////////////////////


