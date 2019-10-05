extends Node

var part_room = preload("res://obj/part/p-n.tscn")

func factor(t = false, r = false, b = false, l = false)-> PartRoom:
	
	var ins = part_room.instance()
	ins.init(t, r, b, l)
	
	return ins