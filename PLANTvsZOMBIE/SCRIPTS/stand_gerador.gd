extends Node2D

var hp = 40
const big_fire_ball = preload("res://CENAS/sol_moeda.tscn")

var viva = true

func _on_timer_timeout():
	if viva:
		$AnimationPlayer.play("PODER")
		$Timer.wait_time = randf_range(5,10)


func _on_animation_player_animation_finished(anim_name):
	if viva: 
		if anim_name == "PODER":
			var sol = big_fire_ball.instantiate()
			add_child(sol)
			sol.position = $Marker2D.position
			sol.position = Vector2(randf_range(-30,30),randf_range(-30,30))
			$AnimationPlayer.play("IDLE")
			print(hp)
	if anim_name == "DERROTADO":
		queue_free()

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("garra_zumbie"): 
		if viva :
			if hp > 0:
				hp -= 10
				print("marguo planta, resta: ", hp)
				
			else:
				viva = false
				$AnimationPlayer.play("DERROTADO")
				
		pass
