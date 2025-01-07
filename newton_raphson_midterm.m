function [a,n] = sadapala_midterm_p1(fdf,a0, x, y, tol)
%SADAPALA_MIDTERM_P1 Performing Nonlinear regression using Newton Rahpson Minimzation.
%
%   Inputs:
%       fdf - An external function that returns residual vector and Jacobian matrix.
%       a0 - The initial guess at the coefficients, stored as a column vector.
%       x - The predictor data to fit, stored as a column vector.
%       y - The response data to fit, stored as a column vector.
%       tol - Tolerance value to consider the full step is very small.
%
%   Outputs:
%       a - A column array the same length as a0 with the converged coefficients.
%       n - The number of iterations it took to converge.

    % Getting Jacobian, Residual vector and error for initial guess
    [r, J] = fdf(a0,x,y);
    error_new = sqrt(sum(r.^2)); % 2nd norm of residuals.
    
    % Intiializing Variables
    n = 0;
    a = a0;
    not_converged = true; % Setting a convergence status
    
    % Performing convergence operation unitll not_converged status became
    % false
    while not_converged
        delta = - J\r; % Calculating the full step.
        delta_2_norm = sqrt(sum(delta.^2)); % Calculating full step two norm.
    
        if delta_2_norm < tol
            % If the full step is too small i.e., 2nd norm of full step is
            % less than tolerance we will update the not_converged status
            % to fals.
            not_converged = false;
        else
            
            error_old = error_new;
            a_old = a;
            
            damped_factor = 1; % Setting the damped factor to 1 to perform full step.
             
            a = a + damped_factor*delta; % Updating the coefficients by performing a full step.

            [r,J] = fdf(a,x,y); % Getting residual vector and jacobian for the new updated weights
            error_new = sqrt(sum(r.^2)); % 2nd norm of residuals.
            
            n = n+1; % Updating the iteration counter.

            if n>= 100
                % Raise the error if the function does not converge after
                % 100 iterations.
                error('The function does not converge within 100 iterations');
            end
    
            damped_factor_scaling_counter = 0; % Setting up a counter to track simple damped iterations.

            % Performing the simple damped iteration when old error is
            % smaller than new error, that the algorithm is overshooting
            % from the minimum.
            while error_old < error_new
                damped_factor = damped_factor/2; % Scaling down the damped factor by 2.

                a = a_old + damped_factor*delta; % Re-perfrom the update step with new damped factor.

                [r,J] = fdf(a,x,y); % Getting residual vector and jacobian for the new updated weights.
                error_new = sqrt(sum(r.^2)); % 2nd norm of residuals.

                damped_factor_scaling_counter = damped_factor_scaling_counter + 1;
    
                if damped_factor_scaling_counter > 10
                    % Break the damped iteration loop if the after 10
                    % damped iterations.
                    break
                end
    
            end
    
        end
    
    end

end % sadapala_midterm_p1