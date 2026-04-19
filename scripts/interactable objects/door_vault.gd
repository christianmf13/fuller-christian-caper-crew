extends Interactable

var has_vault_keys: bool = false

func interact(body):
	if has_vault_keys:
		pass
	else:
		prompt_message = "This door is locked. Find the vault keys to unlock."
