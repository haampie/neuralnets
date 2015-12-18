function [data, labels] = generateRandomData(dim, nsamples, teacher)
    % Inputs, vectors of dimension N
    data = randn(dim, nsamples);

    % Labels, -1 or +1
    labels = sign(teacher' * data);
end

