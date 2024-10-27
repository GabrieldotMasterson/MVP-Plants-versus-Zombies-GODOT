extends Node2D

func _ready():
	$Icon/AnimationPlayer.play("new_animation")

func _process(delta):
	position +=  Vector2(150*delta,0)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
	
func _on_area_2d_area_entered(area):
	if area.is_in_group("zumbie"):
		queue_free()
		
	
