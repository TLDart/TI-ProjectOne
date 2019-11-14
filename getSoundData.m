function getSoundData (source,alpha,order,label)
    figure('Name','Frequency Chart','NumberTitle','off');
    frequency = getfreq(source,alpha);
    probability = frequency/sum(frequency);
    if (nargin == 4)
        drawHist(frequency,label);
    else
        drawHist(frequency,alpha);
    end
    h = entropy(probability);
    fprintf("Entropy: %.2f\n",h/order);
    %Average encoded length and variance
    avg = avglen(probability);
    var = variance(probability);
    fprintf("Average Length encoding: %.7f\n",avg/order);
    fprintf("Standard Deviation Squared: %.7f\n",var);
end