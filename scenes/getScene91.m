function [object_list, color_list] = getScene91()    
    %% Description:  
    % Calibration scene for a solid sate lidar 
    % 3 targets 

    %% Create object list
    num_obj = 3;    
    object_list(num_obj).object_vertices = struct();
    color_list = getColors(num_obj);
    
    %% Create objects
    target_size = 6;
    object = genShape("polygon", target_size, 4);
   
    % Plot original polygon (2D)
    % pgon = polyshape(objects1.y, objects1.z);
    % plot(fig_handle(1), pgon)
    % viewCurrentPlot(fig_handle(1), "2D")

    % Plot original polygon (3D)
    % plotConnectedVerticesStructure(fig_handle(2), vertices, 'b')

    %% move away the polygon
    disp("--- Moving obstacles...")
    
    % Move Object1
    object_mat = convertXYZstructToXYZmatrix(object);
    object_mat_h = converToHomogeneousCoord(object_mat);
    
    
    rpy = [0 30 0]; % in degree
    xyz = [3 0 0];
    moved_obj1_mat_h = moveByRPYXYZ(object_mat_h, rpy, xyz);
    objects(1).object_vertices = convertXYZmatrixToXYZstruct(moved_obj1_mat_h);
    [object_list(1:num_obj).size] = deal(target_size); 
    
    rpy = [10 10 0]; % in degree
    xyz = [3 0 0];
    moved_obj2_mat_h = moveByRPYXYZ(object_mat_h, rpy, xyz);
    objects(2).object_vertices = convertXYZmatrixToXYZstruct(moved_obj2_mat_h);

    rpy = [0 0 30]; % in degree
    xyz = [3 0 0];
    moved_obj3_mat_h = moveByRPYXYZ(object_mat_h, rpy, xyz);
    objects(3).object_vertices = convertXYZmatrixToXYZstruct(moved_obj3_mat_h);
end