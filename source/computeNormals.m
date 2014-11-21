function [normals, albedo_img] = ...
    computeNormals(light_dirs, img_cell, mask)

% img1 = double(img_cell{1})/255; 
% img2 = double(img_cell{2})/255; 
% img3 = double(img_cell{3})/255; 
% img4 = double(img_cell{4})/255; 
% img5 = double(img_cell{5})/255; 
[m, n] = size(mask);
albedo_img = zeros(m, n);
normals = zeros(m, n, 3);
albedo_max = 0;
for i = 1:n
    for j = 1:m
        if mask(i,j)
%             I = [img1(i,j),img2(i,j),img3(i,j),img4(i,j),img5(i,j)];
%             [Iprime,k] = sort(I);
            B = [];
            for k = 1:5 
                B = [B; img_cell{k}(i,j)];
            end
            B = double(B);
            N = inv((light_dirs') * light_dirs) * (light_dirs') * B;
            normals(i,j,1:3) = N./norm(N);
            albedo_img(i,j) = norm(N);
            albedo_max = max(albedo_max, norm(N));
        end
    end
end
albedo_img = albedo_img / albedo_max;