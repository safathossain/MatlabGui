function varargout = GUIpro(varargin)
% GUIPRO MATLAB code for GUIpro.fig
%      GUIPRO, by itself, creates a new GUIPRO or raises the existing
%      singleton*.
%
%      H = GUIPRO returns the handle to a new GUIPRO or the handle to
%      the existing singleton*.
%
%      GUIPRO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIPRO.M with the given input arguments.
%
%      GUIPRO('Property','Value',...) creates a new GUIPRO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIpro_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIpro_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIpro

% Last Modified by GUIDE v2.5 31-Dec-2021 01:37:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIpro_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIpro_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUIpro is made visible.
function GUIpro_OpeningFcn(hObject, eventdata, handles, varargin)
handles.fileLoaded = 0;
handles.fileLoaded2 = 0;
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIpro (see VARARGIN)

% Choose default command line output for GUIpro
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIpro wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIpro_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Upload.
function Upload_Callback(hObject, eventdata, handles)
% hObject    handle to Upload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = uigetfile('.jpg')
a = imread(a);
axes(handles.axes1);
imshow(a);
setappdata(0, 'a', a)
handles.RGB = a;
handles.RGB2 = a;
handles.fileLoaded = 1;
handles.fileLoaded2 = 0;
handles = updateHistograms(handles);
guidata(hObject, handles);
       


% --- Executes on button press in BinaryImage.
function BinaryImage_Callback(hObject, eventdata, handles)
% hObject    handle to BinaryImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0, 'a');
abw = im2bw(a);
axes(handles.axes2);
imshow(abw)
handles.fileLoaded2 = 1;
handles.RGB2(:,:,1) = abw;
handles.RGB2(:,:,2) = abw;
handles.RGB2(:,:,3) = abw;
handles = updateHistograms(handles);


% --- Executes on button press in Rgb2gray.
function Rgb2gray_Callback(hObject, eventdata, handles)
% hObject    handle to Rgb2gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0, 'a');
agray = rgb2gray(a);
axes(handles.axes2);
imshow(agray);
handles.fileLoaded2 = 1;
handles.RGB2(:,:,1) = agray;
handles.RGB2(:,:,2) = agray;
handles.RGB2(:,:,3) = agray;
handles = updateHistograms(handles);



% --- Executes on button press in GrayAdjust.
function GrayAdjust_Callback(hObject, eventdata, handles)
% hObject    handle to GrayAdjust (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0, 'a');
img = a;
gray = rgb2gray(img);
adj_img = imadjust(gray,[0.3, 0.7, []]);
axes(handles.axes2);
imshow(adj_img);
handles.fileLoaded2 = 1;
handles.RGB2(:,:,1) = adj_img;
handles.RGB2(:,:,2) = adj_img;
handles.RGB2(:,:,3) = adj_img;
handles = updateHistograms(handles);



% --- Executes on button press in RGBnoise.
function RGBnoise_Callback(hObject, eventdata, handles)
% hObject    handle to RGBnoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0, 'a');
I = a;
J = imnoise(I, 'salt & pepper', 0.2);
axes(handles.axes2);
imshow(J);
handles.fileLoaded2 = 1;
handles.RGB2 = J;
handles = updateHistograms(handles);

% --- Executes on button press in Sharpen.
function Sharpen_Callback(hObject, eventdata, handles)
% hObject    handle to Sharpen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0, 'a');
sharpen = imsharpen(a);
axes(handles.axes2);
imshow(sharpen);
handles.fileLoaded2 = 1;
handles.RGB2 = sharpen;
handles = updateHistograms(handles);


% --- Executes on button press in HistAdjust.
function HistAdjust_Callback(hObject, eventdata, handles)
% hObject    handle to HistAdjust (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0, 'a');
imgeq = histeq(a);
axes(handles.axes2);
imshow(imgeq);
handles.fileLoaded2 = 1;
handles.RGB2 = imgeq;
handles = updateHistograms(handles);

% --- Executes on button press in Rotateclock.
function Rotateclock_Callback(hObject, eventdata, handles)
% hObject    handle to Rotateclock (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0, 'a');
aclock = a;
aclock = imrotate(aclock, 270);
axes(handles.axes2);
imshow(aclock)
handles.fileLoaded2 = 1;
handles.RGB2 = aclock;
handles = updateHistograms(handles);

