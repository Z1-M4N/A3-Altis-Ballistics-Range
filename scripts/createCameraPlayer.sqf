// set Init
_cam100 = "camera" camCreate [14461.3,15946.1,1.57]; 
_cam900 = "camera" camCreate [15021.5,16517,1.57]; 
 
_cam200 = "camera" camCreate [14538.6,16010.5,1.57]; 
_cam1000 = "camera" camCreate [15099,16581.5,1.57]; 
 
_cam300 = "camera" camCreate [14615.6,16075.1,1.57]; 
_cam1100 = "camera" camCreate [15175.8,16645.6,1.57]; 

_cam400 = "camera" camCreate [14692.9,16139.1,1.57]; 
_cam1200 = "camera" camCreate [15254.1,16710.8,1.57]; 
 
_cam500 = "camera" camCreate [14769.8,16204,1.57]; 
_cam1300 = "camera" camCreate [15330.3,16775.2,1.57]; 
 
_cam600 = "camera" camCreate [14847,16268.6,1.57]; 
_cam1400 = "camera" camCreate [15407.9,16840.1,1.57]; 
 
_cam700 = "camera" camCreate [14924.2,16332.8,1.57]; 
_cam1500 = "camera" camCreate [15485.3,16904.2,1.57]; 
 
_cam800 = "camera" camCreate [15001.7,16397.3,1.57]; 
_cam1600 = "camera" camCreate [15561.9,16967.7,1.57]; 

// adjust pos
_posOffset = [-1.6,-0.72,0.09];
_cam100  setPosATL(tgt_lane_1_1 modelToWorld _posOffset);
_cam900  setPosATL(tgt_lane_1_2 modelToWorld _posOffset);

_cam200  setPosATL(tgt_lane_2_1 modelToWorld _posOffset);
_cam1000 setPosATL(tgt_lane_2_2 modelToWorld _posOffset);

_cam300  setPosATL(tgt_lane_3_1 modelToWorld _posOffset);
_cam1100 setPosATL(tgt_lane_3_2 modelToWorld _posOffset);

_cam400  setPosATL(tgt_lane_4_1 modelToWorld _posOffset);
_cam1200 setPosATL(tgt_lane_4_2 modelToWorld _posOffset);

_cam500  setPosATL(tgt_lane_5_1 modelToWorld _posOffset);
_cam1300 setPosATL(tgt_lane_5_2 modelToWorld _posOffset);

_cam600  setPosATL(tgt_lane_6_1 modelToWorld _posOffset);
_cam1400 setPosATL(tgt_lane_6_2 modelToWorld _posOffset);

_cam700  setPosATL(tgt_lane_7_1 modelToWorld _posOffset);
_cam1500 setPosATL(tgt_lane_7_2 modelToWorld _posOffset);

_cam800  setPosATL(tgt_lane_8_1 modelToWorld _posOffset);
_cam1600 setPosATL(tgt_lane_8_2 modelToWorld _posOffset);

// set Fov
_foV = 0.8;

_cam100 camSetFov _foV;
_cam900  camSetFov _foV;

_cam200 camSetFov _foV;
_cam1000 camSetFov _foV;

_cam300 camSetFov _foV;
_cam1100 camSetFov _foV; 

_cam400 camSetFov _foV;
_cam1200 camSetFov _foV; 

_cam500 camSetFov _foV;
_cam1300 camSetFov _foV; 

_cam600 camSetFov _foV;
_cam1400 camSetFov _foV; 

_cam700 camSetFov _foV;
_cam1500 camSetFov _foV; 

_cam800 camSetFov _foV;
_cam1600 camSetFov _foV; 

// set Angle
_vectorDu = [35,0,0] call compile preprocessFileLineNumbers "scripts\getVectorDirAndUp.sqf";
 
_cam100 setVectorDirAndUp _vectorDu select 0; 
_cam900 setVectorDirAndUp _vectorDu select 0; 
 
_cam200 setVectorDirAndUp _vectorDu select 0; 
_cam1000 setVectorDirAndUp _vectorDu select 0; 
 
_cam300 setVectorDirAndUp _vectorDu select 0; 
_cam1100 setVectorDirAndUp _vectorDu select 0; 
 
_cam400 setVectorDirAndUp _vectorDu select 0; 
_cam1200 setVectorDirAndUp _vectorDu select 0; 
 
_cam500 setVectorDirAndUp _vectorDu select 0; 
_cam1300 setVectorDirAndUp _vectorDu select 0; 
 
_cam600 setVectorDirAndUp _vectorDu select 0; 
_cam1400 setVectorDirAndUp _vectorDu select 0; 
 
_cam700 setVectorDirAndUp _vectorDu select 0; 
_cam1500 setVectorDirAndUp _vectorDu select 0; 
 
_cam800 setVectorDirAndUp _vectorDu select 0; 
_cam1600 setVectorDirAndUp _vectorDu select 0;

player setVariable ["camArray", 
[
_cam100,_cam900,
_cam200,_cam1000,
_cam300,_cam1100,
_cam400,_cam1200,
_cam500,_cam1300,
_cam600,_cam1400,
_cam700,_cam1500,
_cam800,_cam1600
]
];