extends Node3D

@onready var lightmap_gi: LightmapGI = $LightmapGI
@export var bright_lightmapdata: LightmapGIData
@export var dark_lightmapdata: LightmapGIData
@onready var guard: BasicEnemy = $guard
@onready var entered_building_trigger: Area3D = $EnteredBuildingTrigger
@onready var marker_3d: Marker3D = $Marker3D
const enemy = preload("res://scenes/Enemies/guard.tscn")
var current_nodes = get_child_count()
var starting_nodes : int
var enemy_spawned: bool = false
signal end_level
signal player_captured

func _on_level_manager_done_looting() -> void:
	#var new_enemy = enemy.instantiate()
	if !enemy_spawned:
		#get_parent().add_child(new_enemy)
		#new_enemy.global_position = $Marker3D.global_position
		guard.global_position = $Marker3D.global_position
		enemy_spawned = true
		end_level.emit()
	else:
		pass
	
func _on_level_manager_notification_sent() -> void:
	entered_building_trigger.queue_free()


func _on_level_manager_power_off() -> void:
	lightmap_gi.light_data = dark_lightmapdata

func _on_level_manager_power_restored() -> void:
	lightmap_gi.light_data = bright_lightmapdata
