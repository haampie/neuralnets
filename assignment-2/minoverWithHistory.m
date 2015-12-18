function [last, w] = minoverWithHistory(input, labels, iterations, tol)
    N = size(input, 1);

    w = zeros(N, iterations + 1);
    w(1, 1) = 1;
    
    % dingen
    for n = 1:iterations
        [~, index] = min( (w(:, n)' * input) .* labels);
        
        w(:, n + 1) = w(:, n) + input(:, index) * labels(1, index) / N;
        
        last = w(:, n + 1);
                
        if abs(1 - w(:, n + 1)' * w(:, n) / norm(w(:, n + 1)) / norm(w(:, n))) < tol
            w(:, (n + 2) : (iterations + 1)) = [];
            return
        end
    end
end

