extends Node

# Grid dimensions
const GRID_WIDTH = 8
const GRID_HEIGHT = 8
const CELL_SIZE = 50

# Grid state - 0 = empty, 1 = filled
var grid = []

func _ready():
	initialize_grid()

func initialize_grid():
	"""Initialize empty 8x8 grid"""
	grid = []
	for y in range(GRID_HEIGHT):
		var row = []
		for x in range(GRID_WIDTH):
			row.append(0)
		grid.append(row)

func is_cell_empty(x: int, y: int) -> bool:
	"""Check if a cell is empty"""
	if x < 0 or x >= GRID_WIDTH or y < 0 or y >= GRID_HEIGHT:
		return false
	return grid[y][x] == 0

func place_block(x: int, y: int) -> bool:
	"""Place a block at grid position"""
	if is_cell_empty(x, y):
		grid[y][x] = 1
		return true
	return false

func check_row_complete(y: int) -> bool:
	"""Check if a row is complete"""
	for x in range(GRID_WIDTH):
		if grid[y][x] == 0:
			return false
	return true

func check_column_complete(x: int) -> bool:
	"""Check if a column is complete"""
	for y in range(GRID_HEIGHT):
		if grid[y][x] == 0:
			return false
	return true

func clear_row(y: int):
	"""Clear a completed row"""
	for x in range(GRID_WIDTH):
		grid[y][x] = 0

func clear_column(x: int):
	"""Clear a completed column"""
	for y in range(GRID_HEIGHT):
		grid[y][x] = 0

func get_grid_state():
	"""Return current grid state"""
	return grid

func reset_grid():
	"""Reset grid to empty state"""
	initialize_grid()
