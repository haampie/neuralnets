% Input dimension
N = 50;

% Input size
M = 5000;

% Different sample sizes
Pvalues = 50:100:150;

% Iterate tmax times over the training set
tmax = 4000;

% Learning rate
eta = 0.001;

% Permute input
permutation = randperm(M);
permutedData = xi(:, permutation);
permutedLabels = tau(permutation);

% Start learning
errors = [];
for P = Pvalues
    [W] = trainNetwork(permutedData, permutedLabels, P, tmax, eta);
    
    setError = calculateError(W, permutedData(:, P+1:end), permutedLabels(P+1:end));
    trainingError = calculateError(W, permutedData(:, 1:P), permutedLabels(1:P));
    errors = [errors; setError, trainingError];
end

figure
hold on;
semilogy(Pvalues, errors(:, 1), 'b')
semilogy(Pvalues, errors(:, 2), 'r')
hold off;