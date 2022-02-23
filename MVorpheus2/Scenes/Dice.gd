extends Node2D

var remaining = 1
var value = 1
var cycling = false
var choice = 1

var toolCount = 0
var type = "Dice"

var motion = false
var windowPlace = 0

var extra = 1

func _ready():
	randomize()
	remaining = extra
	$Total.text = str(remaining) + " DICE"

func _process(_delta):
	extra = remaining
	match motion:
		true:
			self.position = Vector2(get_global_mouse_position().x - 30, get_global_mouse_position().y - 10)
		false:
			pass

	match cycling:
		true:
			choice = (randi()% remaining) + int(1)
		false:
			pass
	$BodyBase/Base.text = str(choice)


func _on_Decrease_pressed():
	if remaining > 1:
		remaining -= 1
	$Total.text = str(remaining) + " DICE"


func _on_Increase_pressed():
	remaining += 1
	$Total.text = str(remaining) + " DICE"


func _on_Base_button_up():
	cycling = false


func _on_Base_button_down():
	cycling = true


func _on_Close_pressed():
	self.queue_free()


func _on_Move_button_up():
	motion = false


func _on_Move_button_down():
	motion = true


func _on_Hide_pressed():
	match $BodyBase.visible:
		true:
			$BodyBase.visible = false
			$Hide.text = "[]"
		false:
			$BodyBase.visible = true
			$Hide.text = "_"
