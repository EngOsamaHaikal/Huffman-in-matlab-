%%Project digital communication :
data=importdata('project.txt') ;
projectText=data{1,1}; 

AschiiOfcharac=double(projectText); %converting text data to ascii 
N=length(AschiiOfcharac); 

frequencyOfOccurences=zeros(1,128);
%to Count the fequuency of occurence:

for j=0:127
count=0;
for i=1:N
if(AschiiOfcharac(i)==j)
count=count+1;
end
end
frequencyOfOccurences(j+1)=count; % frequency of each character
end

Sympol=find(frequencyOfOccurences)-1;  
numberOf_occuerences=frequencyOfOccurences(Sympol+1); % frequency 
Probability_of_sympol=numberOf_occuerences/N;  %  probability of symbol


% Calculating entropy 
entropy = 0;
for i = 1:length(Sympol)
    entropy = entropy + Probability_of_sympol(i) * log2(1/Probability_of_sympol(i));
end

% Display 
fprintf('\tBinary tree\n')
fprintf('.............................\n')
fprintf('character\t\t\tFrequency\t\tPROBABILITY\t\n')
AschiiOfcharac=numberOf_occuerences';
for i = 1:length(Sympol)
    fprintf('%s\t\t\t\t\t%s\t\t\t\t\t\t%s\n', (Sympol(i)), num2str(numberOf_occuerences(i)), num2str(Probability_of_sympol(i))); 
end

fprintf('Entropy: %f\n', entropy)
% creating huffman 

 [dictionary,AverageLength]=huffmandict(Sympol,Probability_of_sympol);
fprintf('Average Length = %f (bits/symbol)\n', AverageLength)

fprintf('PROB\t\tSYMBOL\t\tCODEWORD\n')
for i = 1:length(Sympol)
   fprintf('%f\t\t%s\t\t\t%s\n', Probability_of_sympol(i), Sympol(i), num2str(cell2mat(dictionary(i,2)))) 
end
 encoData=huffmanenco(projectText,dictionary);

 fprintf('length of code before huffman = %0.2f \n',8*length(projectText));
 fprintf('length of code after huffman = %0.2f \n',length(encoData));

 codeEfficiency=entropy/AverageLength * 100 ;
 fprintf('\n')

 fprintf('coding efficiency =  %0.2f%% \n', codeEfficiency);
 fprintf('\n')
 %%Decoding huffman :

 DecodingText=huffmandeco(encoData,dictionary);
 disp("Encdoing text : ");
 disp(encoData);
 disp("Decdoing text : ");
 fprintf('%s\n',DecodingText)

 
 binaryDATA=[1 1 1 0 0 1 0 0 0 1 0 0 1 0 1 0 0 1 1];
 disp('binary DATA')

 disp(binaryDATA)
 DecoData=huffmandeco(binaryDATA,dictionary);
 disp("Decdoing binaryDATA : ");
 fprintf('%s\n',DecoData)

 