extends Area2D

export var sceneName: String = "evolve"

func _on_ToEvolve_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene(str("res://scenes/" + sceneName + ".tscn"))
