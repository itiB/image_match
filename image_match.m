function varargout = imgmatch_gui(varargin)
% IMGMATCH_GUI MATLAB code for imgmatch_gui.fig
%      IMGMATCH_GUI, by itself, creates a new IMGMATCH_GUI or raises the existing
%      singleton*.
%
%      H = IMGMATCH_GUI returns the handle to a new IMGMATCH_GUI or the handle to
%      the existing singleton*.
%
%      IMGMATCH_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMGMATCH_GUI.M with the given input arguments.
%
%      IMGMATCH_GUI('Property','Value',...) creates a new IMGMATCH_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imgmatch_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imgmatch_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imgmatch_gui

% Last Modified by GUIDE v2.5 20-Nov-2018 19:00:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imgmatch_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @imgmatch_gui_OutputFcn, ...
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
end

% --- Executes just before imgmatch_gui is made visible.
function imgmatch_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imgmatch_gui (see VARARGIN)

% get filelist
filelist = ls;
set(handles.listbox1, 'String', filelist)

% Choose default command line output for imgmatch_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imgmatch_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = imgmatch_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
end

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    filelist = get(handles.listbox1, 'String');
    fileidx = get(handles.listbox1, 'Value');
    filename = filelist(fileidx,:);
    set(handles.edit1, 'String', filename)
end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    filelist = get(handles.listbox1, 'String');
    fileidx = get(handles.listbox1, 'Value');
    filename = filelist(fileidx,:);
    set(handles.edit2, 'String', filename)
end


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end



function  imagematch(img1, img2)
    original = imread(img1);
    origin = rgb2gray(original);

    distored = imread(img2);
    dist = rgb2gray(distored);

    %���������}�b�`���O��g�p�����C���[�W�̉�]����уX�P�[�����o
    %�����̒��o
    ptsOriginal = detectSURFFeatures(origin);
    ptsDistored = detectSURFFeatures(dist);

    %�����̋L�q�q�𒊏o
    [featuresOriginal,  validPtsOriginal] = extractFeatures(origin, ptsOriginal);   
    [featuresDistored, validPtsDistored] = extractFeatures(dist, ptsDistored);

    %�L�q�q��p����������v
    indexPairs = matchFeatures(featuresOriginal, featuresDistored);


    %�e�C���[�W�ɑΉ�����|�C���g�ʒu�̎擾
    matchedOriginal = validPtsOriginal(indexPairs(:,1));
    matchedDistored = validPtsDistored(indexPairs(:,2));

    plot(showMatchedFeatures(original, distored, matchedOriginal, matchedDistored))
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    imagematch(get(handles.edit1, 'String'), get(handles.edit2, 'String'))
end
