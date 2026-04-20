extends Interactable

signal door_key_obtained

func interact(body):
	door_key_obtained.emit()
	self.queue_free()
