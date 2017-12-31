extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var instore
var select
var value
func returnFlapper(value):
	return get_children()[value].duplicate()
