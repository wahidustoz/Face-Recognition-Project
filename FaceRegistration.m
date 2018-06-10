clc
clear

Database = dir ('/Users/mac/Documents/MATLAB/Dataset');

Features = zeros(1,34596);
labels = { };
k = 1;
for i = 3 : length(Database)
    PersonF = dir (strcat('/Users/mac/Documents/MATLAB/Dataset/',Database(i).name));
    for j = 3 : length(PersonF)
        faceImg = imread(strcat('/Users/mac/Documents/MATLAB/Dataset/',Database(i).name, '/' , PersonF(j).name));
        faceGray = rgb2gray(faceImg);
        Features(k,:) = extractHOGFeatures(faceGray);
        labels{k} =  Database(i).name;
        k=k+1;
    end
end

Mdl = fitcecoc(Features,labels);

% [label,score] = predict(Mdl,Features(1,:));

% save trainedModel.mat Mdl
% for i = 1 : 2
%     if(i==1)
%         plot(Features(1,:), '.r');
%     else
%         hold on;
%         plot(Features(2,:), '.b');
%     end
% end
% 
% 
% FeatureTableAndLabel = [array2table(Features) cell2table(labels')];

