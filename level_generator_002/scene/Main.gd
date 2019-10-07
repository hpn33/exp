extends Node


export var weight := 7
export var height := 10

var cols := 0
var rows := 0
var pos := Vector2()
var first := Vector2()
var last := Vector2()


func _ready() -> void:
	
	cols = weight
	rows = height
	
	for x in cols:
		for y in rows:
			$path.set_cell(x, y, 0)
	
	first = Vector2(randi() % cols, 0)
	$path.set_cellv(first, 1)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().reload_current_scene()
