clear all;
K_CC=importdata('CC_K.mat');
K_CF=importdata('CF_K.mat');
K_RC=importdata('RC_K.mat');
K_RF=importdata('RF_K.mat');

numberCC=0;
for i=1:size(K_CC,1)
    for j=1:size(K_CC,1)-i+1
        if K_CC(i,size(K_CC,1)-j+1)~=0
            break;
        end
    end
      number= size(K_CC,1)-i+1-j+1;
      numberCC=numberCC+number;
end
AHBW_CC=numberCC/size(K_CC,1);
disp('Average Half Band Width in circle_coarse mesh is');
disp(AHBW_CC);

numberCF=0;
for i=1:size(K_CF,1)
    for j=1:size(K_CF,1)-i+1
        if K_CF(i,size(K_CF,1)-j+1)~=0
            break;
        end
    end
      number= size(K_CF,1)-i+1-j+1;
      numberCF=numberCF+number;
end
AHBW_CF=numberCF/size(K_CF,1);
disp('Average Half Band Width in circle_fine mesh is');
disp(AHBW_CF);

numberRC=0;
for i=1:size(K_RC,1)
    for j=1:size(K_RC,1)-i+1
        if K_RC(i,size(K_RC,1)-j+1)~=0
            break;
        end
    end
      number= size(K_RC,1)-i+1-j+1;
      numberRC=numberRC+number;
end
AHBW_RC=numberRC/size(K_RC,1);
disp('Average Half Band Width in round_coarse mesh is');
disp(AHBW_RC);

numberRF=0;
for i=1:size(K_RF,1)
    for j=1:size(K_RF,1)-i+1
        if K_RF(i,size(K_RF,1)-j+1)~=0
            break;
        end
    end
      number= size(K_RF,1)-i+1-j+1;
      numberRF=numberRF+number;
end
AHBW_RF=numberRF/size(K_RF,1);
disp('Average Half Band Width in round_fine mesh is');
disp(AHBW_RF);
