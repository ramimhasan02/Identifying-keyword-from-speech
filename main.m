clc; clear; close
% Audio Recording

recObj=audiorecorder(8000,8,1);
recDuration = 3;
disp("Begin speaking.")
recordblocking(recObj,recDuration);
disp("End of recording.")
pause(1)
play(recObj);
y = getaudiodata(recObj);
audiowrite('d:\test.wav',y,8000);
[input,fs]=audioread('d:\test.wav');
m_input=melSpectrogram(input,8000);
m_input2=mfcc(input,8000,"LogEnergy","ignore");
% m_input2(:,1)=[];

load(append(pwd, '\feature_data.mat'));

labels = {'apple', 'banana', 'coconut', 'jackfruit', 'mango', 'oranges'};

% apple2(:,1)=[];
p_apple = dtw(apple, m_input) .* dtw(apple2, m_input2);

% banana2(:,1)=[];
p_banana = dtw(banana, m_input) .* dtw(banana2, m_input2);

% coconut2(:,1)=[];
p_coconut = dtw(coconut, m_input) .* dtw(coconut2, m_input2);

% jackfruit2(:,1)=[];
p_jackfruit = dtw(jackfruit, m_input) .* dtw(jackfruit2, m_input2);

% mango2(:,1)=[];
p_mango = dtw(mango, m_input) .* dtw(mango2, m_input2);

% oranges2(:,1)=[];
p_oranges = dtw(oranges, m_input) .* dtw(oranges2, m_input2);

vect = [p_apple p_banana p_coconut p_jackfruit p_mango p_oranges];

% vect = [p_apple p_banana p_jackfruit p_mango];
        
[val, dis]=min(vect);

disp(labels(dis))