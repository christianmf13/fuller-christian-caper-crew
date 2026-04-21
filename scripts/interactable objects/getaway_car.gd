extends Interactable

@onready var collision_shape_3d: CollisionShape3D = $CollisionShape3D

signal success

func interact(body):
	prompt_message = "CONGRATS YOU WON (ONLY AT THE END OF THE LEVEL THOUGH)."
	success.emit()
