function [f] = sadapala_pp3(n)
    % sadapala_pp3 will calculate the factorial of the number using while loop and will
    % return the value
    % n! = n*n-1*n-2*n-3*........2*1 with 0!=1 and 1!=1
    
    % n(input): Any positive interger
    % f(output): Factorial of n
    
    % Checking if the input variable is positive
    if n>0
        f = 1; % initaiting the value of f with 1
        
        % Iterating untill the value of n is less than 1 and multyplying the
        % value to f and updating f in every iteration and decrementing n
        % by 1
        while n>=1
            f = f*n;
            n = n-1; % decrementing n by 1
        end % While loop end 
    
    % Checking if the input varaible is 0
    elseif n==0
        f = 1; %Factorial of 0 is 1
    
    % Checking if the input is a non-negative integer.
    else
        error('Input Should be a non-negative integer'); % Raising the error
    
    end %if-else end
 
end % sadapala_pp3