function aa_onehot=aa2onehot(seq,L)

seq=upper(seq);
aa_onehot=int8(zeros(L,20));
for i=1:1:min(L,size(seq,2))
    if seq(i)=='A'
        aa_onehot(i,:)=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1];
    elseif seq(i)=='C'
        aa_onehot(i,:)=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0];
    elseif seq(i)=='D'
        aa_onehot(i,:)=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0];
    elseif seq(i)=='E'
        aa_onehot(i,:)=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0];
    elseif seq(i)=='F'
        aa_onehot(i,:)=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0];
    elseif seq(i)=='G'
        aa_onehot(i,:)=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0];
    elseif seq(i)=='H'
        aa_onehot(i,:)=[0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0];
    elseif seq(i)=='I'
        aa_onehot(i,:)=[0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0];
    elseif seq(i)=='K'
        aa_onehot(i,:)=[0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0];
    elseif seq(i)=='L'
        aa_onehot(i,:)=[0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0];
    elseif seq(i)=='M'
        aa_onehot(i,:)=[0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0];
    elseif seq(i)=='N'
        aa_onehot(i,:)=[0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0];
    elseif seq(i)=='P'
        aa_onehot(i,:)=[0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0];
    elseif seq(i)=='Q'
        aa_onehot(i,:)=[0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0];
    elseif seq(i)=='R'
        aa_onehot(i,:)=[0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    elseif seq(i)=='S'
        aa_onehot(i,:)=[0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    elseif seq(i)=='T'
        aa_onehot(i,:)=[0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    elseif seq(i)=='V'
        aa_onehot(i,:)=[0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    elseif seq(i)=='W'
        aa_onehot(i,:)=[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    elseif seq(i)=='Y'
        aa_onehot(i,:)=[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    else
        aa_onehot(i,:)=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    end
end

aa_onehot=aa_onehot';