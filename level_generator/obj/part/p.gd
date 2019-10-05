extends Area2D


export(int, 0, 4) var openingDirection = 0
# 1 top
# 2 right
# 3 bottom
# 4 left

var holder: Node2D
var spawned := false

func _ready() -> void:
	
	randomize()
	connect('area_entered', self, '_on_area_entered')
	
	holder = get_tree().get_nodes_in_group('room_holder')[0]
	
	yield(get_tree().create_timer(1), "timeout")
	spawn()


func spawn() -> void:
	
	if spawned:
		return
	
	match openingDirection:
		1:
			set_room(rt.bottom_room)
		2:
			set_room(rt.left_room)
		3:
			set_room(rt.top_room)
		4:
			set_room(rt.right_room)
	
	spawned = true



func set_room(list: Array):
	var rand = int(rand_range(0, list.size()))
	
	var ins = list[rand]
	
	holder.add_child(ins)
	ins.position = global_position


func _on_area_entered(area: Area2D) -> void:
#	if area.is_in_group('spawn_point') and area.spawned:
	if area.spawned:
		queue_free()
