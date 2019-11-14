function photoFind(queryFilename,targetFilename,step,msg)
   %user friendly funct for the mutual information given:
        % QUERYFILENAME, TARGETFILENAME
        % step 
        % msg for the print below
   % reading the target and the query files
   target = imread(targetFilename);
   query = imread(queryFilename);
   %calc of mutual information
   mi = mutual_info(query,target,step);
   % getting true x,y coords for the rectangle
   [x,y] = getCoords(mi,step);
   %msg
   fprintf("%s: %f\n    x: %d y %d\n\n",msg,mean(mi,'all'),x,y);
   %rectangle print
   imshow(target);
   rectangle('Position', [x,y,size(query,2),size(query,1)], 'LineWidth', 2, 'LineStyle', '--', 'EdgeColor', 'r');
end