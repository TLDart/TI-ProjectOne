function label = getLabel(original, opcode)
%The paramether original should be fed with the output of a unique(x)
%operation
%   This function returns an array of char type labels
%Opcodes values and explanation: 
%0 -> 2 8-bit integers
%1 -> 2 8-bit characthers
%2 -> 1 1-bit characther
%3 -> #SOUND
label = string(original);
if(opcode == 0)
     for i=1:length(original)
          label(i) = sprintf('%03d-%03d',bitand(original(i),65280)/ 2.^8,bitand(original(i),255));
     end
elseif (opcode == 1)
     for i=1:length(original)
          label(i) = sprintf('%c-%c',bitand(original(i),65280)/ 2.^8,bitand(original(i),255));
     end
elseif (opcode == 2)
    for i=1:length(original)
          label(i) = sprintf('%c',original(i));
    end
elseif (opcode == 3)
    for i=1:length(original)
       upper = (double((bitand(original(i),65280))/ 2.^8)*0.0078125) - 1 ;
       lower = (double(bitand(original(i),255))*0.0078125)- 1;
       label(i) = sprintf('%.4f|%.4f',upper,lower) ;
    end
end

end

