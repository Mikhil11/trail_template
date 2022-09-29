function allFiles = TestFileTxt()

    % get the current directory and all the files from code folder
    rootDir = pwd();
    FunctionFileInfo = dir(fullfile(rootDir,"code","*.mlx"));
    FunctionFileInfo1 = dir(fullfile(rootDir,"code","*.m"));
    allFiles= vertcat(FunctionFileInfo,FunctionFileInfo1);
 
end
