extends Interactable

var has_keys: bool = false

func interact(body):
	if has_keys:
		prompt_message = "Door opened"
	else:
		prompt_message = "This door is locked. Find office keys to unlock."


func _on_level_manager_has_office_keys() -> void:
	has_keys = true
