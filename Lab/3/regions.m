function [coding_region, noncoding_region] = regions(sequence, cds_indices)

length_cds = length(cds_indices);

coding_region = zeros(1, length_cds/2);
noncoding_region = zeros(1, length_cds/2);

for n = 1:length_cds
    if mod(n, 2)    % n is odd
        coding_region(n) = sequence(cds_indices(n) : cds_indices(n+1));
%     else
%         noncoding_region(n) = sequence(cds_indices(n) : cds_indices(n+1));
    end
    
end

end