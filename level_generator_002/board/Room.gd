extends Node2D
class_name Room

onready var up = $"up/door"
onready var down = $"down/door"
onready var right = $"right/door"
onready var left = $"left/door"


#func _init(doors:= []) -> void:
#	set_door(doors)

func set_door(doors: Array):
	
	if doors.size() == 0:
		return
	
	show_label(doors)
#	for d in doors:
#		print(d, ': ', bool(d))
	
	right.visible = !bool(doors[0])
	down.visible = !bool(doors[1])
	left.visible = !bool(doors[2])
	up.visible = !bool(doors[3])


func show_label(doors):
	$Label.text = str(doors)
