extends Node2D

var frontPage = preload("res://Scenes/Front_Page.tscn")
var projects = preload("res://Scenes/Saved_Projects.tscn")

func _ready():
	_createProjects()

func updateCam():
	$Camera2D.current = true

func _createDoc():
	var k = frontPage.instance()
	$Camera2D.offset = Vector2(-512, -300)
	$Loaded_Project.add_child(k)

func _loadProject(destination):
	var k = frontPage.instance()
	$Camera2D.offset = Vector2(-512, -300)
	$Loaded_Project.add_child(k)
	k._Project(destination)

func _createProjects():
	for child in $Old_Projects/ScrollContainer/Projects.get_children():
		child.queue_free()
	
	var x = 0
	$Old_Projects/ScrollContainer/Projects.rect_min_size.x = 120
	var path = "user://saves/"

	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin(true)

	var file = dir.get_next()
	while file != '':
		files += [file]
		file = dir.get_next()

	for i in files:
		var k = projects.instance()
		k.get_child(1).text = str(i)
		k.path = path + str(i)
		k.position.x = x
		$Old_Projects/ScrollContainer/Projects.add_child(k)
		x += 155
		$Old_Projects/ScrollContainer/Projects.rect_min_size.x += 155


func _on_Website_pressed():
# warning-ignore:return_value_discarded
	OS.shell_open("http://mventusr.com")
