function withoutSpecFile = parsetext(path)
%This function will parse the {PATH} text and return it without any special
%symbols (including spaces, tabs)
file = fileread(path);
file = double(file);
j = 0;
for i=1:length(file)
    if(65<=file(i) && file(i)<=122)
        j=j+1;
        withoutSpecFile(j)= file(i);
    end
end
end