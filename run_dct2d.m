fileName = './test/64_byte_input';

str = fileread( fileName );
flattened = double( str );

x = reshape(flattened, 8, [])';

fprintf('Input matrix\n\n');
for i = 1:8
    str = '';
    for j = 1:8
        str = sprintf([str, dec2hex(x(i,j)), '\t']);
    end
    disp(str);
end

X = dct2(x);

X_r = round(X);

fprintf('\n\nOutput matrix\n\n');
for i = 1:8
    str = '';
    for j = 1:8
        str = sprintf([str, dec2hex(X_r(i,j)), '\t']);
    end
    disp(str);
end