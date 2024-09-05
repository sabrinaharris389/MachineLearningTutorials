IMPORT Visualizer;

Layout_Sample := RECORD
    UNSIGNED1 Class;
    UNSIGNED4 x1;
    UNSIGNED4 x2;
END;

SVM_Sample := DATASET([ {0,1.25 ,3.5 },
                        {0,2.5 ,4.25 },
                        {0, 1.3, 4.5},
                        {0, 2.5,6.5 },
                        {0,0.5 ,6.7 },
                        {0,.25 , 5},
                        {0, 1.5,5.7 },
                        {1, 8, 1},
                        {1, 7, 2},
                        {1, 6.5, 2.75},
                        {1, 7.75,4 },
                        {1, 8.25, 3},
                        {1, 10, 2.15},
                        {1, 10.85, 3.5}], Layout_Sample);
                        
OUTPUT(SVM_Sample, NAMED('SVM_Sample'))
                        
                        