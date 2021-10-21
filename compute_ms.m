function [m, s] = compute_ms(img, xs, ys)
% 计算当前区域的均值方差
    indexs = [];
    [len, ~] = size(xs);
    for i = 1:len
        indexs = [indexs, double(img(ys(i, 1), xs(i, 1)))];
    end
    m = mean(indexs);
    s = std(indexs);
end

