unit AIDC;

interface


const
  DLL_VERSION_HIGH = 1;
  DLL_VERSION_LOW = 80;
  SSLP_RX_BUFFER_SIZE = 5000;
  CAN_RX_BUFFER_SIZE = 1000;
  LIN_RX_BUFFER_SIZE = 1000;
  SENT_RX_BUFFER_SIZE = 1000;
  SENT_MAX_DATA = 16;
  KCCP_TableMaxEntries = 20;
  AI_MAX_DEVICES = 8;
//  SSLP_Receive_with_Timeout(a) = time = GetTickCount(); \;

//function while(var SSLP_Receive(: (SSLP_RX_BUFFER_SIZE<=(A))&((GETTICKCOUNT()-TIME)<50)) \): Integer cdecl  {$IFDEF WIN32} stdcall {$ENDIF};
//const
//  SSLP_Receive_with_Timeout_Long(a) = time = GetTickCount(); \;

//function while(var SSLP_Receive(: (SSLP_RX_BUFFER_SIZE<=(A))&((GETTICKCOUNT()-TIME)<500)) \): Integer cdecl  {$IFDEF WIN32} stdcall {$ENDIF};
//const
//  SSLP_Receive_Timeout() = (time==50);

type
  AI_DEVICE_INFO = Array  [0..16] of Word;

