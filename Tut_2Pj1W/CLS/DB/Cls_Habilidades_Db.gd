extends Node
class_name  Cls_Habilidades_Db;

# - - - Cls_Habilidades_Db - - -
# Esta clase Genera un arbol de habilidades del juego.
# Se instancia, Configura la CaseHabilidades y se libera.
# NT: Crear las habilidades en orden ascendente ya que 
# al cargarlas se tienen que ejecutar sus visibleos de 
# Menor a Mayor



# Variables para uso interno para acceso rapido.
var V_ClsHs:Cls_Habilidades;
var V_ClsH:Cls_Habilidad;#ClsHabilidad
var V_ClsHp:Cls_Habilidad;#Cls Habilidad Padre






# - - Creamos una Habilidad, 
# OJO, Toma datos del V_ClsHp para saber el padre del que cuelga.
func F_Make1(M_Id:String,M_Nom:String,M_Des:String)->Cls_Habilidad:
	var M_c:Cls_Habilidad;
	M_c=V_ClsHs.F_BuscaId(M_Id);
	if(M_c==null):
		M_c=Cls_Habilidad.new();
		M_c.V_Nom=M_Nom;
		M_c.V_Desc=M_Des;
		M_c.V_ID=M_Id;
		V_ClsHs.V_Lista.append(M_c);
		M_c.V_ROW=V_ClsHs.V_Lista.size();
		# Si NO tengo padre =(NodoRaiz) Def(activos,visibles)
		if(V_ClsHp!=null):
			M_c.V_Padre_ID=V_ClsHp.V_ID;
			M_c.V_Activo=false;
			M_c.V_Visible_Actual=false;
			M_c.V_Visible_Inicial=false;
			M_c.V_Bloqueado_Inicial=true;
			M_c.V_Bloqueado_Actual=true;
		else:# Si no tengo padre (=null)
			M_c.V_Padre_ID="";
			M_c.V_Activo=false;
			M_c.V_Visible_Actual=true;
			M_c.V_Visible_Inicial=true;
			M_c.V_Bloqueado_Inicial=false;
			M_c.V_Bloqueado_Actual=false;
		#END If Sin Padre

	#END IF No Null
	V_ClsH=M_c;
	return M_c
#END F_ADD










func F_CHSet(M_x:int,M_y:int,M_Bloc:bool,M_Vis:bool):
	V_ClsH.V_X=M_x;V_ClsH.V_Y=M_y;
	V_ClsH.V_Bloqueado_Actual=M_Bloc;V_ClsH.V_Bloqueado_Inicial=M_Bloc;
	V_ClsH.V_Visible_Actual=M_Vis;V_ClsH.V_Visible_Inicial=M_Vis;
#END F_CHPos








# Set Muestra ,Oculta ,Bloquea,DesBloquea
func F_CHSetMOBD(
	M_Muestra:Array[String],M_Oculta:Array[String],
	M_Bloq:Array[String],M_DesBloq:Array[String]):
		
	V_ClsH.V_Mostrar_Ids=M_Muestra;
	V_ClsH.V_Ocultar_Ids=M_Oculta;
	V_ClsH.V_Bloq_Ids=M_Bloq;
	V_ClsH.V_DesBloq_Ids=M_DesBloq;
#END F_CHSetMOB









# - - Esta funcion crea el arbol de habilidades en su configuracion basica.
#Fuer 1-4
#Def 1-4
#Agi 1-4
#Int 1-4
#Per 1-4

