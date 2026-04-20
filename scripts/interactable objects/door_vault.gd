extends Interactable

var has_vault_keys: bool = false

func interact(body):
	if has_vault_keys:
		prompt_message = "Door open."
	else:
		prompt_message = "This door is locked. Find the vault keys to unlock."


func _on_level_manager_has_vault_keys() -> void:
	has_vault_keys = true
