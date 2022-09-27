function TestFileTxt()
% get the current directory and all the files from code folder
rootDir = pwd();
FunctionFileInfo = dir(fullfile(rootDir,"code","*.mlx"));
FunctionFileInfo1 = dir(fullfile(rootDir,"code","*.m"));
allFiles= vertcat(FunctionFileInfo,FunctionFileInfo1);


% generate Test_parameters.txt file based on number of function files in
% the code folder
testFileInfo = fullfile(rootDir,"test","Test_parameters.json");
fid = fopen(testFileInfo,"w");
for i=1:length(allFiles)
    ParamInfo = struct;
    ParamInfo.name = allFiles.name;
    ParamInfo.Input_parameter = "{2,3}";
    ParamInfo.Expected_output = "5";
    ParamJSON = jsonencode(ParamInfo);
    try
        fwrite(fid,ParamJSON);
    catch e
        fclose(fid);
        rethrow e
    end
end
fclose(fid);
end
