%% See the history of Minover with random data.
N = 2;
P = 3;
teacher = ones(N, 1);

[data, labels] = generateNoisyData(N, P, teacher, 0.1);

nmax = 1000;
tol = 0.00001;
[w1, history] = minoverWithHistory(data, labels, nmax, tol);
% w2 = rosenblatt(data, labels, nmax);

%Draw the plot
range = norm(data, 1) + 1;
fighandle = figure;
hold on;
numcol = 200;
c = colormap(jet(numcol));
for i = 2:50:size(history, 2)
    plotline(history(:, i), range, c(1 + mod(i, numcol), :)', fighandle);
end
plotline(w1, range, 'r', fighandle);
% plotline(w2, range, 'g', fighandle);
plotline(teacher, range, 'm', fighandle);
plotdata(data, labels, fighandle);

%% Compare Minover with Rosenblatt on random data.
N = 100;
alpha = 0.1:0.1:5;
alpha = 0.1:0.1:5;
alphaValues = size(alpha, 2);
nmax = 200;
nD = 30;
teacher = ones(N, 1);
generror = zeros(alphaValues, 2);
tol = 0.0001;

for i = 1:alphaValues
    
    P = round(alpha(i) * N);
    
    learningcurves = zeros(nD, 1);
    for j = 1:nD
        [data, labels] = generateNoisyData(N, P, teacher, .1);
        
        w1 = minover(data, labels, nmax, tol);
        w2 = rosenblatt(data, labels, nmax);
        
        % Compute learning curve
        learningcurves(j, 1) = learningRate(w1, teacher);
        learningcurves(j, 2) = learningRate(w2, teacher);
    end
    generror(i, 1) = mean(learningcurves(:, 1));
    generror(i, 2) = mean(learningcurves(:, 2));
end

figure
hold on;
plot(alpha, generror(:, 1), 'b')
plot(alpha, generror(:, 2), 'r')

legend('Minover', 'Rosenblatt');
