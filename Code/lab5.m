
func = input('Insert desired function (1 for linear, 2 for polynomial, 3 for Gaussian): ');
box_c = 10000;

%linear
if func == 1
    svmStruct = svmtrain(X, Y, 'kernel_function', 'linear', 'Method', 'QP', 'boxconstraint', box_c, 'showplot', 'true');
    C = svmclassify(svmStruct,X,'showplot',true);

%polynomial
elseif func == 2
    p = input('Insert polynomial degree: ');
    svmStruct = svmtrain(X, Y, 'kernel_function', 'polynomial', 'polyorder', p, 'Method', 'QP', 'boxconstraint', box_c, 'showplot', 'true');
    C = svmclassify(svmStruct,X,'showplot',true);

%Gaussian RBF
elseif func == 3
    sigma = input('Insert sigma: ');
    box_c = input('Insert value for boxconstraint: ');
    svmStruct = svmtrain(X, Y, 'kernel_function', 'rbf', 'rbf_sigma', sigma, 'Method', 'QP', 'boxconstraint', box_c, 'showplot', 'true');
    C = svmclassify(svmStruct,X,'showplot',true);

end

err_rate = sum(Y~= C)/100
number_support_vectors = size(svmStruct.SupportVectors,1)