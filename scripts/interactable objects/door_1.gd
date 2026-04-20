extends Interactable

@onready var collision_shape_3d: CollisionShape3D = $CollisionShape3D
@onready var collision_shape_3d_2: CollisionShape3D = $CollisionShape3D2

var has_keys: bool = false
var door_open: bool = false

func _ready() -> void:
	collision_shape_3d.disabled = false
	collision_shape_3d_2.disabled = true
	
func interact(body):
	if !has_keys:
		prompt_message = "This door is locked. Find office keys to unlock."
	else:
		if !door_open:
			prompt_message = "Door opened"
			$AnimationPlayer.play("open")
			collision_shape_3d.disabled = true
			collision_shape_3d_2.disabled = false
			door_open = true
		
		else:
			$AnimationPlayer.play("close")
			collision_shape_3d.disabled = false
			collision_shape_3d_2.disabled = true
			prompt_message = "Open"
			door_open = false



func _on_level_manager_has_office_keys() -> void:
	has_keys = true
