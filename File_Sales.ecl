EXPORT File_Sales := MODULE;
EXPORT layout:= RECORD
    UNSIGNED4 Id;
    UNSIGNED4 LotFrontage;
    UNSIGNED4 LotArea;
    UNSIGNED2 OverallQual;
    UNSIGNED2 OverallCond;
    UNSIGNED4 MasVnrArea;
    UNSIGNED4 BsmtFinSF1;
    UNSIGNED4 BsmtUnfSF;
    UNSIGNED4 TotalBsmtSF;
    UNSIGNED4 X1stFlrSF;
    UNSIGNED4 X2ndFlrSF;
    UNSIGNED4 GrLivArea;
    UNSIGNED2 BsmtFullBath;
    UNSIGNED2 FullBath;
    UNSIGNED2 HalfBath;
    UNSIGNED4 BedroomAbvGr;
    UNSIGNED2 KitchenAbvGr;
    UNSIGNED2 TotRmsAbvGrd;
    UNSIGNED2 Fireplaces;
    UNSIGNED2 GarageCars;
    UNSIGNED4 GarageArea;
    UNSIGNED4 OpenPorchSF;
    UNSIGNED4 SalePrice;
END;

EXPORT File := DATASET('~gpr::sh::sales_data.csv',Layout,CSV(heading(1)));

EXPORT MLProp := RECORD
    UNSIGNED4 Id; //unique id //values to be used to make predictions
    UNSIGNED4 LotFrontage;//values to be used to make predictions
    UNSIGNED4 LotArea;
    UNSIGNED2 OverallQual;
    UNSIGNED2 OverallCond;
    UNSIGNED4 MasVnrArea;
    UNSIGNED4 BsmtFinSF1;
    UNSIGNED4 BsmtUnfSF;
    UNSIGNED4 TotalBsmtSF;
    UNSIGNED4 X1stFlrSF;
    UNSIGNED4 X2ndFlrSF;
    UNSIGNED4 GrLivArea;
    UNSIGNED2 BsmtFullBath;
    UNSIGNED2 FullBath;
    UNSIGNED2 HalfBath;
    UNSIGNED4 BedroomAbvGr;
    UNSIGNED2 KitchenAbvGr;
    UNSIGNED2 TotRmsAbvGrd;
    UNSIGNED2 Fireplaces;
    UNSIGNED2 GarageCars;
    UNSIGNED4 GarageArea;
    UNSIGNED4 OpenPorchSF;
    UNSIGNED4 SalePrice; //value to predict 22
END;

END;