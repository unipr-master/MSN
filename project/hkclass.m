function LofL = hkclass(nodeLabel, LofL, badLabel)
    
    if numel(LofL) < nodeLabel % initialize the array
        LofL(nodeLabel) = 0;
    end
    
    if badLabel == 0 % good label
        goodRank = LofL(nodeLabel);
        
        if goodRank >= 0
            LofL(nodeLabel) = LofL(nodeLabel) + 1;
        else 
            LofL(-goodRank) =  LofL(-goodRank) + 1;
        end
    else

        badRank = LofL(badLabel);

        if badRank > 0
            LofL(nodeLabel) =  LofL(nodeLabel) + badRank + 1; % +1 for the current node
            LofL(badLabel) = -1 * nodeLabel;
        elseif badRank < 0
            disp("baddy");
            disp(nodeLabel);
            disp(badRank);
            disp("===================")
            LofL = hkclass(nodeLabel, LofL, -badRank);
        end
    end

end