function [W, trainingError, totalError] = trainNetwork(xi, tau, trainingSize, tmax, eta)
    N = size(xi, 1);
    M = size(xi, 2);
    W = normc(rand(N, 2));
    P = trainingSize;
    
    if nargout == 3
        trainingError = [];
        totalError = [];
    end

    for i = 0:(P*tmax - 1)
        j = 1 + mod(i, P);
        input = tanh(W' * xi(:, j));

        for k = 1:2
            W(:, k) = W(:, k) - eta * (sum(input) - tau(j)) * (1 - input(k)^2) * xi(:, j);
        end

        if j == 1 && nargout == 3
            trainingError(i/P+1) = errorCalculation(W, xi(:, 1:P), tau(1:P));
            totalError(i/P+1) = errorCalculation(W, xi(:, P+1:M), tau(P+1:M));
        end
    end
end

