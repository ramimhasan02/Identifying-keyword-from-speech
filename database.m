clc;
clear all;
close all;

labels = {'apple', 'banana', 'coconut', 'jackfruit', 'mango', 'oranges'};

for k=1:length(labels)
    all_features =zeros(32,298);
    all_features2 =zeros(298,13);
    if k==1
           wav_files = dir(append(pwd, '\apple\*.wav'));
    end

    if k==2
           wav_files = dir(append(pwd, '\banana\*.wav'));
    end

    if k==3
           wav_files = dir(append(pwd, '\coconut\*.wav'));
    end
    if k==4
           wav_files = dir(append(pwd, '\jackfruit\*.wav'));
    end
    if k==5
           wav_files = dir(append(pwd, '\mango\*.wav'));
    end
    if k==6
           wav_files = dir(append(pwd, '\oranges\*.wav'));
    end

    % loop through each file and extract its features and label
    for i = 1:length(wav_files)
        % read in the audio data
        [audio_data, sample_rate] = audioread(fullfile(wav_files(i).folder, wav_files(i).name));
        
        % extract the MFCC features
        features = melSpectrogram(audio_data, sample_rate);
        features2 = mfcc(audio_data,sample_rate,"LogEnergy","ignore");
        
        % append the features to the all_features array
    %     all_features = [all_features, features];
        
         all_features = all_features+features;
         all_features2 = all_features2+features2;
       
    end
       all_features=all_features./(length(wav_files));
       all_features2=all_features2./(length(wav_files));
       
       if k==1
           apple=all_features;
           apple2=all_features2;
       end

       if k==2
           banana=all_features;
           banana2=all_features2;
       end
       if k==3
           coconut=all_features;
           coconut2=all_features2;
       end
       if k==4
           jackfruit=all_features;
           jackfruit2=all_features2;
       end
       if k==5
           mango=all_features;
           mango2=all_features2;
       end
       if k==6
           oranges=all_features;
           oranges2=all_features2;
       end
end


save(append(pwd, '\feature_data.mat'));




