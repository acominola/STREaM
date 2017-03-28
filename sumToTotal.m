function outputTrajectory = sumToTotal(outputTrajectory)

% Sums end-uses water consumption time series to total consumption time series

names=fieldnames(outputTrajectory);

for i=1:length(names)
    if strcmp(names(i), 'TOTAL') ==1
    else
        outputTrajectory.TOTAL = outputTrajectory.TOTAL + outputTrajectory.(names{i});
    end
end

end