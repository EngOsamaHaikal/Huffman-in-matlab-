%bader project
IMPOTED_DATA=importdata('project.txt') ;
Project_Text=IMPOTED_DATA{1,1}; 
N=length(Project_Text);
characters=cell(1,N);
frequency=zeros(1,N);
%to Count the number of occurence:

for i=1:N
    characters{i}=Project_Text(i);
end

for k=1:N
     count=0;
     
    for i=1:N
        if(characters{k}==characters{i})
           count=count+1;
        end
    end
    
 frequency(k)=count; % frequency 
 
end

tree = containers.Map(characters,frequency) ;
counts=values(tree);
sympols=keys(tree);
probability=zeros(1,length(counts));
for i=1:length(counts)
    probability(i)=counts{i}/length(Project_Text);
        
end



%  entropy of the source.
 entropy = 0;
 for i = 1:length(probability)
     entropy = entropy + probability(i) * log2(1/probability(i));
 end

 fprintf('Sympol\t\tNumber of occuerence \t\tPROBABILITY\t\n');
 for i = 1:length(counts)
         fprintf('%s\t\t\t\t%s\t\t\t\t\t\t%s\n',sympols{i},num2str(counts{i}), num2str(probability(i))); 
 end
 
 % creating the dictionary  
 

 [dict,avglen]=huffmandict(keys(tree),probability);
 
 fprintf('Sympol\t\tPROB\t\tCODEWORD\n')
 for i = 1:length(probability)
    fprintf('%s\t\t\t%0.2f\t\t%s\n', sympols{i},probability(i),num2str(cell2mat(dict(i,2)))) 
 end
 
 codeEfficiency=entropy/avglen * 100 ;
 fprintf('\n');
 encoData=huffmanenco(Project_Text,dict);

 fprintf('length of Binary text in ASCHII = %0.1f \n',8*length(Project_Text));
 fprintf('length of Bianry text using huffman = %0.1f \n',length(encoData));

 fprintf('Average Length: %f bits/symbol\n', avglen) 
 fprintf('Source Entropy: %f\n', entropy)
 fprintf('coding efficiency : %0.2f%% \n', codeEfficiency);
 fprintf('\n');
 disp('Encdoing data : ');
 disp(encoData);
 Decodingdata1=huffmandeco(encoData,dict);

 disp('Decdoing data of project text : ');
 disp(Decodingdata1);
%%Decoding huffman :
testingDATA=[1 1 1 0 0 1 0 0 0 1 0 0 1 0 1 0 0 1 1];
Decodingdata2=huffmandeco(testingDATA,dict);
disp('Decdoing data of the test variable: ');
disp(Decodingdata2);
