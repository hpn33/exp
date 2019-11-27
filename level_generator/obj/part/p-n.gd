extends Node2D
class_name PartRoom

export var right := false setget set_right
export var left := false setget set_left
export var up := false setget set_up
export var down := false setget set_down


onready var r = $right/door
onready var l = $left/door
onready var u = $up/door
onready var d = $down/door


onready var pr = $point/r/c
onready var pl = $point/l/c
onready var pu = $point/t/c
onready var pd = $point/b/c


func set_right(value:bool):
	right = value
	
	set_setting(r, pr, value)

func set_left(value:bool):
	left = value
	
	set_setting(l, pl, value)

func set_up(value:bool):
	up = value
	
	set_setting(u, pu, value)

func set_down(value:bool):
	down = value
	
	set_setting(d, pd, value)

func init(r, d, l, u):
	self.right = r
	self.down = d
	self.left = l
	self.up = u


func set_setting(door, point, value):
	yield(self, "ready")
	
	door.visible = !value
	point.disabled = !value
	point.get_parent().visible = value

