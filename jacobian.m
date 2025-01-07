function [r, J] = sadapala_midterm_p2(af, x, y)
%SADAPALA_MIDTERM_P2 Summary of this function goes here
%
%   Inputs:
%       af - The Coefficient list, stored as a column vector.
%       x - The X-Locations, stored as a column vector.
%       y - The Y-Locations, stored as a column vector.
%
%   Outputs:
%       r - Residual Vector, stored as a coulumn vector.
%       J - Jacobian Matrix

    % Caluculating y for the new coefficients.
    y_hat = af(1)*sin(af(2)*x)+af(3)*cos(af(4)*x);

    % Caluculating the residual.
    r = y_hat - y;

    % Calculating the Jacobian.
    J = [sin(af(2)*x), af(1)*x.*cos(af(2)*x), cos(af(4)*x), -af(3)*x.*sin(af(4)*x)];

end % sadapala_midterm_p2