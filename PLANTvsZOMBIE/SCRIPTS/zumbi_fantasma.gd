extends Node2D

var hp = 50
var vel_andar = 250
var dano = 5
var andar = false
var atacando = false

const garra = preload("res://CENAS/garra.tscn")

func _process(delta):
	if andar and atacando == false:
		position -= Vector2(delta*vel_andar,0)

func _on_timer_caminhada_timeout():
	
	if not atacando:
		andar = not andar
		if andar:
			$AnimationPlayer.play("ANDAR")
			#print("anda")
			$Timer_CAMINHADA.wait_time = randf_range(1,2.5)
		else:
			$AnimationPlayer.play("IDLE")
			#print("para")
			$Timer_CAMINHADA.wait_time = randf_range(1,4)

func _on_area_2d_area_entered(area):
	if area.is_in_group("planta"):
		print("encostei")
		atacando = true
		$AnimationPlayer.play("ATAQUE")


func _on_area_2d_area_exited(area):
	if area.is_in_group("planta"):
		print("sai da planta")
		atacando = false

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "ATAQUE": #names sigmass
		print("morra samambaia!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		$AnimationPlayer.play("ATAQUE")



func _on_animation_player_animation_started(anim_name: StringName) -> void:
	if anim_name == "ATAQUE": #names sigmass
		print("garr")
		var garr = garra.instantiate()
		add_child(garr)
		garr.position = $Marker2D.position
		
