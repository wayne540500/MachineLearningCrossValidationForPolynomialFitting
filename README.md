# MachineLearningCrossValidationForPolynomialFitting

Requirement:
![image](https://github.com/wayne540500/MachineLearningCrossValidationForPolynomialFitting/assets/69573286/85434361-e33c-413e-989d-a7a8bae68493)


First I set D = 1:100
Then, I use cross validation method to check the value of d. (cross validation helps 
improve the reliability and robustness of your models, leading to better decisionmaking and more accurate predictions when working with data.)
From the picture on the right we can tell value of d: When D approach 6 the values of 
the function stay the same, the decrease of validation error is essentially small and 
start to bounce back. So I think D = 6 is the best choice.

![image](https://github.com/wayne540500/MachineLearningCrossValidationForPolynomialFitting/assets/69573286/58dee12d-5f1d-4948-9982-8cabca3aee5d)
(picture on the right : green line is testing error, red line is training error)

When D = 6 we can see the curve looks like below:

![image](https://github.com/wayne540500/MachineLearningCrossValidationForPolynomialFitting/assets/69573286/8e188156-0643-462e-ab28-43a134d60e25)
