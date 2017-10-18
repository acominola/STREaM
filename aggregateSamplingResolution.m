function outputTrajectory = aggregateSamplingResolution(outputTrajectory, param)

% Aggregate 10-second sampling resolution time series to a desired
% resolution

ts = param.ts;

currHouse = outputTrajectory;
appNames = fieldnames(currHouse);
nApp = length(appNames);

% Converting data to matrix
fineData = [];
for currApp =1:nApp
    currName = appNames{currApp};
    fineData = [fineData, currHouse.(currName)'];
end

aggregateData = cumsum(fineData);
aggregateData = aggregateData(ts:ts:end,:);
aggregateData = [zeros(1,size(aggregateData,2)); aggregateData];
aggregateData = diff(aggregateData);

outputTrajectory = table2struct(array2table(aggregateData,'VariableNames', appNames),'ToScalar',true);
