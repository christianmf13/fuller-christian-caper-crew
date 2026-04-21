extends Node3D

@onready var play_button: Button = $Camera3D/PlayButton
@onready var settings_button: Button = $Camera3D/SettingsButton
@onready var quit_button: Button = $Camera3D/QuitButton

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_01.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
