function outputTrajectory = initializeTrajectories(param)

% Initializes empty water end-use trajectories

H10seconds = timeConversion(param.H);
names=fieldnames(param.appliances);
appliancesVector=zeros(1,length(names));

for i=1:length(names)
    currentAppName = names{i};
    currentAppValue = param.appliances.(currentAppName);
    
    appliancesVector(i) = currentAppValue;
    
    % Initializing empty trajectories
    if currentAppValue > 0
        outputTrajectory.(currentAppName)=zeros(1,H10seconds);
    end
end
outputTrajectory.TOTAL = zeros(1,H10seconds);

end
