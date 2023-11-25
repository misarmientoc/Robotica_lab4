function [] = EnableTorque(port_num,PROTOCOL_VERSION,DXL1_ID,TORQUE_ENABLE)
    %ENABLETORQUE Summary of this function goes here
    %   Detailed explanation goes here
    %   Enable = TORQUE_ENABLE=1
    %   Disable = TORQUE_ENABLE=0
    
    COMM_SUCCESS                = 0;            % Communication Success result value
    

    % Control table address
    ADDR_MX_TORQUE_ENABLE       = 24;           % Control table address is different in Dynamixel model
    
    % Enable Dynamixel Torque
    write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
    dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
    dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
    if dxl_comm_result ~= COMM_SUCCESS
        fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    elseif dxl_error ~= 0
        fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
    else
        fprintf('[ID:%03d] Dynamixel  Torque has change: %03d\n',DXL1_ID,TORQUE_ENABLE);
    end
end

