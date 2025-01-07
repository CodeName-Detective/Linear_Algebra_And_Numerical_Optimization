import numpy as np

def rayleighQuotient(A, v0, tol, itermax):
    # Rayleigh Quotient function to calculate Eigenvalue and Eigenvector for a square matrix.
    #
    #   Inputs:
    #       A - A real and square matrix, matrix.
    #       v0 - Initial Vector.
    #       tol - Tolerance for convergence.
    #       itermax - Maximum number of iterations.
    #   Outputs:
    #       l - Resulting Eigenvalue.
    #       v - Associating Eigenvector, vector.
    
    # Normalizing the vector.
    v_old = v0/np.linalg.norm(v0,ord = 2)
    
    # Caluculating Eigenvalue using Rayleigh quotient.
    lambda_old = np.dot(np.transpose(v_old),np.dot(A,v_old))
    
    iter_count = 0
    not_converged = True
    
    # Iterating untill convergence.
    while not_converged:
        # Calculating the new eigen vector
        v_new = np.dot(np.linalg.inv(A-lambda_old*np.eye(A.shape[0])),v_old)
        # Normalizing the vector.
        v_new = v_new/np.linalg.norm(v_new,ord = 2)
        
        # Caluculating Eigenvalue using Rayleigh quotient.
        lambda_new = np.dot(np.transpose(v_new),np.dot(A,v_new)) 
        iter_count += 1
        
        # Checking for Convergence criteria.
        if abs((lambda_new-lambda_old)/lambda_new) < tol:
            not_converged = False
            l = lambda_new
            v = v_new
        # Checking if maximum iteration reached.
        elif iter_count >= itermax:
            raise Exception('Error: Maximum Number of Iterations')
        
        # Assigning new values to old values for next iteration.
        v_old = v_new
        lambda_old = lambda_new
    
    return l,v