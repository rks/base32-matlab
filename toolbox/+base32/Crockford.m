classdef Crockford
    %CROCKFORD Douglas Crockford's Base32.
    %  See https://www.crockford.com/base32.html

    properties (Constant = true, Access = private)
        ENCODING = "0123456789ABCDEFGHJKMNPQRSTVWXYZ";
        ENCODING_LENGTH = 32;
    end

    methods (Static)
        function str = random(n, options)
        %RANDOM Random Base32-encoded string.
        %  S = RANDOM(N) returns a string of N randomly-selected Base32
        %  characters.

            arguments
                n (1,1) {mustBeNumeric,mustBePositive}
                options.RandFn (1,1) = @(maxn, n) randi(maxn, n, 1);
            end

            str = join( ...
                arrayfun( ...
                    @(i) extractBetween(base32.Crockford.ENCODING, i, i), ...
                    options.RandFn(base32.Crockford.ENCODING_LENGTH, n) ...
                ), ...
            "");
        end
    end
end
