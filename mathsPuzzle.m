
digit = 5;

%% find all numbers from 1:10000 with selected digit in

mat1 = 1:9;
mat2 = 10:99;
mat3 = 100:999;
mat4 = 1000:9999;

% single digit numbers
for ind = mat1
    
    a = num2str(ind);
    
    if str2num(a) == digit
        mat1digit = ind;
    end
    
end

% double digit numbers
mat2digit = NaN;

for ind = mat2
    
    double = 0;
    
    a = num2str(ind);
    
    if str2num(a(1)) == digit
        mat2digit(end+1) = ind;
        double = 1;
    end
    
    if str2num(a(2)) == digit & double == 0;
        mat2digit(end+1) = ind;
    end
end

mat2digit = mat2digit(2:end);

% triple digit numbers
mat3digit = NaN;

for ind = mat3
    
    triple = 0;
    
    a = num2str(ind);
    
    if str2num(a(1)) == digit
        mat3digit(end+1) = ind;
        triple = 1;
    end
    
    if str2num(a(2)) == digit & triple == 0;
        mat3digit(end+1) = ind;
        triple = 1;
    end
    
    if str2num(a(3)) == digit & triple == 0;
        mat3digit(end+1) = ind;
    end
end

mat3digit = mat3digit(2:end);

% 4 digit numbers
mat4digit = NaN;

for ind = mat4
    
    quadruple = 0;
    
    a = num2str(ind);
    
    if str2num(a(1)) == digit
        mat4digit(end+1) = ind;
        quadruple = 1;
    end
    
    if str2num(a(2)) == digit & quadruple == 0;
        mat4digit(end+1) = ind;
        quadruple = 1;
    end
    
    if str2num(a(3)) == digit & quadruple == 0;
        mat4digit(end+1) = ind;
        quadruple = 1;
    end
    
    if str2num(a(4)) == digit & quadruple == 0;
        mat4digit(end+1) = ind;
    end
end
    
mat4digit = mat4digit(2:end);

matUltimate = [ mat1digit mat2digit mat3digit ]; %mat4digit ];

%% loop 

normSol = NaN;
vertSol = NaN;

num1mat = NaN;
num2mat = NaN;

for num1 = matUltimate
    
    for num2 = matUltimate;
        
        normSol(end+1) = num1/num2;
            
        num1mat(end+1) = num1;
        num2mat(end+1) = num2;
        
        cancelled1 = cancelout(num1,digit);
        cancelled2 = cancelout(num2,digit);

        vertSol(end+1) = cancelled1/cancelled2;

    end
end

maybeSolutions = [ normSol' vertSol' num1mat' num2mat' ];

solIndex = normSol == vertSol;
stillMaybeSolutions = maybeSolutions(solIndex,:);

solIndex = stillMaybeSolutions(:,1) ~= 1 & stillMaybeSolutions(:,1) ~= 10 & stillMaybeSolutions(:,1) ~= 0.1;
solutions = stillMaybeSolutions(solIndex,:)

BIG(digit).solutions = solutions;


%% whole number solutions 

quickMat = BIG(digit).solutions;

BIG(digit).whole = quickMat( quickMat(:,1) == floor(quickMat(:,1)), : );

BIG(digit).whole
