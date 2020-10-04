function VF(aa_list,aa_index,SeqFile,ResultFile,t,tmp)
if nargin==4
    t='0';
end

%load('double_index.mat');
%load('delete_index.mat');
t=str2num(t);

%disp('Importing sequences...')
data=fastaread(SeqFile);

%%%data preprocessing%%%
%disp('Data preprocessing...')
% for i=1:1:size(data,1)
%     seq=data(i).Sequence;
%     seq=upper(seq);
%     seq=adjust_uncertain_nt(seq);
%     data(i).Sequence=seq;
%     %disp(i)
% end
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%Sequence sorting%%%
Group_A=[];
Group_B=[];
Group_C=[];
Group_L=[];
cA=1;
cB=1;
cC=1;
cL=1;
for i=1:1:size(data,1)
    seq=data(i).Sequence;
    L=size(seq,2);
    if L<=40
        Group_A(cA,1).Header=data(i).Header;
        Group_A(cA,1).Sequence=seq;
        Group_A(cA,1).Length=L;
        Group_A(cA,1).Index=i;
        cA=cA+1;
    elseif L>=401 && L<=800
        Group_B(cB,1).Header=data(i).Header;
        Group_B(cB,1).Sequence=seq;
        Group_B(cB,1).Length=L;
        Group_B(cB,1).Index=i;
        cB=cB+1;
    elseif L>=801 && L<=4999
        Group_C(cC,1).Header=data(i).Header;
        Group_C(cC,1).Sequence=seq;
        Group_C(cC,1).Length=L;
        Group_C(cC,1).Index=i;
        cC=cC+1;
    elseif L>=5000
        Group_L(cL,1).Header=data(i).Header;
        Group_L(cL,1).Sequence=seq;
        Group_L(cL,1).Length=L;
        Group_L(cL,1).Index=i;
        cL=cL+1;
    end
    data(i).Header=[];
    data(i).Sequence=[];
    %disp(i)
end
clear data
%%%%%%%%%%%%%%%%%%%%%%%

%%%predict Group_A%%%
disp(' ')
%disp('Predicting')
if ~isempty(Group_A)
    aa_onehot=zeros(20,40*size(Group_A,1),'int8');
    for i=1:1:size(Group_A,1)
        aa_onehot(:,(i-1)*40+1:i*40)=aa2onehot(Group_A(i).Sequence,40);
    end
    save([pwd,'/',tmp,'aa_onehot.mat'],'aa_onehot','-v7.3')
    clear aa_onehot
    
    aa_property=zeros(22,40*size(Group_A,1),'int8');
    for i=1:1:size(Group_A,1)
        aa_property(:,(i-1)*40+1:i*40)=aa2property(Group_A(i).Sequence,40,aa_index,aa_list);
        Group_A(i,1).Sequence=[];
    end
    save([pwd,'/',tmp,'aa_property.mat'],'aa_property','-v7.3')
    clear aa_property
    
    cmd=['python ',pwd,'/predict.py ',pwd,'/model.h5 ',pwd,'/',tmp];unix(cmd);
    delete([pwd,'/',tmp,'aa_onehot.mat']);
    delete([pwd,'/',tmp,'aa_property.mat']);
        
    predict=dlmread([pwd,'/',tmp,'predict.csv']);
    delete([pwd,'/',tmp,'predict.csv']);
    
    for i=1:1:size(Group_A,1)
        Group_A(i,1).score=predict(i,1);
        %Group_A(i,1).chromosome_score=predict(i,2);
        %Group_A(i,1).plasmid_score=predict(i,3);
    end
    clear predict;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Group=[Group_A;Group_B;Group_C;Group_L];
clear Group_A; clear Group_B; clear Group_C; clear Group_L;
[m,n]=sort([Group.Index]);
Group=Group(n(:));


for i=1:1:size(Group,1)
    scores=Group(i,1).score;
    %[x,y]=max(scores);
    if scores>=0.5
        Group(i,1).Possible_source='PVP';
    else
        Group(i,1).Possible_source='Non-PVP';
    %else
    %    Group(i,1).Possible_source='chromosome';
    end
end

            

for i=1:1:size(Group,1)
    result{i,1}=Group(i,1).Header;
    result{i,2}=Group(i,1).Length;
    result{i,3}=Group(i,1).score;
    %result{i,4}=Group(i,1).chromosome_score;
    %result{i,5}=Group(i,1).plasmid_score;
    result{i,4}=Group(i,1).Possible_source;
end

result=cell2table(result,'VariableNames',{'Header','Length','Score','Prediction'});
writetable(result,ResultFile);

disp(' ')
%disp('Finished.')  