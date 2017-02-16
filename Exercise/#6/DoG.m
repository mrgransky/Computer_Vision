function [x,y,r] = DoG(octave,sigma,thresh,inpImg)
x = []; y = []; r = [];

for a = 1:octave
    if(a == 1)
        kernel{a} = fspecial('gaussian',size(inpImg),a*sigma);
    else
        kernel{a} = fspecial('gaussian',size(inpImg),a*sqrt(2)*sigma);
    end
% kernel{a} = fspecial('gaussian',size(imTest),a*sigma);
end

% DoG
for b = 1:octave-1
    imgFilt{b} = conv2(inpImg,kernel{b+1}-kernel{b});
end


for layer = 2:octave-2
   for row = 2:size(inpImg,1)-1 
       for col = 2:size(inpImg,2)-1
           indx = 1;
           compare = zeros(1,26);
           for layerCurr = layer-1:layer+1
               for rowCurr = row-1:row+1
                   for colCurr = col-1:col+1
                       compare(indx) = imgFilt{layerCurr}(rowCurr,colCurr);
                       indx = indx + 1;
                   end
               end
           end
           [compareMax,indxMax] = max(compare);
           [compareMin,indxMin] = min(compare);
           
           
%            
           if (compareMax > thresh || compareMin < -thresh)

                   imshow(inpImg,[]),hold on, plot(col,row,'rs');
                   x = [x;row];
                   y = [y;col];
                   r = [r;abs(imgFilt{layer}(row,col))];
           end
           
%            if (compareMax == imgFilt{layer}(row,col) || compareMin == imgFilt{layer}(row,col))
%                if (compareMin < -thresh || compareMax > thresh)
%                    
% %                    figure;
%                    imshow(inpImg,[]),hold on, plot(col,row,'rs');
%                    
%                    x = [x;row];
%                    y = [y;col];
%                    r = [r;abs(imgFilt{layer}(row,col))];
%                end
%            end
       end 
   end
end



end