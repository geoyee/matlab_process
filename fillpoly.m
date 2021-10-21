function [img] = fillpoly(img, xs, ys)
% Моід
    [len, ~] = size(xs);
    for i = 1:len
        img(ys(i, 1), xs(i, 1)) = 0;
    end
end

