extends Control

export var sceneName: String = "noob"

func _on_Start_pressed():
	get_tree().change_scene(str("res://scenes/" + sceneName + ".tscn"))

func _on_Quit_pressed():
	get_tree().quit()
