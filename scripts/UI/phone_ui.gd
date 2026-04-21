extends Node3D

@onready var first_text_bubble: Node3D = $FirstTextBubble
@onready var first_message: Label3D = $phone/FirstMessage
@onready var second_text_bubble: Node3D = $SecondTextBubble
@onready var second_message: Label3D = $phone/SecondMessage
@onready var third_text_bubble: Node3D = $ThirdTextBubble
@onready var third_message: Label3D = $phone/ThirdMessage
@onready var fourth_message: Label3D = $phone/FourthMessage
@onready var fourth_text_bubble: Node3D = $FourthTextBubble
@onready var fifth_text_bubble: Node3D = $FifthTextBubble
@onready var fifth_message: Label3D = $phone/FifthMessage
@onready var sixth_message: Label3D = $phone/SixthMessage
@onready var sixth_text_bubble: Node3D = $SixthTextBubble

func _ready():
	first_message.visible = false
	first_text_bubble.visible = false
	second_message.visible = false
	second_text_bubble.visible = false
	third_text_bubble.visible = false
	third_message.visible = false
	fourth_message.visible = false
	fourth_text_bubble.visible = false
	fifth_message.visible = false
	fifth_text_bubble.visible = false
	sixth_message.visible = false
	sixth_text_bubble.visible = false
	

func _on_level_manager_first_text() -> void:
	first_text_bubble.visible = true
	first_message.visible = true
	await get_tree().create_timer(5.0).timeout
	print("yup")
	second_text_bubble.visible = true
	second_message.visible = true

func _on_level_manager_second_text() -> void:
	first_message.visible = false
	first_text_bubble.visible = false
	second_message.visible = false
	second_text_bubble.visible = false
	third_text_bubble.visible = true
	third_message.visible = true
	await get_tree().create_timer(5.0).timeout
	fourth_text_bubble.visible = true
	fourth_message.visible = true
	
func _on_level_manager_power_restored() -> void:
	third_text_bubble.visible = false
	third_message.visible = false
	fourth_message.visible = false
	fourth_text_bubble.visible = false
	fifth_text_bubble.visible = true
	fifth_message.visible = true
	await get_tree().create_timer(5.0).timeout
	sixth_text_bubble.visible = true
	sixth_message.visible = true
