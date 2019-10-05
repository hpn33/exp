extends Node2D
class_name PartRoom

export var right := false setget set_right
export var left := false setget set_left
export var top := false setget set_top
export var bottom := false setget set_bottom


onready var r = $door/r
onready var l = $door/l
onready var t = $door/t
onready var b = $door/b


onready var pr = $point/r/c
onready var pl = $point/l/c
onready var pt = $point/t/c
onready var pb = $point/b/c


func set_right(value:bool):
	right = value
	
	yield(self, "ready")
	
	r.visible = !value
	pr.disabled = !value

func set_left(value:bool):
	left = value
	
	yield(self, "ready")
	
	l.visible = !value
	pl.disabled = !value

func set_top(value:bool):
	top = value
	
	yield(self, "ready")
	
	t.visible = !value
	pt.disabled = !value

func set_bottom(value:bool):
	bottom = value
	
	yield(self, "ready")
	
	b.visible = !value
	pb.disabled = !value

func init(t, r, b, l):
	self.top = t
	self.right = r
	self.bottom = b
	self.left = l
