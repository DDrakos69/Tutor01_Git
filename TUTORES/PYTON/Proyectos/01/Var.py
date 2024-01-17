#Definimos la funcion con dos parametros 
#solo el 1º oblicatorio
def F_Txt(Dat1,Dat2=""):
    M_Res="";M_Res1="Final";
    if(Dat2==""):
        M_Res=Dat1+" sin Dato";
    else:
        M_Res=Dat1+" "+Dat2;
    return M_Res,M_Res1;
#Creamos dos variables
V_Res1="";V_Res2="";
#Rescatamos de la funcion los dos parametros.
V_Res1,V_Res2 = F_Txt("Antonio");
#Imprimimos el resultado con texto formateado.
print(f"valor 1 ={V_Res1}  Valor 2 ={V_Res2}");
#Rescatamos la funcion pero esta vez con 2 parametros.
V_Res1,V_Res2 = F_Txt("Antonio","Jesus");
#Imprimimos el resultado con texto formateado.
print(f"valor 1 ={V_Res1}  Valor 2 ={V_Res2}");