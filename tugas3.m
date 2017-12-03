function varargout = tugas3(varargin)
% TUGAS3 MATLAB code for tugas3.fig
%      TUGAS3, by itself, creates a new TUGAS3 or raises the existing
%      singleton*.
%
%      H = TUGAS3 returns the handle to a new TUGAS3 or the handle to
%      the existing singleton*.
%
%      TUGAS3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUGAS3.M with the given input arguments.
%
%      TUGAS3('Property','Value',...) creates a new TUGAS3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tugas3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tugas3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tugas3

% Last Modified by GUIDE v2.5 04-Dec-2017 01:48:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tugas3_OpeningFcn, ...
                   'gui_OutputFcn',  @tugas3_OutputFcn, ...
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

function setGlobalt(val)
    global t
    t = val;
    
function r = getGlobalt
    global t
    r = t;
function setGlobalImage(val)
    global d
    d = val;
    
function r = getGlobalImage
    global d
    r = d;    
function setGlobals(val)
    global s
    s = val;
    
function r = getGlobals
    global s
    r = s;
function setGlobald(val)
    global de
    de = val;
    
function r = getGlobald
    global de
    r = de;
function setGlobalMask(val)
    global mask
    mask = val;
    
function r = getGlobalMask
    global mask
    r = mask;

% --- Executes just before tugas3 is made visible.
function tugas3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tugas3 (see VARARGIN)

% Choose default command line output for tugas3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tugas3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tugas3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btntambah.



% --- Executes on button press in btnbrowse.
function btnbrowse_Callback(hObject, eventdata, handles)
    [filename pathname] = uigetfile('*.jpg','File Selector');
    img = imread(filename);
    axes(handles.axes1);
    imshow(img);
    setGlobalImage(img)
    setGlobalt(img);
    res=[size(img,1),size(img,2)];
    res = strcat(int2str(res(1)),'x',int2str(res(2)));
    set(handles.resol,'string',res);
    mask = [0,1,1;0,1,0;0,0,0];
    setGlobalMask(mask);
    

% hObject    handle to btnbrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in btnHasil.


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over kepanjangan.
% hObject    handle to kepanjangan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in btnputar.
function btnputar_Callback(hObject, eventdata, handles)
    d = putar90(getGlobalt);
    setGlobalt(d);
    imshow(d);
    
% hObject    handle to btnputar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_FAB.
function btn_FAB_Callback(hObject, eventdata, handles)
    d = flipatasbawah(getGlobalt);
    setGlobalt(d);
    imshow(d);
% hObject    handle to btn_FAB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btn_FKK.
function btn_FKK_Callback(hObject, eventdata, handles)
    d = flipkirikanan(getGlobalt);
    setGlobalt(d);
    imshow(d);
% hObject    handle to btn_FKK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnBesarin.
function btnBesarin_Callback(hObject, eventdata, handles)
% hObject    handle to btnBesarin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    s = getGlobals
    [d,res] = perbesar(getGlobalt,s);
    res = strcat(int2str(res(1)),'x',int2str(res(2)));
    k = '';
    set(handles.resol,'string',res);
    set(handles.inputBesar,'string',k);
    setGlobalt(d);
    figure
    imshow(d);



function inputBesar_Callback(hObject, eventdata, handles)
% hObject    handle to inputBesar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputBesar as text
%        str2double(get(hObject,'String')) returns contents of inputBesar as a double
    x = str2double(get(handles.inputBesar, 'string'));
    setGlobals(x);

% --- Executes during object creation, after setting all properties.
function inputBesar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputBesar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnKecil.
function btnKecil_Callback(hObject, eventdata, handles)
% hObject    handle to btnKecil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  
    s = getGlobals
    [d,res] = perkecil(getGlobalt,s);
    res = strcat(int2str(res(1)),'x',int2str(res(2)));
    k = '';
    set(handles.resol,'string',res);
    set(handles.InputKecil,'string',k);
    setGlobalt(d);
    figure
    imshow(d);


function InputKecil_Callback(hObject, eventdata, handles)
% hObject    handle to InputKecil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InputKecil as text
%        str2double(get(hObject,'String')) returns contents of InputKecil as a double
    x = str2double(get(handles.InputKecil, 'string'));
    setGlobals(x);

% --- Executes during object creation, after setting all properties.
function InputKecil_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InputKecil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnNDerajat.
function btnNDerajat_Callback(hObject, eventdata, handles)
% hObject    handle to btnNDerajat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    deg = getGlobald
    d = putarDerajat(getGlobalt,deg);
    k = '';
    set(handles.InputDerajat,'string',k);
    setGlobalt(d);
    imshow(d);


