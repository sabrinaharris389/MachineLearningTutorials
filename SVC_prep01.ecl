IMPORT ML_Core.Preprocessing AS x;
Employee := $.File_Employee.File;
ML_Prop  := $.File_Employee.MLProp;
EXPORT SVC_prep01 := MODULE
MLPropExt := RECORD(ML_Prop)
  UNSIGNED4 rnd; // A random number
END;
//Assign a random number to each record

EXPORT myDataE := PROJECT(Employee, TRANSFORM(MLPropExt, 
                                                           SELF.rnd := RANDOM(),
                                                           
                                                           SELF := LEFT))
																							             :PERSIST('~MLTutorial::SH::PrepProp');
// Shuffle your data by sorting on the random field
SHARED myDataES := SORT(myDataE, rnd);
// Now cut the deck and you have random samples within each set
// While you're at it, project back to your original format -- we dont need the rnd field anymore
// Treat first 3723 as training data.  Transform back to the original format.

                              
EXPORT myTrainData := SORT(PROJECT(myDataES[1..3723], ML_Prop),Id)
                              :PERSIST('~MLTutorial::SH::Train');  
// Treat the rest as test data
EXPORT myTestData  := SORT(PROJECT(myDataES[3724..4653], ML_Prop),Id)
                              :PERSIST('~MLTutorial::SH::Test');
END;