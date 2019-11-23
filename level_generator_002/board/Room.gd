extends Node2D
class_name Room

onready var up = $"up/door"
onready var down = $"down/door"
onready var right = $"right/door"
onready var left = $"left/door"

var doors = {
	right = false,
	down = false,
	left = false,
	up = false
}

var pos := Vector2() setget set_pos
var active := false setget set_active
const size := 600
var t:= ''

func set_doors():
	
	yield(self, "ready")
#	show_label(doors)
	$Label.text = t
	
	right.visible = !doors.right
	down.visible = !doors.down
	left.visible = !doors.left
	up.visible = !doors.up


func set_door(direction: Vector2, toggle:= true):
	t += str(direction) + '\n'
	match direction:
		Vector2.RIGHT:
			doors.right = toggle
		Vector2.DOWN:
			doors.down = toggle
		Vector2.LEFT:
			doors.left = toggle
		Vector2.UP:
			doors.up = toggle
	
	set_doors()


func show_label(doors):
	$Label.text = str(doors.values())


func set_active(value: bool) -> void:
	active = value
	modulate = Color.white if active else Color.black

func set_pos(value: Vector2):
	
	pos = value
	position = pos * (Vector2.ONE * size)

