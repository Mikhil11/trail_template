import matlab.unittest.parameters.Parameter
import matlab.unittest.TestSuite
rootDir = pwd();
testFileInfo = dir(fullfile(rootDir,"code"));
addpath(testFileInfo.folder);
[arg1,arg2,arg3] = Getparameters();
for i=1:length(arg1)
    param = Parameter.fromData("fname",{arg1(i)},"ainput",{arg2(i)},"exp_output",{arg3(i)});
    suite2 = TestSuite.fromClass(?SolverTest,"ExternalParameters",param);
    results = suite2.run;
    disp(results)
end
