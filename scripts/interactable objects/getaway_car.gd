extends Interactable

@onready var collision_shape_3d: CollisionShape3D = $CollisionShape3D

signal success
var done_looting = false

func interact(body):
	if !done_looting:
		prompt_message = "You are not ready to leave yet."
	if done_looting == true:
		
		success.emit()


func _on_level_manager_done_looting() -> void:
	done_looting = true