% --- Executes on button press in Rotateanti.
function Rotateanti_Callback(hObject, eventdata, handles)
% hObject    handle to Rotateanti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0, 'a');
aclock = a;
aclock = imrotate(aclock,90);
axes(handles.axes2);
imshow(aclock)
handles.fileLoaded2 = 1;
handles.RGB2 = aclock;
handles = updateHistograms(handles);

% --- Executes on button press in Complement.
function Complement_Callback(hObject, eventdata, handles)
% hObject    handle to Complement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0, 'a');
acomp = a;
acomp = imcomplement(acomp);
axes(handles.axes2);
imshow(acomp);
handles.fileLoaded2 = 1;
handles.RGB2 = acomp;
handles = updateHistograms(handles);

% --- Executes on button press in EdgeDetection.
function EdgeDetection_Callback(hObject, eventdata, handles)
% hObject    handle to EdgeDetection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0,'a');
aedge = a;
aedge = rgb2gray(aedge);
aedge = edge(aedge, 'canny');
axes(handles.axes2);
imshow(aedge);
handles.fileLoaded2 = 1;
handles.RGB2(:,:,1) = aedge;
handles.RGB2(:,:,2) = aedge;
handles.RGB2(:,:,3) = aedge;
handles = updateHistograms(handles);


% --- Executes on button press in Save.
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a = getimage(handles.axes2);
imwrite(a, "NewImageName.jpg");


% --- Executes on button press in Vignetting.
function Vignetting_Callback(hObject, eventdata, handles)
% hObject    handle to Vignetting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0, 'a');
input = a;
[row, col, ~] = size(input); 
center = [row, col] ./ 2; 
[y, x] = meshgrid(1:col, 1:row); 
distance = sqrt((x - center(1)).^2 + (y - center(2)).^2); 
distance = 1 - (distance ./ max(max(distance))); 
distance = cat(3, distance, distance, distance); 
output = mat2gray(double(input) .* distance); 
 
axes(handles.axes2);
imshow(mat2gray(output));
handles.fileLoaded2 = 1;
handles.RGB2 = output;
handles = updateHistograms(handles);


% --- Executes on button press in nightvision.
function nightvision_Callback(hObject, eventdata, handles)
% hObject    handle to nightvision (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0, 'a');
input = a;
output = input; 
output(:, :, 1) = input(:, :, 2) ./ 2; 
output(:, :, 3) = output(:, :, 1) .* 2; 
output(:, :, 2) = output(:, :, 3) .* 2; 
 
axes(handles.axes2);
imshow(mat2gray(output));
handles.fileLoaded2 = 1;
handles.RGB2 = output;
handles = updateHistograms(handles);



% --- Executes on button press in posterize.
function posterize_Callback(hObject, eventdata, handles)
% hObject    handle to posterize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0, 'a');
colors = [16, 32, 64, 128, 200, 250];
input = double(a);
output = input; 
 
for i = 1 : size(input, 1) 
    for j = 1 : size(input, 2) 
        for k = 1 : size(input, 3) 
            [val, idx] = min(abs(colors - input(i, j, k))); 
            output(i, j, k) = colors(idx); 
        end 
    end 
end 
 
axes(handles.axes2);
imshow(mat2gray(output));
handles.fileLoaded2 = 1;
handles.RGB2 = output;
handles = updateHistograms(handles);


% --- Executes on button press in Edgeglow.
function Edgeglow_Callback(hObject, eventdata, handles)
% hObject    handle to Edgeglow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0, 'a');
input = double(a); 
output = zeros(size(input)); 
 
f_x = [-1  0  1; -2 0 2; -1 0 1]; 
f_y = [-1 -2 -1;  0 0 0;  1 2 1]; 
filter = (1 / (5 * 5)) * ones(5, 5); 
 
for row = 3 : size(input, 1) - 2 
    for col = 3 : size(input, 2) - 2 
        for ch = 1 : size(input, 3) 
            temp1 = row - 2; 
            temp2 = col - 2; 
     
            sub_block = input(temp1 : temp1 + 2, temp2 : temp2 + 2, ch); 
             
            val1 = sum(sum(sub_block .* f_x)); 
            val2 = sum(sum(sub_block .* f_y)); 
            val = sqrt(val1.^2 + val2.^2); 
            output(row, col, ch) = val; 
        end 
        printer = 1; 
    end 
end 
 
blur_image = zeros(size(output)); 
 
