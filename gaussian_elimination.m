function [R] = sadapala_pp6(A)
% SADAPALA_PP6 Calculates the Reduced Row Echelon Form of a matrix using Gaussian Elimination with Pivoting.
%
%   Inputs:
%       A - Input Matrix, matrix
%
%   Outputs:
%       R - Reduced Row Echelon Form of Matrix A, matrix

    % Fetching the Size of the matix.
    m = size(A,1);
    n = size(A,2);
    
    % Intializing rwo and column indicators to first row and column.
    i = 1;
    j = 1;

    % While loop to iterate throughout the matrix
    while (i<= m) && (j<=n)

        % Find the row index of the max value of column j
        [~,k] = max(abs(A(i:m,j)));
        k = k+i-1;

        % Swap the rows
        A([i k], :) = A([k i], :);

        % If Pivot is Greater than Zero
        if abs(A(i,j)) > 10e-16

            % Normalize the row
            A(i, j:n) = A(i, j:n)/A(i,j);

            for k = [1:i-1 i+1:m]
                piv = A(k,j);

                % performing row reduction for non-pivot rows.
                for l = j:n
                    A(k,l) = A(k,l) - A(i,l)*piv;
                end
            end

            % Move to next row and next column
            i = i+1;
            j = j+1;
        else
            % Move to next column
            j = j+1;
        end
    end

    R = A;
end % sadapala_pp6