extends Node2D

var wordDict = {}

var motion = false
var word = ""
var definition = ""

var windowPlace = 0
var extra = {}
var toolCount = 0
var type = "Dictionary"

func _ready():
	wordDict = extra

func _process(_delta):
	extra = wordDict
	match motion:
		true:
			self.position = Vector2(get_global_mouse_position().x - 60, get_global_mouse_position().y - 15)

func _on_Add_Def_pressed():
	match $BackPanel/Input_Def.readonly:
		true:
			#wordDict[word] = definition
			$BackPanel/Input_Def.readonly = false
			$BackPanel/Add_Def.text = "Submit"
			$BackPanel/Input_Def.text = ""
		false:
			wordDict[word] = definition
			$BackPanel/Input_Def.readonly = true
			$BackPanel/Add_Def.text = "Add"


func _on_Search_Def_pressed():
	if wordDict.has(word):
		$BackPanel/Input_Def.text = wordDict[word]
		$BackPanel/Input_Def.readonly = true
	else:
		$BackPanel/Input_Def.text = "Word not in Dictionary"
		$BackPanel/Input_Def.readonly = true


func _on_Remove_pressed():
	wordDict.erase(word)


func _on_Input_Main_text_changed(new_text):
	word = new_text


func _on_Input_Def_text_changed():
	definition = $BackPanel/Input_Def.text


func _on_Close_pressed():
	self.queue_free()


func _on_Hide_pressed():
	match $BackPanel.visible:
		true:
			$BackPanel.visible = false
			$Hide.text = "[]"
		false:
			$BackPanel.visible = true
			$Hide.text = "_"


func _on_Move_button_down():
	motion = true


func _on_Move_button_up():
	motion = false


func _on_Browse_pressed():
	var display = ""
	$BackPanel/Input_Def.readonly = true
	for defs in wordDict.keys():
		display += str(defs) + ": " + str(wordDict[defs]) + "\n"
	$BackPanel/Input_Def.text = display