func F_MAKE(M_ClsHs:Cls_Habilidades):
	var M_d:String;
	var M_n:String;
	V_ClsHs=M_ClsHs;
	var M_y:int=20;
	var M_x:int=20;
	F_MAKE_F1(M_ClsHs,M_x*1,M_y*2);#Fuerza
	F_MAKE_D1(M_ClsHs,M_x*1,M_y*6);#Defensa
	F_MAKE_A1(M_ClsHs,M_x*1,M_y*10);#Agilida
	F_MAKE_P1(M_ClsHs,M_x*1,M_y*14);#Percepcion
	F_MAKE_I1(M_ClsHs,M_x*1,M_y*18);#Inteligencia
	
	
	F_MAKE_F2a(M_ClsHs,M_x*7,(M_y*4));#Fuerza 2 - Dagas
	F_MAKE_F3a(M_ClsHs,M_x*13,(M_y*4));#Fuerza 3 - Espadas
	F_MAKE_F4a(M_ClsHs,M_x*19,(M_y*4));#Fuerza 4 - Latigos
	
	F_MAKE_D2a(M_ClsHs,M_x*7, (M_y*8));#Defensa 2 - Ligeras
	F_MAKE_D3a(M_ClsHs,M_x*13,(M_y*8));#Defensa 3 - Pesadas
	F_MAKE_D4a(M_ClsHs,M_x*19,(M_y*8));#Defensa 4 - Energeticas
	
	F_MAKE_A2a(M_ClsHs,M_x*7, (M_y*12));#Agilidad 2 - Esconderse
	F_MAKE_A3a(M_ClsHs,M_x*13,(M_y*12));#Agilidad 3 - Sigilo
	F_MAKE_A4a(M_ClsHs,M_x*19,(M_y*12));#Agilidad 4 - Asesinato
	
	F_MAKE_P2a(M_ClsHs,M_x*7, (M_y*16));#Percepcion 2 - Ver Desmontar
	F_MAKE_P3a(M_ClsHs,M_x*13,(M_y*16));#Percepcion 3 - Cofres Puertas Terminales
	#F_MAKE_P4a(M_ClsHs,M_x*19,(M_y*16));#Percepcion 4 
	
	F_MAKE_I1a(M_ClsHs,M_x*1, (M_y*20));#Inteligencia 1 - Pistola
	F_MAKE_I2a(M_ClsHs,M_x*7, (M_y*20));#Inteligencia 2 - Escopeta
	F_MAKE_I3a(M_ClsHs,M_x*13,(M_y*20));#Inteligencia 3 - Fusil
	F_MAKE_I4a(M_ClsHs,M_x*19,(M_y*20));#Inteligencia 4 - Laser
#END F_MAKE







