/*
 * The following script exemplifies the use the SupportVectorMachines HPCC bundle
 * in training, classifying and analysing SVMs.
 */

// Imports
IMPORT ML_Core;
IMPORT ML_Core.Types as Types;
IMPORT SupportVectorMachines as SVM;
IMPORT SVM.LibSVM;
IMPORT $;

x_train := $.SVM_convert02.myIndTrainDataNF;
y_train := $.SVM_convert02.myDepTrainDataNF;

x_test := $.SVM_convert02.myIndTestDataNF;
y_test := $.SVM_convert02.myDepTestDataNF;


// Define a set of model parameters
// Here these are all explicitly defined, but any/all may be omitted in later function
// calls if the default values are preferred.
svmType    := LibSVM.Types.LibSVM_Type.EPSILON_SVR;
kernelType := LibSVM.Types.LibSVM_Kernel.RBF;
gamma      := 0.4;
C          := 1.5;
degree     := 5;
coef0      := 0.0;
nu         := 0.5;
eps        := 0.001;
p          := 0.1;
shrinking  := true;
prob_est   := false;
scale      := true;
nr_weight  := 1;
lbl        := DATASET([], SVM.Types.I4Entry);
weight     := DATASET([], SVM.Types.R8Entry);

// Define model parameters
SVMSetup := SVM.SVR(
  NAMED X           := x_train,
  NAMED Y           := y_train,
  NAMED svmType     := svmType,
  NAMED kernelType  := kernelType,
  NAMED gamma       := gamma,
  NAMED C           := C,
  NAMED degree      := degree,
  NAMED coef0       := coef0,
  NAMED eps         := eps,
  NAMED nu          := nu,
  NAMED p           := p,
  NAMED shrinking   := shrinking,
  NAMED prob_est    := prob_est,
  NAMED scale       := scale,
  NAMED nr_weight   := nr_weight,
  NAMED lbl         := lbl,
  NAMED weight      := weight
);

// Cross-validate the chosen set of model parameters.
cvResults := SVMSetup.CrossValidate(
  NAMED folds := 10
);
OUTPUT(cvResults, NAMED('CVResults'));

// Build SVM models using chosen parameters
SVMModel := SVMSetup.GetModel;
ConvertedModel := SVM.Converted.ToModel(SVMModel);
OUTPUT(ConvertedModel, NAMED('FittedModels'));
OUTPUT(ConvertedModel[1].sv_coef, NAMED('SVCoefs'));

// Use fitted models to predict training data
predictResults := SVMSetup.Predict(
  NAMED model             := SVMModel,
  NAMED newX              := x_train
);
OUTPUT(predictResults, NAMED('Predictions'));

// Get human-readable model summary
modelSummary := SVMSetup.ModelSummary(SVMModel);
OUTPUT(modelSummary, NAMED('ModelSummary'));

SVRAccuracy := ML_Core.Analysis.Regression.Accuracy(predictResults,y_train);
OUTPUT(SVRAccuracy, NAMED('SVRAccuracy'));

