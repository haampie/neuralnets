% Input dimension
N = 50;

% Input size
M = 5000;

% Sample size
P = 1000;

% Different sample sizes
etaValues = 0.00001 * 2.^linspace(0, 20, 40);

% Iterate tmax times over the training set
tmax = 1000;

% Permute input
permutation = randperm(M);
permutedData = xi(:, permutation);
permutedLabels = tau(permutation);
initialW = normc(rand(N, 2));

etaValues

% Start learning
errors = [];
for eta = etaValues
    [W] = trainNetwork(permutedData, permutedLabels, initialW, P, tmax, eta);
    
    setError = calculateError(W, permutedData(:, P+1:end), permutedLabels(P+1:end));
    trainingError = calculateError(W, permutedData(:, 1:P), permutedLabels(1:P));
    errors = [errors; setError, trainingError];
    fprintf('Finished for eta = %f. train = %f. test = %f\n', eta, trainingError, setError);
end

figure
hold on;
plot(etaValues, errors(:, 1), 'b')
plot(etaValues, errors(:, 2), 'r')
hold off;