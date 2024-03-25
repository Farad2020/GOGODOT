extends Node

var points = 0
@onready var points_label = %PointsLabel

func addPoints():
	points += 1
	points_label.text = "Points: " + str(points)
