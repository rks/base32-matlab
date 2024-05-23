classdef testCrockford < matlab.unittest.TestCase
    methods (Test)
        function randomizesOutput(testCase)
            expected = "0123456789";

            randfn = @(~, ~) (1:10)';
            actual = base32.Crockford.random(10, "RandFn", randfn);            

            testCase.verifyEqual(expected, actual);
        end

        function generatesCustomLengthString(testCase)
            str = base32.Crockford.random(10);
            testCase.verifyEqual(strlength(str), 10);
        end

        function throwsErrorOnMissingInput(testCase)
            testCase.verifyError( ...
                @()base32.Crockford.random, ...
                "MATLAB:minrhs" ...
            );
        end

        function throwsErrorOnNonNumericInput(testCase)
            testCase.verifyError( ...
                @()base32.Crockford.random("10"), ...
                "MATLAB:validators:mustBeNumeric" ...
            );
        end

        function throwsErrorOnZeroInput(testCase)
            testCase.verifyError( ...
                @()base32.Crockford.random(0), ...
                "MATLAB:validators:mustBePositive" ...
            );
        end

        function throwsErrorOnNegativeInput(testCase)
            testCase.verifyError( ...
                @()base32.Crockford.random(-10), ...
                "MATLAB:validators:mustBePositive" ...
            );
        end
    end
end
