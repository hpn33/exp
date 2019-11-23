class_name Board extends Node2D

export(Vector2) var size = Vector2(5, 5)
export(NodePath) var target = NodePath('.')

onready var board_maker := $maker
onready var board_render := $render

var board := []
var path := []

var room_ins = preload("res://board/Room.tscn")

var first := Vector2()
var last := Vector2()

func _ready() -> void:
	
	board_maker.create()
	
	board_render.render()

func clear():
	board.clear()
	path.clear()

