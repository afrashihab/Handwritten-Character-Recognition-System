function xyx=OCR1(filename, dictionary1, dictionary2)
disp('INPUT IMAGE WITH NOISE')
% Convert to gray scale
count=0;
i=5
    while(i>0) 
        if strcmp(dictionary1{i},dictionary2{i})
            count=count+1;
            disp(count);
            i=i-1;
                  end 
    end  
xyx=count;
disp(xyx);
%Open 'text.txt' file
%winopen('text.txt')
end