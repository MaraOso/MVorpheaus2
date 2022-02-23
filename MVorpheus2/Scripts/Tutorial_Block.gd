extends Node2D

var motion = false

var buttonText = "Input text into the 'Button Name' Region.\nClick the 'Create' Button.\nHold down the '>' Button to move button.\nClick the Main Button to Open text.\nInput texts of your own.\nClick the Main Button to Hide Text.\nCongradulations that's the Button."
var imageText = "Click the 'Import' Button.\nSelect the location of your Image File.\nHold down the '>' Button to move Image.\nHold down the 'EX-' Button to scale down X.\nHold down the 'EX+' Button to scale up X.\nHold down the 'EY-' Button to scale down Y.\nHold down the 'EY+' Button to scale up Y.\nCongradulations that's the Image Section."
var toolText = "Click the 'Tools' Tab at the top.\nSelect 'Progress' to Create Progress Bar.\nSelect 'Timer' to Create a Timer." 

var tab = "button"

func _process(_delta):
	match motion:
		true:
			self.position = Vector2(get_global_mouse_position().x - 5, get_global_mouse_position().y - 165)

	match tab:
		"button":
			$TextEdit.text = buttonText
		"image":
			$TextEdit.text = imageText
		"tool":
			$TextEdit.text = toolText

func _on_Button_pressed():
	tab = "button"


func _on_Image_pressed():
	tab = "image"


func _on_Tools_pressed():
	tab = "tool"


func _on_Motion_button_up():
	motion = false


func _on_Motion_button_down():
	motion = true


func _on_Close_pressed():
	self.queue_free()
