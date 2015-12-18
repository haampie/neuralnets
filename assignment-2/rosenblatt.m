function [w, flops] = rosenblatt(input, labels, iterations)

    flops = 0;

    N = size(input, 1);
    P = size(input, 2);

    w = zeros(N, 1);
    
    for n = 1:iterations
        for i = 1:P
            E = w' * input(:, i) * labels(1, i);
            
            flops = flops + 3*N - 1;

            if E <= 0
                w = w + input(:, i) * labels(1, i) / N;
                flops = flops + 2 * N;
            end
        end

        if sum(sign(w' * input .* labels)) == P
            return;
        end
    end
end

