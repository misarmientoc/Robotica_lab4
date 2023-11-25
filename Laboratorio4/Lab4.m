%% Initial configurations

clc;clear;

% Protocol version
PROTOCOL_VERSION            = 1.0;          % See which protocol version is used in the Dynamixel

% Default setting
DXL1_ID = 1; % ID: 1
DXL2_ID = 2; % ID: 2
DXL3_ID = 3; % ID: 3
DXL4_ID = 4; % ID: 4
DXL5_ID = 5; % ID: 5                  

BAUDRATE                    = 1000000;
DEVICENAME                  = 'COM3';       % Check which port is being used on your controller
                                            % ex) Windows: 'COM1'   Linux: '/dev/ttyUSB0' Mac: '/dev/tty.usbserial-*'

% Control table address
ADDR_CW_Angle_Limit         = 06;
ADDR_CCW_Angle_Limit        = 08;
ADDR_MX_TORQUE_ENABLE       = 24;           % Control table address is different in Dynamixel model
ADDR_MX_TORQUE_LIMIT        = 34;
ADDR_CW_Compl_Margin        = 26;
ADDR_CCW_Compl_Margin       = 27;
ADDR_MX_GOAL_POSITION       = 30;
ADDR_MX_PRESENT_POSITION    = 36;
ADDR_MX_MOV_SPEED           = 32;
ADDR_MX_PRESENT_SPEED       = 38;
ADDR_Present_Load           = 40;

LEN_CW_Angle_Limit          = 2;
LEN_CCW_Angle_Limit         = 2;
LEN_MX_TORQUE_ENABLE        = 1;
LEN_MX_TORQUE_LIMIT         = 2;
LEN_CW_Compl_Margin         = 1;
LEN_CCW_Compl_Margin        = 1;
LEN_MX_GOAL_POSITION        = 2;
LEN_MX_PRESENT_POSITION     = 2;
LEN_MX_MOV_SPEED            = 2;
LEN_MX_PRESENT_SPEED        = 2;
LEN_Present_Load            = 2;
%%                                     
[port_num,lib_name, group_num] = ConnectPhantomX(DEVICENAME,BAUDRATE,PROTOCOL_VERSION,ADDR_MX_GOAL_POSITION,LEN_MX_GOAL_POSITION);
%%
EnableTorque(port_num,PROTOCOL_VERSION,DXL1_ID,1)
EnableTorque(port_num,PROTOCOL_VERSION,DXL2_ID,1)
EnableTorque(port_num,PROTOCOL_VERSION,DXL3_ID,1)
EnableTorque(port_num,PROTOCOL_VERSION,DXL4_ID,1)
%%
ChangeTorque(port_num,PROTOCOL_VERSION,DXL1_ID,1023)
ChangeTorque(port_num,PROTOCOL_VERSION,DXL2_ID,1023)
ChangeTorque(port_num,PROTOCOL_VERSION,DXL3_ID,1023)
ChangeTorque(port_num,PROTOCOL_VERSION,DXL4_ID,1023)
%%
WriteAddrValue(port_num,PROTOCOL_VERSION,DXL1_ID,ADDR_MX_MOV_SPEED,LEN_MX_MOV_SPEED,50)
WriteAddrValue(port_num,PROTOCOL_VERSION,DXL2_ID,ADDR_MX_MOV_SPEED,LEN_MX_MOV_SPEED,50)
WriteAddrValue(port_num,PROTOCOL_VERSION,DXL3_ID,ADDR_MX_MOV_SPEED,LEN_MX_MOV_SPEED,50)
WriteAddrValue(port_num,PROTOCOL_VERSION,DXL4_ID,ADDR_MX_MOV_SPEED,LEN_MX_MOV_SPEED,50)
%%
ReadAddrValue(port_num,PROTOCOL_VERSION,DXL1_ID,32,2)
%%
ReadAddrValue(port_num,PROTOCOL_VERSION,DXL1_ID,ADDR_MX_PRESENT_POSITION,2)
%%
%pos1 = 0;%80;
%pos2 = 0;%-35;
%pos3 = 0;%55;
%pos4 = 0;%-45;

while(1) 
n = input('Selecione una opción 1, 2, 3 , 4, 5, 6   ')

switch n
    case 1
        pos1B = ConversorA_bit(0,0);
        pos2B = ConversorA_bit(0,0);
        pos3B = ConversorA_bit(-90,0);
        pos4B = ConversorA_bit(0,0);
    case 2
        pos1B = ConversorA_bit(0,25);
        pos2B = ConversorA_bit(0,25);
        pos3B = ConversorA_bit(-90,20);
        pos4B = ConversorA_bit(0,-20);
    case 3
        pos1B = ConversorA_bit(0,-35);
        pos2B = ConversorA_bit(0, 35);
        pos3B = ConversorA_bit(-90,-30);
        pos4B = ConversorA_bit(0,30);
    case 4
        pos1B = ConversorA_bit(0,85);
        pos2B = ConversorA_bit(0,-20);
        pos3B = ConversorA_bit(-90,55);
        pos4B = ConversorA_bit(0,25);
     case 5
        pos1B = ConversorA_bit(0,80);
        pos2B = ConversorA_bit(0,-35);
        pos3B = ConversorA_bit(-90,55);
        pos4B = ConversorA_bit(0,-45);
     case 6
        EnableTorque(port_num,PROTOCOL_VERSION,DXL1_ID,0)
        EnableTorque(port_num,PROTOCOL_VERSION,DXL2_ID,0)
        EnableTorque(port_num,PROTOCOL_VERSION,DXL3_ID,0)
        EnableTorque(port_num,PROTOCOL_VERSION,DXL4_ID,0)
        DisconnectPhantomX(port_num,lib_name)
        break;

    end


%%
MMotor(port_num,PROTOCOL_VERSION,1.5,DXL1_ID,pos1B)
MMotor(port_num,PROTOCOL_VERSION,1.5,DXL2_ID,pos2B)
MMotor(port_num,PROTOCOL_VERSION,1.5,DXL3_ID,pos3B)
MMotor(port_num,PROTOCOL_VERSION,1.5,DXL4_ID,pos4B)
end
