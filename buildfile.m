function plan = buildfile
    import matlab.buildtool.tasks.TestTask;

    plan = buildplan(localfunctions);

    plan("test") = TestTask;

    plan.DefaultTasks = "test";
end

function packageTask(~)
    pkg = matlab.mpm.Package(pwd);

    fileName = sprintf("%s-%s.zip", pkg.Name, pkg.Version);

    [~, ~, ~] = mkdir(fullfile(pwd, "releases"));

    archivePath = fullfile(pwd, "releases", fileName);

    fileList = [ ...
        pkg.Folders(:).Path ...
        "resources/mpackage.json" ...
    ];

    zip(archivePath, fileList);
end
