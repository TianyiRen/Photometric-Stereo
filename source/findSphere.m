function [center, radius] = findSphere(img)
img1 = im2bw(img,0);
[m,n] = size(img);
A = sum(sum(img1));
center_x = 0;
center_y = 0;

for i = 1:m
    for j = 1:n
        center_x = center_x + i * img1(i,j);
        center_y = center_y + j * img1(i,j);
    end
end

center_x = center_x / A;
center_y = center_y / A;
center = [center_x,center_y];
radius = sqrt(A / pi);
