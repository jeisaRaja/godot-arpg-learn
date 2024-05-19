extends HBoxContainer

@onready var HeartGUIClass = preload("res://gui/heart.tscn")

func _ready():
	pass

func _process(delta):
	pass

func setMaxHearts(max: int):
	for i in range(max):
		var heart = HeartGUIClass.instantiate()
		add_child(heart)
		
func updateHearts(currHealth: int):
	var hearts = get_children()
	for i in range(currHealth):
		hearts[i].update(true)
	for i in range(currHealth, hearts.size()):
		hearts[i].update(false)
