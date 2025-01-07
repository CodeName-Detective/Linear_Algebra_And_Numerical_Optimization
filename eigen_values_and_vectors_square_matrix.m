function [l,v] = sjakka_sadapala_pp11(A, v0, tol, itermax)
% SJAKKA_SADAPALA_PP11 Function to calculate Eigenvalue and Eigenvector for a square matrix.
%
%   Inputs:
%       A - A real and square matrix, matrix.
%       v0 - Initial Vector.
%       tol - Tolerance for convergence.
%       itermax - Maximum number of iterations.
%
%   Outputs:
%       l - Resulting Eigenvalue.
%       v - Associating Eigenvector, vector.

    % Normalizing the vector.
    v_old = v0/norm(v0,2);

    % Caluculating Eigenvalue using Rayleigh quotient.
    lambda_old = transpose(v_old)*A*v_old;

    iter_count = 0;
    not_converged = true;
    
    % Iterating untill convergence.
    while not_converged

        % Calculating the new eigen vector
        v_new = (A-lambda_old*eye(size(A,1))) \ v_old;
        % Normalizing the vector.
        v_new = v_new/norm(v_new,2);

        % Caluculating Eigenvalue using Rayleigh quotient.
        lambda_new = transpose(v_new)*A*v_new;

        %Incrementing the Itercount.
        iter_count = iter_count+1;

        % Checking for Convergence criteria.
        if abs((lambda_new-lambda_old)/lambda_new) < tol
            not_converged = false;
            l = lambda_new;
            v = v_new;
        % Checking if maximum iteration reached.
        elseif iter_count >= itermax
            error('Maximum iterations reached!!!')
        end

        % Assigning new values to old values for next iteration.
        v_old = v_new;
        lambda_old = lambda_new;

    end

end % sjakka_sadapala_pp11