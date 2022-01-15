function varargout = aritmatika(varargin)
% ARITMATIKA MATLAB code for aritmatika.fig
%      ARITMATIKA, by itself, creates a new ARITMATIKA or raises the existing
%      singleton*.
%
%      H = ARITMATIKA returns the handle to a new ARITMATIKA or the handle to
%      the existing singleton*.
%
%      ARITMATIKA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARITMATIKA.M with the given input arguments.
%
%      ARITMATIKA('Property','Value',...) creates a new ARITMATIKA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before aritmatika_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to aritmatika_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help aritmatika

% Last Modified by GUIDE v2.5 24-Oct-2021 14:16:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @aritmatika_OpeningFcn, ...
                   'gui_OutputFcn',  @aritmatika_OutputFcn, ...
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


% --- Executes just before aritmatika is made visible.
function aritmatika_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to aritmatika (see VARARGIN)

% Choose default command line output for aritmatika
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes aritmatika wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = aritmatika_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
[namafile]=uigetfile({'*.jpg;*.bmp;*.tif'},'openimage'); 
I = imread(namafile);
A = rgb2gray(I);
set(open.figure1,'CurrentAxes',open.axes1); 
set(imagesc(A));colormap('gray'); 
set(open.axes1,'Userdata',A);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
[namafile]=uigetfile({'*.jpg;*.bmp;*.tif'},'openimage'); 
I=imread(namafile); 
set(open.figure1,'CurrentAxes',open.axes2); 
set(imagesc(I));colormap('gray'); 
set(open.axes2,'Userdata',I); 


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
A   = double(get(open.axes1,'Userdata'));
B   = double(get(open.axes2,'Userdata'));
wa = 0.7;
wb = 0.3;
[r1 c1] =   size(A);    
[r2 c2] =   size(B);
if (r1 ==r2) && (c1 == c2)
    for x = 1 : r1  
        for y = 1 : c1
            C(x,y) = A(x,y)*wa+B(x,y)*wb;
        end         
    end                 
end
C = clipping(C);
set(open.figure1,'CurrentAxes',open.axes3);
set(imagesc(C));colormap('gray');
set(open.axes3,'Userdata',C);



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
A   = double(get(open.axes1,'Userdata'));
B   = double(get(open.axes2,'Userdata'));
[r1 c1] =   size(A);    
[r2 c2] =   size(B);
if (r1 ==r2) && (c1 == c2)
    for x = 1 : r1  
        for y = 1 : c1
            C(x,y) = A(x,y)-B(x,y);
        end         
    end                 
end
C = clipping(C);
set(open.figure1,'CurrentAxes',open.axes4);
set(imagesc(C));colormap('gray');
set(open.axes4,'Userdata',C);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
A   = double(get(open.axes1,'Userdata'));
[r c] = size(A);
for x = 1 : r
    for y = 1 : c
        B(x,y) = A(x,y)*2;
    end
end
B = clipping(B);
set(open.figure1,'CurrentAxes',open.axes5);
set(imagesc(B));colormap('gray');
set(open.axes5,'Userdata',B);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
A   = double(get(open.axes1,'Userdata'));
[r c] = size(A);
for x = 1 : r
    for y = 1 : c
        B(x,y) = A(x,y)/1000;
    end
end
B = clipping(B);
set(open.figure1,'CurrentAxes',open.axes6);
set(imagesc(B));colormap('gray');
set(open.axes6,'Userdata',B);
