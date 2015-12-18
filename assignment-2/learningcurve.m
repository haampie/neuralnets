N = 50;
alpha = 0.1:0.1:5;
alphaValues = size(alpha, 2);
nmax = 100;
nD = 10;
teacher = ones(N, 1);
generror = zeros(1,alphaValues);
for i = 1:alphaValues
    
    P = round(alpha(i) * N);
    
    learningcurves = zeros(1,nD);
    for j = 1:nD
        % Inputs, vectors of dimension N
        D = randn(N, P);
        % Labels, -1 or +1
        L = zeros(1,P);
        for k = 1:P
            L(1,k) = sign(teacher' * D(:,k)); 
        end

        w = minover(D, L, nmax, 0.00001);

        % Compute learning curve
        learningcurves(j) = acos(w' * teacher / norm(w) / norm(teacher)) / pi; 
    end
    generror(i) = mean(learningcurves);
end
figure;
plot(alpha, generror)