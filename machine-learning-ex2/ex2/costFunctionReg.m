function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
h = sigmoid(X * theta);
J_v = 1/m * (-y .* log(h) - (1 - y) .* log(1 - h));
theta_wot_1 = theta(2:end);

% You need to return the following variables correctly 
J = sum(J_v, 1) + lambda/(2*m) * sum(theta_wot_1 .* theta_wot_1, 1);

grad_v = 1/m * ((h - y) .* X);
grad_0 = sum(grad_v, 1)';
regularized_grad_term = lambda/m * theta;
grad = grad_0 + regularized_grad_term;
grad(1) = grad_0(1);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta






% =============================================================

end