function InputDerajat_Callback(hObject, eventdata, handles)
% hObject    handle to InputDerajat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InputDerajat as text
%        str2double(get(hObject,'String')) returns contents of InputDerajat as a double
    x = str2double(get(handles.InputDerajat, 'string'));
    setGlobald(x);

% --- Executes during object creation, after setting all properties.
function InputDerajat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InputDerajat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnCrop.
function btnCrop_Callback(hObject, eventdata, handles)
% hObject    handle to btnCrop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    rect=getrect(handles.axes1);
    d=getGlobalt;
    [E,res] = potong(d,rect);
    res = strcat(int2str(res(1)),'x',int2str(res(2)));
    set(handles.resol,'string',res);
    imshow(E);
    setGlobalt(E);
 


% --- Executes on button press in btnSave.
function btnSave_Callback(hObject, eventdata, handles)
% hObject    handle to btnSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    d = getGlobalt;
    imwrite(d,'hasil.jpg');


% --- Executes on button press in btnmeanF.
function btnmeanF_Callback(hObject, eventdata, handles)
% hObject    handle to btnmeanF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    s = getGlobals;
    d = filterata(getGlobalt,s);
    setGlobalt(d);
    imshow(d);
    set(handles.InputMeanF,'string','');


function InputMeanF_Callback(hObject, eventdata, handles)
% hObject    handle to InputMeanF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InputMeanF as text
%        str2double(get(hObject,'String')) returns contents of InputMeanF as a double
x = str2double(get(handles.InputMeanF, 'string'));
    setGlobals(x);

% --- Executes during object creation, after setting all properties.
function InputMeanF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InputMeanF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnMedianF.
function btnMedianF_Callback(hObject, eventdata, handles)
% hObject    handle to btnMedianF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    s = getGlobals;
    d = filtermedian(getGlobalt,s);
    setGlobalt(d);
    imshow(d);
    set(handles.InputMedianF,'string','');


function InputMedianF_Callback(hObject, eventdata, handles)
% hObject    handle to InputMedianF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InputMedianF as text
%        str2double(get(hObject,'String')) returns contents of InputMedianF as a double
x = str2double(get(handles.InputMedianF, 'string'));
    setGlobals(x);

% --- Executes during object creation, after setting all properties.
function InputMedianF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InputMedianF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnModusF.
function btnModusF_Callback(hObject, eventdata, handles)
% hObject    handle to btnModusF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    s = getGlobals;
    d = filtermedian(getGlobalt,s);
    setGlobalt(d);
    imshow(d);
    set(handles.InputModusF,'string','');


function InputModusF_Callback(hObject, eventdata, handles)
% hObject    handle to InputModusF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InputModusF as text
%        str2double(get(hObject,'String')) returns contents of InputModusF as a double
x = str2double(get(handles.InputModusF, 'string'));
    setGlobals(x);

% --- Executes during object creation, after setting all properties.
function InputModusF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InputModusF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnEqualisasi.
function btnEqualisasi_Callback(hObject, eventdata, handles)
% hObject    handle to btnEqualisasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    s = getGlobals;
    d = HistEQ(getGlobalt);
    setGlobalt(d);
    imshow(d);

% --- Executes on button press in btnSpesifikasi.
function btnSpesifikasi_Callback(hObject, eventdata, handles)
% hObject    handle to btnSpesifikasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnOutputHisto.
function btnOutputHisto_Callback(hObject, eventdata, handles)
% hObject    handle to btnOutputHisto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    outputHisto(getGlobalt);
    


% --- Executes on button press in BtnReset.
function BtnReset_Callback(hObject, eventdata, handles)
% hObject    handle to BtnReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    img = getGlobalImage();
    setGlobalt(img);
    axes(handles.axes1);
    imshow(img);
    

% --- Executes on button press in BtnEdge.
function BtnEdge_Callback(hObject, eventdata, handles)
% hObject    handle to BtnEdge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    img =getGlobalt();
    d = sobel(img);
    setGlobalt(d);
    axes(handles.axes1);
    imshow(d);

% --- Executes on button press in BtnDilasi.
function BtnDilasi_Callback(hObject, eventdata, handles)
% hObject    handle to BtnDilasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    img =getGlobalt();
    mask = [0,1,1;0,1,1;0,1,1];
    d = Dilasi(img,mask,size(mask,1));
    %setGlobalt(d);
    axes(handles.axes1);
    imshow(d);

% --- Executes on button press in BtnErosi.
function BtnErosi_Callback(hObject, eventdata, handles)
% hObject    handle to BtnErosi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    img =getGlobalt();
    mask = [0,1,1;0,1,0;0,0,0];
    d = Erosi(img,mask,size(mask,1));
    %setGlobalt(d);
    axes(handles.axes1);
    imshow(d);

% --- Executes on button press in BtnThin.
function BtnThin_Callback(hObject, eventdata, handles)
% hObject    handle to BtnThin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
