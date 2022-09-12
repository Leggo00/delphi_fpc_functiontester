unit FormPLCControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AMLed, StdCtrls, Buttons;

type
  TFrmPLCControl = class(TForm)
    TimerPLC: TTimer;
    GroupBox1: TGroupBox;
    Led_PC_PDT_FRT: TLed;
    GroupBox2: TGroupBox;
    Led_PLC_Start1: TLed;
    Led_PLC_Start2: TLed;
    Led_Con_R_Fw: TLed;
    BtnLoading: TSpeedButton;
    BtnUnLoading: TSpeedButton;
    Led_Con_R_ON: TLed;
    Led_Con_R_Off: TLed;
    Led_Clamp_ON: TLed;
    Led_Clamp_Off: TLed;
    Led_Con_L_ON: TLed;
    Led_Con_L_Off: TLed;
    Led_Con_L_Fw: TLed;
    Led_PDT: TLed;
    TimerStart: TTimer;
    SpeedButton1: TSpeedButton;
    LED_MAS85: TLed;
    LED_PPACK: TLed;
    Led_Bat_Close: TLed;
    Led_Bat_Open: TLed;
    Led_Bat_Con_open: TLed;
    Led_Bat_Con_close: TLed;
    Led_CONDW: TLed;
    Led_CONUP: TLed;
    procedure TimerPLCTimer(Sender: TObject);
    procedure BtnLoadingClick(Sender: TObject);
    procedure BtnUnLoadingClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerStartTimer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    bLoading : Boolean;
    bReset   : Boolean;
    fResetTime : double;

    function JigLoading: Boolean;
    function JigUnloading: Boolean;
    function WriteIO(sIOName : String; bOnOff : Boolean) : Boolean;
    function ReadIO (sIOName : String) : Boolean;
    function WaitIO (sIOName : String; nTimeOut : Integer=3000) : Boolean;
  end;

var
  FrmPLCControl: TFrmPLCControl;

implementation

uses {FormHardware}FormHWMain, GenUtils, FormMain, Math, FormLog, FormTestOption,
  FormMessage;

{$R *.dfm}

function TFrmPLCControl.WriteIO(sIOName : String; bOnOff : Boolean) : Boolean;
begin
    if bOnOff then
        FrmHWMain.WriteIOcontrol(sIOName, 'TRUE', '')
    else
        FrmHWMain.WriteIOControl(sIOName, 'FALSE', '');

end;


function TFrmPLCControl.ReadIO(sIOName : String) : Boolean;
begin
    Result := (FrmHWMain.ReadIOcontrol(sIOName, '', '') = 'TRUE');
end;

function TFrmPLCControl.WaitIO(sIOName : String; nTimeOut : Integer=3000) : Boolean;
var fTime : Double;
begin
    Result := False;
    fTime := GetTickCountEX;
    while (GetTickCountEX - fTime <= nTimeOut) do begin
        if ReadIO(sIOName) then begin
            Result := True;
            exit;
        end;
        Application.ProcessMessages;
        Sleep(1);
    end;
end;

procedure TFrmPLCControl.TimerPLCTimer(Sender: TObject);
var fTime : Double;
begin
    // mas 65 : DI1-14
    // mas 85 : DI1-15
    // p pack : DI1-16
    // BAT con Close : DO4-05
    // BAT con open  : DO4-06
    // Bat con close sen : DI1-08
    // Bat con open sen  : DI1-13
    TimerPLC.Enabled := False;

    // DI  PLC -> PC
    //제품 체결
    Led_Clamp_ON.LedOn    := ReadIO('DI1_01'); // 배선문제로12, 를 56으로 변경
    Led_Clamp_Off.LedOn   := ReadIO('DI1_02');
    // conector_rigt_sen
    Led_Con_R_ON.LedOn    := ReadIO('DI1_03');
    Led_Con_R_Off.LedOn   := ReadIO('DI1_04');
    // conector_left_sen
    Led_Con_L_ON.LedOn    := ReadIO('DI1_05');
    Led_Con_L_Off.LedOn   := ReadIO('DI1_06');
    // start
    Led_PLC_Start1.LedOn  := ReadIO('DI1_10');
    Led_PLC_Start2.LedOn  := ReadIO('DI1_11');
    // product 감지

    // 지그 종류 감지
    LED_MAS85.LedOn := ReadIO('DI1_15');
    LED_PPACK.LedOn := ReadIO('DI1_16');
    // bat con open/close
    Led_Bat_Con_close.LedOn := ReadIO('DI1_08');
    Led_Bat_Con_open.LedOn  := ReadIO('DI1_13');

    Led_CONUP.LedOn := ReadIO('DI1_12');
    Led_CONDW.LedOn := ReadIO('DI1_14');

    // DO  PC -> PLC
    // 제품 체결
    Led_PDT.LedOn  := ReadIO('DI1_07');         
    Led_Bat_Close.LedOn  := ReadIO('DI1_05');
    Led_Bat_Open.LedOn   := ReadIO('DI1_06');

    {if not bReset then
    begin
        if  (Led_PLC_Start1.LedOn) or  (Led_PLC_Start2.LedOn) then
        begin
            fTime := GetTickCountEx(Now);
            if fTime - fResetTime > 2000 then
            begin

            end;
        end;
    end; }
    //safety들어오면 안되게 하기

    TimerPLC.Enabled := True;
