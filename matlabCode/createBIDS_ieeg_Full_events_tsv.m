%% Template Matlab script to create an BIDS compatible sub-01_ses-01_task-FullExample-01_run-01_events.tsv file
% This example lists all required and optional fields.
% When adding additional metadata please use camelcase
% 
%
% anushkab, 2018
%%
clear all
root_dir = '../';
project_label = 'templates';
sub_id = '01';
ses_id = '01';
task_id = 'FullExample'; 

acquisition = 'ieeg';
run_id='01';


events_tsv_name = fullfile(root_dir,project_label,...
  ['sub-' sub_id],...
              ['ses-' ses_id],acquisition,...
              ['sub-' sub_id ...
              '_ses-' ses_id ...
              '_task-' task_id ...
              '_run-' run_id '_events.tsv']);
              
%% make a _events table and save 
%% CONTAINS a set of REQUIRED and OPTIONAL columns
%the _events.tsv file SHOULD contain the electrical stimulation parameters in addition to other events

%REQUIRED Onset (in seconds) of the event  measured from the beginning of the acquisition of the first volume in the corresponding task imaging data file.  If any acquired scans have been discarded before forming the imaging data file, ensure that a time of 0 corresponds to the first image stored. In other words negative numbers in “onset” are allowed.
onset = [0]'; 

% REQUIRED. Duration of the event (measured  from onset) in seconds.  Must always be either zero or positive. A "duration" value of zero implies that the delta function or event is so short as to be effectively modeled as an impulse.
duration = [0]'; 

%OPTIONAL Primary categorisation of each trial to identify them as instances of the experimental conditions
trial_type={' '};

%OPTIONAL. Response time measured in seconds. A negative response time can be used to represent preemptive responses and “n/a” denotes a missed response.
response_time=[0]';

%OPTIONAL Represents the location of the stimulus file (image, video, sound etc.) presented at the given onset time
stim_file={' '}; 

%OPTIONAL Hierarchical Event Descriptor (HED) Tag.
HED= {' '}; 

%electrical stimulation parameters
%SHOULD Examples: “biphasic”, “monophasic”, “n/a”
elecstim_type={' '};

%SHOULD Electrode (pair) that was stimulated needs to match a name in _electrodes.tsv (e.g. “LT01”) or in case of bipolar stimulation it must match a pair separated by a dash (e.g. “LT01-LT02”)
elecstim_site={' ' };

%SHOULD Electrical current in ampere.
elecstim_current=[0]';



t = table(onset,duration,trial_type,response_time,stim_file,HED,elecstim_type,elecstim_site,elecstim_current);

writetable(t,events_tsv_name,'FileType','text','Delimiter','\t');
