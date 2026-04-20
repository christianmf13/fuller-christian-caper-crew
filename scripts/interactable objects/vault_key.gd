extends Interactable

signal vault_key_obtained

func interact(body):
	vault_key_obtained.emit()
	queue_free()
