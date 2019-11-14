function var = variance(prob)
%Given a given probability {PROB} set calculates the variance of that set
average = avglen(prob);
    if(size(prob,1)> size(prob,2))
		prob = prob';
    end
    xsquared = hufflen(prob).^2 * prob';
    var = xsquared - average ^2;
    
end
