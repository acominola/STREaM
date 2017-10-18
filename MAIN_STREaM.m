% This is the MAIN file to run STREaM (STochastic REsidential
% wAter end use Model)

% AVAILABLE FIXTURES
% 1. toilet
% 2. shower
% 3. faucet
% 4. clothes washer
% 5. dishwasher
% 6. bathtub

% COMMENTS
% In the current version, probabilities of duration, timing, volume and
% number of uses per day are considered independent. At least volume and
% duration should be linked.

%% ::: INPUT SETTINGS :::

% --- A. Household size setting
param.HHsize = 2; % This parameter should be in the interval (1,6).
% From 1 to 5, it indicates the number of people living in the
% house. 6 means ">5".


% --- B. Water consuming fixtures selection
% Legend:
% 0 = not present
% 1 = present

param.appliances.StToilet = 1;
param.appliances.HEToilet = 0;

param.appliances.StShower = 1;
param.appliances.HEShower = 0;

param.appliances.StFaucet = 1;
param.appliances.HEFaucet = 0;

param.appliances.StClothesWasher = 1;
param.appliances.HEClothesWasher = 0;

param.appliances.StDishwasher = 1;
param.appliances.HEDishwasher = 0;

param.appliances.StBathtub = 1;
param.appliances.HEBathtub = 0;

% --- C. Time horizon length setting
param.H = 365; % It is measured in [days]

% --- D. Time sampling resolution
param.ts = 1; % It is measured in [10 seconds] units. The maximum resolution allowed is 10 seconds (param.ts = 1).

% Setting the seed
rng(1);

% Parameters structure settings and check
% Checking input consistency
temp=checkInput(param);
clearvars -except param

%% ::: LOADING COMPLETE DATABASE :::
homeFolder = pwd;
addpath([homeFolder '/_DATA']); % Path to the folder where the database.mat file is stored
load database.mat

%% ::: WATER END-USE TIME SERIES GENERATION :::

% Initialization
outputTrajectory = initializeTrajectories(param);

% End-use water use time series generation
outputTrajectory = generateConsumptionEvents(outputTrajectory, param, database);
disp('End-use consumption trajectories created');

% Total water use time series aggregation
outputTrajectory = sumToTotal(outputTrajectory);
disp('Total consumption trajectory created');

% Data scaling to desired sampling resolution
outputTrajectory = aggregateSamplingResolution(outputTrajectory, param);
disp('Data scaled to desired sampling resolution');

% Saving
save outputTrajectory.mat outputTrajectory
