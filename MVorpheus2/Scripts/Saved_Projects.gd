extends Node2D

var path = null
var i = 0
var title = ""
var completeName = ""

func _ready():
	completeName = $Base.get_text()
	for j in $Base.get_text():
		if i < 10:
			title += j
		i += 1
	
	$Base.text = title

func _on_Base_pressed():
	if path == null:
		self.get_parent().get_parent()._createDoc()
	else:
		self.get_parent().get_parent().get_parent().get_parent()._loadProject(path)


func _on_Base_mouse_entered():
	$Label.text = completeName
	$Label.visible = true


func _on_Base_mouse_exited():
	$Label.visible = false


func _on_Base_button_down():
	$ColorRect.set_frame_color(Color(.25,.25,.30,1))


func _on_Base_button_up():
	$ColorRect.set_frame_color(Color(.25,.25,.25,1))
