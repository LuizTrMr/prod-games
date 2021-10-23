extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var next_scene = load("res://Scenes/MainScene.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Button.grab_focus()
	$Label.text = "AAA BBB"
	$RichTextLabel.bbcode_text = "BB Code"
	$ProgressBar.value = 50


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	$RichTextLabel.rect_position.x = 1000
	$Label.text += "CCC"
	$RichTextLabel.bbcode_text += " [rainbow]arco iris"
	#get_tree().change_scene_to(next_scene)
