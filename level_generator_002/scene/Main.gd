class_name N extends Node



#var maps_loader = preload("res://scene/map.tscn")
var maps: Map

#var room_loader = preload("res://blocks/Room.tscn")

onready var board_maker :Board= $board_maker
onready var map_render :BoardRender= $map_render

#
#var cols := 0
#var rows := 0
#var pos := Vector2()
#var first := Vector2()
#var last := Vector2()

onready var path = $path


func _ready() -> void:
	
#	maps = maps_loader.instance()
	
	board_maker.create_path()
#	board_maker.draw_board(path)
	
	map_render.render(board_maker.board, self)





func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().reload_current_scene()
