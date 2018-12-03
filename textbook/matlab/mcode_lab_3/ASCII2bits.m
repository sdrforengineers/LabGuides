function msg = ASCII2bits(msgStr)

% Converts the message string to bit format
msgBin = de2bi(int8(msgStr),7,'left-msb');
msg = reshape(double(msgBin).',numel(msgBin),1);

end