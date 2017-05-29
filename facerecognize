function varargout = facerecognize(varargin)
% FACERECOGNIZE MATLAB code for facerecognize.fig
%      FACERECOGNIZE, by itself, creates a new FACERECOGNIZE or raises the existing
%      singleton*.
%
%      H = FACERECOGNIZE returns the handle to a new FACERECOGNIZE or the handle to
%      the existing singleton*.
%
%      FACERECOGNIZE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FACERECOGNIZE.M with the given input arguments.
%
%      FACERECOGNIZE('Property','Value',...) creates a new FACERECOGNIZE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before facerecognize_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to facerecognize_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help facerecognize

% Last Modified by GUIDE v2.5 25-Apr-2017 23:50:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @facerecognize_OpeningFcn, ...
                   'gui_OutputFcn',  @facerecognize_OutputFcn, ...
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


% --- Executes just before facerecognize is made visible.
function facerecognize_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to facerecognize (see VARARGIN)

% Choose default command line output for facerecognize
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes facerecognize wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = facerecognize_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid;
global net;
global faceDetector;



faceDetector = vision.CascadeObjectDetector('haarcascade_frontalface_default.xml');
faceDetector.MinSize = [30 30];
faceDetector.MergeThreshold = 8;



load('facenet.mat') ;
net.layers{end}.type = 'softmax';


% --- Executes on button press in openvideo.
function openvideo_Callback(hObject, eventdata, handles)
% hObject    handle to openvideo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global frame;
global vid;
%frame = getsnapshot(vid);
%axes(handles.axes1);
%imshow(frame);
global oop;
oop =1 ;

axes(handles.axes1);
rectangle('Position',[20,20,100,100],'EdgeColor','r');

%vid = videoinput('winvideo',1,'YUY2_1280x720');
vid = videoinput('winvideo',1,'YUY2_640x480');
set(vid,'ReturnedColorSpace','rgb'); 
vidRes=get(vid,'VideoResolution');
nBands=get(vid,'NumberOfBands');
hImage=image(nBands);
hImage=image(zeros(vidRes(2),vidRes(1),nBands));
preview(vid,hImage);


% --- Executes on button press in recognize.
function recognize_Callback(hObject, eventdata, handles)
% hObject    handle to recognize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vid;
global net;
global faceDetector;
global frame;
global oop;

if oop ==1
frame = getsnapshot(vid);
end

bboxes = step(faceDetector, frame);
if ~isempty(bboxes) 
    frame = imcrop(frame,bboxes(1,1:4));
    axes(handles.axes4);
    imshow(frame);
end

    

    im = imresize(frame, [224 224]) ;
    im_ = single(im) ; 
    im_ = bsxfun(@minus,im_,net.meta.normalization.averageImage) ;
    tic
    res = vl_simplenn(net, im_) ;
    scores = squeeze(gather(res(end).x)) ;
    [bestScore, best] = max(scores) ;
    time = toc;


    % set(handles.edit1,'String', net.meta.classes.name{best});
    if bestScore>0.1
        set(handles.edit2,'String', strcat(net.meta.classes.name{best}));
    else
        set(handles.edit2,'String','warning');
    end
    
    if(best <= 100)
        set(handles.edit2,'String','warning');
    end
    
    set(handles.edit1,'String', strcat(num2str(time),'s'));




% --- Executes on button press in xunlian.
function xunlian_Callback(hObject, eventdata, handles)
% hObject    handle to xunlian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.edit5,'String','正在训练');

load('facenet.mat') ;
net.layers = net.layers(1:33);
renlianku_root = '人脸库';
renlianku_list = dir(renlianku_root);
load imdb.mat;


labels(1:2000)= images.labels(1:2000);
sets(1:2000) = images.set(1:2000);

n = 2001;

for i=3:length(renlianku_list);
    imlist = dir(fullfile(renlianku_root,renlianku_list(i).name));
        for j=3:length(imlist)
            im = imread(fullfile(renlianku_root,renlianku_list(i).name,imlist(j).name));

            if(length(size(im))) == 2
                im1(:,:,1) = im;
                im1(:,:,2) = im;
                im1(:,:,3) = im;
                im = im1;
            end

            im = imresize(im,[224,224]);
            data(:,:,:,n) = im;
            labels(1,n) = i-2+100;
            sets(1,n) = 1;
            n = n + 1;
        end
end

images.labels = labels;
images.set = sets;
n

imageschuli = zeros(1,1,4096,n-1);
for i=2001:n-1
    im = data(:,:,:,i) ; % crop
    im_ = single(im) ; % note: 255 rang
    im_ = bsxfun(@minus,im_,net.meta.normalization.averageImage) ;
   
    res = vl_simplenn(net, im_) ;
    % show the classification result
    imageschuli(:,:,:,i) = gather(res(end).x);
    i
end


images.data(:,:,:,2001:n-1) = imageschuli(:,:,:,2001:end);
images.data = images.data(:,:,:,1:n-1);

save('matconvnet-1.0-beta18\data\mnist-baselinesimplenn\imdb.mat','images');
reslist = dir('matconvnet-1.0-beta18\data\mnist-baselinesimplenn');

for i=3:length(reslist)
   if reslist(i).name(1) == 'n'
    delete(strcat('matconvnet-1.0-beta18\data\mnist-baselinesimplenn\',reslist(i).name));
   end
end
cnn_mnist(labels(end));
net1 = load('matconvnet-1.0-beta18\data\mnist-baselinesimplenn\net-epoch-10.mat');
net.layers(34:length(net1.net.layers)+33) = net1.net.layers(1:end);
for i=3:length(renlianku_list)
    net.meta.classes.name(100+i-2) = {renlianku_list(i).name};
end
save('facenet.mat','net');
set(handles.edit5,'String','训练完成');


% --- Executes on button press in zairu.
function zairu_Callback(hObject, eventdata, handles)
% hObject    handle to zairu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global oop;

[X Y ] = uigetfile('*.*');
global frame;
frame = imread(strcat(Y,X));
axes(handles.axes1);
imshow(frame);
oop = 0;

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on mouse press over axes background.
function axes4_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
