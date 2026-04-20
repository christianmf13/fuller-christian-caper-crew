extends Interactable

signal gold_collected

func interact(body):
	gold_collected.emit()
	queue_free()
