extends Camera2D

@export var tilemap: TileMap

func _ready():
	var mapRect = tilemap.get_used_rect()
	var tileSize = tilemap.rendering_quadrant_size
	
	var upperLeft = mapRect.position * tileSize
	var lowerRight = (mapRect.position + mapRect.size) * tileSize
	
	limit_top = tilemap.position.y + upperLeft.y
	limit_bottom = tilemap.position.y + lowerRight.y
	limit_right = tilemap.position.x + lowerRight.x
	limit_left = tilemap.position.x + upperLeft.x

func _process(delta):
	pass
