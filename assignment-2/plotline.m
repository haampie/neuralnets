function plotline(w, range, color, fighandle)
    syms x y
    p = ezplot(w(1) * x + w(2) * y == 0, [-range, range, -range, range], fighandle);
    set(p, 'Color', color);
end

