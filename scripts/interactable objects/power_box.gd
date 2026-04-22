extends Interactable

@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D

signal power_off
var power_on: bool = true

func interact (body):
	if power_on == true:
		audio_stream_player_3d.play()
		power_off.emit()
		power_on = false
		prompt_message = "The power is now off"
	else:
		pass

func _on_level_manager_power_restored() -> void:
	power_on = true
	prompt_message = "Interact"
