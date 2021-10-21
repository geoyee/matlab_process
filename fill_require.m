function [output] = fill_require(gray_img, rgb_img)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    % ��ȡ��ֵͼ��
    if class(gray_img) == "string"
        gray_img = imread(gray_img); 
        gray_img = rgb2gray(gray_img);
        thresh = graythresh(gray_img);
        gray_img = imbinarize(gray_img,thresh);
    end
    if class(rgb_img) == "string"
        rgb_img = imread(rgb_img);
    end
    end_img = uint8(gray_img) .* rgb_img;  % ��ͼ���Ŀ����������ֵ����ʲô��
    % ��ȡ��ͨ��
    % https://ww2.mathworks.cn/help/images/ref/regionprops.html
    res = regionprops(gray_img, 'all');
    [m, ~] = size(res);
    output = gray_img;
    for i = 1:m
        p = res(i).PixelList;
        a = res(i).Area;  % ���
        xs = int32(p(:, 1));
        ys = int32(p(:, 2));
        [i_mean, i_std] = compute_ms(end_img, xs, ys);  % ��ֵ����
        % ����ĳ��Ҫȥ�������������д�ģ�:
        if (a < 3000) && (i_mean < 120) && (i_std > 30)
            output = fillpoly(output, xs, ys);
        end
        % figure();
        % imshow(output);
    end
end