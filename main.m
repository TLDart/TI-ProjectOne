%landscape.bmp
%{
figure('Name','Landscape.bmp','NumberTitle','off');
image_landscape = imread('landscape.bmp');
imshow(image_landscape);
fprintf("Landscape \n");
getData(image_landscape,[],1);

%------------Using Symbol Grouping-----------------

two_bits_grouped = twobitsencoded(image_landscape,8);
fprintf("------Groups of 2 elements-----\n");
getData(two_bits_grouped,getLabel(uint16(unique(two_bits_grouped)),0),2);
%}

%MRI.bmp 
%{
figure('Name','MRI.bmp','NumberTitle','off');
image_MRI = imread('MRI.bmp');
imshow(image_MRI);
getData(image_MRI,[],1);
%------------Using Symbol Grouping-----------------


two_bits_grouped = twobitsencoded(image_MRI,8);
fprintf("------Groups of 2 elements-----\n");
getData(two_bits_grouped,getLabel(uint16(unique(two_bits_grouped)),0),2);
%}

%MRI_bin.bmp 
%{
figure('Name', 'MRIbin','NumberTitle','off');
image_MRIbin = imread('MRIbin.bmp');
imshow(image_MRIbin);
getData(image_MRIbin,[],1);

%------------Using Symbol Grouping-----------------

two_bits_grouped = twobitsencoded(image_MRIbin,8);
fprintf("------Groups of 2 elements-----\n");
getData(two_bits_grouped,getLabel(uint16(unique(two_bits_grouped)),0),2);
%}

%soundMono.wav checked
%{

[signal, fs] = audioread('soundMono.wav');
p = audioplayer(signal, fs); 
info = audioinfo('soundMono.wav');
Ts = 2/(power(2,info.BitsPerSample));
alphabet = -1:Ts:1-Ts;
getSoundData(signal,alphabet,1);
%WORKING
%------------Using Symbol Grouping-----------------
two_bits_grouped = twobitsencoded((1 + signal')/Ts,8);
fprintf("------Groups of 2 elements-----\n");
getSoundData(two_bits_grouped,unique(two_bits_grouped),2,getLabel(uint16(unique(two_bits_grouped)),3));
%}

%lyrics.txt checked
%{
parsedText = parsetext('lyrics.txt');
getData(parsedText,getLabel(uint16(unique(parsedText)),2),1);

%------------Using Symbol Grouping-----------------

two_bits_grouped = twobitsencoded(parsedText,8);
fprintf("------Groups of 2 elements-----\n");
getData(two_bits_grouped,getLabel(uint16(unique(two_bits_grouped)),1),2);
%}

%{
%mutual information v2

%bigger images
photoFind('query.bmp','target_original.bmp',15,'Original');
pause();
photoFind('query.bmp','target_noise.bmp',15,'Noise');
pause();
photoFind('query.bmp','target_inverted.bmp',15,'Inverted');
pause();
photoFind('query.bmp','target_lightning_contrast.bmp',15,'Light Contrast');
pause();

%smaller images
photoFind('query.bmp','target1.bmp',15,'Target1');
pause();
photoFind('query.bmp','target2.bmp',15,'Target2');
pause();
photoFind('query.bmp','target3.bmp',15,'Target3');
pause();
photoFind('query.bmp','target4.bmp',15,'Target4');
%}





