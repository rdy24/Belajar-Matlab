function varargout = convertimg(varargin)
% CONVERTIMG MATLAB code for convertimg.fig
%      CONVERTIMG, by itself, creates a new CONVERTIMG or raises the existing
%      singleton*.
%
%      H = CONVERTIMG returns the handle to a new CONVERTIMG or the handle to
%      the existing singleton*.
%
%      CONVERTIMG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONVERTIMG.M with the given input arguments.
%
%      CONVERTIMG('Property','Value',...) creates a new CONVERTIMG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before convertimg_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to convertimg_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help convertimg

% Last Modified by GUIDE v2.5 25-Nov-2021 20:17:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @convertimg_OpeningFcn, ...
                   'gui_OutputFcn',  @convertimg_OutputFcn, ...
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


% --- Executes just before convertimg is made visible.
function convertimg_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to convertimg (see VARARGIN)

% Choose default command line output for convertimg
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes convertimg wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = convertimg_OutputFcn(hObject, eventdata, handles) 
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
set(open.figure1,'CurrentAxes',open.axes1); 
set(imagesc(I));colormap('gray'); 
set(open.axes1,'Userdata',I);



% --- Executes on button press in radiobutton4.
function radiobutton5_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
I=ntsc2rgb(get(open.axes2,'Userdata'));
set(open.figure1,'CurrentAxes',open.axes3);
set(imagesc(I));colormap('gray');
set(open.axes3,'Userdata',I);


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
I=lab2rgb(get(open.axes2,'Userdata'));
set(open.figure1,'CurrentAxes',open.axes3);
set(imagesc(I));colormap('gray');
set(open.axes3,'Userdata',I);


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
I=hsv2rgb(get(open.axes2,'Userdata'));
set(open.figure1,'CurrentAxes',open.axes3);
set(imagesc(I));colormap('gray');
set(open.axes3,'Userdata',I);


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
I=xyz2rgb(get(open.axes2,'Userdata'));
set(open.figure1,'CurrentAxes',open.axes3);
set(imagesc(I));colormap('gray');
set(open.axes3,'Userdata',I);


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
I=rgb2ntsc(get(open.axes1,'Userdata'));
set(open.figure1,'CurrentAxes',open.axes2);
set(imagesc(I));colormap('gray');
set(open.axes2,'Userdata',I);


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
I=rgb2lab(get(open.axes1,'Userdata'));
set(open.figure1,'CurrentAxes',open.axes2);
set(imagesc(I));colormap('gray');
set(open.axes2,'Userdata',I);


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
I=rgb2hsv(get(open.axes1,'Userdata'));
set(open.figure1,'CurrentAxes',open.axes2);
set(imagesc(I));colormap('gray');
set(open.axes2,'Userdata',I);


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
I=rgb2xyz(get(open.axes1,'Userdata'));
set(open.figure1,'CurrentAxes',open.axes2);
set(imagesc(I));colormap('gray');
set(open.axes2,'Userdata',I);
