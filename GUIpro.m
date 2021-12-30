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

% Last Modified by GUIDE v2.5 30-Dec-2021 12:52:36

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


% --- Executes on button press in Rgb2gray.
function Rgb2gray_Callback(hObject, eventdata, handles)
% hObject    handle to Rgb2gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a= getappdata(0,'a');
agray=rgb2gray(a);
axes(handles.axes1);
imshow(agray);



% --- Executes on button press in GrayAdjust.
function GrayAdjust_Callback(hObject, eventdata, handles)
% hObject    handle to GrayAdjust (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a= getappdata(0,'a');
img=a;
gray=rgb2gray(img);
adj_img=imadjust(gray,[0.3,0.7,[]]);
axes(handles.axes2);
imshow(adj_img);



% --- Executes on button press in RGBnoise.
function RGBnoise_Callback(hObject, eventdata, handles)
% hObject    handle to RGBnoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a= getappdata(0,'a');
I=a;
J=imnoise(I,'salt & pepper',0.2);
axes(handles.axes1);
imshow(J);

% --- Executes on button press in Histogram.
function Histogram_Callback(hObject, eventdata, handles)
% hObject    handle to Histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
ahist=a;
ahist=rgb2gray(ahist);
imhist(ahist);
img_adj = imgadjust(ahist, [0.4,0.86],[0.0,1.0]);
axes(handles.axes1);
hold on;
imhist(ahist);
imhist(img_adj);
hold off;


% --- Executes on button press in Hisadjust.
function Hisadjust_Callback(hObject, eventdata, handles)
% hObject    handle to Hisadjust (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a= getappdata(0,'a');
imgeq=histeq(a);
axes(handles.axes1);
imshow(imgeq);

% --- Executes on button press in Rotateclock.
function Rotateclock_Callback(hObject, eventdata, handles)
% hObject    handle to Rotateclock (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a= getappdata(0,'a');
aclock=a;
aclock=imrotate(aclock,270);
axes(handles.axes1);
imshow(aclock)

% --- Executes on button press in Rotateanti.
function Rotateanti_Callback(hObject, eventdata, handles)
% hObject    handle to Rotateanti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a= getappdata(0,'a');
aclock=a;
aclock=imrotate(aclock,90);
axes(handles.axes1);
imshow(aclock)

% --- Executes on button press in Complement.
function Complement_Callback(hObject, eventdata, handles)
% hObject    handle to Complement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0,'a');
acomp = a;
acomp = imcomplement(acomp);
axes(handles.axes2);
imshow(acomp);
handles.fileLoaded2 = 1;
handles.RGB2 = acomp;
handles = updateHistograms(handles);

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a= getappdata(0,'a');
aedge=a;
aedge=rgb2gray(aedge);
aedge=edge(aedge,'canny');
axes(handles.axes1);
imshow(aedge);


% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a= getappdata(0,'a');
axes(handles.axes1);
imshow(a);


% --- Executes on button press in Vignetting.
function Vignetting_Callback(hObject, eventdata, handles)
% hObject    handle to Vignetting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in nightvision.
function nightvision_Callback(hObject, eventdata, handles)
% hObject    handle to nightvision (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in posterize.
function posterize_Callback(hObject, eventdata, handles)
% hObject    handle to posterize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Edgeglow.
function Edgeglow_Callback(hObject, eventdata, handles)
% hObject    handle to Edgeglow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Sketchy.
function Sketchy_Callback(hObject, eventdata, handles)
% hObject    handle to Sketchy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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
