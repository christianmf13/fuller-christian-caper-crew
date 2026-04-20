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
		prompt_message = "This door is locked. Find front door keys to unlock."
	else:
		if !door_open:
			prompt_message = "Close"
			$AnimationPlayer.play("open")
			collision_shape_3d.disabled = true
			collision_shape_3d_2.disabled = false
			door_open = true
		else:
			prompt_message = "Open"
			$AnimationPlayer.play("close")
			collision_shape_3d.disabled = false
			collision_shape_3d_2.disabled = true
			door_open = false



func _on_level_manager_has_door_key() -> void:
	has_keys = true