for row = 3 : size(output, 1) - 2 
    for col = 3 : size(output, 2) - 2 
        for ch = 1 : size(output, 3) 
            temp1 = row - 2; 
            temp2 = col - 2; 
            sub_block = output(temp1 : temp1 + 4, temp2 : temp2 + 4, ch); 
            val = sum(sum(sub_block .* filter)); 
            blur_image(row, col, ch) = val; 
        end 
    end 
end 
 
output = input .* blur_image ./ 255; 
 
axes(handles.axes2);
imshow(mat2gray(output));
handles.fileLoaded2 = 1;
handles.RGB2 = output;
handles = updateHistograms(handles);


% --- Executes on button press in Sketchy.
function Sketchy_Callback(hObject, eventdata, handles)
% hObject    handle to Sketchy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0, 'a');
input = double(a); 
output = zeros(size(input)); 
 
f_x = [-1  0  1; -2 0 2; -1 0 1]; 
f_y = [-1 -2 -1;  0 0 0;  1 2 1]; 
 
for row = 3 : size(input, 1) - 2 
    for col = 3 : size(input, 2) - 2 
        for ch = 1 : size(input, 3) 
            temp1 = row - 2; 
            temp2 = col - 2; 
     
            sub_block = input(temp1 : temp1 + 2, temp2 : temp2 + 2, ch); 
             
            val1 = sum(sum(sub_block .* f_x)); 
            val2 = sum(sum(sub_block .* f_y)); 
            val = sqrt(val1.^2 + val2.^2); 
            output(row, col, ch) = val; 
        end 
        printer = 1; 
    end 
end 
 
output = 255 - rgb2gray(uint8(output)); 
axes(handles.axes2);
imshow(mat2gray(output));
handles.fileLoaded2 = 1;
handles.RGB2(:,:,1) = output;
handles.RGB2(:,:,2) = output;
handles.RGB2(:,:,3) = output;
handles = updateHistograms(handles);


function handlesNew = updateHistograms(handles)
handlesNew = handles;
if (handles.fileLoaded == 1)
%     set(handles.textHist1, 'Visible', 'on');
    axes(handlesNew.axesHist1); 
    cla;
    ImageData1 = reshape(handlesNew.RGB(:,:,1), [size(handlesNew.RGB, 1) * size(handlesNew.RGB, 2) 1]);
    ImageData2 = reshape(handlesNew.RGB(:,:,2), [size(handlesNew.RGB, 1) * size(handlesNew.RGB, 2) 1]);
    ImageData3 = reshape(handlesNew.RGB(:,:,3), [size(handlesNew.RGB, 1) * size(handlesNew.RGB, 2) 1]);
    [H1, X1] = hist(ImageData1, 1:5:256);
    [H2, X2] = hist(ImageData2, 1:5:256);
    [H3, X3] = hist(ImageData3, 1:5:256);
    hold on;
    plot(X1, H1, 'r');
    plot(X2, H2, 'g');
    plot(X3, H3, 'b');    
    axis([0 256 0 max([H1 H2 H3])]);
end
if (handlesNew.fileLoaded2 == 1)
    set(handles.textHist2, 'Visible', 'on');
    axes(handlesNew.axesHist2); 
    cla;
    ImageData1 = reshape(handlesNew.RGB2(:,:,1), [size(handlesNew.RGB2, 1) * size(handlesNew.RGB2, 2) 1]);
    ImageData2 = reshape(handlesNew.RGB2(:,:,2), [size(handlesNew.RGB2, 1) * size(handlesNew.RGB2, 2) 1]);
    ImageData3 = reshape(handlesNew.RGB2(:,:,3), [size(handlesNew.RGB2, 1) * size(handlesNew.RGB2, 2) 1]);
    [H1, X1] = hist(ImageData1, 1:5:256);
    [H2, X2] = hist(ImageData2, 1:5:256);
    [H3, X3] = hist(ImageData3, 1:5:256);
    hold on;
    plot(X1, H1, 'r');
    plot(X2, H2, 'g');
    plot(X3, H3, 'b');    
    axis([0 256 0 max([H1 H2 H3])]);    
end


% --- Executes on button press in Photocopy.
function Photocopy_Callback(hObject, eventdata, handles)
% hObject    handle to Photocopy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0, 'a');
input = a;
 
input = im2gray(input); 
output = input;
th = 100; 
 
for i = 1 : size(input, 1) 
    for j = 1 : size(input, 2) 
        if input(i, j) <= th 
            output(i, j) = input(i, j) * (th - input(i, j)) / th^2; 
        else 
            output(i, j) = 255; 
        end 
    end 
end 
 
