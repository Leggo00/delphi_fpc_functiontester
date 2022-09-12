{------------------------------------------------------------------------------

    NIDAQmsf.pas  NI Board 제어모듈. 

-------------------------------------------------------------------------------}
unit NiDAQmxf;

interface

uses
  Windows, Messages, SysUtils, Classes, Mmsystem, Math, Forms, Dialogs;

type
  i16   = Short;
  pi16  = ^i16;
  i32   = LongInt;
  pi32  = ^i32;
  f32   = Single;
  pf32  = ^f32;
  f64   = Double;
  pf64  = ^f64;

  int32 = LongInt;
  float32     =  Single;
  float64     =  Double;
  ui32        =  Longword;
  uInt32      =  Longword;
  pui32       =  ^ui32;
  bool32      =  LongBool;
  pbool32     =  ^bool32;
  uInt64      =  Int64;
  TaskHandle  =  ui32;

  PUpStates = ^TUpStates;
  TUpStates = record
    channelNames: PChar;
    state: int32;
  end;

  TNiDAQmx = class
  private
    { Private declarations }
  public
    { Public declarations }
    procedure loadDLL;
  end;
  function DAQmxGetErrStr( ErrorCode : int32 ) : String;

type
  // TaskConfig.
  TDAQmxCreateTask  = function(const taskName: PChar; var _taskHandle):int32; stdcall;
  TDAQmxClearTask   = function(_taskHandle:TaskHandle):int32; stdcall;
  TDAQmxLoadTask    = function(const taskName:PChar; var _taskHandle):int32; stdcall;
  TDAQmxStartTask   = function(_taskHandle: TaskHandle):int32; stdcall;
  TDAQmxStopTask    = function(_taskHandle: TaskHandle):int32; stdcall;
  TDAQmxIsTaskDone  = function(_taskHandle: TaskHandle; var isTaskDone: bool32): int32; stdcall;

  // Channel Creation.
  TDAQmxCreateAIVoltageChan    = function(_taskHandle: TaskHandle; const physicalChannel,nameToAssignToChannel: PChar; terminalConfig: int32; minVal,maxVal: float64; units: int32; const customScaleName: PChar): int32; stdcall;
  TDAQmxCreateAOVoltageChan    = function(_taskHandle: TaskHandle; const physicalChannel: PChar; const nameToAssignToChannel: PChar; minVal: float64; maxVal: float64;  units: int32; const customScaleName: PChar):int32; stdcall;
  TDAQmxCreateCOPulseChanFreq  = function(_taskHandle: TaskHandle; const counter,nameToAssignToChannel: PChar; units,idleState: int32; initialDelay,freq,dutyCycle: float64): int32; stdcall;
  TDAQmxCreateCIPulseWidthChan = function(_taskHandle: TaskHandle; const counter,nameToAssignToChannel: PChar; minVal, maxVal: float64; units, startingEdge: int32; const customScaleName: PChar): int32; stdcall;
  TDAQmxCreateCOPulseChanTime  = function(_taskHandle: TaskHandle; const counter,nameToAssignToChannel: PChar; units,idleState: int32; initialDelay,lowTime,highTime: float64): int32; stdcall;
  TDAQmxCreateDOChan           = function(_taskHandle: TaskHandle; const lines,nameToAssignToLines: PChar; lineGrouping: int32): int32; stdcall;
  TDAQmxCreateDIChan           = function(_taskHandle: TaskHandle; const lines,nameToAssignToLines: PChar; lineGrouping: int32): int32; stdcall;

  // Triggering
  TDAQmxSendSoftwareTrigger    = function(_taskHandle:TaskHandle; triggerID: int32): int32; stdcall;
  TDAQmxCfgAnlgEdgeStartTrig   = function(_taskHandle:TaskHandle; const triggerSource: PChar; triggerSlope: int32; triggerLevel: float64): int32; stdcall;

  // Write Function
  TDAQmxWriteAnalogF64       = function(_taskHandle: TaskHandle; numSampsPerChan: int32; autoStart: bool32; timeout: float64; dataLayout: bool32; var writeArray{:float64}; var sampsPerChanWritten: int32; reserved: pbool32):int32; stdcall;
  TDAQmxWriteAnalogScalarF64 = function(_taskHandle: TaskHandle; autoStart: bool32; timeout: float64; value: float64; reserved: pbool32):int32; stdcall;
  TDAQmxWriteDigitalU32      = function(_taskHandle: TaskHandle; numSampsPerChan: int32; autoStart: bool32; timeout: float64; dataLayout: bool32; var writeArray: DWORD; var sampsPerChanWritten: int32; reserved: pbool32): int32; stdcall;
  TDAQmxWriteDigitalU16      = function(_taskHandle: TaskHandle; numSampsPerChan: int32; autoStart: bool32; timeout: float64; dataLayout: bool32; var writeArray: WORD; var sampsPerChanWritten: int32; reserved: pbool32): int32; stdcall;
  TDAQmxWriteDigitalU8       = function(_taskHandle: TaskHandle; numSampsPerChan: int32; autoStart: bool32; timeout: float64; dataLayout: bool32; var writeArray: Byte; var sampsPerChanWritten: int32; reserved: pbool32): int32; stdcall;
  TDAQmxWriteCtrFreqScalar   = function(_taskHandle: TaskHandle; autoStart: bool32; timeout,frequency,dutyCycle: float64; reserved: pbool32): int32; stdcall;

  // Read Function.
  TDAQmxReadDigitalU32       = function(_taskHandle: TaskHandle; numSampsPerChan: int32; timeout: float64; fillMode: bool32; var readArray: DWORD; arraySizeInSamps: uInt32; var sampsPerChanRead: int32; reserved: pbool32): int32; stdcall;
  TDAQmxReadDigitalU16       = function(_taskHandle: TaskHandle; numSampsPerChan: int32; timeout: float64; fillMode: bool32; var readArray: WORD; arraySizeInSamps: uInt32; var sampsPerChanRead: int32; reserved: pbool32): int32; stdcall;
  TDAQmxReadDigitalU8        = function(_taskHandle: TaskHandle; numSampsPerChan: int32; timeout: float64; fillMode: bool32; var readArray: Byte; arraySizeInSamps: uInt32; var sampsPerChanRead: int32; reserved: pbool32): int32; stdcall;
  TDAQmxReadAnalogF64        = function(_taskHandle: TaskHandle; numSampsPerChan: int32; timeout: float64; fillMode: bool32; var readArray{ : Pointer{:float64}; arraySizeInSamps: uInt32; var sampsPerChanRead: int32; reserved: pbool32): int32; stdcall;
  TDAQmxReadCounterScalarF64 = function(_taskHandle: TaskHandle; timeout: float64; var value: float64; reserved: pbool32): int32; stdcall;


  TDAQmxCfgSampClkTiming     = function(_taskHandle:TaskHandle; const source: PChar; rate: float64; activeEdge: int32; sampleMode: int32; sampsPerChanToAcquire: Int64): int32; stdcall;
  TDAQmxCfgImplicitTiming    = function(_taskHandle:TaskHandle; sampleMode: int32; sampsPerChanToAcquire: uInt64): int32; stdcall;
  TDAQmxCfgHandshakingTiming = function(_taskHandle:TaskHandle; sampleMode: int32; sampsPerChanToAcquire: uInt64): int32; stdcall;

  //TDAQmxWriteCtrFreq = function(_taskHandle: TaskHandle; int32 numSampsPerChan, bool32 autoStart, float64 timeout, bool32 dataLayout, float64 frequency[], float64 dutyCycle[], int32 *numSampsPerChanWritten, bool32 *reserved);
  //TDAQmxWriteCtrTime (TaskHandle taskHandle, int32 numSampsPerChan, bool32 autoStart, float64 timeout, bool32 dataLayout, float64 highTime[], float64 lowTime[], int32 *numSampsPerChanWritten, bool32 *reserved);
  TDAQmxWriteCtrTimeScalar = function(_taskHandle: TaskHandle; autoStart: bool32; timeout,highTime,lowTime:float64; reserved: pbool32): int32; stdcall;

  TDAQmxGetTaskNumChans = function(_taskHandle: TaskHandle; var data: int32): int32; stdcall;

  TDAQmxSetDigitalPowerUpStates = function(const deviceName: PChar; const Status{const channelNames: PChar; state: int32}): int32; stdcall;
  TDAQmxWaitUntilTaskDone    = function(_taskHandle: TaskHandle; timeToWait: float64): int32; stdcall;

  TDAQmxGetDevProductType    = function(const device: PChar; var data; bufferSize: ui32):int32; stdcall;
  TDAQmxGetDevSerialNum      = function(const device: PChar; var data):int32; stdcall;
  TDAQmxResetDevice          = function(const deviceName: PChar):int32; stdcall;

  TDAQmxGetExtendedErrorInfo = function(errorString: PChar; bufferSize: ui32):int32; stdcall;
  TDAQmxGetErrorString       = function(errorCode:int32; errorString:PChar; bufferSize:ui32):int32; stdcall;

//int32 DAQmxIsTaskDone (TaskHandle taskHandle, bool32 *isTaskDone);

const
  {$I NiDAQmx.inc}
  FREQ_LINES_CLASSICAL = 2;

var
  NiDAQmx : TNiDAQmx;
  NiDAQmxLib: THandle = 0;

  DAQmxLoadTask: TDAQmxLoadTask;
  DAQmxCreateTask: TDAQmxCreateTask;
  DAQmxClearTask: TDAQmxClearTask;
  DAQmxCreateAOVoltageChan: TDAQmxCreateAOVoltageChan;
  DAQmxWriteAnalogF64: TDAQmxWriteAnalogF64;
  DAQmxWriteAnalogScalarF64: TDAQmxWriteAnalogScalarF64;
  DAQmxCfgSampClkTiming: TDAQmxCfgSampClkTiming;
  DAQmxCfgImplicitTiming: TDAQmxCfgImplicitTiming;
  DAQmxCfgHandshakingTiming: TDAQmxCfgHandshakingTiming;
  DAQmxSendSoftwareTrigger: TDAQmxSendSoftwareTrigger;
  DAQmxCreateCOPulseChanFreq: TDAQmxCreateCOPulseChanFreq;
  DAQmxWriteCtrFreqScalar: TDAQmxWriteCtrFreqScalar;
  DAQmxCreateCOPulseChanTime: TDAQmxCreateCOPulseChanTime;
  DAQmxWriteCtrTimeScalar: TDAQmxWriteCtrTimeScalar;
  DAQmxCreateCIPulseWidthChan: TDAQmxCreateCIPulseWidthChan;
  DAQmxReadCounterScalarF64: TDAQmxReadCounterScalarF64;
  DAQmxCreateDOChan: TDAQmxCreateDOChan;
  DAQmxWriteDigitalU32: TDAQmxWriteDigitalU32;
  DAQmxWriteDigitalU16: TDAQmxWriteDigitalU16;
  DAQmxWriteDigitalU8: TDAQmxWriteDigitalU8;
  DAQmxCreateDIChan: TDAQmxCreateDIChan;
  DAQmxReadDigitalU32: TDAQmxreadDigitalU32;
  DAQmxReadDigitalU16: TDAQmxreadDigitalU16;
  DAQmxReadDigitalU8: TDAQmxreadDigitalU8;
  DAQmxCreateAIVoltageChan: TDAQmxCreateAIVoltageChan;
  DAQmxReadAnalogF64: TDAQmxReadAnalogF64;
  DAQmxGetTaskNumChans: TDAQmxGetTaskNumChans;

  DAQmxSetDigitalPowerUpStates: TDAQmxSetDigitalPowerUpStates;
  DAQmxWaitUntilTaskDone: TDAQmxWaitUntilTaskDone;
  DAQmxIsTaskDone : TDAQmxIsTaskDone;
  DAQmxStartTask: TDAQmxStartTask;
  DAQmxStopTask: TDAQmxStopTask;
  DAQmxGetDevProductType: TDAQmxGetDevProductType;
  DAQmxGetDevSerialNum: TDAQmxGetDevSerialNum;
  DAQmxResetDevice: TDAQmxResetDevice;
  DAQmxGetExtendedErrorInfo: TDAQmxGetExtendedErrorInfo;
  DAQmxGetErrorString: TDAQmxGetErrorString;

  DAQmxCfgAnlgEdgeStartTrig : TDAQmxCfgAnlgEdgeStartTrig;

implementation

procedure TNiDAQmx.loadDLL;
var
  str : string;
begin
    NiDAQmxLib := LoadLibrary('NiCAIU.DLL');
    if NiDAQmxLib = 0 then begin
        str := 'LoadLibrary(DAQ) FAILED!';
//        MessageDlg(str, mtError, [mbOK], 0);
        exit;
    end;
    
    @DAQmxLoadTask := GetProcAddress(NiDAQmxLib, 'DAQmxLoadTask');
    @DAQmxCreateTask := GetProcAddress(NiDAQmxLib, 'DAQmxCreateTask');
    @DAQmxClearTask := GetProcAddress(NiDAQmxLib, 'DAQmxClearTask');
    @DAQmxCreateAOVoltageChan := GetProcAddress(NiDAQmxLib, 'DAQmxCreateAOVoltageChan');
    @DAQmxWriteAnalogF64 := GetProcAddress(NiDAQmxLib, 'DAQmxWriteAnalogF64');
    @DAQmxWriteAnalogScalarF64 := GetProcAddress(NiDAQmxLib, 'DAQmxWriteAnalogScalarF64');
    @DAQmxCfgSampClkTiming := GetProcAddress(NiDAQmxLib, 'DAQmxCfgSampClkTiming');
    @DAQmxCfgImplicitTiming := GetProcAddress(NiDAQmxLib, 'DAQmxCfgImplicitTiming');
    @DAQmxCfgHandshakingTiming := GetProcAddress(NiDAQmxLib, 'DAQmxCfgHandshakingTiming');
    @DAQmxSendSoftwareTrigger := GetProcAddress(NiDAQmxLib, 'DAQmxSendSoftwareTrigger');
    @DAQmxCreateCOPulseChanFreq := GetProcAddress(NiDAQmxLib, 'DAQmxCreateCOPulseChanFreq');
    @DAQmxWriteCtrFreqScalar := GetProcAddress(NiDAQmxLib, 'DAQmxWriteCtrFreqScalar');
    @DAQmxCreateCOPulseChantime := GetProcAddress(NiDAQmxLib, 'DAQmxCreateCOPulseChanTime');
    @DAQmxWriteCtrTimeScalar := GetProcAddress(NiDAQmxLib, 'DAQmxWriteCtrTimeScalar');
    @DAQmxCreateCIPulseWidthChan := GetProcAddress(NiDAQmxLib, 'DAQmxCreateCIPulseWidthChan');
    @DAQmxReadCounterScalarF64 := GetProcAddress(NiDAQmxLib, 'DAQmxReadCounterScalarF64');
    @DAQmxCreateDOChan := GetProcAddress(NiDAQmxLib, 'DAQmxCreateDOChan');
    @DAQmxWriteDigitalU32 := GetProcAddress(NiDAQmxLib, 'DAQmxWriteDigitalU32');
    @DAQmxWriteDigitalU16 := GetProcAddress(NiDAQmxLib, 'DAQmxWriteDigitalU16');
    @DAQmxWriteDigitalU8 := GetProcAddress(NiDAQmxLib, 'DAQmxWriteDigitalU8');
    @DAQmxCreateDIChan := GetProcAddress(NiDAQmxLib, 'DAQmxCreateDIChan');
    @DAQmxReadDigitalU32 := GetProcAddress(NiDAQmxLib, 'DAQmxReadDigitalU32');
    @DAQmxReadDigitalU16 := GetProcAddress(NiDAQmxLib, 'DAQmxReadDigitalU16');
    @DAQmxReadDigitalU8 := GetProcAddress(NiDAQmxLib, 'DAQmxReadDigitalU8');
    @DAQmxCreateAIVoltageChan := GetProcAddress(NiDAQmxLib, 'DAQmxCreateAIVoltageChan');
    @DAQmxReadAnalogF64 := GetProcAddress(NiDAQmxLib, 'DAQmxReadAnalogF64');
    @DAQmxGetTaskNumChans := GetProcAddress(NiDAQmxLib, 'DAQmxGetTaskNumChans');

    @DAQmxSetDigitalPowerUpStates := GetProcAddress(NiDAQmxLib, 'DAQmxSetDigitalPowerUpStates');
    @DAQmxWaitUntilTaskDone       := GetProcAddress(NiDAQmxLib, 'DAQmxWaitUntilTaskDone');
    DAQmxIsTaskDone               := GetProcAddress(NiDAQmxLib, 'DAQmxIsTaskDone');
    @DAQmxStartTask               := GetProcAddress(NiDAQmxLib, 'DAQmxStartTask');
    @DAQmxStopTask                := GetProcAddress(NiDAQmxLib, 'DAQmxStopTask');
    @DAQmxGetDevProductType       := GetProcAddress(NiDAQmxLib, 'DAQmxGetDevProductType');
    @DAQmxGetDevSerialNum         := GetProcAddress(NiDAQmxLib, 'DAQmxGetDevSerialNum');
    @DAQmxResetDevice             := GetProcAddress(NiDAQmxLib, 'DAQmxResetDevice');
    @DAQmxGetExtendedErrorInfo    := GetProcAddress(NiDAQmxLib, 'DAQmxGetExtendedErrorInfo');
    @DAQmxGetErrorString          := GetProcAddress(NiDAQmxLib, 'DAQmxGetErrorString');

    @DAQmxCfgAnlgEdgeStartTrig    := GetProcAddress(NiDAQmxLib, 'DAQmxCfgAnlgEdgeStartTrig');

  if (@DAQmxLoadTask                       = nil) or
     (@DAQmxCreateTask                     = nil) or
     (@DAQmxClearTask                      = nil) or
     (@DAQmxCreateAOVoltageChan            = nil) or
     (@DAQmxWriteAnalogF64                 = nil) or
     (@DAQmxWriteAnalogScalarF64           = nil) or
     (@DAQmxCfgSampClkTiming               = nil) or
     (@DAQmxCfgImplicitTiming              = nil) or
     (@DAQmxCfgHandshakingTiming           = nil) or
     (@DAQmxSendSoftwareTrigger            = nil) or
     (@DAQmxCreateCOPulseChanFreq          = nil) or
     (@DAQmxWriteCtrFreqScalar             = nil) or
     (@DAQmxCreateCOPulseChanTime          = nil) or
     (@DAQmxWriteCtrTimeScalar             = nil) or
     (@DAQmxCreateCIPulseWidthChan         = nil) or
     (@DAQmxReadCounterScalarF64           = nil) or
     (@DAQmxCreateDOChan                   = nil) or
     (@DAQmxWriteDigitalU32                = nil) or
     (@DAQmxWriteDigitalU16                = nil) or
     (@DAQmxWriteDigitalU8                 = nil) or
     (@DAQmxCreateDIChan                   = nil) or
     (@DAQmxReadDigitalU32                 = nil) or
     (@DAQmxReadDigitalU16                 = nil) or
     (@DAQmxReadDigitalU8                  = nil) or
     (@DAQmxCreateAIVoltageChan            = nil) or
     (@DAQmxReadAnalogF64                  = nil) or
     (@DAQmxGetTaskNumChans                = nil) or
     (@DAQmxSetDigitalPowerUpStates        = nil) or
     (@DAQmxWaitUntilTaskDone              = nil) or
     (@DAQmxIsTaskDone                     = nil) or
     (@DAQmxStartTask                      = nil) or
     (@DAQmxStopTask                       = nil) or
     (@DAQmxGetDevProductType              = nil) or
     (@DAQmxGetDevSerialNum                = nil) or
     (@DAQmxResetDevice                    = nil) or
     (@DAQmxGetExtendedErrorInfo           = nil) or

     (@DAQmxCfgAnlgEdgeStartTrig           = nil) or 
     (@DAQmxGetErrorString                 = nil) then
     begin
        str := 'GetProcAddress FAILED(NiCAIU.DLL)!';
        MessageDlg(str, mtError, [mbOK], 0);
        FreeLibrary(NiDAQmxLib);
        NiDAQmxLib := 0;
        // Halt;
  end;
end;

function DAQmxGetErrStr( ErrorCode : int32 ) : String;
var
   ErrStr : array[0..2048] of Char;
begin
   DAQmxGetErrorString(ErrorCode, ErrStr, 2048);
   ErrStr[strLen(ErrStr)-1] := #0;

   Result := StrPas(ErrStr);
end;

{==============================================================================}
initialization
begin
  NiDAQmx := TNiDAQmx.Create;
  NiDAQmx.loadDLL;
end;

finalization
  NiDAQmx.Free;

end.
