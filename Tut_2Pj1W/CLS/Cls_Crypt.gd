extends Node
class_name  Cls_Crypt
#Esta clase solo Cifra y Descifra cadenas de texto segun una cadena.

var CLog:Cls_LogLine=Cls_LogLine.new("ClsCrypt");

var V_TK:Array;
var V_KEY:String;

func F_Cifra(MStr:String)->String:
	var M_Res:String="";	
	var M_PosText:int=0;
	var M_PosKey:int=0;
	var M_Row:int;
	var M_PosCh:int;
	var M_Ch:String;
	var M_Str:String=MStr;
	# Remplazo las " por un codigo de control no usado.
	M_Str=M_Str.replace("\"","|");
	# Ahora recorro la cadena de entrada
	for M_q in M_Str.length():
		# Saco la ROW de la pos de la KEY en la primera cadena.
		M_Row=str(V_TK[0]).find(str(V_KEY[M_PosKey]));
		#Avanzo la pos de la KEY#Si llego al final de la key retorno a 0
		M_PosKey+=1;if(M_PosKey>=V_KEY.length()):M_PosKey=0;
		# Reduzco M_Row hasta que apunte a una ROW Valida
		while M_Row>V_TK.size():
			M_Row-=V_TK.size();
		#Busco la pos de mi Char en la 1ª Cadena
		M_Ch=str(M_Str[M_PosText]);
		M_PosCh=str(V_TK[0]).find(M_Ch);
		if(M_PosCh==-1):
			print("ERRROROROROR (Cyfra.Character no encontrado)");
		#Avanzo al siguiente Char a Codificar
		M_PosText+=1;
		#Añado a la salida La PosdelChar en 0 pero de la RowSell
		if(M_PosCh>=str(V_TK[M_Row]).length()):
			print("ERRROROROROR (Cyfra.Cadena encontrada muy corta)");
		M_Ch=str(str(V_TK[M_Row])[M_PosCh]);
		M_Res+=str(M_Ch);
	#END For Keys
	return M_Res;
	
	
	
	
	
	
	
	
	
	
	
	
	
