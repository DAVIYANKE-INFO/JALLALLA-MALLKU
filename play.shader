shader_type canvas_item;
//
//uniform float mov = 10.0;
//void vertex(){
//	VERTEX.y += cos(TIME * 10.0) * mov ;
//	VERTEX.x += cos(TIME * 10.0) * mov ;
//}
uniform float mov = 10.0;

void vertex(){
	VERTEX.y += cos(TIME * 5.0) * mov ;
	VERTEX.x += cos(TIME * 5.0) * mov ;
}

