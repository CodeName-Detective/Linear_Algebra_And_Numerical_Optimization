function [D, Q, iter] = sadapala_final_p1(A, tol)
% SADAPALA_FINAL_P1 Calculates Spectrum of the matrix using Pure QR.
%
%   Inputs:
%       A - Real and Symmetric Matrix, matrix
%       tol - convergence tolerance
%
%   Outputs:
%       D - D is a matrix that contain eigen values of A
%       Q - Unitary matrix such that Q^T*A*Q = D
%       iter - iterations it took for the algorithm to converge

    n_rows = size(A,1);

    % Intializtion
    T_old = A;
    iter = 0;
    U_old = eye(n_rows);

    not_converged = true;

    % Iterate untill algorithm converges
    while not_converged
        % Calculating QR for Prior T
        [Q,R] = qr(T_old);

        % Calculating new T
        T_new = R*Q;

        U_new = U_old * Q;

        % Incrementing the iteration count.
        iter = iter+1;

        % Getting diagonal elements of matrix T_new
        T_new_diagonal = diag(T_new, 0);

        % Getting sub-diagonal elements of matrix T_new.
        T_new_sub_diagonal = diag(T_new, -1);

        if norm(T_new_sub_diagonal,2)/norm(T_new_diagonal,2) < tol
            not_converged = false;
        end

        % Assigning new values to old values for next iteration.
        T_old = T_new;
        U_old = U_new;

    end

    D = transpose(U_new)*A*U_new;
    Q = U_new;

end % sadapala_final_p1