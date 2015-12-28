% Input dimension
N = 50;

% Training size
P = 2500;

% Input size
M = 5000;

% Iterate tmax times over the training set
tmax = 20;

% Learning rate
eta = 0.05;

% Permute input
permutation = randperm(M);
permutedData = xi(:, permutation);
permutedLabels = tau(permutation);

% Start learning
[W, trainingError, setError] = trainNetwork(permutedData, permutedLabels, P, tmax, eta);

figure;
plot(trainingError)
hold on
plot(setError,'r')
hold off

%figure
%bar(W(:,1));