end;


procedure TFrmPLCControl.BtnLoadingClick(Sender: TObject);
begin
    BtnLoading.Enabled := False;

    if (not bLoading) and (BtnUnLoading.Enabled) then JigLoading();

    BtnLoading.Enabled := True;
end;

function TFrmPLCControl.JigLoading(): Boolean;
var fTime : Double;
    sErrorMsg : String;
begin
    bLoading := False;
    sErrorMsg := '';
    try
        // 1) CLAMP해제..
        {WriteIO('DO4_07', False);
        WriteIO('DO4_08', False);
        WriteIO('DO4_09', False); }
        Delay(200, True);
        // 2) 클램프 하강센서 확인.
        {if ((Led_Clamp_ON.LedOn)) or ((Led_Con_R_ON.LedOn) and (Led_Con_L_ON.LedOn)) then begin
            WriteIO('DO4_09', False);
            if not WaitIO('DI1_0') or WaitIO('DI1_06') then begin
                sErrorMsg := '클램프 상승센서 에러';
                exit;
            end;
            //Sleep(200);
        end;             }
        
        // 3) 클램프 하강.
        if ReadIO('DO4_07') or ReadIO('DO4_09') then
            Exit;

        fTime := GetTickCountEx;
        WriteIO('DO4_07', True);
        
        if not WaitIO('DI1_01', 5000) then begin
            sErrorMsg := '클램프 하강센서 에러';
            Exit
        end;

        Sleep(500);

        WriteIO('DO4_09', True);

        if not ( WaitIO('DI1_03', 5000))  then
        begin
            sErrorMsg := '커넥터 연결센서 에러';
            Exit;
        end; 
        DelayEx(500, True);
        //safety들어오면 안되게 하기
        
    // mas 65 : DI1-14
    // mas 85 : DI1-15
    // p pack : DI1-16
    // BAT con Close : DO4-05
    // BAT con open  : DO4-06
    // Bat con close sen : DI1-08
    // Bat con open sen  : DI1-13

        //85, PPACK 추가
        if ((LED_MAS85.LedOn) or (LED_PPACK.LedOn)) then
        begin
            if LED_PPACK.LedOn and (ReadIO('DI1_12')) and (not ReadIO('DI1_14')) then
            begin
                WriteIO('DO4_03', True);

                if not ( WaitIO('DI1_14', 5000))  then
                begin
                    sErrorMsg := '커넥터 다운센서 에러';
                    Exit;
                end;
            end;
            DelayEx(500, True);

            if (ReadIO('DI1_13')) and (not ReadIO('DI1_08')) then
            begin
                WriteIO('DO4_06', False);
                WriteIO('DO4_05', True);

                if not ( WaitIO('DI1_08', 5000))  then
                begin
                    sErrorMsg := '커넥터 연결센서 에러';
                    Exit;
                end;
            end;
        end;

    finally
        if sErrorMsg <> '' then begin
            MessageBox(sErrorMsg, 'ERROR', MB_OK or MB_ICONERROR);
        end;
    end;
    //safety들어오면 안되게 하기
    bLoading := True;
    Result := bLoading;
end;

procedure TFrmPLCControl.BtnUnLoadingClick(Sender: TObject);
begin
    BtnUnLoading.Enabled := False;

    if (bLoading) and (BtnLoading.Enabled) then JigUnloading();

    BtnUnLoading.Enabled := True;
end;

