extends Node2D

onready var room := preload("res://Room.tscn")

var rooms = [
	[0, 0, 0, 0],
	[0, 0, 0, 0],
	[0, 0, 0, 0],
	[0, 0, 0, 0]
]



func _init() -> void:
	make_rooms()

func _ready() -> void:
	set_rooms()

func make_rooms():
	randomize()
	
	rooms = [
		[0, 0, 0, 0],
		[0, 0, 0, 0],
		[0, 0, 0, 0],
		[0, 0, 0, 0]
	]
	
	var x := 1
	var y := 1
	
	for i in rooms.size():
		rooms[x][y] = 1
		var dir = (randi() % 4)* 90
		x += lengthdir_x(1, dir) 
		y += lengthdir_y(1, dir) 
		x = clamp(x, 0, 3)
		y = clamp(y, 0, 3)

func set_rooms():
	for child in get_children():
		child.queue_free()
	
	for y in 4:
		var row = rooms[y]
		for x in 4:
			if row[x]:
				var r = room.instance()
				var room_pos = Vector2(1280 * x, 720 * y)# + Vector2(-1280, -720)
				r.position = room_pos
				add_child(r)
				create_door(x, y, r)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		make_rooms()
		set_rooms()

func lengthdir_x(length: int, dir: float):
	return length * cos(dir)

func lengthdir_y(length: int, dir: float):
	return length * sin(dir)

func create_door(x, y, room):
	pass
