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
end

% Check error on the training set
E = 0;

for i = 1:P
    E = E + (sum(tanh(W' * permutedData(:, i))) - permutedLabels(i))^2;
end

E = E / (2 * P)

% Check the generalization error (error on all data without training set)
Etest = 0;

for i = (P+1):M
    Etest = Etest + (sum(tanh(W' * permutedData(:, i))) - permutedLabels(i))^2;
end

Etest = Etest / (2 * (M - P))