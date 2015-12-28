function E = errorCalculation(W, xi, tau)
    E = sum((ones(1, 2) * tanh(W' * xi) - tau).^2) / (2 * size(xi, 2));
end

