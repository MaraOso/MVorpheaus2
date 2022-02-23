extends Node2D

onready var screenWindow = preload("res://Scenes/Screen.tscn")

onready var InfoButton = preload("res://Scenes/Information_Tabs.tscn")
onready var Times = preload("res://Scenes/Timer_Pack.tscn")
onready var Dice = preload("res://Scenes/Dice.tscn")
onready var Progress = preload("res://Scenes/Progress_Bars.tscn")
onready var Calculator = preload("res://Scenes/Calculator.tscn")
onready var ImageImp = preload("res://Scenes/Images_Imported.tscn")
onready var Refs = preload("res://Scenes/Randomizer.tscn")
onready var Tutor = preload("res://Scenes/Tutorial_Block.tscn")
onready var Diction = preload("res://Scenes/Dictionary_Tool.tscn")

onready var compass = preload("res://Scenes/Compass.tscn")
onready var numGen = preload("res://Scenes/NumberGen.tscn")
onready var hat = preload("res://Scenes/Hat.tscn")
onready var RectColour = preload("res://Scenes/RectColour.tscn")
onready var metronome = preload("res://Scenes/Metronome.tscn")

onready var Hallow = preload("res://Scenes/Hallow_Buttons.tscn")

onready var colourButton = preload("res://Scenes/Coloured_Button.tscn")
onready var pixel16 = preload("res://Scenes/Pixel_Art_16.tscn")

var text = ''
var documentName = ''
var buttonNum = 0
var toolNum = 0
var imageNum = 0
var hallowNum = 0
var SNum = 0
var artNum = 0

var screenCount = 0

const SAVEDIR = "user://saves/"
var savePath = SAVEDIR + documentName + ".save"

var Halloween_DLC = false
var CalcTools_DLC = false
var ArtTools_DLC = false

var currentChild = 0

func _ready():
	var directory = Directory.new()
	Halloween_DLC = directory.file_exists("res://Halloween_DLC.pck")
	CalcTools_DLC = directory.file_exists("res://CalcTools_DLC.pck")
	ArtTools_DLC = directory.file_exists("res://ArtTools_DLC.pck")
	match Halloween_DLC:
		true:
			$Main_Tabs/Main_Tab/Halloween_Button.visible = true
		false:
			$Main_Tabs/Main_Tab/Halloween_Button.visible = false
	match CalcTools_DLC:
		true:
			$Main_Tabs/Main_Tab/Calc_Tools.visible = true
		false:
			$Main_Tabs/Main_Tab/Calc_Tools.visible = false
	match ArtTools_DLC:
		true:
			$Main_Tabs/Main_Tab/Art_Toosl_Button.visible = true
		false:
			$Main_Tabs/Main_Tab/Art_Toosl_Button.visible = false

var stack = []

func _on_Start_Button_pressed():
	$Main_Tabs/Main_Tab/Start_Menu_Base.visible = true
	$Main_Tabs/Main_Tab/Edit_Menu_Base2.visible = false
	$Main_Tabs/Main_Tab/View_Menu_Base3.visible = false
	$Main_Tabs/Main_Tab/Format_Menu_Base4.visible = false
	$Main_Tabs/Main_Tab/Help_Menu_Base5.visible = false
	$Main_Tabs/Main_Tab/Halloween_Base.visible = false
	$Main_Tabs/Main_Tab/Extra_Tools.visible = false
	$Main_Tabs/Main_Tab/Art_Tools_Base.visible = false


func _on_Edit_Button_pressed():
	$Main_Tabs/Main_Tab/Start_Menu_Base.visible = false
	$Main_Tabs/Main_Tab/Edit_Menu_Base2.visible = true
	$Main_Tabs/Main_Tab/View_Menu_Base3.visible = false
	$Main_Tabs/Main_Tab/Format_Menu_Base4.visible = false
	$Main_Tabs/Main_Tab/Help_Menu_Base5.visible = false
	$Main_Tabs/Main_Tab/Halloween_Base.visible = false
	$Main_Tabs/Main_Tab/Extra_Tools.visible = false
	$Main_Tabs/Main_Tab/Art_Tools_Base.visible = false


