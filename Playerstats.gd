extends Node

var total_xp = 0
var current_xp = 0
var xp_next_level = 150
var level = 1

signal player_stats_changed(value)

func level_up():
	level += 1
	current_xp = 0
	xp_next_level *= 1.1
	
func addxp(value):
	current_xp += value
	total_xp += value
	emit_signal("player_stats_changed", self)
