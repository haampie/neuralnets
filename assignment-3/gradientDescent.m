P = 500; 
tmax = 1000;
N = 50;
% learning rate
eta = 0.01; 
% initial weight vectors
w1 = rand(N,1);
w1 = w1 / norm(w1);
w2 = rand(N,1);
w2 = w2 / norm(w2);

for i = 0:(P*tmax - 1)
    j = 1 + mod(i, P);
    tan1 = tanh(w1' * xi(:,j));
    tan2 = tanh(w2' * xi(:,j));
    sigma = tan1 + tan2;
    w1 = w1 - eta * (sigma - tau(j))*(1 - tan1^2) * xi(:, j);
    w2 = w2 - eta * (sigma - tau(j))*(1 - tan2^2) * xi(:, j);
    [E,Etest] = errorCalculation(w1,w2,P,xi,tau);
end