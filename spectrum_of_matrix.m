function [D, Q, iter] = sadapala_final_p2(A, tol)
% SADAPALA_FINAL_P2 Calculates Spectrum of the matrix using Pure QR with
% Wilkinson Shift
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
    I = U_old;

    not_converged = true;

    % Iterate untill algorithm converges
    while not_converged

        % Getting Eigen values of 2x2 Lower right matrix
        sub_matrix = T_old(n_rows-1:n_rows, n_rows-1:n_rows);

        % Solving characterstic equation (det(A-lambda*I)) of sub_matrix
        a = 1;
        b = -(sub_matrix(1,1)+sub_matrix(2,2));
        c = sub_matrix(1,1)*sub_matrix(2,2)- sub_matrix(2,1)*sub_matrix(1,2);
        
        eig_values = [(b^2-4*a*c)/2*a, (b^2+4*a*c)/2*a];

        % getting mu value to implment Wilkinson shift.
        if abs(eig_values(1) - T_old(n_rows,n_rows)) < abs(eig_values(2) - T_old(n_rows,n_rows))
            mu = eig_values(1);
        else
            mu = eig_values(2);
        end

        
        % Calculating QR for Prior T
        [Q,R] = qr(T_old - (mu*I));

        % Calculating new T
        T_new = R*Q+(mu*I);

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

end % sadapala_final_p2