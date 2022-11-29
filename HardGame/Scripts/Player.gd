extends KinematicBody2D

var speed = Vector2()
var velocity = 100

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		speed.x = velocity
	elif Input.is_action_pressed("ui_left"):
		speed.x = -velocity
	else:
		speed.x = 0
	if Input.is_action_pressed("ui_down"):
		speed.y = velocity
	elif Input.is_action_pressed("ui_up"):
		speed.y = -velocity
	else:
		speed.y = 0
	move_and_slide(speed)


func _on_sensor_kill_body_entered(body):
	if body.is_in_group('enemy'):
		get_tree().reload_current_scene()
