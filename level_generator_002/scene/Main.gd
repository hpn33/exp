class_name N extends Node

export var width := 7
export var height := 10

var cols := 0
var rows := 0
var pos := Vector2()
var first := Vector2()
var last := Vector2()

onready var path = $path


func _ready() -> void:
	
	create_path(randi() % 2)


func create_path(origin):
	
	
	if origin == 0:
		print('her')
		create_path_width()
	else:
		create_path_height()
	


func create_path_width():
	cols = width
	rows = height
	
	# set board
	for x in cols:
		for y in rows:
			path.set_cell(x, y, 0)
	
	first = Vector2(randi() % cols, 0)
	path.set_cellv(first, 1)
	pos = first
	
	var end = 0
	while end < rows-1:
		var move = randi() % 5
		
		match move:
			0, 1:
				if pos.x + 1 < cols:
					pos.x += 1
					path.set_cellv(pos, 1)
			2, 3:
				if pos.x - 1 >= 0:
					pos.x -= 1
					path.set_cellv(pos, 1)
			4:
				pos.y += 1
				path.set_cellv(pos, 1)
				end+=1
	
	last = pos

func create_path_height():
	cols = height
	rows = width
	
	# set board
	for x in cols:
		for y in rows:
			path.set_cell(x, y, 0)
	
	first = Vector2(0, randi() % rows)
	path.set_cellv(first, 1)
	pos = first
	
	var end = 0
	while end < cols-1:
		var move = randi() % 5
		
		match move:
			0, 1:
				if pos.y + 1 < rows:
					pos.y += 1
					path.set_cellv(pos, 1)
			2, 3:
				if pos.y - 1 >= 0:
					pos.y -= 1
					path.set_cellv(pos, 1)
			4:
				pos.x += 1
				path.set_cellv(pos, 1)
				end+=1
	
	last = pos


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().reload_current_scene()
