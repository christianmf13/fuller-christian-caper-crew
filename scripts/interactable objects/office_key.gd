extends Interactable

signal office_key_obtained

func interact(body):
	office_key_obtained.emit()
	queue_free()
	
