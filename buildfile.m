function plan = buildfile
    import matlab.buildtool.tasks.TestTask;

    installDependencies;

    plan = buildplan(localfunctions);

    plan("test") = TestTask;
    plan("package") = fileexchange.tasks.PackageTask;
    plan("publish") = fileexchange.tasks.PublishTask;

    plan("publish").Dependencies = "package";

    plan.DefaultTasks = "test";
end

function installDependencies
    repositories = mpmListRepositories;

    if isempty(repositories)
        mpmAddRepository("local", getenv("MPM_REPOSITORY_PATH"));
    end

    mpminstall("FileExchangeToolbox", Prompt=false, Verbosity="quiet");
end