func _on_View_Button_pressed():
	$Main_Tabs/Main_Tab/Start_Menu_Base.visible = false
	$Main_Tabs/Main_Tab/Edit_Menu_Base2.visible = false
	$Main_Tabs/Main_Tab/View_Menu_Base3.visible = true
	$Main_Tabs/Main_Tab/Format_Menu_Base4.visible = false
	$Main_Tabs/Main_Tab/Help_Menu_Base5.visible = false
	$Main_Tabs/Main_Tab/Halloween_Base.visible = false
	$Main_Tabs/Main_Tab/Extra_Tools.visible = false
	$Main_Tabs/Main_Tab/Art_Tools_Base.visible = false


func _on_Format_Button_pressed():
	$Main_Tabs/Main_Tab/Start_Menu_Base.visible = false
	$Main_Tabs/Main_Tab/Edit_Menu_Base2.visible = false
	$Main_Tabs/Main_Tab/View_Menu_Base3.visible = false
	$Main_Tabs/Main_Tab/Format_Menu_Base4.visible = true
	$Main_Tabs/Main_Tab/Help_Menu_Base5.visible = false
	$Main_Tabs/Main_Tab/Halloween_Base.visible = false
	$Main_Tabs/Main_Tab/Extra_Tools.visible = false
	$Main_Tabs/Main_Tab/Art_Tools_Base.visible = false


func _on_Help_Button_pressed():
	$Main_Tabs/Main_Tab/Start_Menu_Base.visible = false
	$Main_Tabs/Main_Tab/Edit_Menu_Base2.visible = false
	$Main_Tabs/Main_Tab/View_Menu_Base3.visible = false
	$Main_Tabs/Main_Tab/Format_Menu_Base4.visible = false
	$Main_Tabs/Main_Tab/Help_Menu_Base5.visible = true
	$Main_Tabs/Main_Tab/Halloween_Base.visible = false
	$Main_Tabs/Main_Tab/Extra_Tools.visible = false
	$Main_Tabs/Main_Tab/Art_Tools_Base.visible = false


func _on_Button_Name_text_changed(new_text):
	text = new_text


func _on_Create_pressed():
	buttonNum += 1
	var k = InfoButton.instance()
	k.get_child(1).text = text
	k.position = Vector2(520,550)
	k.windowPlace = MainControls.Window
	k.buttonVal = buttonNum
	for screens in $Windows.get_children():
		if screens.screenCount == MainControls.Window:
			screens.add_child(k)


func _on_Format_Menu_item_selected(index):
	match index:
		0: #Clear Tools
			for screens in $Windows.get_children():
				if screens.screenCount == MainControls.Window:
					for tools in screens.get_children():
						if tools.is_in_group("Tools"):
							tools.queue_free()
		1: #Clear Buttons
			for screens in $Windows.get_children():
				if screens.screenCount == MainControls.Window:
					for tools in screens.get_children():
						if tools.is_in_group("Buttons"):
							tools.queue_free()
		2: #Clear Images
			for screens in $Windows.get_children():
				if screens.screenCount == MainControls.Window:
					for tools in screens.get_children():
						if tools.is_in_group("Images"):
							tools.queue_free()
		3: #Clear All
			for screens in $Windows.get_children():
				if screens.screenCount == MainControls.Window:
					for tools in screens.get_children():
						tools.queue_free()
		4: #Close
			$Main_Tabs/Main_Tab/Format_Menu_Base4.visible = false


func _on_DocumentName_text_changed(new_text):
	documentName = new_text
	MainControls.docName = documentName


