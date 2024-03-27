extends Node
class_name  Cls_Habilidades_Db;

# - - - Cls_Habilidades_Db - - -
# Esta clase Genera un arbol de habilidades del juego.
# Se instancia, Configura la CaseHabilidades y se libera.
#

# Variables para uso interno para acceso rapido.
var V_ClsHs:Cls_Habilidades;
var V_ClsH:Cls_Habilidad;#ClsHabilidad
var V_ClsHp:Cls_Habilidad;#Cls Habilidad Padre

# - - Creamos una Habilidad, 
# OJO, Toma datos del V_ClsHp para saber el padre del que cuelga.
func F_Make1(M_Id:String,M_Nom:String,M_Des:String)->Cls_Habilidad:
	V_ClsH=V_ClsHs.F_BuscaId(M_Id);
	if(V_ClsH!=null):
		V_ClsH.V_Nom=M_Nom;
		V_ClsH.V_Desc="";
		# Si NO tengo padre =(NodoRaiz) Def(activos,visibles)
		if(V_ClsH.V_Padre_ID!=null):
			V_ClsH.V_Padre_ID=V_ClsHp.V_ID;
			V_ClsH.V_Activo=false;
			V_ClsH.V_Visible_Actual=false;
			V_ClsH.V_Visible_Inicial=false;
			V_ClsH.V_Bloqueado_Inicial=true;
			V_ClsH.V_Bloqueado_Actual=true;
		else:# Si no tengo padre (=null)
			V_ClsH.V_Padre_IDssss="";
			V_ClsH.V_Activo=false;
			V_ClsH.V_Visible_Actual=true;
			V_ClsH.V_Visible_Inicial=true;
			V_ClsH.V_Bloqueado_Inicial=false;
			V_ClsH.V_Bloqueado_Actual=false;
		#END If Sin Padre

	#END IF No Null
	return V_ClsH
#END F_ADD


# - - Esta funcion crea el arbol de habilidades en su configuracion basica.
func F_MAKE(M_ClsHs:Cls_Habilidades):
	V_ClsHs=M_ClsHs;
	pass
