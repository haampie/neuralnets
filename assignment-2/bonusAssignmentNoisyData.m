N = 2;
P = 100;
teacher = ones(N, 1);

[data, labels] = generateNoisyData(N, P, teacher, 0);

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
