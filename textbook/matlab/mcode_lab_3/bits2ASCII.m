function txt = bits2ASCII(u,display)

% Trim if necessary
r = rem(length(u),7);
u = u(1:end-r);

% Convert binary-valued column vector to 7-bit decimal values.
w = [64 32 16 8 4 2 1]; % binary digit weighting
Nbits = numel(u);
Ny = Nbits/7;
y = zeros(1,Ny);
for i = 0:Ny-1
    y(i+1) = w*u(7*i+(1:7));
end

txt = char(y);

% Display ASCII message to command window
if display
    fprintf('%s\n',txt);
end

end