func _on_Start_Menu_item_selected(index):
	match index:
		0:
			MainControls.screens = {}
			for j in range(0, screenCount + 1):
				for i in $Windows.get_children():
					if i.screenCount == j:
						MainControls.screens[j] = [j]

			MainControls.buttonInfo = {}
			for j in range(0,buttonNum + 1):
				for screens in $Windows.get_children():
					for i in screens.get_children():
						if i.is_in_group("Buttons"):
							if i.buttonVal == j:
								MainControls.buttonInfo[j] = [j, i.text, i.windowPlace, i.position, i.get_child(1).text]

			MainControls.imageInfo = {}
			for j in range(0, imageNum + 1):
				for screens in $Windows.get_children():
					for i in screens.get_children():
						if i.is_in_group("Images"):
							if i.imageNumber == j:
								MainControls.imageInfo[j] = [j, i.scaleX, i.scaleY, i.position, i.windowPlace, i.textureData]

			MainControls.toolsInfo = {}
			for j in range(0, toolNum + 1):
				for screens in $Windows.get_children():
					for i in screens.get_children():
						if i.is_in_group("Tools"):
							if i.toolCount == j:
								MainControls.toolsInfo[j] = [j, i.type, i.position, i.windowPlace, i.extra]

			MainControls.hallowInfo = {}
			for j in range(0, hallowNum + 1):
				for screens in $Windows.get_children():
					for i in screens.get_children():
						if i.is_in_group("Hallow"):
							if i.hallowNum == j:
								MainControls.hallowInfo[j] = [j, i.creature, i.position, i.window]

			MainControls.StoolsInfo = {}
			for j in range(0, SNum + 1):
				for screens in $Windows.get_children():
					for i in screens.get_children():
						if i.is_in_group("STools"):
							if i.SCount == j:
								MainControls.StoolsInfo[j] = [j, i.type, i.position, i.window, i.extra]

			MainControls.artTools = {}
			for j in range(0, artNum + 1):
				for screens in $Windows.get_children():
					for i in screens.get_children():
						if i.is_in_group("Arts"):
							if i.artNum == j:
								MainControls.artTools[j] = [j, i.type, i.position, i.window, i.extra]

			save()
		1:
			#load
			self.get_parent().get_parent().get_child(1).offset = Vector2(512,300)
			self.get_parent().get_parent()._createProjects()
			self.queue_free()
		2:
			$Main_Tabs/Main_Tab/Start_Menu_Base.visible = false

