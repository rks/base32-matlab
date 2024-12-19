function plan = buildfile
    import matlab.buildtool.tasks.TestTask;

    plan = buildplan(localfunctions);

    plan("test") = TestTask;

    plan.DefaultTasks = "test";
end
