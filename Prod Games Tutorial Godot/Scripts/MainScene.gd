extends Node2D

var numero_int : int = 7
var numero_float : float = 5.89898989
var texto : String = "Hello World!"
var menor_que_5 : bool = true
var lista : Array = [5,3,1231, "oi"]
var no : Node2D
var posicao_icon : Vector2 = Vector2(100,200)
var poder = false


const VELOCIDADE = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	pass

class Pessoa :
	var nome : String
	var idade : int
	var altura : float

	func saudacao() :
		print("Oi")

class Crianca extends Pessoa: # extends <-> herda
	var brinquedo












