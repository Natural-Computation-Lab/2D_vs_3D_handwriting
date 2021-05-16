tab_KNN=[91.84, 90.14, 89.12, 90.14, 89.12, 91.16, 89.12, 91.5, 92.86, 89.8, 92.18, 90.82, 92.52, 89.8, 90.48, 87.76, 91.5, 91.84, 88.1, 90.82];
tab_SVM=[90.82, 89.46, 88.78, 90.82, 89.8, 90.14, 90.48, 91.16, 90.48, 88.1, 88.44, 93.88, 93.2, 90.48, 90.82, 91.16, 91.84, 92.86, 90.14, 91.84];
watch_KNN=[88.1, 88.44, 86.73, 88.1, 87.41, 88.1, 86.05, 89.46, 84.69, 88.44, 87.76, 87.41, 89.46, 87.76, 87.76, 88.78, 87.41, 84.35, 89.12, 87.07];
watch_SVM=[88.78, 91.16, 88.78, 89.12, 88.44, 88.1, 86.39, 88.78, 87.76, 89.46, 88.1, 90.14, 89.12, 89.12, 87.76, 89.46, 90.14, 86.73, 93.54, 89.12];
tab_RF=[95.24, 95.92, 92.52, 92.18, 95.24, 93.88, 95.92, 95.58, 96.6, 92.18, 95.24, 95.24, 95.24, 94.22, 93.2, 94.56, 94.56, 97.62, 94.22, 95.58];
watch_RF=[89.12, 89.8, 91.16, 90.82, 90.14, 89.8, 89.8, 90.82, 88.1, 90.14, 90.48, 90.82, 87.76, 91.84, 89.46, 89.8, 89.12, 87.76, 88.78, 89.8];

% mean and standard deviation
fprintf("RF (tab: %.3f+-%.3f)\t (watch: %.3f+-%.3f)\n",mean(tab_RF),std(tab_RF),mean(watch_RF),std(watch_RF));
fprintf("SVM (tab: %.3f+-%.3f)\t (watch: %.3f+-%.3f)\n",mean(tab_SVM),std(tab_SVM),mean(watch_SVM),std(watch_SVM));
fprintf("KNN (tab: %.3f+-%.3f)\t (watch: %.3f+-%.3f)\n",mean(tab_KNN),std(tab_KNN),mean(watch_KNN),std(watch_KNN));

% normality test -  Anderson-Darling test
%%
% h = adtest(x) returns a test decision for the null hypothesis that the data 
% in vector x is from a population with a normal distribution, using the 
% Anderson-Darling test.
% The alternative hypothesis is that x is not from a population with a normal 
% distribution. The result h is 1 if the test rejects the null hypothesis at the 5% 
% significance level, or 0 otherwise.
if(adtest(tab_KNN)==0)
    fprintf("cannot reject null hyphotesis - tab KNN\n");
else
    fprintf("reject null hyphotesis - tab KNN\n");
end

if(adtest(tab_SVM)==0)
    fprintf("cannot reject null hyphotesis - tab SVM\n");
else
    fprintf("reject null hyphotesis - tab SVM\n");
end

if(adtest(tab_RF)==0)
    fprintf("cannot reject null hyphotesis - tab RF\n");
else
    fprintf("reject null hyphotesis - tab RF\n");
end

if(adtest(watch_KNN)==0)
    fprintf("cannot reject null hyphotesis - watch KNN\n");
else
    fprintf("reject null hyphotesis - watch KNN\n");
end

if(adtest(watch_SVM)==0)
    fprintf("cannot reject null hyphotesis - watch SVM\n");
else
    fprintf("reject null hyphotesis - watch SVM\n");
end

if(adtest(watch_RF)==0)
    fprintf("cannot reject null hyphotesis - watch RF\n");
else
    fprintf("reject null hyphotesis - watch SVM\n");
end

data_group=[tab_KNN',tab_SVM',tab_RF',watch_KNN',watch_SVM',watch_RF'];
group={'Tablet-KNN','Tablet-SVM','Tablet-RF','Smartwatch-KNN','Smartwatch-SVM','Smartwatch-RF'};
[p,tbl,stats] = anova1(data_group,group);
figure
[results,means] = multcompare(stats,'CType','bonferroni')
