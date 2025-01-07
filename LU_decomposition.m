function [L,U,P] = sjakka_sadapala_pp8(A)
% SJAKKA_SADAPALA_PP8 Performs LU decomposition of a matrix using partial pivoting.
%
%   Inputs:
%       A - Input Matrix, matrix
%
%   Outputs:
%       L - Lower triangular matrix with only ones in the diagnol, matrix
%       U - Upper triangular matrix, matrix
%       P - Permutation matrix, matrix

    n_rows = size(A,1);

    % Initializing the values of L, P and U.
    L = eye(n_rows);
    U = A;
    P = eye(n_rows);

    for k = 1:(n_rows - 1)
        % Select row that maximizes absoule value of U(i,k)
        [~,i] = max(abs(U(k:n_rows, k)));
        i = i+k-1;

        % Check for Zero
        if abs(U(i,k)) > 10e-8
            % Swap the rows
            U([k,i], k:n_rows) = U([i,k],k:n_rows);
            L([k,i], 1:k-1) = L([i,k],1:k-1);
            P([k,i],:) = P([i,k],:);

            for j = (k+1):n_rows
                L(j,k) = U(j,k)/U(k,k);  % Factorizing
                U(j,k:n_rows) = U(j,k:n_rows) - (L(j,k) * U(k,k:n_rows));
            end
        end
    end

end % sjakka_sadapala_pp8