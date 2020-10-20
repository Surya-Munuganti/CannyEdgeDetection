%Student Name : Sri Venkata Sai Surya Munuganti
%Student ID : 40119197
%The non maximum supression is perform to elimate the not maximum pixels
function newMagnitudeImage = NonMaximalSuppression(magnitude,orientation)
newMagnitudeImage=zeros(size(magnitude,1),size(magnitude,2));
Z=zeros(size(magnitude,1),size(magnitude,2));
orientation=orientation*(180/pi); %Converting the orientation rad to degree
%Mapping the gradient direction to the nearest edge direction
for i=1:size(magnitude,1)
    for j=1:size(magnitude,2) %Divide the angles into 4 sections
        if(((orientation(i,j)>(-22.5)) && (orientation(i,j)<=(22.5))) || (( (orientation(i,j)>(157.5)) && (orientation(i,j)<=(-157.5)) )))
            Z(i,j)=0; 
        elseif(((orientation(i,j)>(22.5)) && (orientation(i,j)<=(67.5))) || (( (orientation(i,j)>(-157.5)) && (orientation(i,j)<=(-112.5)) )))
            Z(i,j)=45;
        elseif(((orientation(i,j)>(67.5)) && (orientation(i,j)<=(112.5))) || (( (orientation(i,j)>(-112.5)) && (orientation(i,j)<=(-67.5)) )))
            Z(i,j)=90;
        else
            Z(i,j)=135;
        end
    end
end
%Suppressing the non maximum pixels
for i=2:size(magnitude,1)-1
    for j=2:size(magnitude,2)-1
        if (Z(i,j)==0) %Horizontal Edges
            if( (magnitude(i,j) > magnitude(i,j+1)) && ((magnitude(i,j) > magnitude(i,j-1)))) %when the pixel is stronger than its neighbouring pixels 
                newMagnitudeImage(i,j)=magnitude(i,j); %Dont replace the magnitude
            end
        elseif (Z(i,j)==45) %45 degree edges
            if( (magnitude(i,j) > magnitude(i+1,j+1)) && ((magnitude(i,j) > magnitude(i-1,j-1)))) %when the pixel is stronger than its neighbouring pixels
                newMagnitudeImage(i,j)=magnitude(i,j); %Dont replace the magnitude
            end
        elseif (Z(i,j)==90) %Vertical Edges
            if( (magnitude(i,j) > magnitude(i+1,j)) && ((magnitude(i,j) > magnitude(i-1,j)))) %when the pixel is stronger than its neighbouring pixels
                newMagnitudeImage(i,j)=magnitude(i,j); %Dont replace the magnitude
            end
        elseif (Z(i,j) ==135) %-45 degree edges
            if( (magnitude(i,j) > magnitude(i+1,j-1)) && ((magnitude(i,j) > magnitude(i-1,j+1))))%when the pixel is stronger than its neighbouring pixels
                newMagnitudeImage(i,j)=magnitude(i,j); %Dont replace the magnitude
            end
        end
    end
end      
 end
