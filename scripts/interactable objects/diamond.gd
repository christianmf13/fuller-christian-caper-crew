extends Interactable

signal diamond_collected

func interact(body):
	diamond_collected.emit()
	queue_free()
	#LevelManager.value_amount =+ item_value
