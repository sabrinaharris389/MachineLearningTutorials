IMPORT ML_Core.Preprocessing AS x;
Sales := $.File_Sales.File;
ML_Prop  := $.File_Sales.MLProp;
EXPORT SVM_prep01 := MODULE
MLPropExt := RECORD(ML_Prop)
  UNSIGNED4 rnd; // A random number
END;
// Clean the data and assign a random number to each record
//CleanFilter := Property.zip <> '' AND Property.assessed_value <> 0 AND Property.year_acquired <> 0 AND 
//               Property.land_square_footage <> 0 AND Property.living_square_feet <> 0 AND 
//							    Property.bedrooms <> 0 AND Property.year_Built <> 0;
EXPORT myDataE := PROJECT(Sales, TRANSFORM(MLPropExt, 
                                                           SELF.rnd := RANDOM(),
                                                           
                                                           SELF := LEFT))
																							             :PERSIST('~MLTutorial::SH::PrepProp');
// Shuffle your data by sorting on the random field
SHARED myDataES := SORT(myDataE, rnd);
// Now cut the deck and you have random samples within each set
// While you're at it, project back to your original format -- we dont need the rnd field anymore
// Treat first 7000 as training data.  Transform back to the original format.

                              
EXPORT myTrainData := SORT(PROJECT(myDataES[1..897], ML_Prop),Id)
                              :PERSIST('~MLTutorial::SH::Train');  
// Treat next 2000 as test data
EXPORT myTestData  := SORT(PROJECT(myDataES[898..1121], ML_Prop),Id)
                              :PERSIST('~MLTutorial::SH::Test');
END;