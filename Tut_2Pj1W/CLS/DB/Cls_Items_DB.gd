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
	print("F_Make_Items..");
	
	var M_c:Cls_Items=M_ClsItems;#Para Escribir Menos.
	# Los nombres reales se dan en el fichero de traducion.
	M_c.F_ADD("It_n_CL","It_d_CL",0);#Cristal líquido
	M_c.F_ADD("It_n_CI","It_d_CI",0);#Circuitos integrados
	M_c.F_ADD("It_n_FO","It_d_FO",0);#Fibra óptica
	M_c.F_ADD("It_n_FP","It_d_FP",0);#Fibra Plastica
	M_c.F_ADD("It_n_FCa","It_d_FCa",0);#Fibra de Carbono
	M_c.F_ADD("It_n_FT","It_d_FT",0);#Fibra de Titanio
	M_c.F_ADD("It_n_FG","It_d_FG",0);#Fibra de Grafeno
	M_c.F_ADD("It_n_FA","It_d_FA",0);#Fibra de Aluminio
	M_c.F_ADD("It_n_FCo","It_d_FCo",0);#Fibra de Cobre
	M_c.F_ADD("It_n_NA","It_d_NA",0);#Nanites
	M_c.F_ADD("It_n_PT","It_d_PT",0);#Polímero termoplástico
	M_c.F_ADD("It_n_GE","It_d_GE",0);#Gel Energetico
	
	print("Items1 ?= :"+str((M_c.V_Lista.size()==M_c.V_ListaPlayer1.size())));
	print("Items2 ?= :"+str((M_c.V_Lista.size()==M_c.V_ListaPlayer2.size())));
	print("F_Make_Items__");
#END F_Make_Items



# Esta funcion Crea la lista de items.
func F_Make_Items_Test(M_ClsItems:Cls_Items,M_Rows:int=100):
	print("F_Make_Items_T..");
	
	var M_c:Cls_Items=M_ClsItems;#Para Escribir Menos.
	var M_Rnd:RandomNumberGenerator = RandomNumberGenerator.new()
	# - Añado items
	for M_q in M_Rows:
		M_c.F_ADD("It_TestT"+str(M_q),"It_TestD"+str(M_q),0);
	#END For Añado Items
	
	# - Añado cantidad a los items.
	for M_q in M_c.V_Lista.size():
		M_Rnd.randomize();
		M_c.V_ListaPlayer1[M_q]=M_Rnd.randi_range(0,99999);
		M_Rnd.randomize();
		M_c.V_ListaPlayer2[M_q]=M_Rnd.randi_range(0,99999);
	#END For Añado cantidad a los items.
	
	print("Items1 ?= :"+str((M_c.V_Lista.size()==M_c.V_ListaPlayer1.size())));
	print("Items2 ?= :"+str((M_c.V_Lista.size()==M_c.V_ListaPlayer2.size())));
	print("F_Make_Items_T__");
#END F_Make_Items




