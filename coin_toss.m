


m = zeros(2500,4);
for i = 1:2500
    for j = 1:4
        m(i,j) = round(rand());
    end
end

count_ones = zeros(2500,1);

for i = 1:2500
    for j = 1:4
        if m(i,j) == 1
            count_ones(i,1) = count_ones(i,1)+1;
        end
    end
end

prob_ones = zeros(5,1);
for i = 1:2500
    if count_ones(i,1) == 0
        prob_ones(1,1) = prob_ones(1,1) + 1;
    elseif count_ones(i,1) == 1
        prob_ones(2,1) = prob_ones(2,1) + 1;
    elseif count_ones(i,1) == 2
        prob_ones(3,1) = prob_ones(3,1) + 1;
    elseif count_ones(i,1) == 3
        prob_ones(4,1) = prob_ones(4,1) + 1;
    elseif count_ones(i,1) == 4
        prob_ones(5,1) = prob_ones(5,1) + 1;
    end
end


heads = zeros(2500,1);

for j = 1:4
    t = 0;
    for i = 1:2500
        if m(i,1) ~= 1 && t ~= 0
            heads(i,1) = t;
            t = 0;
        elseif m(i,1) == 1
            t = t + 1;
        end
    end
end

expected = zeros(5,1);
for i = 0:4
    expected(i+1,1) = factorial(4)/(factorial(i)*factorial(4-i))*0.5^i*0.5^(4-i)*2500;
end

comb = [expected(:),prob_ones(:)];

figure
bar([0:4],comb);
figure
histogram(heads);