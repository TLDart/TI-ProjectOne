function freq = getfreq(P,alfa)
   %Given a set {P} and an optional alphabet {ALFA} (generates one if not
   %specified), return the frequency of the alphabet {ALPHA} on the set {P}
    P = P(:);
    if (nargin == 1)
        x = tabulate(P);
        a = x(:,2);
        b = x(:,3);
        freq = a(find(b(:) > 0));
    else
        freq = zeros(size(alfa));
        for k=1:length(alfa)
            indices = find(P == alfa(k));
            freq(k) = length(indices);
        end
    end
end
