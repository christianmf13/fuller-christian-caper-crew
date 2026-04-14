class_name BasicEnemy
extends Enemy

@export var follow_speed: float = 3.0

@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D
@onready var state_chart: StateChart = $StateChart
@onready var health_component: HealthComponent = $HealthComponent

var target: Node3D

func _ready() -> void:
	super._ready()
	
	#find player
	target = get_tree().get_first_node_in_group("player")
	
	#connect signals
	health_component.died.connect(_on_died)
	nav_agent.velocity_computed.connect(_on_velocity_computed)
	
func _physics_process(delta: float) -> void:
	#apply gravity
	if not is_on_floor():
		velocity.y -= 20.0 * delta
		
	move_and_slide()
	
func on_triggered() -> void:
	state_chart.send_event("toFollow")
	
func _on_died() -> void:
	queue_free()
	
func _on_velocity_computed(safe_velocity: Vector3) -> void:
	velocity.x = safe_velocity.x
	velocity.z = safe_velocity.z
	

func _on_follow_state_physics_processing(delta: float) -> void:
	if not target:
		return
	
	#set target position for navigation
	nav_agent.target_position = target.global_position
	
	#check if navigation finished
	if nav_agent.is_navigation_finished():
		nav_agent.velocity = Vector3.ZERO
		return
		
	#get next position in path
	var next_pos = nav_agent.get_next_path_position()
	var direction = (next_pos - global_position).normalized()
	
	#set desired velocity (navigation agent handles avoidance)
	nav_agent.velocity = direction * follow_speed
	
	#rotate to face movement direction
	if direction.length() > 0.01:
		var target_rotation: float  = atan2(direction.x, direction.z)
		#this is broken, don't know why
		var target_rotation = atan2(direction.x, direction.z)
		rotation.y = lerp_angle(rotation.y, target_rotation, 5.0 * delta)
		
		


func _on_detection_area_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		on_triggered()
