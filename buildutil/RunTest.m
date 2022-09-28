import matlab.unittest.parameters.Parameter
import matlab.unittest.TestSuite
rootDir = pwd();
testFileInfo1 = fullfile(rootDir,"tests","Unittest_results.txt");
testFileInfo = dir(fullfile(rootDir,"code"));
addpath(testFileInfo.folder);
[arg1,arg2,arg3] = Getparameters();
fid = fopen(testFileInfo,"w");
for i=1:length(arg1)
    param = Parameter.fromData("fname",{arg1(i)},"ainput",{arg2(i)},"exp_output",{arg3(i)});
    suite2 = TestSuite.fromClass(?SolverTest,"ExternalParameters",param);
    results = suite2.run;
    fprintf(fid,"%s:\n",string(results));
end
fclose(fid);
