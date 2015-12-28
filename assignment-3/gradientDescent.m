% Input dimension
N = 50;

% Training size
P = 500;

% Input size
M = 5000;

% Iterate tmax times over the training set
tmax = 100;

% Learning rate
eta = 0.01;

% Initial weight vectors
W = normc(rand(N, 2));

% Initial training and test error
E_vector = zeros(1,tmax);
Etest_vector = zeros(1,tmax);

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
        E_vector(i/P+1) = errorCalculation(W, permutedData(:, 1:P), permutedLabels(1:P));
        Etest_vector(i/P+1) = errorCalculation(W, permutedData(:, P+1:M), permutedLabels(P+1:M));
    end
end
E_vector