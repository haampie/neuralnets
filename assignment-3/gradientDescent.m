% Training size
P = 500;

% Input size
M = 5000;

% Iterate tmax times over the training set
tmax = 2500;

% Learning rate
eta = 0.001;

% Permute input
permutation = randperm(M);
permutedData = xi(:, permutation);
permutedLabels = tau(permutation);

% Start learning
[W, trainingError, generalizationError] = trainNetwork(permutedData, permutedLabels, P, tmax, eta);

figure;
semilogy(trainingError)
hold on
semilogy(generalizationError,'r')
xlabel('t')
ylabel('error')
legend('Training error', 'Generalization error')
hold off

%figure
%bar(W(:,1));



