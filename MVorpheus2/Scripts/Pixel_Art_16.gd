extends Node2D

var colour = Color(255,255,255)

var motion = false

var locked = false

var window = 0
var artNum = 0
var type = "Pixel16"

var rectColours = {}

var extra = []

func _ready():
	if extra.size() == 256:
		for i in range(256):
			$RectContainer.get_child(i).set_frame_color(extra[i])

func _process(_delta):
	#$CanvasLayer/ColorPickerButton.visible = self.visible
	extra = rectColours
	#$CanvasLayer/ColorPickerButton.set_global_position(self.global_position)
	match motion:
		true:
			self.position = Vector2(get_global_mouse_position().x - 70, get_global_mouse_position().y - 10)

func _input(_event):
	match locked:
		false:
			if Input.is_action_pressed("click"):
				for squares in $RectContainer.get_children():
					if abs(get_global_mouse_position().x - (self.global_position.x + squares.rect_position.x + 20)) < 5 and abs(get_global_mouse_position().y - (self.global_position.y + squares.rect_position.y + 20)) < 5:
						squares.set_frame_color(Color(colour))
			if Input.is_action_just_released("click"):
				rectColours = {}
				for i in range(256):
					rectColours[i] = $RectContainer.get_child(i).get_frame_color()

func _on_ColorPickerButton_color_changed(color):
	#$ColorPickerButton.get_picker().rect_position.y = + 200
	colour = color
	


func _on_Move_button_down():
	motion = true


func _on_Move_button_up():
	motion = false


func _on_Close_pressed():
	self.queue_free()



func _on_Lock_pressed():
	match locked:
		true:
			locked = false
			$Lock/indicator.set_frame_color(Color(0,0,0))
		false:
			locked = true
			$Lock/indicator.set_frame_color(Color(255,0,0))


func _on_Hide_pressed():
	match $RectContainer.visible:
		true:
			$RectContainer.visible = false
			$ColorPickerButton.visible = false
			$Lock.visible = false
			$Hide.text = "[]"
		false:
			$RectContainer.visible = true
			$ColorPickerButton.visible = true
			$Lock.visible = true
			$Hide.text = "_"
