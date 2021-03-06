function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% ===================== Ernest Code Begins here ===========================

% predicting hidden layer (A1)

% adding ones for intercept
X = [ones(m, 1) X];

% initializing A1
A1 = zeros(m, size(Theta1,1));

% predicting probabilities
A1 = sigmoid(X*Theta1');

% predicting output layer

p = predictOneVsAll(Theta2, A1);
% ===================== Ernest Code Ends here =============================







% =========================================================================


end