func _Project(path):
	#load
	var docName = str(path).replace("user://saves/", "")
	docName = docName.replace(".save", "")
	documentName = docName
	MainControls.docName = documentName
	$Main_Tabs/Main_Tab/DocumentName.text = str(docName)

	var file = File.new()
	if file.file_exists(path):
		var ERROR = file.open(path, File.READ)
		if ERROR != OK:
			print(file.open(path, File.READ))
		if ERROR == OK:
			var data = file.get_var()
			file.close()

	#distribute file details
			$Windows.get_child(0).queue_free()
			MainControls.docName = data.get("exportName")

			if data.has("screenCount"):
				for j in data.get("screenCount").values():
					screenCount = max(screenCount, j[0])
					var k = screenWindow.instance()
					k.screenCount = j[0]
					$Windows.add_child(k)
			else:
					var k1 = screenWindow.instance()
					var k2 = screenWindow.instance()
					var k3 = screenWindow.instance()
					k1.screenCount = 1
					k2.screenCount = 2
					k3.screenCount = 3
					$Windows.add_child(k1)
					$Windows.add_child(k2)
					$Windows.add_child(k3)
					screenCount = 3
					MainControls.Window = 1

			for j in data.get("imagePos").values():
				var k = ImageImp.instance()
				imageNum = max(j[0], imageNum)
				k.windowPlace = j[4]
				k.scaleX = j[1]
				k.scaleY = j[2]
				k.position = j[3]
				k.imageNumber = j[0]
				k.updateIMG(j[5])
				for screens in $Windows.get_children():
					if screens.screenCount == j[4]:
						screens.add_child(k)

			for j in data.get("buttonPos").values():
				var k = InfoButton.instance()
				buttonNum = max(j[0], buttonNum)
				k.buttonVal = j[0]
				k.text = j[1]
				k.windowPlace = j[2]
				k.position = j[3]
				k.get_child(1).text = j[4]
				for screens in $Windows.get_children():
					if screens.screenCount == j[2]:
						screens.add_child(k)

			for j in data.get("toolPos").values():
				toolNum = max(j[0], toolNum)
				for screens in $Windows.get_children():
					if screens.screenCount == j[3]:
						match j[1]:
							"Calculator":
								var k = Calculator.instance()
								k.windowPlace = j[3]
								k.toolCount = j[0]
								k.position = j[2]
								k.extra = j[4]
								screens.add_child(k)
							"Dice":
								var k = Dice.instance()
								k.windowPlace = j[3]
								k.toolCount = j[0]
								k.position = j[2]
								k.extra = j[4]
								screens.add_child(k)
							"Progress":
								var k = Progress.instance()
								k.windowPlace = j[3]
								k.toolCount = j[0]
								k.position = j[2]
								k.extra = j[4]
								screens.add_child(k)
							"refs":
								var k = Refs.instance()
								k.windowPlace = j[3]
								k.toolCount = j[0]
								k.position = j[2]
								k.extra = j[4]
								screens.add_child(k)
							"Timer":
								var k = Times.instance()
								k.windowPlace = j[3]
								k.toolCount = j[0]
								k.position = j[2]
								k.extra = j[4]
								screens.add_child(k)
							"Dictionary":
								var k = Diction.instance()
								k.windowPlace = j[3]
								k.toolCount = j[0]
								k.position = j[2]
								k.extra = j[4]
								screens.add_child(k)

			if ArtTools_DLC == true:
				if data.has("artTools"):
					for j in data.get("artTools").values():
						artNum = max(artNum, j[0])
						for screens in $Windows.get_children():
							if screens.screenCount == j[3]:
								match j[1]:
									"Button":
										var k = colourButton.instance()
										k.position = j[2]
										k.window = j[3]
										k.artNum = j[0]
										k.extra = j[4]
										screens.add_child(k)
									"Pixel16":
										var k = pixel16.instance()
										k.position = j[2]
										k.window = j[3]
										k.artNum = j[0]
										k.extra = j[4]
										screens.add_child(k)

			if CalcTools_DLC == true:
				if data.has("sTools"):
					for j in data.get("sTools").values():
						SNum = max(SNum, j[0])
						for screens in $Windows.get_children():
							if screens.screenCount == j[3]:
								match j[1]:
									"Compass":
										var k = compass.instance()
										k.position = j[2]
										k.window = j[3]
										k.SCount = j[0]
										k.SDegree = j[4][0]
										k.EDegree = j[4][1]
										screens.add_child(k)
									"Hat":
										var k = hat.instance()
										k.position = j[2]
										k.window = j[3]
										k.SCount = j[0]
										k.extra = j[4]
										screens.add_child(k)
									"Metronome":
										var k = metronome.instance()
										k.position = j[2]
										k.window = j[3]
										k.SCount = j[0]
										k.extra = j[4]
										screens.add_child(k)
									"NumberGen":
										var k = numGen.instance()
										k.position = j[2]
										k.window = j[3]
										k.SCount = j[0]
										k.extra = j[4]
										screens.add_child(k)
									"RectColour":
										var k = RectColour.instance()
										k.position = j[2]
										k.window = j[3]
										k.SCount = j[0]
										k.extra = j[4]
										screens.add_child(k)

			if Halloween_DLC == true:
				if data.has("Halloween"):
					for j in data.get("Halloween").values():
						var k = Hallow.instance()
						hallowNum = max(j[0], hallowNum)
						for screens in $Windows.get_children():
							if screens.screenCount == j[3]:
								k.window = j[3]
								k.creature = j[1]
								k.position = j[2]
								k.hallowNum = j[0]
								k.animationKind(j[1])
								screens.add_child(k)

