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

% Permute input
permutation = randperm(M);
permutedData = xi(:, permutation);
permutedLabels = tau(permutation);

% Start learning
[W] = trainNetwork(permutedData, permutedLabels, P, tmax, eta);