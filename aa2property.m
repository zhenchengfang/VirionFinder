function aa_property=aa2property(seq,L,aa_index,aa_list)

seq=upper(seq);
aa_property=zeros(L,22);
for i=1:1:min(L,size(seq,2))
    l=strfind(aa_list,seq(i));
    if ~isempty(l)
        aa_property(i,:)=aa_index(l,:);
    end
end

aa_property=aa_property';
    