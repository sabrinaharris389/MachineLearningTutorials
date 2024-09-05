// Imports
IMPORT ML_Core;
IMPORT ML_Core.Types as Types;
IMPORT ML_Core.Discretize;
IMPORT SupportVectorMachines as SVM;
IMPORT SVM.LibSVM;
IMPORT $;



x_train := $.SVC_convert02.myIndTrainDataNF;
y_trainDF := $.SVC_convert02.myDepTrainDataNF;

x_test := $.SVC_convert02.myIndTestDataNF;
y_testDF := $.SVC_convert02.myDepTestDataNF;

y_train := Discretize.ByRounding(y_trainDF);
y_test  := Discretize.ByRounding(y_testDF);

// Define a set of model parameters
// Here these are all explicitly defined, but any/all may be omitted in later function
// calls if the default values are preferred.
svmType    := LibSVM.Types.LibSVM_Type.C_SVC;
kernelType := LibSVM.Types.LibSVM_Kernel.RBF;
gamma      := 0.05;
C          := 1.0;
degree     := 3;
coef0      := 0.0;
nu         := 0.5;
eps        := 0.001;
p          := 0.1;
shrinking  := true;
prob_est   := true;
scale      := true;
nr_weight  := 1;
lbl        := DATASET([], SVM.Types.I4Entry);
weight     := DATASET([], SVM.Types.R8Entry);

// Define model parameters
SVMSetup := SVM.SVC(
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
  NAMED folds := 10,
  NAMED observations    := x_train,
  NAMED classifications := y_train
);
OUTPUT(cvResults, NAMED('CVResults'));

// Build SVM models using chosen parameters
SVMModel := SVMSetup.GetModel(
  NAMED observations    := x_train,
  NAMED classifications := y_train
);
ConvertedModel := SVM.Converted.ToModel(SVMModel);
OUTPUT(ConvertedModel, NAMED('FittedModels'));
OUTPUT(ConvertedModel[1].sv_coef, NAMED('SVCoefs'));

// Use fitted models to classify training data
classifyResults := SVMSetup.Classify(
  NAMED model             := SVMModel,
  NAMED new_observations  := x_train
);
OUTPUT(classifyResults, NAMED('PredictedClasses'));

// Get confusion matrix for the predictions
confusionMatrix := SVMSetup.Report(
  NAMED model := SVMModel,
  NAMED observations := x_train,
  NAMED classifications := y_train
);
OUTPUT(confusionMatrix, NAMED('ConfusionMatrix'));

// Get human-readable model summary
modelSummary := SVMSetup.ModelSummary(SVMModel);
OUTPUT(modelSummary, NAMED('ModelSummary'));



//tuning
/*
tuned := SVMSetup.tune(
  NAMED observations := x_train,
  NAMED classifications := y_train
);

OUTPUT(tuned, NAMED('tuned'));

tunedModel := SVMSetup.gettunedmodel(
  NAMED tuneResult := tuned,
  NAMED observations := x_train,
  NAMED classifications := y_train
);

OUTPUT(tunedModel, NAMED('tunedModel'));

tunedmodelSummary := SVMSetup.ModelSummary(tunedModel);
OUTPUT(tunedmodelSummary, NAMED('tunedModelSummary'));
*/

tuned := SVMSetup.tune(
  NAMED observations := x_train,
  NAMED classifications := y_train
);

OUTPUT(tuned, NAMED('tuned'));

tunedModel := SVMSetup.gettunedmodel(
  NAMED tuneResult := tuned,
  NAMED observations := x_train,
  NAMED classifications := y_train
);

OUTPUT(tunedModel, NAMED('tunedModel'));

tunedmodelSummary := SVMSetup.ModelSummary(tunedModel);
OUTPUT(tunedmodelSummary, NAMED('tunedModelSummary'));