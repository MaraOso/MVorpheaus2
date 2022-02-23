extends Node2D

var motion = false

var EUp = false
var EDown = false
var SUp = false
var SDown = false

var Degree = 0
var SDegree = 0
var EDegree = 0

var window = 0
var SCount = 0

var extra = []
var type = "Compass"

var increaseSpeed = .25

func _process(_delta):
	extra = [SDegree, EDegree]
	Degree = abs(SDegree - EDegree)
	$ButtonBody/Degrees.text = str(Degree)
	$CompassBar/StartLine.rotation_degrees = SDegree
	$CompassBar/EndLine.rotation_degrees = EDegree

	match EUp:
		true:
			EDegree += increaseSpeed
	match EDown:
		true:
			EDegree -= increaseSpeed
	match SUp:
		true:
			SDegree += increaseSpeed
	match SDown:
		true:
			SDegree -= increaseSpeed
	match motion:
		true:
			self.position = Vector2(get_global_mouse_position().x - 90, get_global_mouse_position().y - 2.5)

func _on_Close_pressed():
	self.queue_free()


func _on_Move_button_down():
	motion = true


func _on_Move_button_up():
	motion = false


func _on_StartMinus_button_down():
	SDown = true


func _on_StartMinus_button_up():
	SDown = false


func _on_EndMinus_button_down():
	EDown = true


func _on_EndMinus_button_up():
	EDown = false


func _on_StartPlus_button_down():
	SUp = true


func _on_StartPlus_button_up():
	SUp = false


func _on_EndPlus_button_down():
	EUp = true


func _on_EndPlus_button_up():
	EUp = false


func _on_Reset_pressed():
	SDegree = 0
	EDegree = 0


func _on_Hide_pressed():
	match $Compass_Node.visible:
		true:
			$Compass_Node.visible = false
			$CompassBar.visible = false
			$ButtonBody.visible = false
			$Hide.text = "[]"
			
		false:
			$Compass_Node.visible = true
			$CompassBar.visible = true
			$ButtonBody.visible = true
			$Hide.text = "_"
