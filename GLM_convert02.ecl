IMPORT $;
IMPORT ML_core.Preprocessing as x;
IMPORT ML_Core;
myTrainData := $.GLM_prep01.myTrainData;
myTestData  := $.GLM_prep01.myTestData;
//Numeric Field Matrix conversion
ML_Core.ToField(myTrainData, myTrainDataNF);
ML_Core.ToField(myTestData, myTestDataNF);
//norm_data := x.NORMALIZER(myTrainDataNF, 'l1');

// Output(myTrainDataNF);
EXPORT GLM_convert02 := MODULE
// We have 21 independent fields and the last field (22) is the dependent
EXPORT myIndTrainDataNF := MyTrainDataNF(number < 22); // Number is the field number
EXPORT myDepTrainDataNF := PROJECT(MyTrainDataNF(number = 22), 
                                   TRANSFORM(RECORDOF(LEFT), 
                                             SELF.number := 1,
                                             SELF := LEFT));
EXPORT myIndTestDataNF := myTestDataNF(number < 22); // Number is the field number
EXPORT myDepTestDataNF := PROJECT(myTestDataNF(number = 22), 
                                  TRANSFORM(RECORDOF(LEFT), 
                                            SELF.number := 1,
                                            SELF := LEFT));
																									
END;
