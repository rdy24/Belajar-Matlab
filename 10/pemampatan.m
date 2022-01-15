function varargout = pemampatan(varargin)
% PEMAMPATAN MATLAB code for pemampatan.fig
%      PEMAMPATAN, by itself, creates a new PEMAMPATAN or raises the existing
%      singleton*.
%
%      H = PEMAMPATAN returns the handle to a new PEMAMPATAN or the handle to
%      the existing singleton*.
%
%      PEMAMPATAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PEMAMPATAN.M with the given input arguments.
%
%      PEMAMPATAN('Property','Value',...) creates a new PEMAMPATAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pemampatan_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pemampatan_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pemampatan

% Last Modified by GUIDE v2.5 24-Dec-2021 20:21:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pemampatan_OpeningFcn, ...
                   'gui_OutputFcn',  @pemampatan_OutputFcn, ...
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


% --- Executes just before pemampatan is made visible.
function pemampatan_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pemampatan (see VARARGIN)

% Choose default command line output for pemampatan
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pemampatan wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pemampatan_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
[namafile]=uigetfile({'*.jpg;*.bmp;*.tif;*.jpeg'},'openimage'); 
I = imread(namafile);
set(open.figure1,'CurrentAxes',open.axes1); 
set(imagesc(I));colormap('gray'); 
set(open.axes1,'Userdata',I);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
[namafile]=uigetfile({'*.jpg;*.bmp;*.tif;*.jpeg'},'openimage'); 
I = imread(namafile);
set(open.figure1,'CurrentAxes',open.axes2); 
set(imagesc(I));colormap('gray'); 
set(open.axes2,'Userdata',I);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
cover = get(open.axes1,'Userdata');
message = get(open.axes2,'Userdata'); 
bitpos = 8;
message = round(message/256);
r = size(cover, 1); 
c = size(cover, 2);
I = cover;
for i = 1 : r
   for j = 1 : c
      I(i, j) = bitset(I(i, j),bitpos, message(i, j));
   end
end
set(open.figure1,'CurrentAxes',open.axes3); 
set(imagesc(I));colormap('gray'); 
set(open.axes3,'Userdata',I);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
I = get(open.axes3,'Userdata');
bitpos = 8;
r = size(I, 1);
c = size(I, 2);
for i = 1 : r
   for j = 1 : c
      W(i, j) = bitget(I(i, j), bitpos);
   end
end
W = 256 * W;
set(open.figure1,'CurrentAxes',open.axes4); 
set(imagesc(W));colormap('gray'); 
set(open.axes4,'Userdata',W);
