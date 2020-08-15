fileName = '../test/64_byte_input';

str = fileread( fileName );
flattened = double( str );

x = reshape(flattened, 8, [])';

x_level_off = x - 128;

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

X_level_off = dct2(x_level_off);
X_r_level_off = round(X_level_off);

fprintf('\n\nOutput matrix, no level off\n\n');
for i = 1:8
    str = '';
    for j = 1:8
        str = sprintf([str, dec2hex(X_r(i,j)), '\t']);
    end
    disp(str);
end

fprintf('\n\nOutput matrix, with level off\n\n');
for i = 1:8
    str = '';
    for j = 1:8
        str = sprintf([str, dec2hex(X_r_level_off(i,j)), '\t']);
    end
    disp(str);
end