# Used for storing character positions for Crystallize Time sequence

extends Node

class_name CTPos

# Multipliers
const N := Vector2(1, 0)
const S := Vector2(-1, 0)
const E := Vector2(0, 1)
const W := Vector2(0, -1)
const NE := Vector2(1, 1)
const NW := Vector2(1, -1)
const SE := Vector2(-1, 1)
const SW := Vector2(-1, -1)

const FIRST_HG_DODGE :=  Vector2(36.3, 28.4)
const INTER_STACK := Vector2(30.8, 30.8)
const AERO_TARGET := Vector2(35.9, 20.3)
const AERO_SOURCE := Vector2(39.6, 22.8)
const EARLY_SOAK := Vector2(24.2, 16.77)
const NS_EXA_DODGE := Vector2(38.9, 4.0)

# Rewind positions
const G1_TANK_NE := Vector2(28.3, 18.9)
const G1_PARTY_NE := Vector2(23.4, 16.8)
const G2_TANK_NE := Vector2(18.9, 28.3)
const G2_PARTY_NE := Vector2(16.8, 23.4)

const G1_TANK_NW := Vector2(18.9, -28.3)
const G1_PARTY_NW := Vector2(16.8, -23.4)
const G2_TANK_NW := Vector2(28.3, -18.9)
const G2_PARTY_NW := Vector2(23.4, -16.8)

const G1_TANK_SE := Vector2(-18.9, 28.3)
const G1_PARTY_SE := Vector2(-16.8, 23.4)
const G2_TANK_SE := Vector2(-28.3, 18.9)
const G2_PARTY_SE := Vector2(-23.4, 16.8)

const G1_TANK_SW := Vector2(-28.3, -18.9)
const G1_PARTY_SW := Vector2(-23.4, -16.8)
const G2_TANK_SW := Vector2(-18.9, -28.3)
const G2_PARTY_SW := Vector2(-16.8, -23.4)

#const SE_ROTATION := deg_to_rad(90.0)
#const SW_ROTATION := deg_to_rad(180.0)
#const NW_ROTATION := deg_to_rad(270.0)

# Jump spread positions
const T1_SPREAD_NE := Vector2(36.8, 25.9)
const T2_SPREAD_NE := Vector2(20, 40)
const H1_SPREAD_NE := Vector2(24.0, 14.0)
const H2_SPREAD_NE := Vector2(5.8, 28.4)
const M1_SPREAD_NE := Vector2(13, -3)
const M2_SPREAD_NE := Vector2(-3, 13)
const R1_SPREAD_NE := Vector2(20, -19)
const R2_SPREAD_NE := Vector2(-19, 20)

const T1_SPREAD_NW := Vector2(20, -40)
const T2_SPREAD_NW := Vector2(36.8, -25.9)
const H1_SPREAD_NW := Vector2(5.8, -28.4)
const H2_SPREAD_NW := Vector2(24.0, -14.0)
const M1_SPREAD_NW := Vector2(-3, -13)
const M2_SPREAD_NW := Vector2(13, 3)
const R1_SPREAD_NW := Vector2(-19, -20)
const R2_SPREAD_NW := Vector2(20, 19)

# Akh Morn
const AM_STACK_LEFT := Vector2(8, 0)
const AM_STACK_RIGHT := Vector2(-8, 0)

# 'Random' spread values so bots aren't stacked
const RS1 := Vector2(0.3, 0.2)
const RS2 := Vector2(0.15, -0.28)
const RS3 := Vector2(-0.2, 0.1)

# NW Tether first move
const PRE_HG_1_NW := {
	"r_aero_sw": FIRST_HG_DODGE * SW, "r_aero_se": FIRST_HG_DODGE * SE,
	"r_ice_w": Vector2(0, -30), "r_ice_e": Vector2(0, 30),
	"b_erupt": FIRST_HG_DODGE * NW, "b_ice": FIRST_HG_DODGE * SE + RS1,
	"b_ud": FIRST_HG_DODGE * SE + RS2, "b_water": FIRST_HG_DODGE * SE + RS3
}
# NE Tether first move
const PRE_HG_1_NE := {
	"r_aero_sw": FIRST_HG_DODGE * SW, "r_aero_se": FIRST_HG_DODGE * SE,
	"r_ice_w": Vector2(0, -30), "r_ice_e": Vector2(0, 30),
	"b_erupt": FIRST_HG_DODGE * NE, "b_ice": FIRST_HG_DODGE * SW + RS1,
	"b_ud": FIRST_HG_DODGE * SW + RS2, "b_water": FIRST_HG_DODGE * SW + RS3
}


