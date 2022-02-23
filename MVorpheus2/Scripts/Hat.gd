extends Node2D

var inputVar = ""
var variables = []

var holder = ""

var window = 0
var motion = false

var SCount = 0
var extra = []
var type = "Hat"

func _ready():
	variables = extra
	_populate()

func _process(_delta):
	match motion:
		true:
			self.position = Vector2(get_global_mouse_position().x - 125, get_global_mouse_position().y - 5)

func _on_VariableEdit_text_entered(new_text):
	variables.append(new_text)
	inputVar = ""
	$VariableEdit.text = ""
	_populate()
	$Draw.disabled = false


func _on_Enter_pressed():
	variables.append(inputVar)
	inputVar = ""
	$VariableEdit.text = ""
	_populate()
	$Draw.disabled = false


func _on_VariableEdit_text_changed(new_text):
	inputVar = new_text


func _on_Draw_pressed():
	randomize()
	var choice = randi() % variables.size()
	$Result.text = str(variables[choice])
	variables.remove(choice)
	_populate()
	if variables.size() < 1:
		$Draw.disabled = true


func _on_Clear_pressed():
	variables = []
	_populate()
	$Draw.disabled = true

func _populate():
	holder = ""
	for i in variables:
		holder += "\n" + str(i)

	$VariableHolder.text = holder
	if variables.size() < 1:
		$Draw.disabled = true


func _on_Close_pressed():
	self.queue_free()



func _on_Move_button_down():
	motion = true


func _on_Move_button_up():
	motion = false


func _on_Hide_pressed():
	match $Panel.visible:
		true:
			$Panel.visible = false
			$Panel2.visible = false
			$Panel3.visible = false
			$Panel4.visible = false
			$VariableEdit.visible = false
			$Result.visible = false
			$Draw.visible = false
			$Clear.visible = false
			$Enter.visible = false
			$VariableHolder.visible = false
			$Hide.text = "[]"
		false:
			$Panel.visible = true
			$Panel2.visible = true
			$Panel3.visible = true
			$Panel4.visible = true
			$VariableEdit.visible = true
			$Result.visible = true
			$Draw.visible = true
			$Clear.visible = true
			$Enter.visible = true
			$VariableHolder.visible = true
			$Hide.text = "_"
