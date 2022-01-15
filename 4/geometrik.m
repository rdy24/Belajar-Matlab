function varargout = geometrik(varargin)
% GEOMETRIK MATLAB code for geometrik.fig
%      GEOMETRIK, by itself, creates a new GEOMETRIK or raises the existing
%      singleton*.
%
%      H = GEOMETRIK returns the handle to a new GEOMETRIK or the handle to
%      the existing singleton*.
%
%      GEOMETRIK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GEOMETRIK.M with the given input arguments.
%
%      GEOMETRIK('Property','Value',...) creates a new GEOMETRIK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before geometrik_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to geometrik_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help geometrik

% Last Modified by GUIDE v2.5 31-Oct-2021 18:29:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @geometrik_OpeningFcn, ...
                   'gui_OutputFcn',  @geometrik_OutputFcn, ...
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


% --- Executes just before geometrik is made visible.
function geometrik_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to geometrik (see VARARGIN)

% Choose default command line output for geometrik
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes geometrik wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = geometrik_OutputFcn(hObject, eventdata, handles) 
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
I = rgb2gray(imread(namafile));
set(open.figure1,'CurrentAxes',open.axes1); 
set(imagesc(I));colormap('gray'); 
set(open.axes1,'Userdata',I);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
Tx = 20;
Ty = 50;
C = get(open.axes1,'Userdata'); 
[r c] = size(C);
for x = 1 : r
    for y = 1 : c
        D(x+Tx, y+Ty) = C(x,y);
    end
end
set(open.figure1,'CurrentAxes',open.axes2); 
set(imagesc(D));colormap('gray'); 
set(open.axes2,'Userdata',D);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
I = get(open.axes1,'Userdata');
C = imcrop(I,[50 50 150 150]);
set(open.figure1,'CurrentAxes',open.axes3); 
set(imagesc(C));colormap('gray'); 
set(open.axes3,'Userdata',C);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
I = get(open.axes1,'Userdata');
[r c] = size(I);
for x = 1 : r
    for y = 1 : c
        J(x,y) = I((r-x)+1, y);
    end
end
set(open.figure1,'CurrentAxes',open.axes4); 
set(imagesc(J));colormap('gray'); 
set(open.axes4,'Userdata',J);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
I = get(open.axes1,'Userdata');
theta = 45;
D = imrotate(I,theta); 
set(open.figure1,'CurrentAxes',open.axes5); 
set(imagesc(D));colormap('gray'); 
set(open.axes5,'Userdata',D);




% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
I = get(open.axes1,'Userdata');
ShX = 6;
ShY = 8;
m = size(I,1);
n = size(I,2); 
r = m*ShX;
c = n*ShY; 
for x = 1 : m
    for y = 1 : n
        J((x-1)*ShX+1 : x*ShX, (y-1)*ShY+1 : y*ShY) = I(x,y);
    end
end
set(open.figure1,'CurrentAxes',open.axes6); 
set(imagesc(J));colormap('gray'); 
set(open.axes6,'Userdata',J);