axes(handles.axes2);
imshow(mat2gray(output));
handles.fileLoaded2 = 1;
handles.RGB2(:,:,1) = output;
handles.RGB2(:,:,2) = output;
handles.RGB2(:,:,3) = output;
handles = updateHistograms(handles);



% --- Executes on button press in RemoveBackground.
function RemoveBackground_Callback(hObject, eventdata, handles)
% hObject    handle to RemoveBackground (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0, 'a');


% --- Executes on button press in OldImageEffect.
function OldImageEffect_Callback(hObject, eventdata, handles)
% hObject    handle to OldImageEffect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0, 'a');
input = double(a); 
output = zeros(size(input)); 
output(:, :, 1) = (input(:, :, 1) .* 0.393) + (input(:, :, 2) .* 0.769) + (input(:, :, 3) .* 0.189); 
output(:, :, 2) = (input(:, :, 1) .* 0.349) + (input(:, :, 2) .* 0.686) + (input(:, :, 3) .* 0.168); 
output(:, :, 3) = (input(:, :, 1) .* 0.272) + (input(:, :, 2) .* 0.534) + (input(:, :, 3) .* 0.131); 
output(output > 255) = 255; 
noise_image = double(imnoise(uint8(output),'speckle', 0.01)); 
output = input .* noise_image ./ 255; 
axes(handles.axes2);
imshow(mat2gray(output));
handles.fileLoaded2 = 1;
handles.RGB2 = output;
handles = updateHistograms(handles);



% --- Executes on button press in ColorFilter.
function ColorFilter_Callback(hObject, eventdata, handles)
% hObject    handle to ColorFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (handles.fileLoaded==1)
    RUN = 1;

    while (RUN==1)

        prompt = {'Enter threshold for RED (0-255):','Enter threshold for GREEN (0-255):','Enter threshold for BLUE (0-255):'};
        dlg_title = 'RGB Thresholds:';
        num_lines = 1;
        def = {'30','30','30'};
        answer = inputdlg(prompt,dlg_title,num_lines,def);
        if (isempty(answer))
            return;
        end
        T1 = str2num(answer{1});
        T2 = str2num(answer{2});
        T3 = str2num(answer{3});
        

        if ((T1>=0) & (T1<=256)) & ((T2>=0) && (T2<=256)) & ((T3>=0) && (T3<=256))
            RUN = 0;
        end
    end
    
    handles.RGB2 = filterColors(handles.RGB, T1, T2, T3, 5);
    axes(handles.axes2); imshow(handles.RGB2);
    handles.fileLoaded2 = 1;
    handles = updateHistograms(handles);

    guidata(hObject, handles);    
else
    h = msgbox('No primary file has been loaded!','Error','error');
end


% --- Executes on button press in ColorButton2.
function ColorButton2_Callback(hObject, eventdata, handles)
% hObject    handle to ColorButton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


if (handles.fileLoaded == 1)
    RUN = 1;

    while (RUN==1)

        prompt = {'Enter weight for RED (0-200%):','Enter weight for GREEN (0-200%):','Enter weight for BLUE (0-200%):'};
        dlg_title = 'Enter Color Weight Parameters:';
        num_lines = 1;
        def = {'100','100','100'};
        answer = inputdlg(prompt,dlg_title,num_lines,def);
        if (isempty(answer))
            return;
        end
        W1 = str2num(answer{1});
        W2 = str2num(answer{2});
        W3 = str2num(answer{3});
        

        if ((W1>=0) & (W1<=200)) & ((W2>=0) && (W2<=200)) & ((W3>=0) && (W3<=200))
            RUN = 0;
        end
    end
    
    handles.RGB2 = handles.RGB;
    R = double(handles.RGB2(:,:,1));
    G = double(handles.RGB2(:,:,2));
    B = double(handles.RGB2(:,:,3));
    
    R = R * W1 ./ 100;
    G = G * W2 ./ 100;
    B = B * W3 ./ 100;
    
    R(find(R>256)) = 256;
    G(find(G>256)) = 256;
    B(find(B>256)) = 256;
    
    handles.RGB2(:,:,1) = R;
    handles.RGB2(:,:,2) = G;
    handles.RGB2(:,:,3) = B;
    
    axes(handles.axes2); imshow(handles.RGB2);
    handles.fileLoaded2 = 1;
    handles = updateHistograms(handles);
    guidata(hObject, handles);    
else
    h = msgbox('No primary file has been loaded!','Error','error');
end
