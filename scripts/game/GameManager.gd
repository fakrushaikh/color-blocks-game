extends Node

# Game states
enum GameState {
	PLAYING,
	GAME_OVER,
	PAUSED
}

var current_state = GameState.PLAYING
var grid_manager
var score_manager
var block_spawner

func _ready():
	# Initialize managers
	grid_manager = GridManager.new()
	add_child(grid_manager)
	
	score_manager = ScoreManager.new()
	add_child(score_manager)
	
	block_spawner = BlockSpawner.new()
	add_child(block_spawner)
	block_spawner.set_grid_manager(grid_manager)
	
	# Start game
	start_game()

func start_game():
	"""Start a new game"""
	current_state = GameState.PLAYING
	grid_manager.reset_grid()
	score_manager.reset_score()
	block_spawner.reset_blocks()
	print("Game Started!")

func place_block(block, x: int, y: int) -> bool:
	"""Attempt to place a block at grid position"""
	if current_state != GameState.PLAYING:
		return false
	
	if block.place(grid_manager, x, y):
		block_spawner.remove_placed_block(block)
		check_for_clears()
		
		# Check if game is over
		if not block_spawner.can_place_any_block():
			end_game()
		
		return true
	return false

func check_for_clears():
	"""Check and clear completed rows and columns"""
	var cleared = 0
	
	# Check rows
	for y in range(8):
		if grid_manager.check_row_complete(y):
			grid_manager.clear_row(y)
			cleared += 1
	
	# Check columns
	for x in range(8):
		if grid_manager.check_column_complete(x):
			grid_manager.clear_column(x)
			cleared += 1
	
	if cleared > 0:
		score_manager.add_clear_points(cleared)
	else:
		score_manager.reset_combo()

func end_game():
	"""End the game"""
	current_state = GameState.GAME_OVER
	print("Game Over! Final Score: %d" % score_manager.get_score())

func get_current_score() -> int:
	return score_manager.get_score()

func get_current_combo() -> int:
	return score_manager.get_combo()

func get_game_state():
	return current_state

func restart_game():
	"""Restart the game"""
	start_game()
