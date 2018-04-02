function varargout = view(varargin)
% VIEW MATLAB code for view.fig
%      VIEW, by itself, creates a new VIEW or raises the existing
%      singleton*.
%
%      H = VIEW returns the handle to a new VIEW or the handle to
%      the existing singleton*.
%
%      VIEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VIEW.M with the given input arguments.
%
%      VIEW('Property','Value',...) creates a new VIEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before view_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to view_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help view

% Last Modified by GUIDE v2.5 21-Jan-2018 03:47:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @view_OpeningFcn, ...
                   'gui_OutputFcn',  @view_OutputFcn, ...
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


% --- Executes just before view is made visible.
function view_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to view (see VARARGIN)

% Choose default command line output for view
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes view wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = view_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('sss');
host = 'localhost';
hostusername = 'root';
hostpassword = '';
%Database Name
databasename = 'SystemAfra';
 
%JDBC Parameters
jdbcString = sprintf('jdbc:mysql://%s/%s', host, databasename);
jdbcDriver = 'com.mysql.jdbc.Driver';
 

 
%Now making DB connection Object
dbConn = database(databasename, hostusername, hostpassword, jdbcDriver, jdbcString);
 
%checking Connection Status
dbStatus = isopen(dbConn);
if (dbStatus==0)
    msg = sprintf('Failed To Establish Connection.\nReason: %s', dbConn.Message);
    msgbox(msg);
    return
else 
    selectquery='Select name, Dictation1,Dictation2,Dictation3 from studentmarks';
    curs=exec(dbConn,selectquery);
    curs=fetch(curs);
    set(handles.uitable1,'data',curs.Data);
    datas=curs.Data;
    l=(length(datas(:,2)));
    disp(datas(:,2));
    sumd1=0;
    for i =1:l
       sumd1=sumd1+ str2double(datas(i,2));
    end
    disp(sumd1);
    d1=sumd1/l;
    disp(d1);
    
    sumd2=0;
    for i =1:l
       sumd2=sumd2+ str2double(datas(i,3));
    end
    disp(sumd2);
    d2=sumd2/l;
    disp(d2);
    
    sumd3=0;
    for i =1:l
       sumd3=sumd3+ str2double(datas(i,4));
    end
    disp(sumd3);
    d3=sumd3/l;
    disp(d3);
   a1=[];
   a2=[];
   a3=[];
     for i =1:l
       a1(i)=d1;
       a2(i)=d2;
       a3(i)=d3;
     end
   
     
     net=feedforwardnet(10);

%train the neural network with the training inputs and targets
%net=train(net,a1,datas(:,2));

%view the network
%view(net);

%recommendation=net(a1(1));
%get the predicted output for each day
%disp(round(recommendation))
%category=round(recommendation);

%check neural network performance
%performance=perform(net,recommendation,targets);
 

    
    
    
    
    
    
end
