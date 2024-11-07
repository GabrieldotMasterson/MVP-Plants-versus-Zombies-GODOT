extends Node2D

var hp = 60
var atk = false



func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $RayCast2D.is_colliding() and atk == false:
		atk = true
		print("sigmas vizalizados")
		$AnimationPlayer.play("PODER")
		
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "PODER":
		print("bala")
		$AnimationPlayer.play("PODER")
