function [w, flops] = minover(input, labels, iterations, tol)
    flops = 0;
    N = size(input, 1);
    P = size(input, 2);

    w = zeros(N, 1);
    w(1) = 1;
    
    for n = 1:iterations
        [~, index] = min( (w' * input) .* labels);
        
        % vector-matrix product + vector-scalar product
        flops = flops + 2 * P * N;
        
        wnew = w + input(:, index) * labels(1, index) / N;
        
        flops = flops + 2 * N;
        
        if abs(1 - wnew'* w / norm(w) / norm(wnew)) < tol
            w = wnew;
            return
        end
        w = wnew;
    end
end

