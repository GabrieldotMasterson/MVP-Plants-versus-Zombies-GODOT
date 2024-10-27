extends Node2D

const bala = preload("res://scenes/projetil.tscn")

var hp = 200

var dano_constante = false
var dano_espera = false

func _ready():
	pass

func _process(_delta):
	if dano_constante:
		if dano_espera:
			$dano_timer.start()
			dano_espera = false
	
func _on_timer_timeout():
	var b = bala.instantiate() 
	add_child(b) 
	b.position = $Icon/Marker2D.position 

func _on_area_2d_area_entered(area):
	if area.is_in_group("zumbie"):
		dano_constante = true
		dano_espera = true
	
func _on_area_2d_area_exited(area):
	if area.is_in_group("zumbie"):
		dano_constante = false
		dano_espera = false

func _on_dano_timer_timeout() -> void:
	hp -= 50
	dano_espera = true
	if hp <= 0:
		queue_free()
