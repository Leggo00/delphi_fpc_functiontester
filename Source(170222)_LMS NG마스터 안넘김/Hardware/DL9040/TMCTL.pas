unit TMCTL;

interface

uses
    Messages, Windows;

    const	WIRE_GPIB     = 1;
    const	WIRE_RS232    = 2;
    const	WIRE_USB      = 3;
    const	WIRE_ETHERNET = 4;
    const	WIRE_USBTMC   = 5;

    const TERM_CRLF = 0;
    const TERM_CR   = 1;
    const TERM_LF   = 2;
    const TERM_EOI  = 3;


    function TmInitialize (wire: LongInt; adr : String; var id: LongInt): LongInt; stdcall;
    function TmSetIFC (id: LongInt; tm: LongInt): LongInt; stdcall;
    function TmDeviceClear (id: LongInt): LongInt; stdcall;

    function TmSend (id: LongInt; msg : String): LongInt; stdcall;
    function TmSendByLen (id: LongInt; var  msg : variant; blen: LongInt): LongInt; stdcall;
    function TmSendSetup (id: LongInt): LongInt; stdcall;
    function TmSendOnlyBin (id: LongInt; var  msg : variant; blen: LongInt; ed: LongInt): LongInt; stdcall;

    function TmReceive(id: LongInt; var buf: Char; blen: LongInt; var rlen: LongInt): LongInt; stdcall;
    function TmReceiveSetup (id: LongInt): LongInt; stdcall;
    function TmReceiveOnly (id: LongInt; var  buf : Char; blen: LongInt; var  rlen: LongInt): LongInt; stdcall;
    function TmReceiveBlockHeader (id: LongInt; var  rlen: LongInt): LongInt; stdcall;
    function TmReceiveBlockData (id: LongInt; var  buf : variant; blen: LongInt; var  rlen: LongInt; var  ed: LongInt): LongInt; stdcall;

    function TmCheckEnd (id: LongInt): LongInt; stdcall;
    function TmSetCmd (id: LongInt; cmd : String): LongInt;  stdcall;
    function TmSetRen (id: LongInt; flg: LongInt): LongInt; stdcall;
    function TmGetLastError (id: LongInt): LongInt; stdcall;
    function TmGetDetailLastError (id: LongInt): LongInt; stdcall;
    function TmCheckError (id: LongInt; sts: LongInt; msg : String; err : String): LongInt; stdcall;
    function TmSetTerm (id: LongInt; eos: LongInt; eot: LongInt): LongInt; stdcall;
    function TmSetEos (id: LongInt; eos: LongInt): LongInt; stdcall;
    function TmSetTimeout (id: LongInt; tmp: LongInt): LongInt; stdcall;
    function TmSetDma (id: LongInt; flg: LongInt): LongInt; stdcall;
    function TmGetStatusByte (id: LongInt; var  sts : Byte): LongInt; stdcall;

    function TmFinish (id: LongInt): LongInt; stdcall;

implementation

const
    TMCTL_DLL = 'tmctl.dll';

    function TmInitialize; external TMCTL_DLL;
    function TmSetIFC; external TMCTL_DLL;
    function TmDeviceClear; external TMCTL_DLL;
    function TmSend; external TMCTL_DLL;
    function TmSendByLen; external TMCTL_DLL;
    function TmSendSetup; external TMCTL_DLL;
    function TmSendOnlyBin; external TMCTL_DLL;
    function TmReceive; external TMCTL_DLL;
    function TmReceiveSetup; external TMCTL_DLL;
    function TmReceiveOnly; external TMCTL_DLL;
    function TmReceiveBlockHeader; external TMCTL_DLL;
    function TmReceiveBlockData; external TMCTL_DLL;
    function TmCheckEnd; external TMCTL_DLL;
    function TmSetCmd; external TMCTL_DLL;
    function TmSetRen; external TMCTL_DLL;
    function TmGetLastError; external TMCTL_DLL;
    function TmGetDetailLastError; external TMCTL_DLL;
    function TmCheckError; external TMCTL_DLL;
    function TmSetTerm; external TMCTL_DLL;
    function TmSetEos; external TMCTL_DLL;
    function TmSetTimeout; external TMCTL_DLL;
    function TmSetDma; external TMCTL_DLL;
    function TmGetStatusByte; external TMCTL_DLL;
    function TmFinish; external TMCTL_DLL;

end.


