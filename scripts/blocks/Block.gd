extends Node

class_name Block

# Block properties
var shape = []  # Array of (x, y) offsets
var color = Color.WHITE
var position = Vector2(0, 0)
var is_placed = false

# Block shapes (relative positions)
var SHAPES = {
	"square": [(0, 0), (1, 0), (0, 1), (1, 1)],
	"line_h": [(0, 0), (1, 0), (2, 0), (3, 0)],
	"line_v": [(0, 0), (0, 1), (0, 2), (0, 3)],
	"l_shape": [(0, 0), (1, 0), (2, 0), (2, 1)],
	"t_shape": [(0, 0), (1, 0), (2, 0), (1, 1)],
}

var COLORS = [
	Color.RED,
	Color.BLUE,
	Color.GREEN,
	Color.YELLOW,
	Color.MAGENTA,
	Color.CYAN,
]

func _ready():
	randomize_block()

func randomize_block():
	"""Create a random block with random shape and color"""
	var shape_keys = SHAPES.keys()
	var random_shape = shape_keys[randi() % shape_keys.size()]
	shape = SHAPES[random_shape].duplicate()
	color = COLORS[randi() % COLORS.size()]
	is_placed = false

func get_cells() -> Array:
	"""Get all cells this block occupies"""
	var cells = []
	for cell in shape:
		cells.append(Vector2(position.x + cell[0], position.y + cell[1]))
	return cells

func can_place(grid_manager, start_x: int, start_y: int) -> bool:
	"""Check if block can be placed at given position"""
	for cell in shape:
		var x = start_x + cell[0]
		var y = start_y + cell[1]
		if not grid_manager.is_cell_empty(x, y):
			return false
	return true

func place(grid_manager, start_x: int, start_y: int) -> bool:
	"""Place block on grid"""
	if can_place(grid_manager, start_x, start_y):
		for cell in shape:
			var x = start_x + cell[0]
			var y = start_y + cell[1]
			grid_manager.place_block(x, y)
		position = Vector2(start_x, start_y)
		is_placed = true
		return true
	return false
