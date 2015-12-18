N = 50;
alpha = 0.1:0.1:5;
alphaValues = size(alpha, 2);
nmax = 100;
nD = 10;
teacher = ones(N, 1);
generror = zeros(1,alphaValues);
tol = 0.00001;

for i = 1:alphaValues
    
    P = round(alpha(i) * N);
    
    learningcurves = zeros(1,nD);
    for j = 1:nD
        [D, L] = generateRandomData(N, P, teacher);

        w = minover(D, L, nmax, tol);

        % Compute learning curve
        learningcurves(j) = learningRate(w, teacher);
    end
    generror(i) = mean(learningcurves);
end
figure;
plot(alpha, generror)