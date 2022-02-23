extends Node2D

var title = ""
var colour = Color(.5,.5,.5,1)

var xSize = 69
var ySize = 20

var canStretch = false
var canPull = false

var motion = false
var texts = ""

var artNum = 0
var window = 0
var type = "Button"

var extra = [Color(.5,.5,.5,1), "Empty"]

func _ready():
	$TextEdit.text = extra[1]
	texts = extra[1]
	colour = extra[0]
	$Title_Colour.set_frame_color(extra[0])

func _process(_delta):
	extra = [colour, texts]
	title = $TextEdit.get_line(0)
	$Title.text = title
	$Title_Colour.rect_size.x = $Title.rect_size.x + 40
	$Move.rect_position.x = $Title.rect_size.x + 20
	$Close.rect_position.x = $Move.rect_position.x + 20
	#$TextEdit.rect_size.x = $Title.rect_size.x + 60
	$Shrink_Stretch.rect_position.y = $TextEdit.rect_size.y + 20
	$Shrink_Stretch.rect_size.x = $TextEdit.rect_size.x
	$Shrink_Pull.rect_position.x = $TextEdit.rect_size.x
	$Shrink_Pull.rect_size.y = $TextEdit.rect_size.y
	#$CanvasLayer/ColorPickerButton.set_global_position(self.global_position)
	
	match canStretch:
		true:
			$TextEdit.rect_size.y = get_global_mouse_position().y - self.global_position.y
	
	match canPull:
		true:
			$TextEdit.rect_size.x = get_global_mouse_position().x - self.global_position.x

	match motion:
		true:
			self.position = Vector2(get_global_mouse_position().x - $Move.rect_position.x, get_global_mouse_position().y - $Move.rect_position.y)

func _input(_event):
	if Input.is_action_pressed("DelectChar"):
		$Title.rect_size.x = 0

func _on_ColorPickerButton_color_changed(color):
	colour = color
	$Title_Colour.set_frame_color(color)


func _on_TextEdit_text_changed():
	texts = $TextEdit.text

func _on_Shrink_Stretch_button_down():
	canStretch = true


func _on_Shrink_Stretch_button_up():
	canStretch = false


func _on_Move_button_down():
	motion = true


func _on_Move_button_up():
	motion = false


func _on_Title_pressed():
	match $TextEdit.visible:
		true:
			$TextEdit.visible = false
		false:
			$TextEdit.visible = true


func _on_Close_pressed():
	self.queue_free()


func _on_Shrink_Pull_button_down():
	canPull = true


func _on_Shrink_Pull_button_up():
	canPull = false
