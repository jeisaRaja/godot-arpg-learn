extends Node2D
@onready var player = $TileMap/Player
@onready var heartsContainer = $CanvasLayer/heartsContainer

func _ready():
	heartsContainer.setMaxHearts(player.maxHealth)
	heartsContainer.updateHearts(3)

func _process(delta):
	pass
