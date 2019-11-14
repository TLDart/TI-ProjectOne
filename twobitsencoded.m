function new_arr = twobitsencoded(source, shiftsize)
%Generates a new_arr encoding the pair bits with odd bits per line using binary shifts.
%Paramethers:
%source -> Source to be encoded matrix or vector
%shiftsize -> Amount of bits to be shifted to the left.
num = length(source(1,:));
if(mod(num,2) == 1) 
    source = source (:,1:end - 1);
end
source = double(source);
new_arr = source(:,1:2:end) * 2.^shiftsize + source(:,2:2:end);
end