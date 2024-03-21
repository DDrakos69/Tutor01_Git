extends Node
class_name Cls_Items_DB

# _ _ _ _ _ Cls_Items_DB _ _ _ _ _
# Esta clase solo genera la lista de items y sub items
# Solo crea los datos y rellena la clase Items
# Genera los IDs unicos
# En un futuro se puede plantear cargarlo desde fichero
# pero tambien lo haria esta clase, ahora estara todo dentro
# del ejecutable.

func _init():
	pass
#END _init()





# Esta funcion Crea la lista de items.
func F_Make_Items(M_ClsItems:Cls_Items):
	var Mc:Cls_Items=M_ClsItems;#Para Escribir Menos.
	Mc.F_ADD("Plomo","",0);
	Mc.F_ADD("Plata","",0);
	Mc.F_ADD("Oro","",0);
	Mc.F_ADD("Uranio","",0);
	Mc.F_ADD("Cobre","",0);
	Mc.F_ADD("Titanio","",0);
#END F_Make_Items