# Aero's and blues move into hg
const POST_HG_1_NW := {
	"r_aero_sw": AERO_SOURCE * SW, "r_aero_se": AERO_SOURCE * SE,
	"b_ice": AERO_TARGET * SE + RS1, "b_ud": AERO_TARGET * SE + RS2, "b_water": AERO_TARGET * SE + RS3
}
const POST_HG_1_NE := {
	"r_aero_sw": AERO_SOURCE * SW, "r_aero_se": AERO_SOURCE * SE,
	"b_ice": AERO_TARGET * SW + RS1, "b_ud": AERO_TARGET * SW + RS2, "b_water": AERO_TARGET * SW + RS3
}

# E/W Reds step out to avoid soaking their own puddles.
const PUDDLE_DODGE := {
	"r_ice_w": Vector2(4, -36), "r_ice_e": Vector2(4, 36),
}

# Blues and close Blizzard stack north, Aero's and other Blizzard dodge second HG
const POST_KB_NW := {
	"r_aero_sw": Vector2(-42.71, -16.77), "r_aero_se": Vector2(-42.71, 16.77),
	"r_ice_w": INTER_STACK * NW, "r_ice_e": Vector2(-7.5, 45.3),
	"b_erupt": INTER_STACK * NW + RS1, "b_ice": INTER_STACK * NW + RS2,
	"b_ud": INTER_STACK * NW + RS3, "b_water": INTER_STACK * NW - RS1
}
const POST_KB_NE := {
	"r_aero_sw": Vector2(-42.71, -16.77), "r_aero_se": Vector2(-42.71, 16.77),
	"r_ice_w": Vector2(-7.5, -45.3), "r_ice_e": INTER_STACK * NE,
	"b_erupt": INTER_STACK * NE + RS1, "b_ice": INTER_STACK * NE + RS2,
	"b_ud": INTER_STACK * NE + RS3, "b_water": INTER_STACK * NE - RS1
}


# Ice joins rest north, Aero's move to early soaks (move north to avoid puddles) 
const POST_HG_2_NW := {
	"r_aero_sw": EARLY_SOAK * SW, "r_aero_se": EARLY_SOAK * SE,
	"r_ice_e": INTER_STACK * NE
}
# West exaflares
const POST_HG_2_NE := {
	"r_aero_sw": EARLY_SOAK * SW, "r_aero_se": EARLY_SOAK * SE,
	"r_ice_w": INTER_STACK * NW
}


# Give a little more time for North people to group, the move them middle
# Far soakers cheat towards HG3 (assume it's the active one)
# East exaflares
const POST_UD_E := {
	"r_ice_w": NS_EXA_DODGE * NW, "r_ice_e": NS_EXA_DODGE * NW + RS1,
	"b_erupt": Vector2(43, -15.1), "b_ice": Vector2(43, -15.1),
	"b_ud": NS_EXA_DODGE * NW + RS2, "b_water": NS_EXA_DODGE * NW + RS3
}
const POST_UD_W := {
	"r_ice_w": NS_EXA_DODGE * NE, "r_ice_e": NS_EXA_DODGE * NE + RS1,
	"b_erupt": NS_EXA_DODGE * NE + RS2, "b_ice": NS_EXA_DODGE * NE + RS3,
	"b_ud": Vector2(43, 15.1), "b_water": Vector2(43, 15.1)
}

# Aero's dodge 3rd HG and Exas right after they soak.
const POST_EARLY_SOAK_E := {
	"r_aero_sw": NS_EXA_DODGE * SW, "r_aero_se": NS_EXA_DODGE * SW + RS1
}
const POST_EARLY_SOAK_W := {
	"r_aero_sw": NS_EXA_DODGE * SE, "r_aero_se": NS_EXA_DODGE * SE + RS1
}


# There's a small window where the far soaks can get a head start.
# Need to make sure south soak doesn't grab E/W puddle.
# Might need to move this further out.
const POST_HG_3_E := {
	"b_erupt": "r_ice_w", "b_ice": Vector2(-10, -29.6)
}
const POST_HG_3_W := {
	"b_ud": "r_ice_e", "b_water": Vector2(-10, 29.6)
}


# Setup for Soaks and NW dodges.
# Safeside soaks can go now, other 2 setup mid.
const POST_EXA_2_E := {
	"r_aero_sw": Vector2(0, 20), "r_aero_se": Vector2(0, 20) + RS1,
	"r_ice_w": Vector2(0, 20) + RS2, "r_ice_e": Vector2(0, 20) + RS3,
	"b_ud": "r_ice_e", "b_water": "r_aero_se"
}
const POST_EXA_2_W := {
	"r_aero_sw": Vector2(0, -20), "r_aero_se": Vector2(0, -20) + RS1,
	"r_ice_w": Vector2(0, -20) + RS2, "r_ice_e": Vector2(0, -20) + RS3,
	"b_erupt": "r_ice_w", "b_ice": "r_aero_sw"
}


