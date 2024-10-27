extends Node2D

var livre = true
var hp = 300
var col_planta = false

func _ready():
	pass 

func _process(delta):
	if livre:
		position += Vector2(-50*delta,0)

func _on_area_2d_area_entered(area):
	if area.is_in_group("projetil"):
		hp -= 50
		$atordoado_timer.start()
		livre = false
		
		if hp <= 0:
			get_tree().ini_derrotados -= 1
			queue_free() 
			
	if area.is_in_group("planta"):
		col_planta = true
		livre = false
		

func _on_area_2d_area_exited(area):
	if area.is_in_group("planta"):
		col_planta = false
		livre = true
	pass

func _on_atordoado_timer_timeout() -> void:
	if not col_planta:
		livre = true
	
