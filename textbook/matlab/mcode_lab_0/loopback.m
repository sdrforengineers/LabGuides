%% Example Loopback
clear all;
addpath(genpath('../drivers'));
%% Setup PlutoSDR
sdr = PlutoSDR;
sdr.mode = 'transceive';
sdr.rx_gain = 10;
sdr.rx_gain_mode = 'fast-attack';
%% Setup SDR buffers
ch_size = 1e6;
sdr.in_ch_size = ch_size;
sdr.out_ch_size = ch_size;
%% Generate complex transmit signal
Fs = 30.72e6;
Fc = 1e6;
t = 1/Fs:1/Fs:ch_size/Fs;
amplitude = 1024;
sigR = sin(2*pi*Fc*t+0).*amplitude;
sigC = sin(2*pi*Fc*t+pi/2).*amplitude;
sig = complex(sigR,sigC);

%% Transceive with SDR
frames = 10;
cap = zeros(ch_size*frames,1);
prev = 0;
for frame = 1:frames
    % Call radio
    o = sdr.transceive(sig);
    % Save data
    indx = (frame-1)*ch_size+1 : frame*ch_size;
    cap(indx) = o;
    % Info
    s = sprintf('Frame %d of %d',frame,frames);
    fprintf(repmat('\b',1,prev));fprintf(s);prev = length(s);
end
fprintf('\n');

%% Plot
t = 1/Fs:1/Fs:frames*ch_size/Fs;
plot(t,real(cap),t,imag(cap));
xlabel('Sample');
ylabel('Amplitude');
xlim([t(end-300) t(end)])