{/// --- External AID.DLL functions --- }


function FT_ListDevices: integer; stdcall;
function FT_Open: Cardinal; stdcall;
function FT_Open_Index(device_index: Byte): Cardinal;stdcall;
function FT_Close: Cardinal ; stdcall;
function FT_Close_Index(device_index: Byte): Cardinal; stdcall;
function FT_ResetDevice: Cardinal; stdcall;
function FT_ResetDevice_Index(device_index: Byte): Cardinal; stdcall;

function FT_Read(var data: byte;
                 size: integer): Cardinal; stdcall;

function FT_Read_Index(device_index: Byte;
                       var data: byte;
                       size: Cardinal): Cardinal; stdcall;
function FT_Write(var data: byte;
                  size: Cardinal): Cardinal; stdcall;
function FT_Write_Index(device_index: Byte;
                        var data: byte;
                        size: Cardinal): Cardinal; stdcall;
function FT_PurgeRX: Cardinal; stdcall;
function FT_PurgeRX_Index(device_index: Byte): Cardinal; stdcall ;
function FT_PurgeTX: Cardinal; stdcall;
function FT_PurgeTX_Index(device_index: Byte): Cardinal; stdcall;
function FT_GetQueueStatus: Cardinal; stdcall;
function FT_GetQueueStatus_Index(device_index: Byte): Cardinal; stdcall;
function FT_GetStatus(var rxsize: Cardinal;
                      var txsize: Cardinal): Cardinal; stdcall;
function FT_GetStatus_Index(device_index: Byte;
                            var rxsize: Cardinal;
                            var txsize: Cardinal): Cardinal; stdcall;
function FT_EE_Program(vid: Word;
                       pid: Word;
                       power: Word;
                       var manuf: byte;
                       var descr: byte): Cardinal; stdcall;
function FT_EE_Program_Index(device_index: Byte;
                             vid: Word;
                             pid: Word;
                             power: Word;
                             var manuf: byte;
                             var descr: byte): Cardinal; stdcall;
function FT_EE_ProgramToDefault: Cardinal; stdcall;
function FT_EE_ProgramToDefault_Index(device_index: Byte): Cardinal; stdcall;
function FT_EE_Read(var vid: Word;
                    var pid: Word;
                    var power: Word;
                    var manuf: byte;
                    var descr: byte): Cardinal; stdcall;
function FT_EE_Read_Index(device_index: Byte;
                          var vid: Word;
                          var pid: Word;
                          var power: Word;
                          var manuf: byte;
                          var descr: byte): Cardinal; stdcall;
function FT_GetLatencyTimer(var data: Byte): Cardinal; stdcall;
function FT_GetLatencyTimer_Index(device_index: Byte;
                                  var data: Byte): Cardinal; stdcall;
function FT_SetLatencyTimer(data: Byte): Cardinal; stdcall;
function FT_SetLatencyTimer_Index(device_index: Byte;
                                  data: Byte): Cardinal; stdcall;
function FT_SetBitMode(mask: byte;
                       enable: byte): Cardinal; stdcall;
function FT_SetBitMode_Index(device_index: Byte;
                             mask: byte;
                             enable: byte): Cardinal; stdcall;
function FT_GetBitMode(var data: Byte): Cardinal; stdcall;
function FT_GetBitMode_Index(device_index: Byte;
                             var data: Byte): Cardinal; stdcall;
function FT_SetUSBParameters(insize: Cardinal;
                             outsize: Cardinal): Cardinal; stdcall;
function FT_SetUSBParameters_Index(device_index: Byte;
                                   insize: Cardinal;
                                   outsize: Cardinal): Cardinal; stdcall;
function KAI_List_Device(var info: AI_DEVICE_INFO): Cardinal; stdcall;
function KAI_Open(var serial_number: Byte): Cardinal; stdcall;
function KAI_Open_Index(device_index: Byte;
                        var serial_number: Byte): Cardinal; stdcall;
function KAI_Close: Cardinal; stdcall;
function KAI_Close_Index(device_index: Byte): Cardinal; stdcall;

{/// die Hardware und Software Infos }

function KAIHardware_Info(var version_high: Byte;
                          var version_low: Byte): Cardinal; stdcall;
function KAIHardware_Info_Index(device_index: Byte;
                                var version_high: Byte;
                                var version_low: Byte): Cardinal; stdcall;
function KAISoftware_Info(var version_high: Byte;
                          var version_low: Byte): Cardinal; stdcall;
function KAISoftware_Info_Index(device_index: Byte;
                                var version_high: Byte;
                                var version_low: Byte): Cardinal; stdcall;
function KAISoftware_String(var softwarestring: Byte): Cardinal; stdcall;
function KAISoftware_String_Index(device_index: Byte;
                                  var softwarestring: Byte): Cardinal; stdcall;
function KAIHardware_Reset: Cardinal; stdcall;
function KAIHardware_Reset_Index(device_index: Byte): Cardinal; stdcall;
function KDLL_Info(var version_high: Byte;
                   var version_low: Byte): Cardinal; stdcall;
function KHardware_Info(var version_high: Byte;
                        var version_low: Byte): Cardinal; stdcall;
function KHardware_Info_Index(device_index: Byte;
                              var version_high: Byte;
                              var version_low: Byte): Cardinal; stdcall;
function KAIController_Id(var partid_high: Byte;
                          var partid_low: Byte): Cardinal; stdcall;
function KAIController_Id_Index(device_index: Byte;
                                var partid_high: Byte;
                                var partid_low: Byte): Cardinal; stdcall;
function KAIController_MemInfo(var register_high: Byte;
                               var register_low: Byte): Cardinal; stdcall;
function KAIController_MemInfo_Index(device_index:Byte ;
                                     var register_high: Byte;
                                     var register_low: Byte): Cardinal; stdcall;

{/// KSENT }

function KSENT_RXInit(len: Byte;
                      CRC: Byte;
                      timeUnit: Word;
                      DiagCom: Byte;
                      specCom: Byte): Byte; stdcall;

function KSENT_RXInit_Index(device_index: Byte;
                            len: Byte;
                            CRC: Byte;
                            timeUnit: Word;
                            DiagCom: Byte;
                            specCom: Byte): Byte; stdcall;


function KSENT_RX(var channel: Byte;
                  var typ: Byte;
                  var len: Byte;
                  var data: Byte;
                  var time: Cardinal): Byte; stdcall;

function KSENT_RX_Index(device_index: Byte;
                        var channel: Byte;
                        var typ: Byte;
                        var len: Byte;
                        var data: Byte;
                        var time: Cardinal): Byte; stdcall;


function KSENT_RXPoll(channel: Byte;
                      typ: Byte;
                      var len: Byte;
                      var data: Byte;
                      var ltime: Cardinal): Byte; stdcall;

function KSENT_RXPoll_Index(device_index: Byte;
                            channel: Byte;
                            typ: Byte;
                            var len: Byte;
                            var data: Byte;
                            var ltime: Cardinal): Byte; stdcall;


function KSENT_TXInit(timeUnit: Word;
                      syncLow: Word;
                      syncHigh: Word;
                      len: Byte;
                      CRC: Byte;
                      diagCom: Byte;
                      specCom: Byte): Byte; stdcall;

function KSENT_TXInit_Index(device_index: Byte;
                            timeUnit: Word;
                            syncLow: Word;
                            syncHigh: Word;
                            len: Byte;
                            CRC: Byte;
                            diagCom: Byte;
                            specCom: Byte): Byte; stdcall;


function KSENT_TX(channel: Byte;
                  data: Pchar;
                  cyclic: Cardinal): Byte; stdcall;

function KSENT_TX_Index(channel: Byte;
                        device_index: Byte;
                        var data: Byte;
                        cyclic: Cardinal): Byte; stdcall;


{function KSENT_OptionsSet(triggerInMode: Byte;
                          triggerIn0: Byte;
                          triggerIn1: Byte;
                          DAMode: Word;
                          DA0Bit: Byte;
                          DA0Len: Byte;
                          DA1Bit: Byte;
                          DA1Len: Byte;
                          ADMode: Word;
                          var statusRx0: UNSIGNED CHAR _STDCALL KSENT_STATUSGET(UNSIGNED CHAR;
                          var statusRx1: Byte;
                          var statusTx0: Byte;
                          var statusTx1: Byte): Byte; stdcall;
}
function KSENT_OptionsSet_Index(device_index : Word;
                                triggerInMode : Word;
                                triggerIn0 : Word;
                                triggerIn1 : Word;
                                DAMode : Integer;
                                DA0Bit : Word;
                                DA0Len : Word;
                                DA1Bit : Word;
                                DA1Len : Word;
                                ADMode : Integer;
                                AD0Bit : Word;
                                AD0Len : Word;
                                AD1Bit : Word;
                                AD1Len : Word): Byte; stdcall;


function KSENT_StatusGet(var statusRx0;
                         var statusRx1;
                         var statusTx0;
                         var statusTx1): Byte; stdcall;

function KSENT_StatusGet_Index(device_index: Byte;
                               var statusRx0: Byte;
                               var statusRx1: Byte;
                               var statusTx0: Byte;
                               var statusTx1: Byte): Byte; stdcall;




type
  SENT_rx_buffer = record
    channel: BYTE;
    typ: BYTE;
    len: BYTE;
    data: Array[0..SENT_MAX_DATA-1] of BYTE;
    time: LongWord;
  end {SENT_rx_buffer};



implementation

const
  DLL_Name = 'AID.DLL';

function FT_ListDevices;                external DLL_Name;
function FT_Open;                       external DLL_Name;
function FT_Open_Index;                 external DLL_Name;
function FT_Close;                      external DLL_Name;
function FT_Close_Index;                external DLL_Name;
function FT_ResetDevice;                external DLL_Name;
function FT_ResetDevice_Index;          external DLL_Name;
function FT_Read;                       external DLL_Name;
function FT_Read_Index;                 external DLL_Name;
function FT_Write;                      external DLL_Name;
function FT_Write_Index;                external DLL_Name;
function FT_PurgeRX;                    external DLL_Name;
function FT_PurgeRX_Index;              external DLL_Name;
function FT_PurgeTX;                    external DLL_Name;
function FT_PurgeTX_Index;              external DLL_Name;
function FT_GetQueueStatus;             external DLL_Name;
function FT_GetQueueStatus_Index;       external DLL_Name;
function FT_GetStatus;                  external DLL_Name;
function FT_GetStatus_Index;            external DLL_Name;
function FT_EE_Program;                 external DLL_Name;
function FT_EE_Program_Index;           external DLL_Name;
function FT_EE_ProgramToDefault;        external DLL_Name;
function FT_EE_ProgramToDefault_Index;  external DLL_Name;
function FT_EE_Read;                    external DLL_Name;
function FT_EE_Read_Index;              external DLL_Name;
function FT_GetLatencyTimer;            external DLL_Name;
function FT_GetLatencyTimer_Index;      external DLL_Name;
function FT_SetLatencyTimer;            external DLL_Name;
function FT_SetLatencyTimer_Index;      external DLL_Name;
function FT_SetBitMode;                 external DLL_Name;
function FT_SetBitMode_Index;           external DLL_Name;
function FT_GetBitMode;                 external DLL_Name;
function FT_GetBitMode_Index;           external DLL_Name;
function FT_SetUSBParameters;           external DLL_Name;
function FT_SetUSBParameters_Index;     external DLL_Name;
function KAI_List_Device;               external DLL_Name;
function KAI_Open;                      external DLL_Name;
function KAI_Open_Index;                external DLL_Name;
function KAI_Close;                     external DLL_Name;
function KAI_Close_Index;               external DLL_Name;
function KAIHardware_Info;              external DLL_Name;
function KAIHardware_Info_Index;        external DLL_Name;
function KAISoftware_Info;              external DLL_Name;
function KAISoftware_Info_Index;        external DLL_Name;
function KAISoftware_String;            external DLL_Name;
function KAISoftware_String_Index;      external DLL_Name;
function KAIHardware_Reset;             external DLL_Name;
function KAIHardware_Reset_Index;       external DLL_Name;
function KDLL_Info;                     external DLL_Name;
function KHardware_Info;                external DLL_Name;
function KHardware_Info_Index;          external DLL_Name;
function KAIController_Id;              external DLL_Name;
function KAIController_Id_Index;        external DLL_Name;
function KAIController_MemInfo;         external DLL_Name;
function KAIController_MemInfo_Index;   external DLL_Name;
function KSENT_RXInit;                  external DLL_Name;
function KSENT_RXInit_Index;            external DLL_Name;
function KSENT_RX;                      external DLL_Name;
function KSENT_RX_Index;                external DLL_Name;
function KSENT_RXPoll;                  external DLL_Name;
function KSENT_RXPoll_Index;            external DLL_Name;
function KSENT_TXInit;                  external DLL_Name;
function KSENT_TXInit_Index;            external DLL_Name;
function KSENT_TX;                      external DLL_Name;
function KSENT_TX_Index;                external DLL_Name;
//function KSENT_OptionsSet;              external DLL_Name;
function KSENT_OptionsSet_Index;        external DLL_Name;
function KSENT_StatusGet;                external DLL_Name;
function KSENT_StatusGet_Index;         external DLL_Name;

end.
