function [length] = sadapala_pp5(A, i, j)
% SADAPALA_PP5 This fucntion is to calculate the shrotest path of a 
% graph given adjecency matrix, starting point and ending point
%   
%   Inputs:
%       A - graph represented in matrix notation, matrix
%       i - Index of the vertex where path begins, integer, 1,2,3
%       j - Index of the vertex where path ends, integer, 1,2,3
%
%   Outputs:
%       length - Lenght of shortest path beginning and destination, integer, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15

    temp_matrix = zeros(size(A)); % Initiating the temporary matrix and Length
    length = 0;

    % Iterating till a path has been found between i and j
    while temp_matrix(i,j) == 0
    
        if length == 0
            % Case to test if there was already a path of lenght one in
            % matrix A
            temp_matrix = A;
        else
            temp_matrix = temp_matrix * A;
        end
        
        %incrementing the length by one
        length = length + 1;
        
        if length > 15
            %raise error when length of the path is greater that 15
            error('path length is grather than to 15'); % Raising the error
        end

    end

end % sadapala_pp5