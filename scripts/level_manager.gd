extends Node3D

@onready var value_tracker: Label = $ValueTracker
@onready var vault_key: Label = $VaultKey
@onready var office_key: Label = $OfficeKey
@onready var front_door_key: Label = $FrontDoorKey
@onready var phone_ui: Node3D = $PhoneUI
@onready var text_notification: Label = $TextNotification

@export var value_amount: int
@export var value_goal: int

var has_vault_key: bool = false
signal has_vault_keys
var has_office_key: bool = false
signal has_office_keys
signal has_door_key
var has_front_door_key: bool = false
var power_on: bool = true
signal power_off
var value_reached: bool = false
signal done_looting
signal power_restored
var phone_out: bool 
var text_noti: bool
signal first_text
signal second_text

func _ready() -> void:
	phone_ui.visible = false
	text_noti = false
	level_start()

func _physics_process(delta: float) -> void:
	value_tracker.text = "Value: $" + str(value_amount) + "/$" + str(value_goal)
	
	if !text_noti:
		text_notification.visible = false
	if text_noti == true:
		text_notification.visible = true
	phone()
	
	end_level_start()

func level_start():
	await get_tree().create_timer(5.0).timeout
	text_noti = true
	
	if !text_noti:
		pass
	else:
		first_text.emit()
#phone UI logic
func phone():
	if Input.is_action_just_pressed("phone") and !phone_out:
		#print("phone input worked")
		phone_ui.visible = true
		phone_out = true
		text_noti = false
	elif Input.is_action_just_pressed("phone"):
		#print("yipee")
		phone_ui.visible = false
		phone_out = false

#how to trigger the end level sequence
func end_level_start():
	if value_amount >= value_goal:
		value_reached = true
	if value_reached == true:
		#print("congrats")
		done_looting.emit()
		power_restored.emit()
	else:
		pass

#gold collection amounts (find a more efficient way)
func _on_gold_bar_gold_collected() -> void:
	value_amount += 500
func _on_gold_bar_2_gold_collected() -> void:
	value_amount += 500
func _on_gold_bar_3_gold_collected() -> void:
	value_amount += 500
func _on_gold_bar_4_gold_collected() -> void:
	value_amount += 500
func _on_gold_bar_5_gold_collected() -> void:
	value_amount += 500
func _on_gold_bar_6_gold_collected() -> void:
	value_amount += 500
func _on_gold_bar_7_gold_collected() -> void:
	value_amount += 500
func _on_gold_bar_8_gold_collected() -> void:
	value_amount += 500
func _on_gold_bar_9_gold_collected() -> void:
	value_amount += 500
func _on_gold_bar_10_gold_collected() -> void:
	value_amount += 500
func _on_gold_bar_11_gold_collected() -> void:
	value_amount += 500
func _on_gold_bar_12_gold_collected() -> void:
	value_amount += 500
func _on_gold_bar_13_gold_collected() -> void:
	value_amount += 500
func _on_gold_bar_14_gold_collected() -> void:
	value_amount += 500
func _on_gold_bar_15_gold_collected() -> void:
	value_amount += 500
func _on_gold_bar_16_gold_collected() -> void:
	value_amount += 500
func _on_gold_bar_17_gold_collected() -> void:
	value_amount += 500

#diamond collection logic (same w/ gold)
func _on_diamond_diamond_collected() -> void:
	value_amount += 2500
func _on_diamond_2_diamond_collected() -> void:
	value_amount += 500
func _on_diamond_3_diamond_collected() -> void:
	value_amount += 250
func _on_diamond_4_diamond_collected() -> void:
	value_amount += 500
func _on_diamond_5_diamond_collected() -> void:
	value_amount += 500
func _on_diamond_6_diamond_collected() -> void:
	value_amount += 500
func _on_diamond_7_diamond_collected() -> void:
	value_amount += 500
func _on_diamond_8_diamond_collected() -> void:
	value_amount += 500
func _on_diamond_9_diamond_collected() -> void:
	value_amount += 500
func _on_diamond_10_diamond_collected() -> void:
	value_amount += 500
func _on_diamond_11_diamond_collected() -> void:
	value_amount += 500
func _on_diamond_12_diamond_collected() -> void:
	value_amount += 500
func _on_diamond_13_diamond_collected() -> void:
	value_amount += 250
func _on_diamond_14_diamond_collected() -> void:
	value_amount += 250
func _on_diamond_15_diamond_collected() -> void:
	value_amount += 250
func _on_diamond_16_diamond_collected() -> void:
	value_amount += 250
func _on_diamond_17_diamond_collected() -> void:
	value_amount += 250
func _on_diamond_18_diamond_collected() -> void:
	value_amount += 500
func _on_diamond_19_diamond_collected() -> void:
	value_amount += 500
func _on_diamond_20_diamond_collected() -> void:
	value_amount += 500

#money collecting logic (also needs new way, this sucked)
func _on_money_stacks_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_2_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_3_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_4_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_5_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_6_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_7_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_8_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_9_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_10_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_11_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_12_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_13_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_14_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_15_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_16_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_17_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_18_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_19_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_20_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_21_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_22_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_23_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_24_money_collected() -> void:
	value_amount += 750
func _on_money_stacks_25_money_collected() -> void:
	value_amount += 750

#vault key logic
func _on_vault_key_vault_key_obtained() -> void:
	has_vault_key = true
	has_vault_keys.emit()
	vault_key.text = "1x Vault Key"

#office key logic
func _on_office_key_office_key_obtained() -> void:
	has_office_key = true
	has_office_keys.emit()
	office_key.text = "1x Office Key"
#front door key logic
func _on_door_key_door_key_obtained() -> void:
	has_front_door_key = true
	has_door_key.emit()
	front_door_key.text = "1x Front Door Key"
#power logic
func _on_power_box_power_off() -> void:
	power_on = false
	power_off.emit()

func _on_entered_building_trigger_body_entered(body: Node3D) -> void:
	text_noti = true
	second_text.emit()
	print("second text trigger works")
