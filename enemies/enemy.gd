extends CharacterBody3D

class_name Enemy

@onready var player = get_parent().get_parent().get_parent().get_node("player")
var HP = 1

func check_for_die():
	if HP <= 0:
		Score.score += 1
		Score.enemyct -= 1
		self.queue_free()

func take_damage(dmg):
	HP -= dmg
	
