extends Interactable

var power_on: bool = true

func interact(body):
	if power_on:
		prompt_message = "This door is locked. Cut the power to unlock."
	else:
		pass
