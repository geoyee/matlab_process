function [m, s] = compute_ms(img, xs, ys)
% ���㵱ǰ����ľ�ֵ����
    indexs = [];
    [len, ~] = size(xs);
    for i = 1:len
        indexs = [indexs, double(img(ys(i, 1), xs(i, 1)))];
    end
    m = mean(indexs);
    s = std(indexs);
end

