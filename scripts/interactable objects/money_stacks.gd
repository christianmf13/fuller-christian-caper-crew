extends Interactable

signal money_collected

func interact(body):
	money_collected.emit()
	queue_free()
