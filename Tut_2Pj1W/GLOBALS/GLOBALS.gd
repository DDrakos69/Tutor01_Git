extends Node

var V_Player:CharacterBody3D;#Node;
var V_PlayerCamPoint:Node3D;

var V_CamFront:Camera3D;
var V_CamBack:Camera3D;

func F_PlayerSet(Player_Node):
	V_Player=Player_Node;
	
func F_PlayerCamPointSet(PlayerCam_N3D):
	V_PlayerCamPoint=PlayerCam_N3D;
