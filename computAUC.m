function Bin = computAUC(edit, manu,  mask, Omask)

manu = im2uint8(mat2gray(manu));
%% compare 
TP = double(0);
TN = double(0);
FP = double(0);
FN = double(0);
falsepoint   = double(0);
% vessel_count = sum(manu(:)==1);
vessel_count = double(0);
non_vessel_count = double(0);
background_count = double(0);
%
manual = double(manu);
for i=1:size(manual,1)
    for j=1:size(manual,2)
        if (manual(i,j) == 255)
            vessel_count = vessel_count + 1;
        end
    end
end

for i=1:size(mask,1)
    for j=1:size(mask,2)
        if Omask(i,j)==255
            background_count = background_count + 1;
        end
    end
end

non_vessel_count = background_count - vessel_count;

manubw=im2bw(manu);
ed =im2bw(edit);

%Note : This is for drive :
for i=1:size(edit,1)
    for j=1:size(edit,2)
        if Omask(i,j)==255
            if ed(i,j)==0 && manubw(i,j)==1
                FN = FN + 1;
            end
            if ed(i,j)==0 && manubw(i,j)==0
                TN = TN + 1;
            end
            if ed(i,j)==1 && manubw(i,j)==1
                TP = TP + 1;
            end
            if ed(i,j)==1 && manubw(i,j)==0
                FP = FP + 1;
            end
        end
    end
end

%% compute and show result
Acc = (TP + TN) / (vessel_count + non_vessel_count);
% Ac  = (TP + TN) / (TP + TN + FP + FN);
SN  = TP / (TP + FN);
SP  = TN / (TN + FP);
Pr  = TP / (TP + FP);
NPV = TN / (TN + FN);
Recal= TP / (TP + FN);
AUC = (SN+SP)/2;
TPR = TP / (vessel_count);
FPR = FP / (non_vessel_count);
TNR = TN / (vessel_count);
FNR = FN / (non_vessel_count);
LRp = TPR / FPR;
LRn = FNR / TNR;
% F1score = (2*TP) / (2*TP + FP + FN);
Fmeasure= 2*(Pr*Recal)/(Pr+Recal);

disp(strcat('TPR: ',num2str(TPR)));
disp(strcat('FPR: ',num2str(FPR)));
disp(strcat('Accuracy: ',num2str(Acc)));
disp(strcat('Sensitivity: ',num2str(SN)));
disp(strcat('Specificity: ',num2str(SP)));
disp(strcat('Precision: ',num2str(Pr)));
disp(strcat('negative predictive value: ',num2str(NPV)));
disp(strcat('Recall: ',num2str(Recal)));
disp(strcat('Area Under Curve: ',num2str(AUC)));
disp(strcat('Positive likelihood ratio: ',num2str(LRp)));
disp(strcat('Negative likelihood ratio: ',num2str(LRn)));
disp(strcat('Fmeasure: ',num2str(Fmeasure)));
% disp(strcat('Fmeasure, the harmonic mean of precision and sensitivity: ',num2str(Fmeasure)));

end
