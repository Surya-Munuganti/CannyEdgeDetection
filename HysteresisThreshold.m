%Student Name : Sri Venkata Sai Surya Munuganti
%Student ID : 40119197
%Hystersis Threshold is performed to transform weak pixels into strong
%pixels depending on the threshold
function BinaryEdgeImage=HysteresisThreshold(magnitudeImage,minThresh,maxThresh)
for i=2:size(magnitudeImage,1)-1
    for j=2:size(magnitudeImage,2)-1
        if (magnitudeImage(i,j)>minThresh )
            if ((magnitudeImage(i+1, j-1) > maxThresh) || (magnitudeImage(i+1, j) > maxThresh) || (magnitudeImage(i+1, j+1) > maxThresh) || (magnitudeImage(i, j-1) > maxThresh) || (magnitudeImage(i, j+1) == maxThresh) || (magnitudeImage(i-1, j-1) > maxThresh) || (magnitudeImage(i-1, j) > maxThresh) || (magnitudeImage(i-1, j+1) > maxThresh))
                        magnitudeImage(i, j) = 1; %Tranforming the weak pixels into strong ones
            elseif(magnitudeImage(i,j)> maxThresh) 
                magnitudeImage(i, j) = 1; %Tranforming the weak pixels into strong ones
            else
                magnitudeImage(i,j)=0;
            end
        else 
            magnitudeImage(i,j)=0;
        end
    end  
end
BinaryEdgeImage=magnitudeImage; %Obtaining the binary edge
end 

