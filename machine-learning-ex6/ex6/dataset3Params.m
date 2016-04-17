function [C, sigma, pred_err] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.1;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

cand = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
pred_err = zeros(length(cand), length(cand));
return;

for c = 1:length(cand)
  for sig = 1:length(cand)
    model = svmTrain(X, y, cand(c), @(x1, x2) gaussianKernel(x1, x2, cand(sig)));
    predictions = svmPredict(model, Xval);
    pred_err(c, sig) = mean(double(predictions ~= yval));
  end
end

[pred_err_min, pred_err_c_v] = min(pred_err, [], 1);
[pred_err_min, pred_err_sig] = min(pred_err_min, [], 2);
pred_err_c = pred_err_c_v(pred_err_sig);
C = cand(pred_err_c);
sigma = cand(pred_err_sig);


% =========================================================================

end
