extends Resource

class_name ITEM

@export var ITEM_NAME : String
@export var ITEM_TEXTURE : Texture
#@export var QUANTITY : int
@export var HOVER_TEXT : String


func getTexture() -> Texture:
	return ITEM_TEXTURE



