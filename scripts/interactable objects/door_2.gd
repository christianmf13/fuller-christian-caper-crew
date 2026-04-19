extends Interactable

var has_keys: bool = false

func interact(body):
	if has_keys:
		pass
	else:
		prompt_message = "This door is locked."
