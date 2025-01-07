function [mu,va] = sadapala_final_p3(eigFunc, m, tol, N)
% SADAPALA_FINAL_P3 Calculates Mean and Variance of the number of
% iterations necessary to compute the spectrum using given function using
% Monte Carlo.
%
%   Inputs:
%       eigFunc - Real and Symmetric Matrix, matrix
%       m - Size of the square matrix to use.
%       tol - convergence tolerance to use in eigFunc.
%       N - Number of samples to take.
%
%   Outputs:
%       mu - mean of the iteration count.
%       va - variance of the iteration count.

    % set random number seed generator.
    rng(0);

    iteration_set = zeros(N,1);

    % iterating to generate N samples
    for count = 1:N
        % creating matrix
        A = rand(m);

        % making the matrix symmetric
        A = 0.5*(A+transpose(A));

        [~, ~, iter] = eigFunc(A, tol);
        iteration_set(count,1) = iter;
    end

    mu = mean(iteration_set);
    va = var(iteration_set);

end % sadapala_final_p3