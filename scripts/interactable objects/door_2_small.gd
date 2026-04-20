extends Interactable

@onready var collision_shape_3d: CollisionShape3D = $CollisionShape3D
@onready var collision_shape_3d_2: CollisionShape3D = $CollisionShape3D2

var power_on: bool = true
var door_open: bool = false

func _ready() -> void:
	collision_shape_3d.disabled = false
	collision_shape_3d_2.disabled = true
	
func interact(body):
	if power_on:
		prompt_message = "This door is locked. Cut the power to unlock."
	else:
		if !door_open:
			prompt_message = "Door opened. Leave this door open for faster escape."
			$AnimationPlayer.play("open")
			$CollisionShape3D.disabled = true
			$CollisionShape3D2.disabled = false
			door_open = true
		else:
			prompt_message = "Open"
			$AnimationPlayer.play("close")
			$CollisionShape3D.disabled = false
			$CollisionShape3D2.disabled = true
			door_open = false


func _on_level_manager_power_off() -> void:
	power_on = false

func _on_level_manager_power_restored() -> void:
	power_on = true
