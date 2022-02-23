extends Node2D

var startNum  = 0
var endNum = 0

var window = 0
var motion = false

var gen = false
var SCount = 0
var extra = [0,0]
var type = "NumberGen"

func _ready():
	startNum = extra[0]
	endNum = extra[1]

func _process(_delta):
	extra = [startNum, endNum]
	match gen:
		true:
			var choice = rand_range(startNum, endNum + 1)
			$ResultPanel/Result.text = str(int(choice))

	match motion:
		true:
			self.position = Vector2(get_global_mouse_position().x - 155, get_global_mouse_position().y - 10)


func _on_SpinBoxStart_value_changed(value):
	startNum = value


func _on_SpinBoxEnd_value_changed(value):
	endNum = value


func _on_Generate_button_down():
	gen = true


func _on_Generate_button_up():
	gen = false


func _on_Close_pressed():
	self.queue_free()


func _on_Move_button_down():
	motion = true


func _on_Move_button_up():
	motion = false


func _on_Hide_pressed():
	match $StartNumPanel.visible:
		true:
			$Hide.text = "[]"
			$StartNumPanel.visible = false
			$EndNumPanel.visible = false
			$ResultPanel.visible = false
			$Panel.visible = false
			$Panel2.visible = false
			$Generate.visible = false
		false:
			$Hide.text = "_"
			$StartNumPanel.visible = true
			$EndNumPanel.visible = true
			$ResultPanel.visible = true
			$Panel.visible = true
			$Panel2.visible = true
			$Generate.visible = true
