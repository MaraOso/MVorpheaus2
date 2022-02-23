extends Node2D

var totalTime = 0
var move = false

var toolCount = 0
var type = "Timer"
var windowPlace = 0

var extra = 0

func _ready():
	totalTime = extra

func _process(_delta):
	extra = totalTime
	match move:
		true:
			self.position = Vector2(get_global_mouse_position().x - 130, get_global_mouse_position().y - 10)
		false:
			pass
	$Timer_Base/HourTime.text = str(round(totalTime/3600)) + "H"
	var hr = totalTime%3600
	$Timer_Base/MinTime.text = str(round(hr/60)) + "M"
	var minute = hr%60
	$Timer_Base/SecTime.text = str(minute) + "S"
	$Label.text = "Timer       " + $Timer_Base/HourTime.text + ":" + $Timer_Base/MinTime.text +":"+ $Timer_Base/SecTime.text + " Remaining"

func _on_HourBack_pressed():
	totalTime -= 3600


func _on_MinBack_pressed():
	totalTime -= 60


func _on_SecBack_pressed():
	totalTime -= 1


func _on_MinUp_pressed():
	totalTime += 60


func _on_SecUp_pressed():
	totalTime += 1


func _on_HourUp_pressed():
	totalTime += 3600



func _on_Start_pressed():
	$Timer_Base/BaseTime.start(1)


func _on_Stop_pressed():
	$Timer_Base/BaseTime.stop()


func _on_Reset_pressed():
	totalTime = 0


func _on_BaseTime_timeout():
	totalTime -= 1


func _on_Close_pressed():
	self.queue_free()


func _on_Move_button_down():
	move = true


func _on_Move_button_up():
	move = false


func _on_Hide_pressed():
	match $Timer_Base.visible:
		true:
			$Timer_Base.visible = false
			$Hide.text = "[]"
		false:
			$Timer_Base.visible = true
			$Hide.text = "_"
