extends Entity

func _ready():
	position = Vector2(0.0, 0.0)

func _on_death_area_entered(body):
	super.die()
