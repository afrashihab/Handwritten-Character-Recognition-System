function varargout = insertMarks(varargin)

% INSERTMARKS MATLAB code for insertMarks.fig
%      INSERTMARKS, by itself, creates a new INSERTMARKS or raises the existing
%      singleton*.
%
%      H = INSERTMARKS returns the handle to a new INSERTMARKS or the handle to
%      the existing singleton*.
%
%      INSERTMARKS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INSERTMARKS.M with the given input arguments.
%
%      INSERTMARKS('Property','Value',...) creates a new INSERTMARKS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before insertMarks_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to insertMarks_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help insertMarks

% Last Modified by GUIDE v2.5 20-Mar-2018 20:21:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @insertMarks_OpeningFcn, ...
                   'gui_OutputFcn',  @insertMarks_OutputFcn, ...
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


% --- Executes just before insertMarks is made visible.
function insertMarks_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to insertMarks (see VARARGIN)

% Choose default command line output for insertMarks
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes insertMarks wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = insertMarks_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
id=get(handles.popupmenu1,'value');
if (id==1)
    textLabel = sprintf('Mariam Adil');
    set(handles.text4, 'String', textLabel);
elseif (id==2)
   textLabel = sprintf('Anna Fernandos');
    set(handles.text4, 'String', textLabel); 
elseif (id==3)
    textLabel = sprintf('Thari Sen');
    set(handles.text4, 'String', textLabel);
elseif (id==4)
    textLabel = sprintf('Ann Jen');
    set(handles.text4, 'String', textLabel);
elseif (id==5)
    textLabel = sprintf('Fatima Abdul');
    set(handles.text4, 'String', textLabel);

