extends Node2D

var text = ''
var moveToggle = false
var windowPlace = 0
var buttonVal = 0
var expand = false

func _ready():
	$Text_Region.text = text


func _process(_delta):
	$Move.rect_size.x = $Button_Name.rect_size.x + 5
	$ColorRect.rect_size.x = $Button_Name.rect_size.x + 45
	
	match expand:
		true:
			$Text_Region.rect_size = Vector2(get_global_mouse_position().x - $Move.rect_global_position.x + 45, get_global_mouse_position().y - $Move.rect_global_position.y)
	
	match moveToggle:
		true:
			self.position = Vector2(get_global_mouse_position().x - 40, get_global_mouse_position().y)
		false:
			pass

func _on_Button_Region_pressed():
	match $Text_Region.visible:
		true:
			$Text_Region.visible = false
			$Button_Region.text = "[]"
			return
		false:
			$Text_Region.visible = true
			$Button_Region.text = "_"
			return


func _on_Text_Region_text_changed():
	text = $Text_Region.text


func _on_Close_pressed():
	self.queue_free()


func _on_Move_button_down():
	moveToggle = true


func _on_Move_button_up():
	moveToggle = false


func _on_Movement_button_up():
	expand = false


func _on_Movement_button_down():
	expand = true
