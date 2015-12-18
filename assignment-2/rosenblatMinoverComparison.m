N = 100;
alpha = 0.1:0.1:5;
alphaValues = size(alpha, 2);
nmax = 10000;
nD = 20;
teacher = ones(N, 1);
generror = zeros(alphaValues, 2);
tol = 0.0001;

for i = 1:alphaValues
    
    P = round(alpha(i) * N);
    
    learningcurves = zeros(nD, 1);
    for j = 1:nD
        [data, labels] = generateRandomData(N, P, teacher);
        
        [w1, updates1] = minover(data, labels, nmax, tol);
        [w2, updates2] = rosenblatt(data, labels, nmax);
        
        % Compute learning curve
        learningcurves(j, 1) = learningRate(w1, teacher);
        learningcurves(j, 2) = learningRate(w2, teacher);
    end
    generror(i, 1) = mean(learningcurves(:, 1));
    generror(i, 2) = mean(learningcurves(:, 2));
end

figure
hold on;
plot(generror(:, 1), 'b')
plot(generror(:, 2), 'r')

legend('Minover', 'Rosenblatt');
