function bwtdec
%bwtdec is a BWT decoder
% type bwtdec at the command prompt 
% this particular function reads the transformed(BWT)
% file bwt.txt and then geets the original file back
% as orig_text 
% BE SURE that the transformed file BWT.TXT is in the 
% current directory
%copyright
%MA Imran imran_akthar@hotmail.com
%please send me ur feedback and suggestion 
%do check out my other files at MATLAB CENTRAL FILE EXCHANGE

%http://www.mathworks.com/matlabcentral/fileexchange/loadAuthor.do?objectType=author&objectId=1093740
clear all;
clc;
dec_bwt_file=fopen('bwt.cmp','r');
dec_bwt_read=fread(dec_bwt_file,'uint8');
fclose(dec_bwt_file);
disp('BWT DECODING Started');

encoded_data=dec_bwt_read(1:length(dec_bwt_read)-1);
primary_index=dec_bwt_read(length(dec_bwt_read));


sorted_data=sort(encoded_data);
vector_flag=ones(1,length(encoded_data))';
vector=zeros(1,length(encoded_data))';
%%%%%%%preparing vector table
for i=1:length(sorted_data)
    for j=1:length(sorted_data)
        if(encoded_data(j)==sorted_data(i) && vector_flag(j))
%             clc;
%             encoded_data(j);
%             sorted_data(i);
            vector_flag(j);
            vector(i)=j;
            vector_flag(j)=0;
            break
            
        end
    end
end

index=primary_index;
reconst_data=zeros(1,length(encoded_data));
%getting original data back
for i=1:length(encoded_data)
       reconst_data(i)=encoded_data(index);
       index=vector(index);
   end
  
   
%    char(lexi_sorted_data(:,length(a)));
%    primary_index=find(ind==2);
%    char(reconst_data);

   rec_file=fopen('orig_file.txt','w');
   fwrite(rec_file,reconst_data,'uint8');
   fclose(rec_file);
   disp('BWT Decosing over..');
   disp('file writeen back as orig_file.txt')