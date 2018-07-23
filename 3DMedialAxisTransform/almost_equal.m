function [yesorno] = almost_equal(a, b)
    epsilon = 0.1; %TRY DIFFERENT
    
    if abs(a - b) < epsilon
        yesorno = true;
    else
        yesorno = false;
    end
    
end