const POST_EXA_3_REF := [POST_EXA_3_NW, POST_EXA_3_NE, POST_EXA_3_SE, POST_EXA_3_SW]
# We now know NS Exa, so need to adjust for that.
# Adjust previous movements for NS exa. Far dodges follow EW Exa.
# Aero's wait for second NS wave if North.
# If E/W soak is not there in time, move this movement to post soak.
const POST_EXA_3_NE := {
	"r_aero_sw": Vector2(21.5, 12), "r_aero_se": Vector2(21.5, 12) + RS1,
	"r_ice_w": Vector2(21.5, 12) + RS2, "r_ice_e": Vector2(21.5, 12) + RS3,
	"b_erupt": Vector2(22.3, -11.4), "b_ice": "r_aero_sw",
	#"b_ud": Vector2(22.3, 17.4)
}
const POST_EXA_3_NW := {
	"r_aero_sw": Vector2(21.5, -12), "r_aero_se": Vector2(21.5, -12) + RS1,
	"r_ice_w": Vector2(21.5, -12) + RS2, "r_ice_e": Vector2(21.5, -12) + RS3,
	#"b_erupt": Vector2(22.3, -17.4),
	"b_ud": Vector2(22.3, 11.4), "b_water": "r_aero_se"
}
const POST_EXA_3_SE := {
	"r_aero_sw": Vector2(-21.5, 12), "r_aero_se": Vector2(-21.5, 12) + RS1,
	"r_ice_w": Vector2(-21.5, 12) + RS2, "r_ice_e": Vector2(-21.5, 12) + RS3,
	"b_erupt": Vector2(-22.3, -11.4), "b_ice": "r_aero_sw",
	#"b_ud": Vector2(-22.3, 11.4)
}
const POST_EXA_3_SW := {
	"r_aero_sw": Vector2(-21.5, -12), "r_aero_se": Vector2(-21.5, -12) + RS1,
	"r_ice_w": Vector2(-21.5, -12) + RS2, "r_ice_e": Vector2(-21.5, -12) + RS3,
	#"b_erupt": Vector2(-22.3, -17.4), 
	"b_ud": Vector2(-22.3, 17.4), "b_water": "r_aero_se"
}


const POST_EXA_4_REF := [POST_EXA_4_NW, POST_EXA_4_NE, POST_EXA_4_SE, POST_EXA_4_SW]
const POST_EXA_4_NE := {
	"r_aero_sw": G1_TANK_NE, "r_aero_se": G1_TANK_NE + RS1,
	"r_ice_w": G1_TANK_NE + RS2, "r_ice_e": G1_TANK_NE + RS3,
	"b_erupt": G1_TANK_NE - RS1, "b_ice": Vector2(-2, 2),
	"b_ud": G1_TANK_NE - RS2
	#"b_water": Vector2(-2, 20)
}
const POST_EXA_4_NW := {
	"r_aero_sw": G2_TANK_NW, "r_aero_se": G2_TANK_NW + RS1,
	"r_ice_w": G2_TANK_NW + RS2, "r_ice_e": G2_TANK_NW + RS3,
	"b_erupt": G2_TANK_NW - RS1,
	"b_ud": G2_TANK_NW - RS2, "b_water": Vector2(-2, -2)
	#"b_ice": Vector2(-2, -20)
}
# Ice won't have soaked yet,
const POST_EXA_4_SE := {
	"r_aero_sw": G2_TANK_SE, "r_aero_se": G2_TANK_SE + RS1,
	"r_ice_w": G2_TANK_SE + RS2, "r_ice_e": G2_TANK_SE + RS3,
	"b_erupt": G2_TANK_SE - RS1,
	"b_ud": G2_TANK_SE - RS2
	#"b_water": Vector2(-33, 0)
}
# Water won't have soaked yet.
const POST_EXA_4_SW := {
	"r_aero_sw": G1_TANK_SW, "r_aero_se": G1_TANK_SW + RS1,
	"r_ice_w": G1_TANK_SW + RS2, "r_ice_e": G1_TANK_SW + RS3,
	"b_erupt": G1_TANK_SW - RS1,
	"b_ud": G1_TANK_SW - RS2
	#"b_ice": Vector2(-33, 0)
}



const POST_SOAK_TARGET_REF = [POST_SOAK_TARGET_NW, POST_SOAK_TARGET_NE, POST_SOAK_TARGET_SE, POST_SOAK_TARGET_SW]
# This is to adjust SE/SW soakers if puddle is placed inside 4th exa
# Ommitting far E/W soak because they need to wait for 3rd exa.
const POST_SOAK_TARGET_NE := {
	"b_ud": Vector2(22.3, 12.4),
	"b_ice": Vector2(-2, 2),
	"b_water": Vector2(-2, 20)
}
const POST_SOAK_TARGET_NW := {
	"b_erupt": Vector2(22.3, -12.4),
	"b_ice": Vector2(-2, -20),
	"b_water": Vector2(-2, -2)
}
const POST_SOAK_TARGET_SE := {
	"b_ud": Vector2(-22.3, 11.4),
	"b_ice": G2_TANK_SE - RS3,
	"b_water": Vector2(-33, 0)
}
const POST_SOAK_TARGET_SW := {
	"b_erupt": Vector2(-22.3, -12.4),
	"b_water": G1_TANK_SW - RS3,
	"b_ice": Vector2(-33, 0)
}


