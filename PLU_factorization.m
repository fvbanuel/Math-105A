function [L,U,P] = PLU_factorization(A)
n = size(A,1);
M = zeros(n);

NROW = 1:n;
for i = 1:n-1
    [m,p] = max(abs(A(NROW(i:n),i)));
    p = p + i-1;
    if abs(m)>4e-16
        
        if p ~= i
            NCOPY = NROW(i); NROW(i) = NROW(p); NROW(p) = NCOPY;
        end
        for j = i+1:n
            M(NROW(j),i) = A(NROW(j),i)/A(NROW(i),i);
            A(NROW(j),i) = 0;
            A(NROW(j),(i+1):end) = A(NROW(j),(i+1):end) - M(NROW(j),i)*A(NROW(i),(i+1):end);
        end
        
    end
end


U = A(NROW(:),1:n);
% P = full(sparse(1:n,NROW,ones(1,n)));
P = eye(n);
P = P(NROW(:),:);
L = M(NROW(:),1:n) + eye(n);





    