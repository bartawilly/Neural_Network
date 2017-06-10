src=dir('C:\Users\Mohamed\Desktop\Gam3a\Pattern\Pattern Assignment_5\Pattern Recognition Data Set (0-9)\*.bmp');
Vectors=[];

R=3;C=3;

for i=1:100
    filename=strcat('C:\Users\Mohamed\Desktop\Gam3a\Pattern\Pattern Assignment_5\Pattern Recognition Data Set (0-9)\',src(i).name);
    img = imread(filename);
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
    vec=GetCenVec(Croppedimg, R , C  );
    Vectors=[Vectors ; vec];
    
end

[NumOfSamples FV_Size]=size(Vectors);
   
    
    temp=Vectors;
    
     Matrix={};
     for i=0 : 9
        
            startIndex=(i*10 )+1;
            endIndex  =(i*10)+10;
            Z=temp(startIndex:endIndex,:);
            MEAN=mean(Z);
            Covar=cov(Z);
            invCov=pinv(Covar);
            Determ=det(Covar);
            Matrix{i+1,1} = MEAN;
            Matrix{i+1,2} = invCov;
            Matrix{i+1,3} = Determ;

     end
     
        
    size(Matrix)



 save('C:\Users\Mohamed\Desktop\Gam3a\Pattern\Pattern Assignment_5\Matrix' , 'Matrix');