func save():
	var save_dict = {
		"buttonPos" : MainControls.buttonInfo,
		"toolPos" : MainControls.toolsInfo,
		"imagePos" : MainControls.imageInfo,
		"docName" : documentName,
		"exportName" : MainControls.docName,
		"Halloween" : MainControls.hallowInfo,
		"sTools" : MainControls.StoolsInfo,
		"artTools" : MainControls.artTools,
		"screenCount" : MainControls.screens
	}
	#print(save_dict)
	savePath = SAVEDIR + documentName + ".save"
	var Dir = Directory.new()
	if !Dir.dir_exists(SAVEDIR):
		Dir.make_dir_recursive(SAVEDIR)
	var file = File.new()
	var ERROR = file.open(savePath, File.WRITE)
	if ERROR == OK:
		file.store_var(save_dict)
		file.close()


func _on_View_Menu_item_selected(index):
	for screens in $Windows.get_children():
		if screens.screenCount == MainControls.Window:
			match index:
				0:
					$Main_Tabs/Main_Tab/View_Menu_Base3.visible = false
				1:
					toolNum += 1
					var k = Progress.instance()
					k.position = Vector2(520,530)
					k.toolCount = toolNum
					k.windowPlace = MainControls.Window
					screens.add_child(k)
				4:
					toolNum += 1
					var k = Dice.instance()
					k.position = Vector2(520,530)
					k.toolCount = toolNum
					k.windowPlace = MainControls.Window
					screens.add_child(k)
				2:
					toolNum += 1
					var k = Times.instance()
					k.position = Vector2(520,530)
					k.toolCount = toolNum
					k.windowPlace = MainControls.Window
					screens.add_child(k)
				5:
					toolNum += 1
					var k = Calculator.instance()
					k.position = Vector2(520,530)
					k.toolCount = toolNum
					k.windowPlace = MainControls.Window
					screens.add_child(k)
				3:
					toolNum += 1
					var k = Refs.instance()
					k.position = Vector2(520,530)
					k.toolCount = toolNum
					k.windowPlace = MainControls.Window
					screens.add_child(k)
				6:
					toolNum += 1
					var k = Diction.instance()
					k.position = Vector2(520,530)
					k.toolCount = toolNum
					k.windowPlace = MainControls.Window
					screens.add_child(k)


func _on_Image_pressed():
	$Popup_Holder/CanvasLayer/ImageFile.visible = true


func _on_ImageFile_file_selected(path):
	imageNum += 1
	for screens in $Windows.get_children():
		if screens.screenCount == MainControls.Window:
			$Popup_Holder/CanvasLayer/ImageFile.visible = false
			var k = ImageImp.instance()
			k.imageNumber = imageNum
			k.updateIMG(path)
			k.position = Vector2(520,530)
			k.windowPlace = MainControls.Window
			screens.add_child(k)

func _on_Edit_Menu_item_selected(index):
	match index:
		0: #undo
			if stack:
				var option = stack[-1]
				match option:
					"button1":
						$ButtonHold.get_child($ButtonHold.get_child_count() - 1).queue_free()
						stack.pop_back()
					"button2":
						$ButtonHold2.get_child($ButtonHold2.get_child_count() - 1).queue_free()
						stack.pop_back()
					"button3":
						$ButtonHold3.get_child($ButtonHold3.get_child_count() - 1).queue_free()
						stack.pop_back()
		2: #redo
			pass
		1:
			$Main_Tabs/Main_Tab/Edit_Menu_Base2.visible = false


