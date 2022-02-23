extends Node2D

var value = 0
var window = 0

func _on_2Binary_pressed():
	var decimal_value = 0
	var count = 0
	var temp
	while(value != 0):
		temp = value % 10
		value /= 10
		decimal_value += temp * pow(2, count)
		count += 1
	$result.text = str(decimal_value)
	value = int(0)


func _on_2Decimal_pressed():
	var binary_string = "" 
	var temp 
	var count = 31 # Checking up to 32 bits 
	while(count >= 0):
		temp = int(value) >> count 
		if(temp & 1):
			binary_string = binary_string + "1"
		else:
			binary_string = binary_string + "0"
			count -= 1
	$result.text = str(binary_string)
	value = int(0)
	# Takes in a binary value (int) and returns the decimal value (int)


func _on_SpinBox_value_changed(pvalue):
	value = int(pvalue)
