function TestFileTxt()

    % get the current directory and all the files from code folder
    rootDir = pwd();
    FunctionFileInfo = dir(fullfile(rootDir,"code","*.mlx"));
    FunctionFileInfo1 = dir(fullfile(rootDir,"code","*.m"));
    allFiles= vertcat(FunctionFileInfo,FunctionFileInfo1);
    
    
    % generate Test_parameters.txt file based on number of function files in
    % the code folder
    testFileInfo = fullfile(rootDir,"test","Test_parameters.json");
    ParamInfo = struct;
    for i=1:length(allFiles)
        ParamInfo(i).name = allFiles(i).name;
        ParamInfo(i).Input_parameter = "{2,3}";
        ParamInfo(i).Expected_output = "5";
    end
    badgeJSON = jsonencode(ParamInfo);
    disp(badgeJSON)
    fid = fopen(testFileInfo,'w');
    try
        fprintf(fid,'%s',badgeJSON);
    catch e
        fclose(fid);
        rethrow e
    end
    fclose(fid);
end
