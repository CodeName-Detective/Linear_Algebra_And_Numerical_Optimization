def newtonRaphson(g, x0, eps, delta, itermax):
    # Newton Raphson Algorithm for root finding.
    #
    #   Inputs:
    #       g - Function for which we want to find the root for.
    #       x0 - Initial value.
    #       eps - criteria for convergence.
    #       delta - criteria for divergence.
    #       itermax - maximum number of iterations the algorithm should run
    #   Outputs:
    #       x - root of the function g.
    #       iter - iterations it took for the algorithm to converge
    
    # Initialization
    old_x = x0
    iter = 0

    not_converged = True
    
    # Iterate untill algorithm converges
    while not_converged:
        f, fx = g(old_x)
        
        # updating the value of the x
        x = old_x - (f/fx)
        
        # incrementing the iteration count
        iter = iter + 1
        
        # Checking for convergence
        if abs(x - old_x) < eps:
            not_converged = False
        # Checking for diivergence
        elif abs(x - old_x) > delta:
            raise Exception('Error: Divergence')
        # Checkig for if maximum iteration reached
        elif iter >= itermax:
            raise Exception('Error: Maximum Number of Iterations')
        
        old_x = x

    return x, iter