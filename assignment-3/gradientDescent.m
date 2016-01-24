% Training size
P = 2500;

% Input size
M = 5000;

% Iterate tmax times over the training set
tmax = 500;

% Learning rate
eta = 0.001;

% Permute input
permutation = randperm(M);
permutedData = xi(:, permutation);
permutedLabels = tau(permutation);

% Start learning
[W, trainingError, generalizationError, normW] = trainNetwork(permutedData, permutedLabels, initialW, P, tmax, eta);

figure;
semilogy(trainingError)
hold on
semilogy(generalizationError,'r')
xlabel('t')
ylabel('Error')
legend('Training error', 'Generalization error')
hold off

figure;
semilogy(normW)
xlabel('t')
ylabel('norm(delta W)')
legend('Norm of weight vector update')

%figure
%bar(W(:,1));



