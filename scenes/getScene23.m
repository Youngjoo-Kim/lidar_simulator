function [object_list, color_list] = getScene23()    
    %% Description: 
    %4 medium targets list on the 4 sides of the lidar, surrounding the
    %lidar beams. paralell to z axis. Constrain the scaling, translation in
    %x y plane. 
    
    

    %% Create object list
    num_obj = 4;    
    object_list(num_obj).object_vertices = struct();
    color_list = getColors(num_obj);
    
    %% Create objects
    objects1 = genShape("polygon", 3, 4);
    objects2 = genShape("polygon", 3, 4);
    
    % Plot original polygon (2D)
    % pgon = polyshape(objects1.y, objects1.z);
    % plot(fig_handle(1), pgon)
    % viewCurrentPlot(fig_handle(1), "2D")

    % Plot original polygon (3D)
    % plotConnectedVerticesStructure(fig_handle(2), vertices, 'b')

    %% move away the polygon
    disp("--- Moving obstacles...")
    
    % Move Object1
    object1_mat = convertXYZstructToXYZmatrix(objects1);
    object1_mat_h = converToHomogeneousCoord(object1_mat);
    rpy = [0 0 0]; % in degree
    xyz = [5, 0, 0];
    moved_obj1_mat_h = moveByRPYXYZ(object1_mat_h, rpy, xyz);
    object_list(1).object_vertices = convertXYZmatrixToXYZstruct(moved_obj1_mat_h);

    rpy = [0 0 90]; % in degree
    xyz = [0, 12, 0];
    moved_obj2_mat_h = moveByRPYXYZ(object1_mat_h, rpy, xyz);
    object_list(2).object_vertices = convertXYZmatrixToXYZstruct(moved_obj2_mat_h);
    
    % Move Object2
    object2_mat = convertXYZstructToXYZmatrix(objects2);
    object2_mat_h = converToHomogeneousCoord(object2_mat);

    rpy = [0 0 0]; % in degree
    xyz = [-10, 0, 0];
    moved_obj3_mat_h = moveByRPYXYZ(object2_mat_h, rpy, xyz);
    object_list(3).object_vertices = convertXYZmatrixToXYZstruct(moved_obj3_mat_h);

    rpy = [0 0 90]; % in degree
    xyz = [0, -8, 0];
    moved_obj4_mat_h = moveByRPYXYZ(object2_mat_h, rpy, xyz);
    object_list(4).object_vertices = convertXYZmatrixToXYZstruct(moved_obj4_mat_h);

end