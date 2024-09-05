IMPORT $;
OUTPUT($.File_Sales.File,NAMED('OriginalSales'));

OUTPUT($.GLM_prep01.myDataE,NAMED('CleanSales'));
COUNT($.GLM_prep01.myDataE);
OUTPUT($.GLM_prep01.myTrainData,NAMED('TrainData'));
COUNT($.GLM_prep01.myTrainData);
OUTPUT($.GLM_prep01.myTestData,NAMED('TestData'));
COUNT($.GLM_prep01.myTestData);
OUTPUT($.GLM_convert02.myIndTrainDataNF,NAMED('Pivot'));