function light_dirs_5x3 = computeLightDirections(center, radius, img_cell)
for i = 1:5
    h(i) = max(img_cell{i}(:));
    for j = 1:length(img_cell{i})
        for k = 1: length(img_cell{i}(1,:))
            if img_cell{i}(k,j) == h(i)
                xx = j;
                yy = k;
                break;
            end
        end
    end
    x_0 = mean(xx);
    y_0 = mean(yy);
    x(i) = x_0 - center(1);
    y(i) = y_0 - center(2);
    z(i) = sqrt(radius*radius-x(i)*x(i)-y(i)*y(i));
end
h = double(h)/255;
tmp1 = [x',y',z'];
tmp2 = tmp1./radius;
light_dirs_5x3 = tmp2.*[h',h',h'];


