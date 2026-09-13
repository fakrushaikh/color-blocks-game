extends Node

# Score tracking
var current_score = 0
var combo_count = 0
var combo_multiplier = 1.0

# Points per clear
const POINTS_PER_CLEAR = 10
const COMBO_BONUS_MULTIPLIER = 0.5  # 50% bonus per combo

func _ready():
	reset_score()

func reset_score():
	"""Reset score and combo"""
	current_score = 0
	combo_count = 0
	combo_multiplier = 1.0

func add_clear_points(cleared_count: int):
	"""Add points for cleared rows/columns"""
	var points = cleared_count * POINTS_PER_CLEAR * combo_multiplier
	current_score += int(points)
	combo_count += cleared_count
	update_combo_multiplier()
	print("Points added: %d | Total Score: %d | Combo: %d" % [int(points), current_score, combo_count])

func reset_combo():
	"""Reset combo when no clears happen"""
	combo_count = 0
	combo_multiplier = 1.0

func update_combo_multiplier():
	"""Update multiplier based on combo count"""
	combo_multiplier = 1.0 + (combo_count * COMBO_BONUS_MULTIPLIER)

func get_score() -> int:
	return current_score

func get_combo() -> int:
	return combo_count

func get_combo_multiplier() -> float:
	return combo_multiplier
