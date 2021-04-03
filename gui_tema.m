function varargout = gui_tema(varargin)
% GUI_TEMA MATLAB code for gui_tema.fig
%      GUI_TEMA, by itself, creates a new GUI_TEMA or raises the existing
%      singleton*.
%
%      H = GUI_TEMA returns the handle to a new GUI_TEMA or the handle to
%      the existing singleton*.
%
%      GUI_TEMA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_TEMA.M with the given input arguments.
%
%      GUI_TEMA('Property','Value',...) creates a new GUI_TEMA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_tema_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_tema_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_tema

% Last Modified by GUIDE v2.5 19-Dec-2020 18:05:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_tema_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_tema_OutputFcn, ...
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


% --- Executes just before gui_tema is made visible.
function gui_tema_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_tema (see VARARGIN)
    handles.Imagine1=imread('X_&_0_1.jpg');
    handles.Imagine2=imread('X_&_0_2.jpg');
    %figure;
    %imshow(handles.Imagine2)
    % Set the current data value.
    handles.current_data = handles.Imagine1;
    %figure;
    %imshow(handles.current_data)
    % Choose default command line output for sample_gui
    % Choose default command line output for gui_tema
    handles.output = hObject;
    % Update handles structure
    guidata(hObject, handles);

% UIWAIT makes gui_tema wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_tema_OutputFcn(hObject, eventdata, handles) 
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
    str = get(hObject, 'String');
    val = get(hObject,'Value');
    % Set current data to the selected data set.
    switch str{val};
    case 'Imagine_1' 
       handles.current_data = handles.Imagine1;
       imshow(handles.Imagine1)
    case 'Imagine_2' 
       handles.current_data = handles.Imagine2;
       imshow(handles.Imagine2)
    end
    % Save the handles structure.
    guidata(hObject,handles)
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    img1 = imresize(handles.current_data,0.5);
    gray = rgb2gray(img1);
    prag = 70;
    imgBinara = preprocess(gray,prag);
    [nrObiecte,proprX0, t_en, t_area] = connectedElemAndRegionProprs(imgBinara);
    intervalArie = [ 2500 7000];
    intervalENZero = [0, 0.95];
    intervalENX = [0.8, 1];
    %[nrObiecte,proprX0, t_en, t_area] = connectedElemAndRegionProprs(imgBinara);
    [centroidX,centroidY,centroidX_X, centroidY_X,centroidX_0,centroidY_0] = findCentroid(img1,proprX0,t_area,t_en);
     A = 2*ones(3,3);
    [A] = findCoordFor0(centroidX_0,centroidY_0, A);
    [A] = findCoordForX(centroidX_X,centroidY_X,A);
    [player, remiza, nu_se_stie] = predictResult(A);
    %set(handles.text2, 'String', sprintf(predictResult(A)));
    if(player == 1 || player ==0)
        handles.text2.String= (sprintf('Castigator: %d',player));
    elseif(remiza == 1)
        handles.text2.String= (sprintf('Remiza'));
    elseif(nu_se_stie ==1)
        handles.text2.String= (sprintf('Ambii jucatori pot castiga'));
    end
    
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    img1 = imresize(handles.current_data,0.5);
    gray = rgb2gray(img1);
    prag = 70;
    imgBinara = preprocess(gray,prag);
    [nrObiecte,proprX0, t_en, t_area] = connectedElemAndRegionProprs(imgBinara);
    intervalArie = [ 2500 7000];
    intervalENZero = [0, 0.95];
    intervalENX = [0.8, 1];
   [imgElemArea,imgXEulerNo,imgZeroEulerNo] = filterImage(imgBinara, intervalArie, intervalENZero, intervalENX);
   detectXand0(img1,nrObiecte,t_en, t_area,proprX0);

% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
    %predictResult(A)

