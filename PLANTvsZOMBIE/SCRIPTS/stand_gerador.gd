extends Node2D

var hp = 40
const big_fire_ball = preload("res://CENAS/sol_moeda.tscn")

func _on_timer_timeout():
	var sol = big_fire_ball.instantiate()
	add_child(sol)
	sol.position = $Marker2D.position
	sol.position = Vector2(randf_range(-30,30),randf_range(-30,30))
	$AnimationPlayer.play("PODER")
	$Timer.wait_time = randf_range(5,10)


func _on_animation_player_animation_finished(anim_name):
	
	if anim_name == "PODER":
		$AnimationPlayer.play("IDLE")
	
