function [f] = sadapala_pp2(n)
    % sadapala_pp2 will calculate the factorial of the number using for loop and will
    % return the value
    % n! = n*n-1*n-2*n-3*........2*1 with 0!=1 and 1!=1
    
    % n(input): Any positive interger
    % f(output): Factorial of n
    
    % Checking if the input variable is positive
    if n>0
        f = 1; % initaiting the value of f with 1
        
        % Iterating through n to 1 with step size of 1 and multyplying the
        % value to f and updating f in every iteration
        for i = n:-1:1
            f = f*i;
        end % for loop end 
    
    % Checking if the input varaible is 0
    elseif n==0
        f = 1; %Factorial of 0 is 1
    
    % Checking if the input is a non-negative integer.
    else
        error('Input Should be a non-negative integer'); % Raising the error
    
    end %if-else end
 
end % sadapala_pp2