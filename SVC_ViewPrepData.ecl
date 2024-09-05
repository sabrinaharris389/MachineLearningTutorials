IMPORT $;
OUTPUT($.File_Employee.File,NAMED('OriginalSales'));

OUTPUT($.SVC_prep01.myDataE,NAMED('CleanSales'));
COUNT($.SVC_prep01.myDataE);
OUTPUT($.SVC_prep01.myTrainData,NAMED('TrainData'));
COUNT($.SVC_prep01.myTrainData);
OUTPUT($.SVC_prep01.myTestData,NAMED('TestData'));
COUNT($.SVC_prep01.myTestData);
OUTPUT($.SVC_convert02.myIndTrainDataNF,NAMED('Pivot'));