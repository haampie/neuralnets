function [data, labels] = generateNoisyData(dim, nsamples, teacher, lambda)
    [data, labels] = generateRandomData(dim, nsamples, teacher);
    
    % Randomly flip the labels with a chance of lamda.
    labels = labels .* ( (rand(1, nsamples) > lambda) * 2 - 1 );
end

