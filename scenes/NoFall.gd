extends Area2D

export var sceneName: String = "noob"

var player_path: String = "res://scenes/Player"

func _on_NoFall_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene(str("res://scenes/" + sceneName + ".tscn"))
