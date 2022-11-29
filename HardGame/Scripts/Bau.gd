extends Area2D



func _ready():
	pass 


func _on_Bau_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene("res://Cenas/Bau.tscn")

