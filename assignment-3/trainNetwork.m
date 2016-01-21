function [W, trainingError, setError] = trainNetwork(xi, tau, trainingSize, tmax, eta)
    N = size(xi, 1);
    M = size(xi, 2);
    W = normc(rand(N, 2));
    P = trainingSize;
    
    if nargout == 3
        trainingError = [];
        setError = [];
    end

    for time = 1:tmax
        for points = 1:P
            j = randi([1, P]); % pick a random index between 1 and P
            input = tanh(W' * xi(:, j));

            for k = 1:2
                W(:, k) = W(:, k) - eta * (sum(input) - tau(j)) * (1 - input(k)^2) * xi(:, j);
            end
        end
        
        if nargout == 3
            trainingError(time) = calculateError(W, xi(:, 1:P), tau(1:P));
            setError(time) = calculateError(W, xi(:, P+1:M), tau(P+1:M));
        end
    end
end

