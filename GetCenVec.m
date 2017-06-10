function [ Centroid_vector ] = GetCenVec(Image, rows , coloumns  )
[higth width ] = size(Image) ;

while(mod(higth , rows)~= 0)
     Image( higth+1 , :) = 0 ;   
   [higth width ] = size (Image);
end

 [higth width ] = size (Image);
while(mod(width , coloumns) ~= 0)
       Image ( : , width + 1) = 0  ; 
      [higth width ] = size (Image);
end


[higth width ] = size (Image);
 higth = higth / rows ; 
 width = width / coloumns ; 
 
 startw=1;  endw=width;
 starth = 1; endh = higth;
 
 sumXs = 0;  sumYs = 0;  sumdom = 0;
 
 indx = 1 ; 
for i=1:rows  
 startw = 1;
 endw = width;
     for j=1:coloumns
         for s = starth : endh 
            for k = startw:endw     
                 sumXs = sumXs +( s * Image (s , k ));
                 sumYs = sumYs +( k * Image (s , k ));
                 sumdom = sumdom +( Image (s , k ));
            end 
         end
         
         startw=startw+width;
         endw = endw+width;
         if (sumdom==0)
           centrX = - 10 ;
           centrY = -10 ;
         else 
             
         centrX = sumXs / sumdom ;
         centrY = sumYs / sumdom;
         end
         centrX = centrX / higth;
         centrY = centrY / width;
         
         Centroid_vector(indx)=centrX;
         indx = indx+1;
         Centroid_vector(indx)=centrY;
         indx = indx+1;
         
         sumXs = 0;  sumYs = 0;  sumdom = 0; 
     end
     starth=starth+higth;
     endh = endh+higth;      
end
end