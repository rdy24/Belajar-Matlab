function varargout = filer(varargin)
% FILER MATLAB code for filer.fig
%      FILER, by itself, creates a new FILER or raises the existing
%      singleton*.
%
%      H = FILER returns the handle to a new FILER or the handle to
%      the existing singleton*.
%
%      FILER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FILER.M with the given input arguments.
%
%      FILER('Property','Value',...) creates a new FILER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before filer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to filer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help filer

% Last Modified by GUIDE v2.5 06-Dec-2021 17:55:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @filer_OpeningFcn, ...
                   'gui_OutputFcn',  @filer_OutputFcn, ...
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


% --- Executes just before filer is made visible.
function filer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to filer (see VARARGIN)

% Choose default command line output for filer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes filer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = filer_OutputFcn(hObject, eventdata, handles) 
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
I = get(open.axes1,'Userdata');      
k = [-1 -1 -1; -1 9 -1; -1 -1 -1];            
[r c] = size(I);        
[m n] = size(k);      
Rep = padarray (I,[1 1]); 
Rep = double (Rep);
for x = 1 : r       
    for y = 1  : c 
        jum = 0;
        for i = 1 : m
            for j = 1 : n
                q = x - 1;
                w = y -1;
                jum = jum + (Rep(i + q, j + w) * k(i, j));
            end
        end
        B(x,y)=jum;
    end
end
set(open.figure1,'CurrentAxes',open.axes2); 
set(imagesc(B));colormap('gray'); 
set(open.axes2,'Userdata',B);



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
[namafile]=uigetfile({'*.jpg;*.bmp;*.tif'},'openimage'); 
I = rgb2gray(imread(namafile));
I = imnoise (I,'salt & pepper',0.01);
set(open.figure1,'CurrentAxes',open.axes3); 
set(imagesc(I));colormap('gray'); 
set(open.axes3,'Userdata',I);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
I = get(open.axes3,'Userdata'); 
[r c] = size(I);           
Rep = padarray (I,[1 1]); 
Rep = double (Rep);
B = zeros (r,c);
for x = 1 : r       
    for y = 1  : c 
       for i = 1 : 3
            for j = 1 : 3
                q = x - 1;
                w = y -1;
                array((i - 1) * 3 + j) = Rep(i + q, j + w);
            end
        end
        B(x, y) = median(array(:));
    end
end
set(open.figure1,'CurrentAxes',open.axes4); 
set(imagesc(B));colormap('gray'); 
set(open.axes4,'Userdata',B);

