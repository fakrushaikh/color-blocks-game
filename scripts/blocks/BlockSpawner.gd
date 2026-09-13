extends Node

class_name BlockSpawner

var blocks = []
var grid_manager

func _ready():
	blocks = []
	spawn_initial_blocks()

func set_grid_manager(gm):
	"""Set reference to grid manager"""
	grid_manager = gm

func spawn_initial_blocks():
	"""Spawn 3 initial random blocks"""
	for i in range(3):
		spawn_new_block()

func spawn_new_block():
	"""Spawn a single new random block"""
	var new_block = Block.new()
	blocks.append(new_block)

func get_blocks() -> Array:
	"""Return all current blocks"""
	return blocks

func can_place_any_block() -> bool:
	"""Check if any current block can be placed on grid"""
	if not grid_manager:
		return false
	
	for block in blocks:
		if not block.is_placed:
			# Try to find any valid position on grid
			for y in range(8):
				for x in range(8):
					if block.can_place(grid_manager, x, y):
						return true
	return false

func remove_placed_block(block):
	"""Remove a placed block from the list"""
	blocks.erase(block)
	spawn_new_block()

func reset_blocks():
	"""Reset all blocks"""
	blocks = []
	spawn_initial_blocks()
