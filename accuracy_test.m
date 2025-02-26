clc; clear; close

load(append(pwd, '\feature_data.mat'));

apple2(:,1)=[];
banana2(:,1)=[];
coconut2(:,1)=[];
jackfruit2(:,1)=[];
mango2(:,1)=[];
oranges2(:,1)=[];

c1=0; c2=0; c3=0; c4=0; c5=0; c6=0; 

correct=0;

for k=1:6
    all_features =zeros(32,298);
    all_features2 =zeros(298,13);
    if k==1
           wav_files = dir(append(pwd, '\Test Data\apple\*.wav'));
    end

    if k==2
           wav_files = dir(append(pwd, '\Test Data\banana\*.wav'));
    end

    if k==3
           wav_files = dir(append(pwd, '\Test Data\coconut\*.wav'));
    end
    if k==4
           wav_files = dir(append(pwd, '\Test Data\jackfruit\*.wav'));
    end
    if k==5
           wav_files = dir(append(pwd, '\Test Data\mango\*.wav'));
    end
    if k==6
           wav_files = dir(append(pwd, '\Test Data\oranges\*.wav'));
    end

    % loop through each file and extract its features and label


    for i = 1:length(wav_files)
        % read in the audio data
        [audio_data, sample_rate] = audioread(fullfile(wav_files(i).folder, wav_files(i).name));
        
        % extract the MFCC features
        features = melSpectrogram(audio_data, sample_rate);
        features2 = mfcc(audio_data,sample_rate,"LogEnergy","ignore");
        features2(:,1) = [];
        
        
        p_apple = dtw(apple, features) .* dtw(apple2,features2);

        
        p_banana = dtw(banana, features) .* dtw(banana2, features2);

        
        p_coconut = dtw(coconut, features) .* dtw(coconut2, features2);

       
        p_jackfruit = dtw(jackfruit, features) .* dtw(jackfruit2, features2);

       
        p_mango = dtw(mango, features) .* dtw(mango2, features2);

        
        p_oranges = dtw(oranges, features) .* dtw(oranges2, features2);
        
        vect = [p_apple p_banana p_coconut p_jackfruit p_mango p_oranges];
        [val, dis]=min(vect);
        
        if k==dis
            correct=correct+1;
            if k==1
                c1=c1+1;
            end
            if k==2
                c2=c2+1;
            end            
            if k==3
                c3=c3+1;
            end            
            if k==4
                c4=c4+1;
            end            
            if k==5
                c5=c5+1;
            end            
            if k==6
                c6=c6+1;
            end
        end
    end
       
end

accuracy_rate = (correct/250)*100

accuracy_rate_apple = (c1/50)*100
accuracy_rate_banana = (c2/50)*100
accuracy_rate_coconut = (c3/50)*100
accuracy_rate_jackfruit = (c4/50)*100
accuracy_rate_mango = (c5/50)*100
accuracy_rate_oranges = (c6/50)*100

