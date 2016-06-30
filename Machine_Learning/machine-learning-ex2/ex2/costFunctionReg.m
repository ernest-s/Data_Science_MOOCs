function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

%==================== Ernest Code Begins Here ===================


% finding theta transpose x
theta_tran_x = X * theta;

% finding hypothesis
hypo = sigmoid(theta_tran_x);

%finding cost for non-regularized
J0 = (-1/m)*((y'*log(hypo))+((1.-y)'*(log(1.-hypo))));

% additional term in cost for regularization
J1 = 0;
indices = 2:length(theta);
for i=indices;
    J1 = J1 +(lambda/(2*m)*theta(i)^2);
end;

% finding total final cost
J = J0+J1;




% finding gradient for non-regularized
grad1 = (X'*(hypo-y))./m;

% finding gradient for regularized
grad2 = zeros(size(grad1));

for i=indices;
    grad2(i) = (lambda/m*theta(i));
end;

% finding final total gradient
grad = grad1 + grad2;

%================== Ernest Code Ends Here ========================




% =============================================================

end
