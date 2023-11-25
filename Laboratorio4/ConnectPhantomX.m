%Conectarse con el PhantomX a un puerto serial especifico
function [port_num,lib_name, group_num] = ConnectPhantomX(DEVICENAME,BAUDRATE,PROTOCOL_VERSION,ADDR_MX_GOAL_POSITION,LEN_MX_GOAL_POSITION)
    
    lib_name = '';
    
    if strcmp(computer, 'PCWIN')
      lib_name = 'dxl_x86_c';
    elseif strcmp(computer, 'PCWIN64')
      lib_name = 'dxl_x64_c';
    elseif strcmp(computer, 'GLNX86')
      lib_name = 'libdxl_x86_c';
    elseif strcmp(computer, 'GLNXA64')
      lib_name = 'libdxl_x64_c';
    elseif strcmp(computer, 'MACI64')
      lib_name = 'libdxl_mac_c';
    end
    
    % Load Libraries
    if ~libisloaded(lib_name)
        [notfound, warnings] = loadlibrary(lib_name, 'dynamixel_sdk.h', 'addheader', 'port_handler.h', 'addheader', 'packet_handler.h', 'addheader', 'group_sync_write.h');
        disp(notfound)
        disp(warnings)
    end
    
    % Initialize PortHandler Structs
    % Set the port path
    % Get methods and members of PortHandlerLinux or PortHandlerWindows
    port_num = portHandler(DEVICENAME);
    
    % Initialize PacketHandler Structs
    packetHandler();
    
    % Open port
    if (openPort(port_num))
        fprintf('Succeeded to open the port!\n');
    else
        unloadlibrary(lib_name);
        fprintf('Failed to open the port!\n');
        input('Press any key to terminate...\n');
        return;
    end
    
    % Set port baudrate
    if (setBaudRate(port_num, BAUDRATE))
        fprintf('Succeeded to change the baudrate!\n');
    else
        unloadlibrary(lib_name);
        fprintf('Failed to change the baudrate!\n');
        input('Press any key to terminate...\n');
        return;
    end
    
    % Initialize Groupsyncwrite instance
    group_num = groupSyncWrite(port_num, PROTOCOL_VERSION, ADDR_MX_GOAL_POSITION, LEN_MX_GOAL_POSITION);
    
end