# Creamos la Basica para Inteligencia
func F_MAKE_I1(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("I1","HI1t","HI1d");F_CHSet(M_x,M_y,false,true);M_x+=120;
	F_CHSetMOBD(["I2"],[],["I1"],["I2","I1a1"]);
	F_Make1("I2","HI2t","HI2d");F_CHSet(M_x,M_y,true,true);M_x+=120;
	F_CHSetMOBD(["I3"],[],["I2"],["I3","I2a1"]);
	F_Make1("I3","HI3t","HI3d");F_CHSet(M_x,M_y,true,true);M_x+=120;
	F_CHSetMOBD(["I4"],[],["I3"],["I4","I3a1"]);
	F_Make1("I4","HI4t","HI4d");F_CHSet(M_x,M_y,true,true);M_x+=120;
	F_CHSetMOBD([],[],["I4"],["I4a1"]);


# Creamos la Basica para Inteligenica pistolas
func F_MAKE_I1a(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("I1a1","HI1a1t","HI1a1d");F_CHSet(M_x,M_y,true,true);#M_x+=120;
	F_CHSetMOBD(["I1a2"],["I1a1"],["I1a1"],[]);
	F_Make1("I1a2","HI1a2t","HI1a2d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["I1a3"],["I1a2"],["I1a2"],[]);
	F_Make1("I1a3","HI1a3t","HI1a3d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["I1a4"],["I1a3"],["I1a3"],[]);
	F_Make1("I1a4","HI1a4t","HI1a4d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD([],[],["I1a4"],[]);


# Creamos la Basica para Inteligenica Escopetas
func F_MAKE_I2a(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("I2a1","HI2a1t","HI2a1d");F_CHSet(M_x,M_y,true,true);#M_x+=120;
	F_CHSetMOBD(["I2a2"],["I2a1"],["I2a1"],[]);
	F_Make1("I2a2","HI2a2t","HI2a2d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["I2a3"],["I2a2"],["I2a2"],[]);
	F_Make1("I2a3","HI2a3t","HI2a3d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["I2a4"],["I2a3"],["I2a3"],[]);
	F_Make1("I2a4","HI2a4t","HI2a4d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD([],[],["I2a4"],[]);


# Creamos la Basica para Inteligenica Fusiles
func F_MAKE_I3a(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("I3a1","HI3a1t","HI3a1d");F_CHSet(M_x,M_y,true,true);#M_x+=120;
	F_CHSetMOBD(["I3a2"],["I3a1"],["I3a1"],[]);
	F_Make1("I3a2","HI3a2t","HI3a2d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["I3a3"],["I3a2"],["I3a2"],[]);
	F_Make1("I3a3","HI3a3t","HI3a3d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["I3a4"],["I3a3"],["I3a3"],[]);
	F_Make1("I3a4","HI3a4t","HI3a4d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD([],[],["I3a4"],[]);


# Creamos la Basica para Inteligenica Laser
func F_MAKE_I4a(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("I4a1","HI4a1t","HI4a1d");F_CHSet(M_x,M_y,true,true);#M_x+=120;
	F_CHSetMOBD(["I4a2"],["I4a1"],["I4a1"],[]);
	F_Make1("I4a2","HI4a2t","HI4a2d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["I4a3"],["I4a2"],["I4a2"],[]);
	F_Make1("I4a3","HI4a3t","HI4a3d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["I4a4"],["I4a3"],["I4a3"],[]);
	F_Make1("I4a4","HI4a4t","HI4a4d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD([],[],["I4a4"],[]);














# Creamos la Basica para Percepcion
func F_MAKE_P1(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("P1","HP1t","HP1d");F_CHSet(M_x,M_y,false,true);M_x+=120;
	F_CHSetMOBD(["P2"],[],["P1"],["P2"]);
	F_Make1("P2","HP2t","HP2d");F_CHSet(M_x,M_y,true,true);M_x+=120;
	F_CHSetMOBD(["P3"],[],["P2"],["P3","P2a1"]);
	F_Make1("P3","HP3t","HP3d");F_CHSet(M_x,M_y,true,true);M_x+=120;
	F_CHSetMOBD(["P4"],[],["P3"],["P4","P3a1"]);
	F_Make1("P4","HP4t","HP4d");F_CHSet(M_x,M_y,true,true);M_x+=120;
	F_CHSetMOBD([],[],["P4"],[]);


# Creamos la Basica para Percepcion 2 Trampas (Ver Desmontar)
func F_MAKE_P2a(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("P2a1","HP2a1t","HP2a1d");F_CHSet(M_x,M_y,true,true);#M_x+=120;
	F_CHSetMOBD(["P2a2"],["P2a1"],["P2a1"],[]);
	F_Make1("P2a2","HP2a2t","HP2a2d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD([],[],["P2a2"],[]);
	

# Creamos la Basica para Percepcion 3 (Cofres Puertas Terminales)
func F_MAKE_P3a(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("P3a1","HP3a1t","HP3a1d");F_CHSet(M_x,M_y,true,true);#M_x+=120;
	F_CHSetMOBD(["P3a2"],["P3a1"],["P3a1"],[]);
	F_Make1("P3a2","HP3a2t","HP3a2d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["P3a3"],["P3a2"],["P3a2"],[]);
	F_Make1("P3a3","HP3a3t","HP3a3d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD([],[],["P3a3"],[]);













# Creamos la Basica para Agilidad
func F_MAKE_A1(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("A1","HA1t","HA1d");F_CHSet(M_x,M_y,false,true);M_x+=120;
	F_CHSetMOBD(["A2"],[],["A1"],["A2"]);
	F_Make1("A2","HA2t","HA2d");F_CHSet(M_x,M_y,true,true);M_x+=120;
	F_CHSetMOBD(["A3"],[],["A2"],["A3","A2a1"]);
	F_Make1("A3","HA3t","HA3d");F_CHSet(M_x,M_y,true,true);M_x+=120;
	F_CHSetMOBD(["A4"],[],["A3"],["A4","A3a1"]);
	F_Make1("A4","HA4t","HA4d");F_CHSet(M_x,M_y,true,true);M_x+=120;
	F_CHSetMOBD([],[],["A4"],["A4a1"]);


# Creamos la Basica para Agilidad 2 Esconderse
func F_MAKE_A2a(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("A2a1","HA2a1t","HA2a1d");F_CHSet(M_x,M_y,true,true);#M_x+=120;
	F_CHSetMOBD(["A2a2"],["A2a1"],["A2a1"],[]);
	F_Make1("A2a2","HA2a2t","HA2a2d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["A2a3"],["A2a2"],["A2a2"],[]);
	F_Make1("A2a3","HA2a3t","HA2a3d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["A2a4"],["A2a3"],["A2a3"],[]);
	F_Make1("A2a4","HA2a4t","HA2a4d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD([],[],["A2a4"],[]);


# Creamos la Basica para Agilidad 3 Sigilo
func F_MAKE_A3a(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("A3a1","HA3a1t","HA3a1d");F_CHSet(M_x,M_y,true,true);#M_x+=120;
	F_CHSetMOBD(["A3a2"],["A3a1"],["A3a1"],[]);
	F_Make1("A3a2","HA3a2t","HA3a2d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["A3a3"],["A3a2"],["A3a2"],[]);
	F_Make1("A3a3","HA3a3t","HA3a3d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["A3a4"],["A3a3"],["A3a3"],[]);
	F_Make1("A3a4","HA3a4t","HA3a4d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD([],[],["A3a4"],[]);


# Creamos la Basica para Agilidad 4 Asesinato
func F_MAKE_A4a(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("A4a1","HA4a1t","HA4a1d");F_CHSet(M_x,M_y,true,true);#M_x+=120;
	F_CHSetMOBD(["A4a2"],["A4a1"],["A4a1"],[]);
	F_Make1("A4a2","HA4a2t","HA4a2d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["A4a3"],["A4a2"],["A4a2"],[]);
	F_Make1("A4a3","HA4a3t","HA4a3d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["A4a4"],["A4a3"],["A4a3"],[]);
	F_Make1("A4a4","HA4a4t","HA4a4d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD([],[],["A4a4"],[]);










# Creamos la Basica para Defensa
func F_MAKE_D1(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("D1","HD1t","HD1d");F_CHSet(M_x,M_y,false,true);M_x+=120;
	F_CHSetMOBD(["D2"],[],["D1"],["D2"]);
	F_Make1("D2","HD2t","HD2d");F_CHSet(M_x,M_y,true,true);M_x+=120;
	F_CHSetMOBD(["D3"],[],["D2"],["D3","D2a1"]);
	F_Make1("D3","HD3t","HD3d");F_CHSet(M_x,M_y,true,true);M_x+=120;
	F_CHSetMOBD(["D4"],[],["D3"],["D4","D3a1"]);
	F_Make1("D4","HD4t","HD4d");F_CHSet(M_x,M_y,true,true);M_x+=120;
	F_CHSetMOBD([],[],["D4"],["D4a1"]);


# Creamos la Basica para Defensa 2 Ligeras
func F_MAKE_D2a(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("D2a1","HD2a1t","HD2a1d");F_CHSet(M_x,M_y,true,true);#M_x+=120;
	F_CHSetMOBD(["D2a2"],["D2a1"],["D2a1"],[]);
	F_Make1("D2a2","HD2a2t","HD2a2d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["D2a3"],["D2a2"],["D2a2"],[]);
	F_Make1("D2a3","HD2a3t","HD2a3d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD([],[],["D2a3"],[]);


# Creamos la Basica para Defensa 3 Pesadas
func F_MAKE_D3a(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("D3a1","HD3a1t","HD3a1d");F_CHSet(M_x,M_y,true,true);#M_x+=120;
	F_CHSetMOBD(["D3a2"],["D3a1"],["D3a1"],[]);
	F_Make1("D3a2","HD3a2t","HD3a2d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["D3a3"],["D3a2"],["D3a2"],[]);
	F_Make1("D3a3","HD3a3t","HD3a3d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD([],[],["D3a3"],[]);


# Creamos la Basica para Defensa 4 Energeticas
func F_MAKE_D4a(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("D4a1","HD4a1t","HD4a1d");F_CHSet(M_x,M_y,true,true);#M_x+=120;
	F_CHSetMOBD(["D4a2"],["D4a1"],["D4a1"],[]);
	F_Make1("D4a2","HD4a2t","HD4a2d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["D4a3"],["D4a2"],["D4a2"],[]);
	F_Make1("D4a3","HD4a3t","HD4a3d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD([],[],["D4a3"],[]);












# Creamos la Basica para Fuerza
func F_MAKE_F1(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("F1","HF1t","HF1d");F_CHSet(M_x,M_y,false,true);M_x+=120;
	F_CHSetMOBD(["F2"],[],["F1"],["F2"]);
	F_Make1("F2","HF2t","HF2d");F_CHSet(M_x,M_y,true,true);M_x+=120;
	F_CHSetMOBD(["F3"],[],["F2"],["F3","F2a1"]);
	F_Make1("F3","HF3t","HF3d");F_CHSet(M_x,M_y,true,true);M_x+=120;
	F_CHSetMOBD(["F4"],[],["F3"],["F4","F3a1"]);
	F_Make1("F4","HF4t","HF4d");F_CHSet(M_x,M_y,true,true);M_x+=120;
	F_CHSetMOBD([],[],["F4"],["F4a1"]);


# Creamos la Basica para Fuerza a Puñales
func F_MAKE_F2a(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("F2a1","HF2a1t","HF2a1d");F_CHSet(M_x,M_y,true,true);#M_x+=120;
	F_CHSetMOBD(["F2a2"],["F2a1"],["F2a1"],[]);
	F_Make1("F2a2","HF2a2t","HF2a2d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["F2a3"],["F2a2"],["F2a2"],[]);
	F_Make1("F2a3","HF2a3t","HF2a3d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["F2a4"],["F2a3"],["F2a3"],[]);
	F_Make1("F2a4","HF2a4t","HF2a4d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD([],[],["F2a4"],[]);


# Creamos la Basica para Fuerza 3 Espadas
func F_MAKE_F3a(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("F3a1","HF3a1t","HF3a1d");F_CHSet(M_x,M_y,true,true);#M_x+=120;
	F_CHSetMOBD(["F3a2"],["F3a1"],["F3a1"],[]);
	F_Make1("F3a2","HF3a2t","HF3a2d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["F3a3"],["F3a2"],["F3a2"],[]);
	F_Make1("F3a3","HF3a3t","HF3a3d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["F3a4"],["F3a3"],["F3a3"],[]);
	F_Make1("F3a4","HF3a4t","HF3a4d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD([],[],["F3a4"],[]);


# Creamos la Basica para Fuerza 4 Latigos
func F_MAKE_F4a(M_ClsHs:Cls_Habilidades,M_x:int,M_y:int):
	V_ClsHs=M_ClsHs;
	F_Make1("F4a1","HF4a1t","HF4a1d");F_CHSet(M_x,M_y,true,true);#M_x+=120;
	F_CHSetMOBD(["F4a2"],["F4a1"],["F4a1"],[]);
	F_Make1("F4a2","HF4a2t","HF4a2d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["F4a3"],["F4a2"],["F4a2"],[]);
	F_Make1("F4a3","HF4a3t","HF4a3d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD(["F4a4"],["F4a3"],["F4a3"],[]);
	F_Make1("F4a4","HF4a4t","HF4a4d");F_CHSet(M_x,M_y,false,false);#M_x+=120;
	F_CHSetMOBD([],[],["F4a4"],[]);
