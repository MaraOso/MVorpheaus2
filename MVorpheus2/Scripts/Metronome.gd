extends Node2D

var started = false

var squareNum = 1

var window = 0
var importedVal = 1

var motion = false

var increment = .125
var SCount = 0

var extra = 1
var type = "Metronome"

func _ready():
	$Timer.set_wait_time(extra)
	

func _process(_delta):
	extra = $Timer.get_wait_time()
	$RPM.text = str(int(1/$Timer.get_wait_time() * 60)) + "RPM"
	match motion:
		true:
			self.position = Vector2(get_global_mouse_position().x - 180, get_global_mouse_position().y - 5)

func _on_Close_pressed():
	self.queue_free()


func _on_Move_button_down():
	motion = true


func _on_Move_button_up():
	motion = false


func _on_Start_pressed():
	match started:
		true:
			$Timer.stop()
			started = false
			$Started.set_frame_color(Color(0,0,0))
			$Start.text = "Start"
		false:
			$Timer.start()
			started = true
			$Started.set_frame_color(Color(255,0,0))
			$Start.text = "Stop"


func _on_SpinBox_value_changed(value):
	$Timer.set_wait_time(value)


func _on_Timer_timeout():
	match squareNum:
		1:
			$Panel2/ColorRect.set_frame_color(Color(255,0,0))
			$Panel2/ColorRect8.set_frame_color(Color(54,54,54))
			squareNum = 2
		2:
			$Panel2/ColorRect2.set_frame_color(Color(255,0,0))
			$Panel2/ColorRect.set_frame_color(Color(54,54,54))
			squareNum = 3
		3:
			$Panel2/ColorRect3.set_frame_color(Color(255,0,0))
			$Panel2/ColorRect2.set_frame_color(Color(54,54,54))
			squareNum = 4
		4:
			$Panel2/ColorRect4.set_frame_color(Color(255,0,0))
			$Panel2/ColorRect3.set_frame_color(Color(54,54,54))
			squareNum = 5
		5:
			$Panel2/ColorRect5.set_frame_color(Color(255,0,0))
			$Panel2/ColorRect4.set_frame_color(Color(54,54,54))
			squareNum = 6
		6:
			$Panel2/ColorRect6.set_frame_color(Color(255,0,0))
			$Panel2/ColorRect5.set_frame_color(Color(54,54,54))
			squareNum = 7
		7:
			$Panel2/ColorRect7.set_frame_color(Color(255,0,0))
			$Panel2/ColorRect6.set_frame_color(Color(54,54,54))
			squareNum = 8
		8:
			$Panel2/ColorRect8.set_frame_color(Color(255,0,0))
			$Panel2/ColorRect7.set_frame_color(Color(54,54,54))
			squareNum = 1


func _on_Hide_pressed():
	match $BackGround.visible:
		true:
			$BackGround.visible = false
			$Panel2.visible = false
			$Start.visible = false
			$RPM.visible = false
			$SpinBox.visible = false
			$Started.visible = false
			$Hide.text = "[]"
		false:
			$BackGround.visible = true
			$Panel2.visible = true
			$Start.visible = true
			$RPM.visible = true
			$SpinBox.visible = true
			$Started.visible = true
			$Hide.text = "_"
