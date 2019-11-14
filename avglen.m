function avg = avglen(prob)
%Calculates the average length of a code based on probability and huffman
%coded
    if(size(prob,1)> size(prob,2))
		prob = prob';
    end
    avg = hufflen(prob) * prob';
end