function huffman(input)   
    a=double(input);
    [r,c]=size(a);
    co=r*c;
    h=zeros(1,300);
    p=zeros(1,300);
    pdf=zeros(1,300);
    prob=zeros(1,300);
    qq=zeros(1,300);
    for i=1:r
        for j=1:c
            p(i)=a(i,j);
        end
    end
    for i=1:r
        for j=1:c
            t=a(i,j);
            h(t+1)=h(t+1)+1;
        end
    end
    pdf=h/co;
    for i=1:300
             prob(i)=pdf(i);
    end
    for k=1:255
        for i=1:255
               if(pdf(i)>pdf(i+1))
                   temp=pdf(i);
                   pdf(i)=pdf(i+1);
                   pdf(i+1)=temp;
               end
        end
    end
    pdf = pdf/sum(pdf);
    for index = 1:length(pdf)
        codewords{index} = [];
        set_contents{index} = index;
        set_pdf(index) = pdf(index);
    end
    while length(set_contents) > 1
          [~, sorted_indices] = sort(set_pdf);
          zero_set = set_contents{sorted_indices(1)};
          zero_pdf = set_pdf(sorted_indices(1));
          for codeword_index = 1:length(zero_set)
              codewords{zero_set(codeword_index)} = [codewords{zero_set(codeword_index)}, 0];       
          end
          one_set = set_contents{sorted_indices(2)};
          one_pdf = set_pdf(sorted_indices(2));
          for codeword_index = 1:length(one_set)
              codewords{one_set(codeword_index)} = [codewords{one_set(codeword_index)}, 1];       
          end
          set_contents(sorted_indices(1:2)) = [];
          set_contents{length(set_contents)+1} = [zero_set, one_set];
          set_pdf(sorted_indices(1:2)) = [];
          set_pdf(length(set_pdf)+1) = zero_pdf + one_pdf;
    end
    for index = 1:256
        disp([num2str(index), '    ', num2str(pdf(index)),'    ',num2str(codewords{index}(length(codewords{index}):-1:1))]);
    end
    ent = entropyhist(histtofreq(input));
    av_length = 0;
    for index = 1:length(codewords)
        av_length = av_length + pdf(index)*length(codewords{index});
    end
    disp(['Entropy of the image is:                     ',num2str(ent)]);
    disp(['The average Huffman codeword length is:    ',num2str(av_length)]);
    disp(['The Compression efficiency of coding is:                ',num2str(ent/av_length)]);