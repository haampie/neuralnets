% Input dimension
N = 50;

% Input size
M = 5000;

% Different sample sizes
Pvalues = [5 10 15 20 30 40 50 75 100 200 300 500 750 1000 1500 2000];

% Iterate tmax times over the training set
tmax = 100;

% Learning rate
eta = 0.01;

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
plot(Pvalues, errors(:, 1), 'b')
plot(Pvalues, errors(:, 2), 'r')
hold off;