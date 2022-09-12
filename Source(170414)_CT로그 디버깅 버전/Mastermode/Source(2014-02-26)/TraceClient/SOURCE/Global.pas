//------------------------------------------------------------------------------
//
//  KMI Traceability Server Global Module     2013.04.09.
//  Server 용 상수/Error 정의.
//
//------------------------------------------------------------------------------

unit Global;

interface

uses Classes, SysUtils, Windows;

var
    gClose : Boolean;


const
    SOCKET_PORT = 5010;     // Default Trace Socket Port 
    
    DELIMITER = ';';

    HEADER_SERVER = 'S';
    HEADER_CLIENT = 'C';

    //--------------------------------------------------------------------------
    // ERROR CODE LIST 정의.
    TEST_PASS                       = 1;
    TEST_FAIL                       = 0;

    // Serial
    RES_SUCCESS                     = 0;
    RES_FAIL                        = -1;
    RES_SERIAL_NOT_FOUND            = -2;
    RES_SERIAL_NOT_VALID            = -3;
    RES_SERIAL_NOT_UNIQUE           = -5;
    RES_MAX_SEQUENCE_REACHED        = -9;

    // Station.
    RES_UNKNOWN_STATION             = -110;
    RES_STATION_NOT_VALID           = -111;

    // Model
    RES_UNKNOWN_MODEL               = -120;
    RES_MODEL_NOT_VALID             = -121;
    RES_MODEL_NOT_UNIQUE            = -122;

    // Attribute
    RES_UNKNOWN_ATTRIBUTE           = -130;
    RES_ATTRIBUTE_NOT_FOUND         = -131;
    RES_ATTRIBUTE_NOT_VALID         = -132;
    RES_ATTRIBUTE_NOT_UNIQUE        = -133;
    RES_ATTRIBUTE_SERIAL_NOT_FOUND  = -134;

    RES_UNKNOWN_HEADER              = -200;
    RES_DATASIZE_NOT_EQUAL          = -201;
    RES_UNKNOWN_COMMAND             = -202;

    RES_SERVER_ERROR                = -203;
    RES_DATABASE_ERROR              = -204;
    RES_UNKNOWN_ERROR               = -255;

    // SockeConnect
    RES_SERVER_SOCKET_CONNECT_ERROR = -300;

    // SYSTEM ERROR
    RES_TIME_OUT                    = -900;

{ Global Function List }
function GetErrorString(nRet : Integer) : String;
function StrToTraceDateTime(Param : String) : TDateTime;

implementation

uses GenUtils, DateUtils;


//------------------------------------------------------------------------------
// Ret값에따라 Error메세지를 출력한다.
function GetErrorString(nRet : Integer) : String;
begin
    case nRet of
        // ERROR CODE LIST 정의.
        RES_SUCCESS                        : Result := 'Success';
        RES_FAIL                           : Result := 'Fail';
        RES_SERIAL_NOT_FOUND               : Result := 'Serial not found';
        RES_SERIAL_NOT_VALID               : Result := 'Serial not valid';
        RES_SERIAL_NOT_UNIQUE              : Result := 'Serial not unique';
        RES_MAX_SEQUENCE_REACHED           : Result := 'Max Sequence readched';

        // Station.
        RES_UNKNOWN_STATION                : Result := 'Unknown Station';
        RES_STATION_NOT_VALID              : Result := 'Station not valid';

        // Model
        RES_UNKNOWN_MODEL                  : Result := 'Unknown Model';
        RES_MODEL_NOT_VALID                : Result := 'Model not valid';
        RES_MODEL_NOT_UNIQUE               : Result := 'Model not unique';

        // Attribute
        RES_UNKNOWN_ATTRIBUTE              : Result := 'Unknown Attribute';
        RES_ATTRIBUTE_NOT_FOUND            : Result := 'Attribute not found';
        RES_ATTRIBUTE_NOT_VALID            : Result := 'Attribute not valid';
        RES_ATTRIBUTE_NOT_UNIQUE           : Result := 'Attribute not unique';
        RES_ATTRIBUTE_SERIAL_NOT_FOUND     : Result := 'Attribute Serial not found';

        RES_UNKNOWN_HEADER                 : Result := 'Unknown Header';
        RES_DATASIZE_NOT_EQUAL             : Result := 'Data size is not equal';
        RES_UNKNOWN_COMMAND                : Result := 'UnKnown Command';

        RES_SERVER_ERROR                   : Result := 'Server Error';
        RES_DATABASE_ERROR                 : Result := 'Database Error';

        RES_TIME_OUT                       : Result := 'TimeOut Error';
    else
        Result := 'UnKnown Error';
    end;
end;

//------------------------------------------------------------------------------
// YYYYMMSSHHNNSS 형식을 TDateTime으로 변경한다.
function StrToTraceDateTime(Param : String) : TDateTime;
var
    nYear, nMon, nDay, nHour, nMin, nSec, nMSec : Word;
    SystemTime: TSystemTime;
begin
    Result := Now;    // 날짜형식이 안맞으면 현재시간으로 설정.
    try
        nYear := StrToIntDef( Copy(Param, 1,  4), -1);
        nMon  := StrToIntDef( Copy(Param, 5,  2), -1);
        nDay  := StrToIntDef( Copy(Param, 7,  2), -1);
        nHour := StrToIntDef( Copy(Param, 9,  2), -1);
        nMin  := StrToIntDef( Copy(Param, 11, 2), -1);
        nSec  := StrToIntDef( Copy(Param, 13, 2), -1);
        nMSec  := StrToIntDef( Copy(Param, 15, 3), -1);
        // 유효한 날짜면 변경.
        if (nYear >= 2000) and (nYear <= 2100) and
           (nMon  >= 1   ) and (nMon  <= 12  ) and
           (nDay  >= 1   ) and (nDay  <= 31  ) and
           (nHour >= 0   ) and (nHour <= 23  ) and
           (nMin  >= 0   ) and (nMin  <= 59  ) and
           (nSec  >= 0   ) and (nSec  <= 59  ) and
           (nMSec  >= 0   ) and (nMSec  <= 999  ) then
            Result := EncodeDate(nYear, nMon, nDay) + EncodeTime(nHour, nMin, nSec, nMSec);
    except
    end;
end;


end.

