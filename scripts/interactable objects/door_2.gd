extends Interactable

var has_keys: bool = false

func interact(body):
	if has_keys:
		prompt_message = "Door Opened"
	else:
		prompt_message = "This door is locked. Find front door keys to unlock."


func _on_level_manager_has_door_key() -> void:
	has_keys = true
