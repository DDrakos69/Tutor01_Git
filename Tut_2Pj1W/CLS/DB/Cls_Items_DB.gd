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
	# Los nombres reales se dan en el fichero de traducion.
	Mc.F_ADD("It_n_CL","It_d_CL",0);#Cristal líquido
	Mc.F_ADD("It_n_CI","It_d_CI",0);#Circuitos integrados
	Mc.F_ADD("It_n_FO","It_d_FO",0);#Fibra óptica
	Mc.F_ADD("It_n_FP","It_d_FP",0);#Fibra Plastica
	Mc.F_ADD("It_n_FCa","It_d_FCa",0);#Fibra de Carbono
	Mc.F_ADD("It_n_FT","It_d_FT",0);#Fibra de Titanio
	Mc.F_ADD("It_n_FG","It_d_FG",0);#Fibra de Grafeno
	Mc.F_ADD("It_n_FA","It_d_FA",0);#Fibra de Aluminio
	Mc.F_ADD("It_n_FCo","It_d_FCo",0);#Fibra de Cobre
	Mc.F_ADD("It_n_NA","It_d_NA",0);#Nanites
	Mc.F_ADD("It_n_PT","It_d_PT",0);#Polímero termoplástico
	Mc.F_ADD("It_n_GE","It_d_GE",0);#Gel Energetico


#END F_Make_Items