function TFrmPLCControl.JigUnloading(): Boolean;
var sErrorMsg : String;
begin
    bLoading := True;
    sErrorMsg := '';
    try
        if (not ReadIO('DO4_09')) OR (not ReadIO('DO4_07')) then exit;

    // mas 65 : DI1-14
    // mas 85 : DI1-15
    // p pack : DI1-16
    // BAT con Close : DO4-05
    // BAT con open  : DO4-06
    // Bat con close sen : DI1-08
    // Bat con open sen  : DI1-13

        //85, PPACK 추가
        if ((LED_MAS85.LedOn) or (LED_PPACK.LedOn)) then
        begin
            if (ReadIO('DI1_08')) and (not ReadIO('DI1_13')) then
            begin
                WriteIO('DO4_05', False);
                WriteIO('DO4_06', True);

                if not ( WaitIO('DI1_13', 5000))  then
                begin
                    sErrorMsg := '커넥터 연결센서 에러';
                    Exit;
                end;
                DelayEx(500, True);
            end;

            if LED_PPACK.LedOn and (ReadIO('DI1_14')) and (not ReadIO('DI1_12')) then
            begin
                WriteIO('DO4_03', False);

                if not ( WaitIO('DI1_12', 5000))  then
                begin
                    sErrorMsg := '커넥터 업센서 에러';
                    Exit;
                end;
                DelayEx(500, True);
            end;
        end;

        // 1) UNCLAMP  커넥터 제거.
        WriteIO('DO4_09', False);
        DelayEx(1000, True);
        if (not WaitIO('DI1_04'))  then begin
            sErrorMsg := '커넥터 연결해지센서 에러';
            exit;
        end;


        // 2) 클램프 제거.
        WriteIO('DO4_07', False);
        DelayEx(1000, True);
        if not WaitIO('DI1_02') then begin
            sErrorMsg := '클램프 해지센서 에러';
            exit;
        end;

    finally
        if sErrorMsg <> '' then begin
            MessageBox(sErrorMsg, 'ERROR', MB_OK or MB_ICONERROR);
        end;
    end;
    bLoading := False;
    Result := bLoading;
    
    TimerStart.Enabled := True;
end;

procedure TFrmPLCControl.FormCreate(Sender: TObject);
begin
    bLoading := False;
    TimerPLC.Enabled := True;
    TimerStart.Enabled := True;
    bReset := False;
    fResetTime := 0;
    FrmMain.bFail := True;
end;

procedure TFrmPLCControl.TimerStartTimer(Sender: TObject);
begin
    TimerStart.Enabled := False;

    if bLoading then exit;

    if (Led_PLC_Start1.LedOn) and (Led_PLC_Start2.LedOn) and (Led_PDT.LedOn) then
    begin
        if not FrmMain.bFail then
        begin
            FrmLog.AddMessage('불량 제품을 제거해 주세요');
            TimerStart.Enabled := True;
            DelayEx(300, True);
            Exit;
        end;
        if not frmtestoption.Cb_UseITAC.checked then
        begin
            FrmMessage := TFrmMessage.Create(Self);
            FrmMessage.ShowTestMessaage('ITAC 사용이 해지 되었습니다.',0);
        end;

        BtnLoadingClick(Sender);
        if bLoading then
            FrmMain.BtnStrartClick(Sender);
    end;

    if not Led_PDT.LedOn then
        FrmMain.bFail := True;

    TimerStart.Enabled := True;
end;

procedure TFrmPLCControl.SpeedButton1Click(Sender: TObject);
var sErrorMsg : String;
begin
    bLoading := True;
    sErrorMsg := '';
    try
        if LED_MAS85.LedOn or LED_PPACK.LedOn then
        begin
            WriteIO('DO4_06', True);
            WriteIO('DO4_05', False);
            DelayEx(1000, True);

            WriteIO('DO4_03', False);
            DelayEx(1000, True);
        end;

        // 1) UNCLAMP  커넥터 제거.
        WriteIO('DO4_09', False);
        DelayEx(1000, True);

        // 2) 클램프 제거.
        WriteIO('DO4_07', False);
        DelayEx(1000, True);

    // mas 65 : DI1-14
    // mas 85 : DI1-15
    // p pack : DI1-16
    // BAT con Close : DO4-05
    // BAT con open  : DO4-06
    // Bat con close sen : DI1-08
    // Bat con open sen  : DI1-13
    finally
        if sErrorMsg <> '' then begin
            MessageBox(sErrorMsg, 'ERROR', MB_OK or MB_ICONERROR);
        end;
    end;
    bLoading := False;
    //Result := bLoading;

    TimerStart.Enabled := True;
end;

procedure TFrmPLCControl.FormDestroy(Sender: TObject);
begin
    SpeedButton1Click(Sender);
end;

end.