const REWIND_REF := [REWIND_NW, REWIND_NE, REWIND_SE, REWIND_SW]
const REWIND_NE := {
	"t1": G1_TANK_NE, "t2": G2_TANK_NE,
	"m1": G1_PARTY_NE, "r1": G1_PARTY_NE + RS1, "h1": G1_PARTY_NE + RS2,
	"m2": G2_PARTY_NE, "r2": G2_PARTY_NE + RS1, "h2": G2_PARTY_NE + RS2
}
const REWIND_SE := {
	"t1": G1_TANK_SE, "t2": G2_TANK_SE,
	"m1": G1_PARTY_SE, "m2": G2_PARTY_SE, 
	"r1": G1_PARTY_SE + RS1, "r2": G2_PARTY_SE + RS1, 
	"h1": G1_PARTY_SE + RS2, "h2": G2_PARTY_SE + RS2
}
const REWIND_NW := {
	"t1": G1_TANK_NW, "t2": G2_TANK_NW,
	"m1": G1_PARTY_NW, "m2": G2_PARTY_NW, 
	"r1": G1_PARTY_NW + RS1, "r2": G2_PARTY_NW + RS1, 
	"h1": G1_PARTY_NW + RS2, "h2": G2_PARTY_NW + RS2
}
const REWIND_SW := {
	"t1": G1_TANK_SW, "t2": G2_TANK_SW,
	"m1": G1_PARTY_SW, "m2": G2_PARTY_SW, 
	"r1": G1_PARTY_SW + RS1, "r2": G2_PARTY_SW + RS1, 
	"h1": G1_PARTY_SW + RS2, "h2": G2_PARTY_SW + RS2
}


#const JUMP_SPREAD_REF := [JUMP_SPREAD_NW, JUMP_SPREAD_NE, JUMP_SPREAD_SE, JUMP_SPREAD_SW]
const JUMP_SPREAD_NE := {
	"t1": T1_SPREAD_NE, "t2": T2_SPREAD_NE,
	"m1": M1_SPREAD_NE, "m2": M2_SPREAD_NE, 
	"r1": R1_SPREAD_NE, "r2": R2_SPREAD_NE, 
	"h1": H1_SPREAD_NE, "h2": H2_SPREAD_NE
}
const JUMP_SPREAD_NW := {
	"t1": T1_SPREAD_NW, "t2": T2_SPREAD_NW,
	"m1": M1_SPREAD_NW, "m2": M2_SPREAD_NW, 
	"r1": R1_SPREAD_NW, "r2": R2_SPREAD_NW, 
	"h1": H1_SPREAD_NW, "h2": H2_SPREAD_NW
}
#const JUMP_SPREAD_SE := {
	#"t1": T1_SPREAD_NE, "t2": T2_SPREAD_NE,
	#"m1": M1_SPREAD_NE, "m2": M2_SPREAD_NE, 
	#"r1": R1_SPREAD_NE, "r2": R2_SPREAD_NE, 
	#"h1": H1_SPREAD_NE, "h2": H2_SPREAD_NE
#}
#const JUMP_SPREAD_SW := {
	#"t1": T1_SPREAD_NE, "t2": T2_SPREAD_NE,
	#"m1": M1_SPREAD_NE, "m2": M2_SPREAD_NE, 
	#"r1": R1_SPREAD_NE, "r2": R2_SPREAD_NE, 
	#"h1": H1_SPREAD_NE, "h2": H2_SPREAD_NE
#}
#const JUMP_SPREAD_NW := {
	#"t1": T1_SPREAD_NE, "t2": T2_SPREAD_NE,
	#"m1": M1_SPREAD_NE, "m2": M2_SPREAD_NE, 
	#"r1": R1_SPREAD_NE, "r2": R2_SPREAD_NE, 
	#"h1": H1_SPREAD_NE, "h2": H2_SPREAD_NE
#}

const AKH_MORN := {
	"t1": AM_STACK_LEFT, "t2": AM_STACK_RIGHT,
	"m1": AM_STACK_LEFT + RS1, "m2": AM_STACK_RIGHT + RS1, 
	"r1": AM_STACK_LEFT + RS2, "r2": AM_STACK_RIGHT + RS2, 
	"h1": AM_STACK_LEFT + RS3, "h2": AM_STACK_RIGHT + RS3
}
