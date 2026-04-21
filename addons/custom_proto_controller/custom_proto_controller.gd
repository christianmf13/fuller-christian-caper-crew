extends CharacterBody3D

@onready var head: Node3D = $Head
@onready var standing_collision_shape: CollisionShape3D = $StandingCollisionShape
@onready var crouching_collision_shape: CollisionShape3D = $CrouchingCollisionShape
@onready var uncrouch_detection: RayCast3D = $UncrouchDetection
@onready var phone_ui: Node3D = $Head/Camera3D/PhoneUI

var current_speed = base_speed
var mouse_captured : bool = false


@export_group("Speeds")
## How fast is base speed?
@export var base_speed = 5.0
## How fast is sprint speed?
@export var sprint_speed = 10.0
## How fast is crouch speed?
@export var crouch_speed = 3.0
## What is the jump velocity?
@export var jump_velocity = 4.5
## What is movement lerp speed? (how snappy movement is to button press. Lower = longer)
@export var movement_lerp = 20.0
## What is the crouching lerp speed? (how snappy the crouch is to button press. lower = longer)
@export var crouch_lerp = 10.0
## What is the slide speed?
@export var slide_speed = 10.0
## How much control do you have over the player while jumping?
@export var air_lerp = 3.0

@export_group("Settings")
## Look sensitivity
@export var mouse_sens = 0.2
## What is the crouching depth (hold to crouch setting)?
@export var crouch_depth = -0.8
## What is the crouching height
@export var crouch_height = 0.75
## What is the standing height
@export var stand_height = 1.8

var walking = false
var sprinting = false
var crouching = false
var free_looking = false
var sliding = false

var slide_timer = 0.0
var slide_timer_max = 1.0
var slide_vector = Vector2.ZERO
var direction = Vector3.ZERO


#Mouse looking logic
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		capture_mouse()
	if Input.is_key_pressed(KEY_ESCAPE):
		release_mouse()
func _input(event):
	if event is InputEventMouseMotion and mouse_captured:
		rotate_y(deg_to_rad(-event.relative.x * mouse_sens))
		head.rotate_x(deg_to_rad(-event.relative.y * mouse_sens))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89), deg_to_rad(89))

func _physics_process(delta: float) -> void:
	#movement inputs
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	#crouching
	if Input.is_action_pressed("crouch") || sliding:
		current_speed = lerp(current_speed, crouch_speed, delta*movement_lerp)
		head.position.y = lerp(head.position.y, stand_height + crouch_depth, delta*crouch_lerp)
		standing_collision_shape.disabled = true
		crouching_collision_shape.disabled = false
	
		if sprinting && input_dir != Vector2.ZERO:
			sliding = true
			slide_timer = slide_timer_max
			slide_vector = input_dir
			print("slide begin")
		crouching = true
		sprinting = false

	#standing
	elif !uncrouch_detection.is_colliding():
		standing_collision_shape.disabled = false
		crouching_collision_shape.disabled = true
		head.position.y = lerp(head.position.y,stand_height, delta*crouch_lerp)
		
		#sprinting
		if Input.is_action_pressed("sprint"):
			current_speed = lerp(current_speed, sprint_speed, delta*movement_lerp)
			sprinting = true
			sliding =false
		else:
			current_speed = base_speed
			sprinting = false
			crouching = false
			sliding = false

	#Sliding logic
	if sliding:
		slide_timer -= delta
		if slide_timer <= 0:
			sliding = false
			print("slide end")
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and !uncrouch_detection.is_colliding():
		velocity.y = jump_velocity
		sliding = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if is_on_floor():
		direction = lerp(direction,(transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized(),delta*movement_lerp)
	else:
		if input_dir != Vector2.ZERO:
			direction = lerp(direction,(transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized(),delta*air_lerp)


	if sliding:
		current_speed = (slide_timer + 0.1) * slide_speed
		
	if direction:
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
		
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
		velocity.z = move_toward(velocity.z, 0, current_speed)

	move_and_slide()

func capture_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mouse_captured = true
	
func release_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	mouse_captured = false


func _on_guard_player_captured() -> void:
	set_physics_process(false)
	mouse_captured = false
	print("captured")