func _on_Help_Menu_item_selected(index):
	match index:
		0:
			var k = Tutor.instance()
			$References.add_child(k)
		1:
			$Main_Tabs/Main_Tab/Help_Menu_Base5.visible = false


func _on_Halloween_Button_pressed():
	$Main_Tabs/Main_Tab/Start_Menu_Base.visible = false
	$Main_Tabs/Main_Tab/Edit_Menu_Base2.visible = false
	$Main_Tabs/Main_Tab/View_Menu_Base3.visible = false
	$Main_Tabs/Main_Tab/Format_Menu_Base4.visible = false
	$Main_Tabs/Main_Tab/Help_Menu_Base5.visible = false
	$Main_Tabs/Main_Tab/Halloween_Base.visible = true
	$Main_Tabs/Main_Tab/Extra_Tools.visible = false
	$Main_Tabs/Main_Tab/Art_Tools_Base.visible = false


func _on_Halloween_Menu_item_selected(index):
	for screens in $Windows.get_children():
		if screens.screenCount == MainControls.Window:
			match index:
				0:
					var k = Hallow.instance()
					k.animationKind("Pumpkin")
					k.window = MainControls.Window
					k.position = Vector2(520,530)
					hallowNum += 1
					k.hallowNum = hallowNum
					screens.add_child(k)
				1:
					var k = Hallow.instance()
					k.animationKind("Skull")
					k.window = MainControls.Window
					k.position = Vector2(520,530)
					hallowNum += 1
					k.hallowNum = hallowNum
					screens.add_child(k)
				2:
					var k = Hallow.instance()
					k.animationKind("Grave")
					k.window = MainControls.Window
					k.position = Vector2(520,530)
					hallowNum += 1
					k.hallowNum = hallowNum
					screens.add_child(k)
				3:
					var k = Hallow.instance()
					k.animationKind("Bat")
					k.window = MainControls.Window
					k.position = Vector2(520,530)
					hallowNum += 1
					k.hallowNum = hallowNum
					screens.add_child(k)
				4:
					var k = Hallow.instance()
					k.animationKind("Ghost")
					k.window = MainControls.Window
					k.position = Vector2(520,530)
					hallowNum += 1
					k.hallowNum = hallowNum
					screens.add_child(k)
				5:
					var k = Hallow.instance()
					k.animationKind("Tree")
					k.window = MainControls.Window
					k.position = Vector2(520,530)
					hallowNum += 1
					k.hallowNum = hallowNum
					screens.add_child(k)
				6:
					$Main_Tabs/Main_Tab/Halloween_Base.visible = false


func _on_Calc_Tools_pressed():
	$Main_Tabs/Main_Tab/Start_Menu_Base.visible = false
	$Main_Tabs/Main_Tab/Edit_Menu_Base2.visible = false
	$Main_Tabs/Main_Tab/View_Menu_Base3.visible = false
	$Main_Tabs/Main_Tab/Format_Menu_Base4.visible = false
	$Main_Tabs/Main_Tab/Help_Menu_Base5.visible = false
	$Main_Tabs/Main_Tab/Halloween_Base.visible = false
	$Main_Tabs/Main_Tab/Extra_Tools.visible = true
	$Main_Tabs/Main_Tab/Art_Tools_Base.visible = false


func _on_Calc_Tools_item_selected(index):
	for screens in $Windows.get_children():
		if screens.screenCount == MainControls.Window:
			match index:
				0:
					$Main_Tabs/Main_Tab/Extra_Tools.visible = false
				1:
					SNum += 1
					var k = metronome.instance()
					k.SCount = SNum
					k.window = MainControls.Window
					k.position = Vector2(520,530)
					screens.add_child(k)
				2:
					SNum += 1
					var k = hat.instance()
					k.SCount = SNum
					k.window = MainControls.Window
					k.position = Vector2(520,530)
					screens.add_child(k)
				3:
					SNum += 1
					var k = compass.instance()
					k.SCount = SNum
					k.window = MainControls.Window
					k.position = Vector2(520,530)
					screens.add_child(k)
				4:
					SNum += 1
					var k = RectColour.instance()
					k.SCount = SNum
					k.window = MainControls.Window
					k.position = Vector2(520,530)
					screens.add_child(k)
				5:
					SNum += 1
					var k = numGen.instance()
					k.SCount = SNum
					k.window = MainControls.Window
					k.position = Vector2(520,530)
					screens.add_child(k)