func F_DesCifra(MStr:String)->String:
	var M_Res:String="";
	var M_PosText:int=0;
	var M_PosKey:int=0;
	var M_Row:int;
	var M_PosCh:int;
	var M_Ch:String;
	var M_Str:String=MStr;
	# Ahora recorro la cadena de entrada
	for M_q in M_Str.length():
		# Saco la ROW de la pos de la KEY en la primera cadena.
		M_Row=str(V_TK[0]).find(str(V_KEY[M_PosKey]));
		#Avanzo la pos de la KEY#Si llego al final de la key retorno a 0
		M_PosKey+=1;if(M_PosKey>=V_KEY.length()):M_PosKey=0;
		# Reduzco M_Row hasta que apunte a una ROW Valida
		while M_Row>V_TK.size():
			M_Row-=V_TK.size();
		#Busco la pos de mi Char en la X Row
		M_Ch=str(M_Str[M_PosText]);
		M_PosCh=str(V_TK[M_Row]).find(M_Ch);
		if(M_PosCh==-1):
			print("ERRROROROROR (DesCyfra.Character no encontrado)");
		#Avanzo al siguiente Char a Codificar
		M_PosText+=1;
		#Añado a la salida La PosdelChar pero de la Row0
		if(M_PosCh>=str(V_TK[0]).length()):
			print("ERRROROROROR (DesCyfra.Cadena encontrada muy corta)");
		M_Ch=str(str(V_TK[0])[M_PosCh]);
		M_Res+=str(M_Ch);
	#END For Keys
	# Remplazo el codigo de control no usado por las ".
	M_Res=M_Res.replace("|","\"");
	return M_Res;
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
func _init():
	V_KEY="Achilipu";
	V_TK.append("5}P%]$4lyvTXQSVcYC7xo+wzA&·3;Z|6:M BE0WqtiUDI@hRmerg.(,L8Os)H{Fud!fK-aÑ1GñNjk*2#9pnb[_J");
	V_TK.append("Y6AK;[&E)zn0W5NBjIDñlem·*wbv|FfR_9P}u3 L7.-TXr:h]it@,Cc8!SHÑapUGqs2JQ(ygO+k14VZxMo$d%#{");
	V_TK.append("8.&Cg}KhÑ@J]AxPYsoNqEXI*FD%ZV;+jT2#ew_nOuHW-v$m3|R9[idk{p)(·cL,U !4zb76yrBG:0MSlatQf1ñ5");
	V_TK.append("N(elkM}gZQr]|{ID7_x&.3 :aO+-VdztRYbUyp),n[5*8jWiñÑ#THhA0$!BPoLvC2wSsq;fJE6cF·mK%91u@XG4");
	V_TK.append("N!lX3EmqGMs)LH[|Cp v$t&iKSF.,PA8QJy@%5c:4OU;jhÑwTu76zI*BgrfV9Y1nRoñ{0ZDkbx·]2-W}a(+e#d_");
	V_TK.append(":*9DdBk21Ay!mCpJc3|W·U&QxMf-( I6ljuS[@g}Xh$LZzvPHt;a{On0N%K,+GwesYTr_#7F.5]ñiq)8VE4ÑboR");
	V_TK.append("cSs@_D0C*YUFQ;rdñHiB|[4(1P&fnoyp.}GMv{+T6A·L-xjW$ KRetk%5h,8J2Zub#XÑO)!mq9zE]l:I3gaNwV7");
	V_TK.append("[Og#S(24CefcM0oL:HYpi7l|mv]dq;sBR@!*XrW8ñ&uEw.U-%1GAQPZKN$+TkjÑ{xbJtV} 65n_9,z)aF·h3yDI");
	V_TK.append("V3$5#a{YBusQK]U(g,ñTH*lN&ZM|:Epjm9-DOo1 )_4z2;r@6SCLfIq!bRw}kÑ·XnJGtc0Fh%y8eid[WPv7.Ax+");
	V_TK.append("Wk1Aop_ExmdGsc,YQV&ñ+3ÑZ-{]!%|Ha5NbX;2li.$vfw8BCj@#IPrKD6TeM74·StO0}RJ*z()9qgUun:[ FLhy");
	V_TK.append("S_1!-3])vu[$ob4DmX5{}@2Qk TNY|Cz0WIAEHÑd9;tfRa#i:l%hK7MBZOnñrj6sx*Gpgc&+VF·JUyw.(,e8PqL");
	V_TK.append("p6o;ScFIrnW-9 8,xUl_.qkT:3!XH|7uJV$YN2Ov0@#B*ZAh5RPC&ym%+ÑQ·sg4}(]Kj{DfMdwz[Gie)1LEatñb");
	V_TK.append("+1d6tK*#rqeP3M48CYbamuHFX7! o5I|ic0L.WsDp&V@y2_J$zS}9ZgBkvTj,Ñ(Q:n·{AE)hñR-xN%lfw[O]G;U");
	V_TK.append("70k;PoeaBs(·O5G4hiw LFy.+CE-U_XRt8|93I#A}&m@df)SÑ2gñVprzxMq:NlnJKY6jv*b%[Z]u$HQ1T,!D{Wc");
	V_TK.append("Utmhx:ogs lñ4e%b[&·Fk79Q5y8.uq2J!P|H1vN3Ñ*](w,Xn;+DfELOZj{M0@Ki$-pScVRB#dC6Gz_AWTI)}arY");
	V_TK.append("QmPCYld$3r0LuG6B5}%D|w&@_jv(!cf74EI[R,{t#n.s:ñM*9zNT+k;AagWoxqXVO8FKeZiÑ]S·h1JHbp2-U y)");
	V_TK.append("vTnF*U,G-:g0YRñJ)BQfc}·$hs!Cd+iNW|x.ALoI7m6aHSpj15Zq4Mk2#X9%t _&;wPu8Or@b{l]ye[z(EKÑD3V");
	V_TK.append("NM%@4KR(cu&y{XUOe|Z)Ltm;r JsA.[6pqb7jfW#ñC!TFGainP·}2kY08SQ5x1I:v-VDw3_]BodH$Ñ*lE,g+h9z");
	V_TK.append("zI1$C-Kmf3!·%JR*0 2uMl|na5NsBZ#U]tTpQAyWb{oP9iLEjx.8vHSFV7eÑ:hOY(rXq&)D+dc4;[k,@wGg6}ñ_");
	V_TK.append("Vnitu+KU_ÑXab,NRW[!HQ&·J9 myF|r7cI.Aw:o)xMGñT028d{5%eY6#lpZ]SvsEhq*Og;3P(@j-Cf$kD1B4z}L");
	V_TK.append("ZHAWwMnj8*S%uzN9}#cy-BI!_[5&E$@TJO|gt(,7VF:xaD.i{0p4hvUkY+Gd1er ]C·qfPm);6Ll3Ro2sQñbÑXK");
	V_TK.append("GKZB Inwb{f:,u]07LH}xA[m&Q54U_·rkO2zMC9-eq.T|XjÑ)@%l8$yREW#SNg3cñ!6h1;PstaJiDVvYoF+*pd(");
	V_TK.append("d7CXe.4r$vq[kBñIzhJHuU|a1VED_(N%O;YSw:,M@jyb}ÑPWnlF+TQ6ARptGm!{&8-o* #·c5gZ9])siK02f3Lx");
	V_TK.append("*5vrdWK!GF4EMjcsX2;:8%A#i|6p(qL+.ISVk{N[Ol3exgZ_bJ10YC&tR7}Ñz$ah·D9@]P-oQyufB mUH)Tw,nñ");
	V_TK.append(".xZOG(@XPU!5AHYÑM74}%)VfS2v[g:EpNB,*Q8#1C$a{FDce_zlT|nrWLm+·kbR-h qu;KjIs&]90tñidwo6y3J");
	V_TK.append("h!fñ;YkZibVL[Xd%jCB*U43$rK+n91(mt6MÑ&5NvE-aRgJ:I{]y8c)w0Tu·7S|As#p_qGHOD2,l@ QeWoP.z}Fx");
	V_TK.append("!0fAY7se.Ñ@3WCEn$gi5yV%JP#zlI Ok,TvMbQ};USNu·(|c-Gw8xFpm6+a[tHKd4*r)Bo_R1qñjhLZX9&{2]:D");
	V_TK.append("HOc·nF3qgyÑ9}+C-&[04NswJ_{iAlPKteGU7|x6@b#Xmd.aY)BWDjrQ%pvTL128EZo5f,; VM!ñ*]IhSz$(Rku:");
	V_TK.append("-EbKn*!ITgkñFLH|;o#2X5O&c{RCM},mza%1Ñvl8tB]Vs3$y7h9(G4uQ)YAZ ·:Ue@[NWp+fDJSi_.jxPwq6dr0");
	V_TK.append("(}0a[Cw7h5·8{e:NO;PK]URmfJQLlu|s#ñg+ÑI4z2ME!B-Vdq@$G%nHjtyZ.3&iY)SW ok6ApXv*9bFxT_1Drc,");
	V_TK.append("MPuo#ykB1W8;z[ñHe}*&$v3bNqI2QTFKl@gG6 RÑ|fnZ0E,JYL_w(U.pstVhS4-{iO7m)jrdC]!xacA59%+:X·D");
	V_TK.append("n}uML!]2*)xNWyT$gGRFz&.:[jb7@w9J8UVhÑpqv%a(CZ{0;5·cQBA|os-ñXtlH3YEidDe#1,kmPO+6rIf _4KS");
	V_TK.append("T2Z,)f*t;$NqdgPl.E]uRjX8x9B{JVÑ0%&cbk!We1Diñz@o5+a(#vLw[SpOFYGm3y }sA-CH|7n:MI_K4Uh·6Qr");
	V_TK.append("NIq275F}@Hñ8Z :;[-·%l3,URQ$YzÑJVwua+Brejo0!P)DOs.f9{Md4hKWin(1G|6*TCvA_&bmkXyxtcLEgpS#]");
	V_TK.append("}%@BH1CK+Sa9 7(RV.hXTkr2#ntm3xui$·GgqvE|),pc{&_OU:-[YLZejPQÑyFwld4;Ab5f6z!oM8*s0]IJWñND");
	V_TK.append("rfJAMÑ)3NohlT{2KpFz4CPb|6G#i7k.LW@QvngY&9:s%(ed5,8my1tE[aHq*c_RUVjOxD X-Zu+}$w]I;B0·!Sñ");
	V_TK.append("2CetPo[Yj$U5-|Gn7{9qN hwu#sXV;Z_3)Iñ6l}QH,WKrzBÑ:agd8yL·Rk](xJmfE*1!%i&F+bTOASD@4pvM0.c");
	V_TK.append("kg}:qTPyzUQu9b;oEOi,X-NV7#I&%eR$w|ñ2H3pm4*l[. +JA{0Kdx!vjMtÑ(Fc)SBh·W58]n16@rDL_fZCsaGY");
	V_TK.append(":9.Rc03y[dqApu+LYr#B$7t1*OjbMG!5,N}ZUk]lCo-T4J()8; ·nKHPÑWV|Qefñ6i&Ehzw_%vS@I2a{xXmgDsF");
	V_TK.append("T 3wu5$f98dq7+Pj&1iH*yJWrhUñkt:cg_[L,Q2bsvozB@N#MF4Kx·)nIXAGaS.Ñ{!E}RC|pmDO0lV%e]Z(6Y;-");
	V_TK.append("QemCoJP]x[4O;y:gWj·}.M{zZncN+9H)X(I&bd1RfGhsvk3TÑA2q685Dp_0|*7B-$u#!EaFK,triw%VL@ñSl UY");
	V_TK.append("b.n)_a}E#O{P6p2L!sD4W,Xg+1R|dI@M;ñ]fv0Z9&GrtBk7z8VoÑy3SQhwF[KJl·%A:u$NCcq5Umx Y*T-iHj(e");
	V_TK.append("ÑQL&K6z+C[81l#V_sq7{9|ZbHNJR;YpTurf3a*W]FEo,d·cIn)yñvD.w}(AxBk05itPOMS@:e$2%XhGU- 4gmj!");
	V_TK.append("iyq){LZM.tBEwfT5&AoDr9a7j1X0JxI-S·#zgCdN}*[$|V,2W!k;F%H 3b]eR_sKhnP(vupU84cOñ+mYl@G:Q6Ñ");
	V_TK.append("Ef·jy3&W].:KwY5uTsrFp_8@1[i2vLR-( BPñCQg%*tcbmd,U#o;H9}MxA67|NIqznDVXZhGSkÑa$el)O0{4+!J");
	V_TK.append("A)+cB]#J}Ij_2apevzqlhPV!Zf:@NK3*·Ñ7d.6HU&,sD;W9b$5[8Y4(ymECr%x{tX 1gkLS|wiOñRoM-FnTGuQ0");
	V_TK.append("·VkyN53_KCZSfG9BJo{(bt!$XrgFnMvE@-}e2AiÑc,.Lh] 6:añWx87mY4d1TzpDsRUwPqlIO[#0)*|ujQ;H%+&");
	V_TK.append("pDA,!m79]wQ$&+t0)(ng;8*26[eO4@lMqGTa5}FUoZrui1-%jcIXCdhyEPJK|·f:{BHÑxvR._sV3 NYSL#ñkWzb");
	V_TK.append("y#Z D$Js)GVP(9Cr0lp+ñ*A{hK6T7kaq|bgi}zRjfe.c!EQYum,3OHLv5[w;@B_&W84-XUN:oFM1x2I]S%d·tnÑ");
	V_TK.append("4qgÑEn:&yxvQ·JOVM[*YB7$U)|dF;TNWe{9},]z8a!A-KDRSuL IkXmf+6bñ3oCwrphlcij15G%sH_#Z(t0@P2.");
	V_TK.append("4X{NC·Gr!6Bl8:h]$g_o}YcñxW7JP2vujT1&(,pdfD|RtI#MiSe;ysKn @Vw0Ñ*ZQFk+mO5A-[bE)H%q.La93zU");
	V_TK.append("RB)[fk%j]añ(}Lpdy{SV·D84etI$FXC3Er@16zgM_29ciqxoZ0Ñ5WU|vNQHm: +huT;-PK.7*bGnYOsl,!wJ#A&");
	V_TK.append("eñ%08#Inaro1 t5!$CXLD,hZMj427fJ-iSHVs;(K&k3lGN:gb_+FmdvuBp6UÑw}·c9QOqY|x@TPz[R*EA]y).W{");
	V_TK.append("djo*uDA(KHR40_8W·wQGN3lñÑx{9av][fgk; +71emn$cIUhbP&V#@C5!B}.OTqrSZXis-,:%pyzF|2EJMtYL)6");
	V_TK.append(" cQxUu]KRVnb3s5,}4+*P81E-q;0Hh{flNGgzw9S·rZA|F(yYMXkLI%7v#Ñ$62CB[eJ:mjaWd@)Dtñ&!O.op_iT");
	V_TK.append("nañ}YsZ43g7RWV#vj-P F|{5Ht·]_m6TG@:bzu.*kcQdi8f[0,U!wCJ;rySNO2hI+DqMe)B(o%1&xÑEXAKL$l9p");
	var M_P:int=0;
	#var M_T:Array;
	#var M_L:String="";
	#M_T.append(V_TK[0]);
	for M_q in V_TK.size():
		if(str(V_TK[M_P]).length()!=str(V_TK[0]).length()):
			print(M_P);
			#M_L+="V_TK.append(\""+str(V_TK[M_P])+"\");\r\n";
		M_P+=1;
	#M_L="";
# END _Init()



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
