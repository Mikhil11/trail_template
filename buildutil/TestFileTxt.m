function TestFileTxt()

% get the current directory and all the files from code folder
rootDir = pwd();
FunctionFileInfo = dir(fullfile(rootDir,"code","*.mlx"));
FunctionFileInfo1 = dir(fullfile(rootDir,"code","*.m"));
allFiles= vertcat(FunctionFileInfo,FunctionFileInfo1);


% generate Test_parameters.txt file based on number of function files in
% the code folder
parallel.internal.pool.isPoolWorker = 0;
testFileInfo = fullfile(rootDir,"test","Test_parameters.txt");
fid = fopen(testFileInfo,'w');
for i=1:length(allFiles)
    a = string(allFiles(i).name);
    string_new = strsplit(a,'.');
    disp(class(string_new(1)));
    %fprintf(fid, '%s:\n',string_new(1));
    fprintf(fid, 'Input parameter:\n');
    fprintf(fid, 'Expected Output:\n');
end
fclose(fid);

end