func _on_Art_Toosl_Button_pressed():
	$Main_Tabs/Main_Tab/Start_Menu_Base.visible = false
	$Main_Tabs/Main_Tab/Edit_Menu_Base2.visible = false
	$Main_Tabs/Main_Tab/View_Menu_Base3.visible = false
	$Main_Tabs/Main_Tab/Format_Menu_Base4.visible = false
	$Main_Tabs/Main_Tab/Help_Menu_Base5.visible = false
	$Main_Tabs/Main_Tab/Halloween_Base.visible = false
	$Main_Tabs/Main_Tab/Extra_Tools.visible = false
	$Main_Tabs/Main_Tab/Art_Tools_Base.visible = true


func _on_Art_Tools_item_selected(index):
	for screens in $Windows.get_children():
		if screens.screenCount == MainControls.Window:
			match index:
				0:
					$Main_Tabs/Main_Tab/Art_Tools_Base.visible = false
				1:
					var k = colourButton.instance()
					k.position = Vector2(520,550)
					k.window = MainControls.Window
					artNum += 1
					k.artNum = artNum
					screens.add_child(k)
				2:
					var k = pixel16.instance()
					k.position = Vector2(520, 550)
					k.window = MainControls.Window
					artNum += 1
					k.artNum = artNum
					screens.add_child(k)


func _on_Add_Window_pressed():
	screenCount += 1
	var k = screenWindow.instance()
	k.screenCount = screenCount
	MainControls.Window = screenCount
	$Windows.add_child(k)
	$Windows.get_child(currentChild).visible = false
	$Windows.get_child($Windows.get_child_count() - 1).visible = true
	currentChild = $Windows.get_child_count() - 1
	$Main_Tabs/Main_Tab/WindowCount.text = str(currentChild)


func _on_Remove_Window_pressed():
	if $Windows.get_child_count() > 1:
		for screen in $Windows.get_children():
			if screen.screenCount == MainControls.Window:
				screen.queue_free()
				if currentChild > 0:
					currentChild -= 1
				else:
					currentChild = $Windows.get_child_count() - 1
				MainControls.Window = $Windows.get_child(currentChild).screenCount
				$Windows.get_child(currentChild).visible = true
				$Main_Tabs/Main_Tab/WindowCount.text = str(currentChild)
				return

func _on_Scroll_Left_pressed():
	if currentChild > 0:
		currentChild -= 1
		MainControls.Window = $Windows.get_child(currentChild).screenCount
	else:
		MainControls.Window = $Windows.get_child($Windows.get_child_count() - 1).screenCount
		currentChild = $Windows.get_child_count() - 1

	for screens in $Windows.get_children():
		if screens.screenCount == MainControls.Window:
			screens.visible = true
		else:
			screens.visible = false
	$Main_Tabs/Main_Tab/WindowCount.text = str(currentChild)


func _on_Scroll_Right_pressed():
	if currentChild < $Windows.get_child_count() - 1:
		currentChild += 1
		MainControls.Window = $Windows.get_child(currentChild).screenCount
	else:
		MainControls.Window = $Windows.get_child(0).screenCount
		currentChild = 0

	for screens in $Windows.get_children():
		if screens.screenCount == MainControls.Window:
			screens.visible = true
		else:
			screens.visible = false
	$Main_Tabs/Main_Tab/WindowCount.text = str(currentChild)
