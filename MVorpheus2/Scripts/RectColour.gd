extends Node2D

var xScale = 1
var yScale = 1

var increment = .1
var growth = false

var window = 0
var motion = false

var extra = [Color(255,255,255), 1,1]
var SCount = 0
var type = "RectColour"

var colour = Color(255,255,255)

func _ready():
	colour = extra[0]
	xScale = extra[1]
	yScale = extra[2]
	$ColorRect.set_frame_color(colour)

func _process(_delta):
	extra = [colour, xScale, yScale]
	$ColorRect.rect_scale = Vector2(xScale, yScale)
	match motion:
		true:
			self.position = Vector2(get_global_mouse_position().x - 35, get_global_mouse_position().y - 10)

	match growth:
		true:
			$Expand.rect_position = Vector2(get_global_mouse_position().x, get_global_mouse_position().y)
			$ColorRect.rect_size.x = $Expand.rect_position.x - 20
			$ColorRect.rect_size.y = $Expand.rect_position.y
			$ColorRect2.rect_size.x = $ColorRect.rect_size.x + 40
			$Move.rect_size.x = $ColorRect2.rect_size.x - 40
			$Hide.rect_position.x = $ColorRect2.rect_size.x - 40
			$Close.rect_position.x = $ColorRect2.rect_size.x - 20

func _on_Close_pressed():
	self.queue_free()


func _on_Move_button_down():
	motion = true


func _on_Move_button_up():
	motion = false


func _on_ColorPickerButton_color_changed(color):
	$ColorRect.color = color
	colour = color

func _on_Hide_pressed():
	match $ColorRect.visible:
		true:
			$ColorPickerButton.visible = false
			$ColorRect.visible = false
			$Expand.visible = false
			$Hide.text = "[]"
		false:
			$ColorPickerButton.visible = true
			$ColorRect.visible = true
			$Expand.visible = true
			$Hide.text = "_"


func _on_Expand_button_down():
	growth = true


func _on_Expand_button_up():
	growth = false
