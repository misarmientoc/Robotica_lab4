function [] = DisconnectPhantomX(port_num,lib_name)
    %DISCONNECTPHANTOMX Summary of this function goes here
    %   Detailed explanation goes here
    % Close port
    closePort(port_num);
    
    % Unload Library
    unloadlibrary(lib_name);
    
    close all;
    clear;
    fprintf('Port Disconnected \n')
end

