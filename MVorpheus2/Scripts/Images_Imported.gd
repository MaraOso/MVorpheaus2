extends Node2D

var imageNumber = 0

var scaleX = 200
var scaleY = 200

var val = .01

var windowPlace = 0

var textureData = ''
var motion = false
var pull = false

var control = false

var increment = .01

func _ready():
	$ViewportContainer.rect_size = Vector2(scaleX,scaleY)
	$ViewportContainer/Viewport.size = Vector2(scaleX,scaleY)
	$Grow.rect_position = Vector2(scaleX - 20, scaleY)

func _process(_delta):
	$Label.text = str($ViewportContainer/Viewport/Camera2D.zoom.x) + "x" + str($ViewportContainer/Viewport/Camera2D.zoom.y)
	match pull:
		true:
			$Grow.rect_position = Vector2(get_global_mouse_position().x - 280, get_global_mouse_position().y - 200)
			$ViewportContainer/Viewport.size = Vector2($Grow.rect_position.x, $Grow.rect_position.y)
			$ViewportContainer.rect_size = Vector2($Grow.rect_position.x, $Grow.rect_position.y)
			scaleX = $ViewportContainer.rect_size.x
			scaleY = $ViewportContainer.rect_size.y
	match motion:
		true:
			self.position = Vector2(get_global_mouse_position().x - 20, get_global_mouse_position().y - 10)

func _input(_event):
	match control:
		true:
			if Input.is_action_pressed("ui_up"):
				$ViewportContainer/Viewport/Camera2D.position.y -= increment
			if Input.is_action_pressed("ui_down"):
				$ViewportContainer/Viewport/Camera2D.position.y += increment
			if Input.is_action_pressed("ui_right"):
				$ViewportContainer/Viewport/Camera2D.position.x += increment
			if Input.is_action_pressed("ui_left"):
				$ViewportContainer/Viewport/Camera2D.position.x -= increment
			if Input.is_action_pressed("scrollDown"):
				$ViewportContainer/Viewport/Camera2D.zoom.x -= increment
				$ViewportContainer/Viewport/Camera2D.zoom.y -= increment
			if Input.is_action_pressed("scrollUp"):
				$ViewportContainer/Viewport/Camera2D.zoom.x += increment
				$ViewportContainer/Viewport/Camera2D.zoom.y += increment

func updateIMG(path):
	var img = Image.new()
	img.load(path)
	var tex = ImageTexture.new()
	tex.create_from_image(img)
	#$Sprite.texture = tex
	$ViewportContainer/Viewport/Sprite.texture = tex
	
	textureData = path
	#if $Sprite.texture.get_width() > 200:
	#	$ColorRect.rect_size.x = $Sprite.texture.get_width()
	#	$Move.rect_size.x = $Sprite.texture.get_width() - 40
	#	$Hide.rect_position.x = $Sprite.texture.get_width() - 40
	#	$Close.rect_position.x = $Sprite.texture.get_width() - 20


func _on_Close_pressed():
	self.queue_free()


func _on_Move_button_down():
	motion = true


func _on_Move_button_up():
	motion = false




func _on_Hide_pressed():
	match $ViewportContainer.visible:
		true:
			$ViewportContainer.visible = false
			$Grow.visible = false
			$X_Scale.visible = false
			$ColorRect/CheckBox.visible = false
			$Hide.text = "[]"
		false:
			$ViewportContainer.visible = true
			$Grow.visible = true
			$X_Scale.visible = true
			$ColorRect/CheckBox.visible = true
			$Hide.text = "_"


func _on_X_Scale_value_changed(value):
	increment = value


func _on_Grow_button_down():
	pull = true


func _on_Grow_button_up():
	pull = false


func _on_CheckBox_toggled(button_pressed):
	match button_pressed:
		true:
			control = true
		false:
			control = false
