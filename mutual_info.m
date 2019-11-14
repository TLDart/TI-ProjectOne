function mi = mutual_info(query,target,step)
    %query entropy
    query_entropy = calcEntropy(query);
    
    %mutual information (mi) matrix sizes
    lines_mi = floor(1+(size(target,1)-size(query,1))/ step);
    columns_mi = floor(1+(size(target,2)-size(query,2))/step);
    mi = zeros(lines_mi, columns_mi);
    
    %lines and columns for the FOR's iterations
    [lines,columns] = size(target);
    for i = 1:step:lines-size(query,1)+1
       for j = 1:step:columns-size(query,2)+1
            %current window settings
            window = target(i:i+size(query,1)-1,j:j+size(query,2)-1);
            %window entropy
            window_entropy = calcEntropy(window);
            %codification of (X,Y)
            conj_source = shift_codification(query,window);
            % H(X,Y)
            conj_entropy = calcEntropy(conj_source);
            %I(X;Y) = H(X) + H(Y) - H(X,Y)
            mi(ceil(i/step),ceil(j/step)) = query_entropy + window_entropy - conj_entropy;
       end
    end 
end

function matrix = shift_codification(source1,source2)
    % Just a function for the codification of X and Y into 1 matrix w/ 2^8
    source1 = double(source1);
    value = sum(size(source1) == size(source2));
    if (value == 2)
        matrix = source1*power(2,8) + double(source2);
    else
        fprintf("Matrixes size dont match\n");
        fprintf("	Source1: %d %d\n",size(source1,1),size(source1,2));
        fprintf("	Source2: %d %d\n",size(source2,1),size(source2,2));
    end
end

function e = calcEntropy(source)
    %function to prevent code repetition in mutual_info()
    frequency = getfreq(source);
    probability = frequency/sum(frequency);
    probability = probability(:)';
    e = entropy(probability);
end