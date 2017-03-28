function void = checkInput(param)

% Checking STREaM input settings and returning errors if input is in

% A. Household size
if param.HHsize <=0 | param.HHsize >6 | floor(param.HHsize)~=ceil(param.HHsize)
    error('ERROR: check the household size setting. \n It should be a positive integer and lower than 7, while it is currently equal to %f',param.HHsize);
end

% B. Water consuming fixtures 
names=fieldnames(param.appliances);
appliances=[];

for i=1:length(names)
    appliances(i)=param.appliances.(names{i});
end

if sum(appliances)==0
    error('ERROR: you did not select any fixture. Please check your inputs');
end

if min(appliances)<0 || max(appliances)>=2
    error('ERROR: please check your water consuming fixture settings. Each value should be in the interval (0,1).');
end

% C. Time horizon length
if param.H<1
    error('ERROR: you are trying to generate less a trajectory shorter than 1 day. \n Your time horizon is currently %d days.', param.H); 
end

if floor(param.H)~=ceil(param.H)
    error('ERROR: the number of days you decided to generate is not integer. \n Your time horizon is currently %d days.', param.H); 
end

% D. Time sampling resolution
if param.ts < 1 || ceil(param.ts)~=floor(param.ts)
    error('ERROR: the time sampling resolution you selected is not available. Please check, the time resolution must be lower/equal 1 second and to be integer.');
end

void=1;

end