EXPORT File_Employee := MODULE;
EXPORT layout:= RECORD
    STRING field1;
    UNSIGNED4 id;
    STRING Education;
    UNSIGNED4 JoiningYear;
    STRING City;
    UNSIGNED4 PaymentTier;
    UNSIGNED4 Age;
    STRING Gender;
    STRING EverBenched;
    UNSIGNED4 ExperienceInCurrentDomain;
    UNSIGNED4 LeaveOrNot;
    UNSIGNED4 Gender_Numeric;
    UNSIGNED4 EverBenched_Numeric;
    UNSIGNED4 Education_Numeric;
END;

EXPORT File := DATASET('~sh::svm::employee_clean.csv',Layout,CSV(heading(1)));

EXPORT MLProp := RECORD
    UNSIGNED4 id;
    UNSIGNED4 JoiningYear;
    UNSIGNED4 PaymentTier;
    UNSIGNED4 Age;
    UNSIGNED4 ExperienceInCurrentDomain;
    UNSIGNED4 Gender_Numeric;
    UNSIGNED4 EverBenched_Numeric;
    UNSIGNED4 Education_Numeric;
    UNSIGNED4 LeaveOrNot; //value to predict 8
END;

END;