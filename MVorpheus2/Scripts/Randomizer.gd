extends Node2D

onready var person = preload("res://Import/Button_Test_Person.PNG")
onready var debt = preload("res://Import/Button_Debt.PNG")
onready var money = preload("res://Import/Button_Money.PNG")
onready var idea = preload("res://Import/Button_Idea.PNG")

var motion = false
var toolCount = 0
var windowPlace = 0
var type = "refs"

var extra = 0

func _ready():
	extra = 0

func _process(_delta):
	extra = 0
	match motion:
		true:
			self.position = get_global_mouse_position()

func _on_Base_button_down():
	motion = true


func _on_Base_button_up():
	motion = false


func _on_Base_pressed():
	match $ItemList.visible:
		true:
			$ItemList.visible = false
		false:
			$ItemList.visible = true


func _on_ItemList_item_selected(index):
	match index:
		0:
			self.queue_free()
		1:
			$Base.icon = person
		2:
			$Base.icon = debt
		3:
			$Base.icon = money
		4:
			$Base.icon = idea
