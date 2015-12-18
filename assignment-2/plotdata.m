function plotdata(D, L, fighandle)
    figure(fighandle);
    for i = 1:size(D, 2)
        x = D(1, i);
        y = D(2, i);

        if L(i) == 1
            scatter(x, y, 50, 10, 'filled', 'b')
        else
            scatter(x, y, 50, 10, 'b')
        end
    end
end

