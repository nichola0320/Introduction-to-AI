clear; close all; clc;

%data 불러오기
%meas 1 column: sepal length
%meas 2 column: sepal width
%meas 3 column: petal length
%meas 4 column: petal width
%species: flower 종류

load fisheriris;

%% draw figure(sepal length, width)
figure;
plot(meas(:,1), meas(:, 2), 'k.');
xlabel('Sepal length');
ylabel('Sepal width');

% express each species by numbers
% 1: setosa, 2: versicolor, 3: virginica
spcs2num = [];
for k=1:1:length(species)
    if strcmp(species(k), 'setosa') == 1
        spcs2num(k,1) = 1;
    elseif strcmp(species(k), 'versicolor') == 1
        spcs2num(k,1) = 2;
    elseif strcmp(species(k), 'virginica') == 1
        spcs2num(k,1) = 3;
    end
end

%% paint different colors with each species
idx1 = find(spcs2num == 1); % find only setosa
idx2 = find(spcs2num == 2); % find only versicolor
idx3 = find(spcs2num == 3); % find only virginica

figure;
plot(meas(idx1, 1), meas(idx1, 2), 'r.'); hold on; % red dot for setosa
plot(meas(idx2, 1), meas(idx2, 2), 'go'); hold on; %green circle for versicolor
plot(meas(idx3, 1), meas(idx3, 2), 'bx'); hold on; %blue X for virginica
xlabel('Sepal length');
ylabel('Sepal width');

figure;
plot(meas(idx1, 3), meas(idx1, 4), 'r.'); hold on; % red for setosa
plot(meas(idx2, 3), meas(idx2, 4), 'go'); hold on; %green for versicolor
plot(meas(idx3, 3), meas(idx3, 4), 'bx'); hold on; %blue for virginica
xlabel('Petal length');
ylabel('Petal width');

%% divide 학습데이터 & 평가데이터
% 두개의 그룹만 먼저 나눠보기: versicolor vs. virginica
% 오늘은 편의상 아래와 같이
% 1~50: setosa, 51~100: versicolor, 101~150: virginica
% 학습데이터. 71~100: versicolor, 121~150: virginica 총 60개
% 평가데이터. 51~70: versicolor, 101~120: virginica 총 40개

tr_id = [71:1:100 121:1:150];
Training_data = meas(tr_id,:);
Training_label = spcs2num(tr_id,:);

ts_id = [51:1:70 101:1:120];
Test_data = meas(ts_id, :);
Test_label = spcs2num(ts_id,:);