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
	
