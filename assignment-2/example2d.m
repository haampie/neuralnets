N = 2;
P = 8;
teacher = ones(N, 1);

[data, labels] = generateRandomData(N, P, teacher);

nmax = 10000;
tol = 0.00001;
w1 = minover(data, labels, nmax, tol);
w2 = rosenblatt(data, labels, nmax);

%Draw the plot
range = norm(data, 1) + 1;
fighandle = figure;
hold on;
plotline(w1, range, 'r', fighandle);
plotline(w2, range, 'g', fighandle);
plotline(teacher, range, 'm', fighandle);
plotdata(data, labels, fighandle);
