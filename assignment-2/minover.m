function [w, flops] = minover(input, labels, iterations, tol)
    flops = 0;
    N = size(input, 1);
    P = size(input, 2);
   
    w = zeros(N, 1);
    w(1) = 1;
    
    for n = 1:iterations
        % Compute data point with minimal stability
        [~, index] = min( (w' * input) .* labels);
        
        % Vector-matrix product + vector-scalar product
        flops = flops + 2 * P * N;
        
        % Perform Hebbian update step to data point with minimal stability
        wnew = w + input(:, index) * labels(1, index) / N;
        
        flops = flops + 2 * N;
        
        % Stopping criterium
        if abs(1 - wnew'* w / norm(w) / norm(wnew)) < tol
            w = wnew;
            return
        end
        w = wnew;
    end
end

