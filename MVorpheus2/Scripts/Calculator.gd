extends Node2D

var finalVal = 0
var finalValDivMul = 1

var inputArr = []
var opSign = ''

var motion = false

var divisor = float()
var dividend = 1

var firstNum = 0
var secondNum = null

var toolCount = 0
var type = "Calculator"

var windowPlace = 0

var extra = 0

func _ready():
	finalVal = extra


func _process(_delta):
	extra = finalVal
	match motion:
		true:
			self.position = Vector2(get_global_mouse_position().x - 80, get_global_mouse_position().y - 10)
		false:
			pass

func _on_Button0_pressed():
	inputArr.append(0)
	$Panel2/Label.text = str(PoolStringArray(inputArr).join(''))


func _on_Button1_pressed():
	inputArr.append(1)
	$Panel2/Label.text = str(PoolStringArray(inputArr).join(''))


func _on_Button2_pressed():
	inputArr.append(2)
	$Panel2/Label.text = str(PoolStringArray(inputArr).join(''))


func _on_Button3_pressed():
	inputArr.append(3)
	$Panel2/Label.text = str(PoolStringArray(inputArr).join(''))


func _on_Button4_pressed():
	inputArr.append(4)
	$Panel2/Label.text = str(PoolStringArray(inputArr).join(''))


func _on_Button5_pressed():
	inputArr.append(5)
	$Panel2/Label.text = str(PoolStringArray(inputArr).join(''))


func _on_Button6_pressed():
	inputArr.append(6)
	$Panel2/Label.text = str(PoolStringArray(inputArr).join(''))


func _on_Button7_pressed():
	inputArr.append(7)
	$Panel2/Label.text = str(PoolStringArray(inputArr).join(''))


func _on_Button8_pressed():
	inputArr.append(8)
	$Panel2/Label.text = str(PoolStringArray(inputArr).join(''))


func _on_Button9_pressed():
	inputArr.append(9)
	$Panel2/Label.text = str(PoolStringArray(inputArr).join(''))


func _on_Button12_pressed():
	#equal sign
	match opSign:
		"Add":
			finalVal = finalVal + float(PoolStringArray(inputArr).join(''))
			$Panel2/Label.text = str(finalVal)
			inputArr = []
			finalValDivMul = finalVal
		"Subtract":
			if secondNum == null:
				finalVal = float(PoolStringArray(inputArr).join(''))
				secondNum = finalVal
				inputArr = []
				$Panel2/Label.text = str(finalVal)
				finalValDivMul = finalVal
				return
			else:
				firstNum = float(PoolStringArray(inputArr).join(''))
				finalVal = secondNum - firstNum
				secondNum = finalVal
				inputArr = []
				$Panel2/Label.text = str(finalVal)
				finalValDivMul = finalVal
		"Divide":
			if divisor == float():
				finalValDivMul = float(PoolStringArray(inputArr).join(''))
				inputArr = []
				divisor = finalValDivMul
				finalVal = finalValDivMul
				return
			else:
				dividend = float(PoolStringArray(inputArr).join(''))
				if dividend == 0:
					$Panel2/Label.text = "Div Zero Error"
					return
				else:
					finalValDivMul = divisor/dividend
					divisor = finalValDivMul
					$Panel2/Label.text = str(finalValDivMul)
					inputArr = []
					finalVal = finalValDivMul
		"Multiply":
			finalValDivMul = float(PoolStringArray(inputArr).join('')) * finalValDivMul
			$Panel2/Label.text = str(finalValDivMul)
			inputArr = []
			finalVal = finalValDivMul


func _on_Button19_pressed():
	#clear
	inputArr = []
	$Panel2/Label.text = str(PoolStringArray(inputArr).join(''))
	finalVal = 0
	finalValDivMul = 1
	dividend = 1
	divisor = float()
	firstNum = 0
	secondNum = null

func _on_Button13_pressed():
	finalVal = finalVal + float(PoolStringArray(inputArr).join(''))
	opSign = "Add"
	$Panel2/Label.text = str(finalVal)
	inputArr = []


func _on_Button15_pressed():
	if divisor == float():
		finalValDivMul = float(PoolStringArray(inputArr).join(''))
		inputArr = []
		divisor = finalValDivMul
		opSign = "Divide"
		return
	else:
		dividend = float(PoolStringArray(inputArr).join(''))
		if dividend == 0:
			$Panel2/Label.text = "Div Zero Error"
			return
		else:
			finalValDivMul = divisor/dividend
			divisor = finalValDivMul
			$Panel2/Label.text = str(finalValDivMul)
			inputArr = []
			opSign = "Divide"


func _on_Button16_pressed():
	finalValDivMul = float(PoolStringArray(inputArr).join('')) * finalValDivMul
	$Panel2/Label.text = str(finalValDivMul)
	inputArr = []
	opSign = "Multiply"


func _on_Button14_pressed():
	if secondNum == null:
		finalVal = float(PoolStringArray(inputArr).join(''))
		secondNum = finalVal
		inputArr = []
		opSign = "Subtract"
		$Panel2/Label.text = str(finalVal)
		return
	else:
		firstNum = float(PoolStringArray(inputArr).join(''))
		finalVal = secondNum - firstNum
		secondNum = finalVal
		opSign = "Subtract"
		inputArr = []
		$Panel2/Label.text = str(finalVal)


func _on_Button11_pressed():
	inputArr.append(".")
	$Panel2/Label.text = str(PoolStringArray(inputArr).join(''))


func _on_Button17_pressed():
	self.queue_free()


func _on_Button18_button_up():
	motion = false


func _on_Button18_button_down():
	motion = true


func _on_expand_pressed():
	match $Nums.visible:
		true:
			$Nums.visible = false
			$Panel.visible = false
			$Panel2.visible = false
			$expand.text = "[]"
		false:
			$Nums.visible = true
			$Panel.visible = true
			$Panel2.visible = true
			$expand.text = "_"
