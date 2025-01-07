function [x, iter] = sjakka_sadapala_pp9(g, x0, eps, delta, itermax)
% SJAKKA_SADAPALA_PP9 Newton Raphson Algorithm for root finding.
%
%   Inputs:
%       g - Function to find the root.
%       x0 - initial guess.
%       eps - criteria for convergence.
%       delta - criteria for divergence.
%       itermax - maximum number of iterations. 
%
%   Outputs:
%       x - root of the function g.
%       iter - number of iterations needed for the algorithm to converge

    % Intialize the intial guess
    old_x = x0;
    iter = 0;

    not_converged = true;

    % Iterate until the algorithm converge
    while not_converged
        [f,fx] = g(old_x);

        % update the value of x
        x = old_x - (f/fx);

        % increment the iteration count
        iter = iter + 1;

        % check for convergence
        if abs(x - old_x) < eps
            not_converged = false;

        % check for divergence
        elseif abs(x - old_x) > delta
            error('Algorithm Diverged!!!')

        % check for maximum number of iterations  
        elseif iter >= itermax
            error('Maximum iterations reached!!!')
        end

        old_x = x;

    end

end % sjakka_sadapala_pp9