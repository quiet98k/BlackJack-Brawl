extends Node2D

@onready var label: Label = $TextLabel
@onready var label2: Label = $TextLabel2
@onready var label3: Label = $TextLabel3
@onready var label4: Label = $TextLabel4

@onready var diamond: Button = $CardSuit/DiamondSuit
@onready var club: Button = $CardSuit/ClubSuit
@onready var heart: Button = $CardSuit/HeartSuit
@onready var spade: Button = $CardSuit/SpadeSuit

@onready var player = preload("res://scenes/player.tscn")
@onready var table = preload("res://scenes/table.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	diamond.hide()
	club.hide()
	heart.hide()
	spade.hide()
	label3.hide()
	label4.hide()
	label.text = "Congratulations, now you successfully"
	label2.text = "registered Gaming Playing course"
	
	var delay: float = 3.0
	SoundManager.stop_start()
	await get_tree().create_timer(delay).timeout
	SoundManager.play_sfx("StoryAudio")
	
	var audio_stream = "res://assets/sfx/background_story.mp3"
	
	# You can skip the introduction bu press Tab
	var duration: float = 0
	if (Input.is_action_pressed("skip")):
		duration = 1.0
		SoundManager.stop_story()
	#else:
		#duration = 31.0
		#await get_tree().create_timer(duration).timeout
	
	label.hide()
	label2.hide()
	label3.show()
	label4.text = ""
	label4.show()
	
	var gap: float = 0.5
	await get_tree().create_timer(gap).timeout
	diamond.show()
	await get_tree().create_timer(gap).timeout
	club.show()
	await get_tree().create_timer(gap).timeout
	heart.show()
	await get_tree().create_timer(gap).timeout
	spade.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_diamond_suit_mouse_entered() -> void:
	SoundManager.play_sfx("ButtonFocus")
	label4.text = "Diamond"
	var animation := create_tween()
	animation.tween_property($CardSuit/DiamondSuit, "scale", Vector2(0.5, 0.5), 0.1)
	await animation.finished


func _on_diamond_suit_mouse_exited() -> void:
	var animation := create_tween()
	animation.tween_property($CardSuit/DiamondSuit, "scale", Vector2(0.4, 0.4), 0.1)
	await animation.finished


func _on_diamond_suit_pressed() -> void:
	SoundManager.play_sfx("ButtonStart")
	GameGlobal.chosen_suit = GameGlobal.Suit.DIAMONDS
	get_tree().change_scene_to_file("res://scenes/player.tscn")


func _on_club_suit_mouse_entered() -> void:
	SoundManager.play_sfx("ButtonFocus")
	label4.text = "Club"
	var animation := create_tween()
	animation.tween_property($CardSuit/ClubSuit, "scale", Vector2(0.5, 0.5), 0.1)
	await animation.finished


func _on_club_suit_mouse_exited() -> void:
	var animation := create_tween()
	animation.tween_property($CardSuit/ClubSuit, "scale", Vector2(0.4, 0.4), 0.1)
	await animation.finished


func _on_club_suit_pressed() -> void:
	SoundManager.play_sfx("ButtonStart")
	GameGlobal.chosen_suit = GameGlobal.Suit.CLUBS


func _on_heart_suit_mouse_entered() -> void:
	SoundManager.play_sfx("ButtonFocus")
	label4.text = "Heart"
	var animation := create_tween()
	animation.tween_property($CardSuit/HeartSuit, "scale", Vector2(0.5, 0.5), 0.1)
	await animation.finished


func _on_heart_suit_mouse_exited() -> void:
	var animation := create_tween()
	animation.tween_property($CardSuit/HeartSuit, "scale", Vector2(0.4, 0.4), 0.1)
	await animation.finished


func _on_heart_suit_pressed() -> void:
	SoundManager.play_sfx("ButtonStart")
	GameGlobal.chosen_suit = GameGlobal.Suit.HEARTS


func _on_spade_suit_mouse_entered() -> void:
	SoundManager.play_sfx("ButtonFocus")
	label4.text = "Spade"
	var animation := create_tween()
	animation.tween_property($CardSuit/SpadeSuit, "scale", Vector2(0.5, 0.5), 0.1)
	await animation.finished


func _on_spade_suit_mouse_exited() -> void:
	var animation := create_tween()
	animation.tween_property($CardSuit/SpadeSuit, "scale", Vector2(0.4, 0.4), 0.1)
	await animation.finished


func _on_spade_suit_pressed() -> void:
	SoundManager.play_sfx("ButtonStart")
	GameGlobal.chosen_suit = GameGlobal.Suit.SPADES
