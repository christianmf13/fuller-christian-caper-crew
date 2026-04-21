extends Node3D

@onready var marker_3d: Marker3D = $Marker3D
const enemy = preload("res://scenes/Enemies/guard.tscn")
var current_nodes = get_child_count()
var starting_nodes : int
var enemy_spawned: bool = false

func _on_level_manager_done_looting() -> void:
	var new_enemy = enemy.instantiate()
	if !enemy_spawned:
		get_parent().add_child(new_enemy)
		new_enemy.global_position = $Marker3D.global_position
		enemy_spawned = true
	else:
		pass
	
