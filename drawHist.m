function drawHist(freq,alpha)
%Draw an histogram given a frequency {FREQ}, and an alphabet {ALPHA}
    bar(freq);
    set(gca,'XTick',1:length(alpha),'XTickLabel',alpha);
    xtickangle(45);
end