% Input dimension
N = 50;

% Training size
P = 500;

% Input size
M = 5000;

% Iterate tmax times over the training set
tmax = 1000;

% Learning rate
eta = 0.01;

% Initial weight vectors
W = normc(rand(N, 2));

% Permute input
permutation = randperm(M);
permutedData = xi(:, permutation);
permutedLabels = tau(permutation);

% Start learning
for i = 0:(P*tmax - 1)
    j = 1 + mod(i, P);
    input = tanh(W' * permutedData(:, j));
    
    for k = 1:2
        W(:, k) = W(:, k) - eta * (sum(input) - permutedLabels(j)) * (1 - input(k)^2) * permutedData(:, j);
    end
    
    if j == 1
        Etraining = errorCalculation(W, permutedData(:, 1:P), permutedLabels(1:P))
        Etestdata = errorCalculation(W, permutedData(:, P+1:M), permutedLabels(P+1:M))
    end
end