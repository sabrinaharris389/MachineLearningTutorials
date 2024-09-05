IMPORT $;
IMPORT GLM;
IMPORT GLM.Family;
IMPORT ML_Core;
IMPORT ML_Core.Types as Types;

x_train := $.GLM_convert02.myIndTrainDataNF;
y_train := $.GLM_convert02.myDepTrainDataNF;

x_test := $.GLM_convert02.myIndTestDataNF;
y_test := $.GLM_convert02.myDepTestDataNF;


Setup := GLM.GLM(x_train, y_train, Family.Gaussian);
Mdl := Setup.GetModel();
Preds := Setup.Predict(x_train, Mdl);
Deviance := GLM.Deviance_Detail(y_train, Preds, Mdl, Family.Gaussian);

OUTPUT(GLM.ExtractBeta_full(Mdl), NAMED('Model'));
OUTPUT(Preds, NAMED('Preds'));
OUTPUT(Deviance, NAMED('Deviance'));