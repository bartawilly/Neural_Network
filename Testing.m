load('C:\Users\Mohamed\Desktop\Gam3a\Pattern\Pattern Assignment_5\Matrix' , 'Matrix');

img = imread('C:\Users\Mohamed\Desktop\Gam3a\Pattern\Pattern Assignment_5\0.bmp');

R=3;C=3;
 img2=imcomplement(img);
%     subplot(2,3,2);
%     imshow(img2);
%     title('Complemented');

    
    [a,b]=find(img2>0);
    fs=min(a);
    fe=max(a);
    ls=min(b);
    le=max(b);
    Croppedimg = img2(fs:fe , ls:le);
    Test=GetCenVec(Croppedimg, R , C  );
    
    [s1 s2]=size(Matrix);
    
    
%             Matrix{i+1,1} = MEAN;
%             Matrix{i+1,2} = invCov;
%             Matrix{i+1,3} = Determ;
            
            
    Probs=[];
    for i=1:s1
       
        Prob = -1/2 * log(Matrix{i,3}) - (1/2 * (  (Test - Matrix{i,1}) * Matrix{i,2} * (Test - Matrix{i,1})' )) ;
        Probs=[Probs ; Prob];
    end
    
    
        Probs
        
    [Max_Prob index]=max(Probs)
    

     
    figure,
    imshow(img);
    title ('Drawn Image');
    
    num=num2str(index-1);
    
    %Notes:
    %classifier is based for normally disteributed data this data set isn't
    %Determaint comes to zero because centroid returns small numbers
    %
             
    
    
text(120,220,['This Number is : ', num],'HorizontalAlignment','center',... 
 'BackgroundColor',[.9 .9 .9]);
        
   
    