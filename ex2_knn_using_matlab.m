clear; close all; clc;

load fisheriris;
% 1: versicolor, 2:virginica
spcs2num = [];
for k=1:1:length(species)
    if strcmp(species(k), 'versicolor') == 1
        spcs2num(k,1) = 1;
    elseif strcmp(species(k), 'virginica') == 1
        spcs2num(k,1) = 2;
    end
end

%% training data and test data
% versicolor and virginica
% 1~50: setosa, 51~100:versicolor, 101~150: virginica
% training data. 71~100: versicolor, 121~150: virginica 총 60개
% test data. 51~70: versicolor, 101~120: virginica 총 40개

% 일단, 사용할 특징: sepal length와 width = 1열과 2열
tr_id = [71:1:100 121:1:150];
Training_data = meas(tr_id, 1:2);
Training_label = spcs2num(tr_id, :);

ts_id = [51:1:70 101:1:120];
Test_data = meas(ts_id, 1:2);
Test_label = spcs2num(ts_id, :);

%% 매트랩 내부 함수를 이용한 knn모델 만들기(학습-결정해야할 것: k, 거리를 어떤 방법으로 할지)
k = 3; % 인접한 이웃 3개를 보겠다.
mdl = fitcknn(Training_data, Training_label, 'NumNeighbors', k, 'Distance', 'euclidean');
% mdl = fitchnn(Training_data, Training_label, 'NumNeighbors', k); 
% ==> knn에서 거리를 계산하는 default 방법은 유클리디안 이므로, 이렇게 작성해도 됨

%2줄이면 끝

%% 평가해보기 #1
% test의 첫번째 데이터를 넣어보자
result = predict(mdl, Test_data(1,:))

%% 평가해보기 #2: 한번에 다해보기
result = predict(mdl, Test_data)


%% 그려보기
figure;
subplot(211); bar(Test_label); axis tight;
subplot(212); bar(result); axis tight;


figure;
subplot(311); bar(Test_label); axis tight;
subplot(312); bar(result); axis tight;
subplot(313); bar(Test_label - result); axis tight;