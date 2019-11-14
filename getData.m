function getData(source, alpha, order)
%This function generates all the data for a source: Entropy frequency chart
%average length of encoding according to huffman and Standard deviation
%Paramethers:
%source - Specifies the source, need to be either a matrix or a vector
%alpha - Specifies the alphabet used in bar graph
%order - Specifies the order of the entropy Ex:groups of 2 -> order 2.
    figure('Name','Frequency Chart','NumberTitle','off');
    frequency = getfreq(source);
    probability = frequency/sum(frequency);
    if (isempty(alpha) == 1)
        drawHist(frequency,unique(source));
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