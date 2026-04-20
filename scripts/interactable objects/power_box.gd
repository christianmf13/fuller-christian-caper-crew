extends Interactable

signal power_off
var power_on: bool = true

func interact (body):
	power_off.emit()
	power_on = false
	prompt_message = "The power is now off"

func _on_level_manager_power_restored() -> void:
	power_on = true
	prompt_message = "Interact"
