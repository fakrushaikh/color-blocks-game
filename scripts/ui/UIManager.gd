extends Control

# UI References
@onready var score_label = Label.new()
@onready var combo_label = Label.new()
@onready var restart_button = Button.new()

var game_manager

func _ready():
	setup_ui()
	game_manager = GameManager.new()
	add_child(game_manager)
	update_ui()

func setup_ui():
	"""Setup UI elements"""
	# Score Label
	score_label.text = "Score: 0"
	score_label.position = Vector2(10, 10)
	score_label.add_theme_font_size_override("font_size", 24)
	add_child(score_label)
	
	# Combo Label
	combo_label.text = "Combo: 0"
	combo_label.position = Vector2(10, 50)
	combo_label.add_theme_font_size_override("font_size", 20)
	add_child(combo_label)
	
	# Restart Button
	restart_button.text = "Restart"
	restart_button.position = Vector2(10, 90)
	restart_button.size = Vector2(100, 40)
	restart_button.pressed.connect(_on_restart_pressed)
	add_child(restart_button)

func _process(_delta):
	update_ui()

func update_ui():
	"""Update UI with current game state"""
	score_label.text = "Score: %d" % game_manager.get_current_score()
	combo_label.text = "Combo: %d" % game_manager.get_current_combo()

func _on_restart_pressed():
	"""Handle restart button press"""
	game_manager.restart_game()

func _input(event):
	"""Handle input for block placement"""
	if event is InputEventMouseButton and event.pressed:
		var mouse_pos = get_local_mouse_position()
		# TODO: Implement block placement on click
		print("Clicked at: ", mouse_pos)
