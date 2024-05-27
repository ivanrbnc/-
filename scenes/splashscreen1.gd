extends Control

export var sceneName: String = "splashscreen2"

func _on_Next_pressed():
	get_tree().change_scene(str("res://scenes/" + sceneName + ".tscn"))
