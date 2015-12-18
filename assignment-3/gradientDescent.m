P = 500; 
tmax = 1000;
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
end

E = 0;

for i = 1:P
    tan1 = tanh(w1' * xi(:,i));
    tan2 = tanh(w2' * xi(:,i));
    sigma = tan1 + tan2;
    E = E + (sigma - tau(i))^2;
end

E = E / (2 * P)

Etest = 0;

for i = (P+1):size(xi, 2)
    tan1 = tanh(w1' * xi(:,i));
    tan2 = tanh(w2' * xi(:,i));
    sigma = tan1 + tan2;
    Etest = Etest + (sigma - tau(i))^2;
end

Etest = Etest / (2 * (size(xi, 2) - P))