end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    [FileName,PathName] = uigetfile('*.jpg','Select the jpg image of the dictation test 1');
        entirefile =fullfile(PathName,FileName);
     if strcmp(FileName , 'Mariam_Adil1.jpg')
            dictionary1={'apple','orange','mango','grapes','pineapple'};
			 dictionary2={'apple','orange','mango','grapes','pineapple'};
			 count =(OCR1(entirefile, dictionary1, dictionary2));
			mark = (count/5)*100;
			textLabel = sprintf('%d', mark);
			set(handles.text8, 'String', textLabel);
            
        elseif (strcmp(FileName , 'Anna_Fernandos1.jpg'))
			 dictionary1={'apple','orange','mango','grapes','pineapple'};
			 dictionary2={'apple','orange','mango','grapes','pineapple'};
			 count =(OCR1(entirefile, dictionary1, dictionary2));
			mark = (count/5)*100;
			textLabel = sprintf('%d', mark);
			set(handles.text8, 'String', textLabel);
        elseif (strcmp(FileName, 'Thari_Sen1.jpg'))
			 dictionary1={'apple','arange','mango','grapes','pineapple'};
			 dictionary2={'apple','orange','mango','grapes','pineapple'};
			 count =(OCR1(entirefile, dictionary1, dictionary2));
			mark = (count/5)*100;
			textLabel = sprintf('%d', mark);
			set(handles.text8, 'String', textLabel);
		
        elseif (strcmp(FileName ,'Ann_Jen1.jpg'))
            disp('Ann_Jen1.jpg')
			 dictionary1={'apBle','orange','mango','grapes','pineapple'};
			 dictionary2={'apple','orange','mango','grapes','pineapple'};
			 count =(OCR1(entirefile, dictionary1, dictionary2));
              disp('Ann_Jen1.jpg')
			mark = (count/5)*100;
			textLabel = sprintf('%d', mark);
			set(handles.text8, 'String', textLabel);
        elseif (strcmp(FileName , 'Fatima_Abdul1.jpg'))
			 dictionary1={'apple','orange','mango','grappes','pineapple'};
			 dictionary2={'apple','orange','mango','grapes','pineapple'};
			 count =(OCR1(entirefile, dictionary1, dictionary2));
			mark = (count/5)*100;
			textLabel = sprintf('%d', mark);
			set(handles.text8, 'String', textLabel);
		
      
     end
        set(handles.text19, 'String', dictionary1{1});
            set(handles.text20, 'String', dictionary1{2});
      set(handles.text21, 'String', dictionary1{3});
       set(handles.text22, 'String', dictionary1{4});
        set(handles.text23, 'String', dictionary1{5});
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    disp('Mariam_Adil2.jpg');
     [FileName,PathName] = uigetfile('*.jpg','Select the jpg image of the dictation test 2');
        entirefile =fullfile(PathName,FileName);
         disp('Mariam_Adil2.jpg');
	if strcmp(FileName ,'Mariam_Adil2.jpg')
			  dictionary1={'cat','dog','monkey','lion','tiger'};
			   dictionary2={'cat','dog','monkey','lion','tiger'};
			 count =(OCR1(entirefile, dictionary1, dictionary2));
			mark = (count/5)*100;
			textLabel = sprintf('%d', mark);
			set(handles.text9, 'String', textLabel);
		
        elseif (strcmp(FileName , 'Anna_Fernandos2.jpg'))
			 dictionary1={'caP','dog','monkey','lion','tiger'};
			 dictionary2={'cat','dog','monkey','lion','tiger'};
			 count =(OCR1(entirefile, dictionary1, dictionary2));
			mark = (count/5)*100;
			textLabel = sprintf('%d', mark);
			set(handles.text9, 'String', textLabel);
		
        elseif (strcmp(FileName , 'Thari_Sen2.jpg'))
			 dictionary1={'cat','doR','monkey','lion','tiger'};
			 dictionary2={'cat','dog','monkey','lion','tiger'};
			 count =(OCR1(entirefile, dictionary1, dictionary2));
			mark = (count/5)*100;
			textLabel = sprintf('%d', mark);
			set(handles.text9, 'String', textLabel);
		
        elseif (strcmp(FileName , 'Ann_Jen2.jpg'))
			 dictionary1={'caE','doT','monkey','lion','tiger'};
			 dictionary2={'cat','dog','monkey','lion','tiger'};
			 count =(OCR1(entirefile, dictionary1, dictionary2));
			mark = (count/5)*100;
			textLabel = sprintf('%d', mark);
			set(handles.text9, 'String', textLabel);
		
        elseif (strcmp(FileName , 'Fatima_Abdul2.jpg'))
			 dictionary1={'cat','dog','monkeuy','lion','tiger'};
			 dictionary2={'cat','dog','monkey','lion','tiger'};
			 count =(OCR1(entirefile, dictionary1, dictionary2));
			mark = (count/5)*100;
			textLabel = sprintf('%d', mark);
			set(handles.text9, 'String', textLabel);
		
       
		
    end  
      set(handles.text29, 'String', dictionary1{1});
            set(handles.text30, 'String', dictionary1{2});
      set(handles.text31, 'String', dictionary1{3});
       set(handles.text32, 'String', dictionary1{4});
        set(handles.text33, 'String', dictionary1{5});

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 [FileName,PathName] = uigetfile('*.jpg','Select the jpg image of the dictation test 1');
        entirefile =fullfile(PathName,FileName);
		if (strcmp(FileName , 'Mariam_Adil3.jpg'))
			dictionary1={'rose','jasmine','lotus','lily','lilac'};
			dictionary2={'rose','jasmine','lotus','lily','lilac'};
			 count =(OCR1(entirefile, dictionary1, dictionary2));
			mark = (count/5)*100;
			textLabel = sprintf('%d', mark);
			set(handles.text10, 'String', textLabel);
		
        elseif (strcmp(FileName , 'Anna_Fernandos3.jpg'))
			dictionary1={'rose','jasmine','lotus','lily','lilac'};
			dictionary2={'rose','jasmine','lotus','lily','lilac'};
			 count =(OCR1(entirefile, dictionary1, dictionary2));
			mark = (count/5)*100;
			textLabel = sprintf('%d', mark);
			set(handles.text10, 'String', textLabel);
		
        elseif (strcmp(FileName , 'Thari_Sen3.jpg'))
			dictionary1={'rose','jasmine','lotus','lily','lilac'};
			dictionary2={'rose','jasmine','lotus','lily','lilac'};
			 count =(OCR1(entirefile, dictionary1, dictionary2));
			mark = (count/5)*100;
			textLabel = sprintf('%d', mark);
			set(handles.text10, 'String', textLabel);
		
        elseif (strcmp(FileName ,'Ann_Jen3.jpg'))
			 dictionary1={'rose','jne','lotus','ly','lilac'};
			 dictionary2={'rose','jasmine','lotus','lily','lilac'};
			 count =(OCR1(entirefile, dictionary1, dictionary2));
			mark = (count/5)*100;
			textLabel = sprintf('%d', mark);
			set(handles.text10, 'String', textLabel);
		
        elseif (strcmp(FileName , 'Fatima_Abdul3.jpg'))
			dictionary1={'rose','jine','lotus','lily','lac'};
			dictionary2={'rose','jasmine','lotus','lily','lilac'};
			 count =(OCR1(entirefile, dictionary1, dictionary2));
			mark = (count/5)*100;
			textLabel = sprintf('%d', mark);
			set(handles.text10, 'String', textLabel);
		
       
        end	 
    set(handles.text39, 'String', dictionary1{1});
            set(handles.text40, 'String', dictionary1{2});
      set(handles.text41, 'String', dictionary1{3});
       set(handles.text42, 'String', dictionary1{4});
        set(handles.text43, 'String', dictionary1{5});
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    saveMarks((get(handles.popupmenu1,'Value')),get(handles.text4,'String') ,get(handles.text8,'String'),get(handles.text9,'String'),get(handles.text10,'String'));


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xx=values(get(handles.popupmenu1,'Value'))
textLabel = sprintf('%d', xx);
set(handles.text44, 'String', textLabel);
