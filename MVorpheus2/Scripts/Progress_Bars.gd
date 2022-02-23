extends Node2D

var motion = false
var increase = false
var decrease = false

var toolCount = 0
var type = "Progress"
var windowPlace = 0

var extra = 0

func _ready():
	$ProgressBar.value = extra

func _process(_delta):
	extra = $ProgressBar.value
	$Label.text = "Progressbar:        " + str($ProgressBar.value) + "%"
	match increase:
		true:
			$ProgressBar.value -= 1
		false:
			pass

	match decrease:
		true:
			$ProgressBar.value += 1
		false:
			pass

	match motion:
		true:
			self.position = Vector2(get_global_mouse_position().x - 110, get_global_mouse_position().y - 10)
		false:
			pass

func _on_Close_pressed():
	self.queue_free()


func _on_Decrease_button_up():
	increase = false


func _on_Decrease_button_down():
	increase = true


func _on_Increase_button_up():
	decrease = false


func _on_Increase_button_down():
	decrease = true


func _on_Move_button_up():
	motion = false


func _on_Move_button_down():
	motion = true


func _on_Hide_pressed():
	match $ProgressBar.visible:
		true:
			$ProgressBar.visible = false
			$Decrease.visible = false
			$Increase.visible = false
			$ColorRect2.visible = false
			$Hide.text = "[]"
		false:
			$ProgressBar.visible = true
			$Decrease.visible = true
			$Increase.visible = true
			$ColorRect2.visible = true
			$Hide.text = "_"
