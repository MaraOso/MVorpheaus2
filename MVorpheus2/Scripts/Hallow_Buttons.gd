extends Node2D

var frame = 1
var creature = "Pumpkin"
var move = false
var window = 0
var hallowNum = 0

func _process(_delta):
	match move:
		true:
			self.position = Vector2(get_global_mouse_position().x -48, get_global_mouse_position().y- 28)

func _on_Animate_pressed():
	match frame:
		1:
			$AnimatedSprite.frame = 1
			frame = 0
		0:
			$AnimatedSprite.frame = 0
			frame = 1

func animationKind(anim):
	$AnimatedSprite.animation = anim
	creature = anim


func _on_Close_pressed():
	self.queue_free()


func _on_Move_button_down():
	move = true


func _on_Move_button_up():
	move = false
