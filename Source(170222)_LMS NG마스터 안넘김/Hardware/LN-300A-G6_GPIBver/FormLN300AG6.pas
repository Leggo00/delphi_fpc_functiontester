unit FormLN300AG6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, ZINICtrl, AdvPanel,
  ExtCtrls, XiPanel, XiButton, Spin, ComCtrls, slstbox, GradFill,
  RealSpinEdit, ZGPIBDev, FormDevice;

type
  TEloadMode = (temCC, temCR, temCV, temCP);

  TFrmLN300AG6 = class(TFrmDevice)
    INI: ZIniData;
    GroupBox1: TGroupBox;
    edtSend: ZIniEdit;
    BtnSend: TXiButton;
    Panel: TPanel;
    GradientFill2: TGradientFill;
    LabelType: TLabel;
    XiButton2: TXiButton;
    edtDevNo: ZIniSpinEdit;
    GroupBox2: TGroupBox;
    lbCommendList: ZIniListBox;
    XiButton1: TXiButton;
    BtnOff: TXiButton;
    BtnOn: TXiButton;
    XiPanel1: TXiPanel;
    XiButton3: TXiButton;
    edtCurrent: ZIniRealSpinEdit;
    XiButton4: TXiButton;
    pnlValue: TXiPanel;
    btnInitial: TXiButton;
    ZGPIBdevice: ZGPIBdevice;
    edtOhm: ZIniRealSpinEdit;
    XiButton5: TXiButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    MemoLog: TMemo;
    edtLIMIT_OHM_MIn: ZIniEdit;
    Label1: TLabel;
    edtLIMIT_OHM_Max: ZIniEdit;
    Label2: TLabel;
    procedure BtnOnClick(Sender: TObject);
    procedure BtnOffClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnCommedClearClick(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnClearClick(Sender: TObject);
    procedure lbCommendListDblClick(Sender: TObject);
    procedure XiButton3Click(Sender: TObject);
    procedure XiButton4Click(Sender: TObject);
    procedure btnInitialClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure XiButton5Click(Sender: TObject);
  private
    { Private declarations }
    procedure AddLog(Param : string);

    function CommSend(sCommend: string) : integer;
    function CommRead(): string;
  public
    { Public declarations }

    procedure Initialize();
    procedure SetValue(fValue: double; aEloadMode: TEloadMode = temCC);
    function GetValue(Idx:Integer):String;

    //------------------------------------------------------------
    function DevOpen(Param : String) : Integer; override;
    function DevClose(Param : String): Integer; override;
    function DevInit(Param : String) : Integer; override;

    function DevSend(Param : String) : Integer; override;
    function DevRead(Param : String) : String;  override;

  end;

var
  FrmLN300AG6: TFrmLN300AG6;

implementation

{$R *.dfm}

uses
    GenUtils, SysConst, FormLog;

procedure TFrmLN300AG6.AddLog(Param : String);
var
    Str : string;
begin
    if not Visible then exit;
    
    if MemoLog.Lines.Count > 1000 then
        MemoLog.Lines.Delete(0);

    Str := Format('Send: %s ',[Param]);

    MemoLog.Lines.Add(Str);   
end;

function TFrmLN300AG6.CommSend(sCommend: string): integer;
begin

    Result := 0;
    AddLog(sCommend);

    ZGPIBdevice.ibwrt(sCommend);
end;

function TFrmLN300AG6.CommRead(): string;
var
    Buff : array [0..10240] of Char;
    ReceiveData : OleVariant;
begin
    Result := '';

    ZGPIBdevice.ibrd(@Buff[0], ZGPIBdevice.BufferSize);//
    Result := String(Buff);

    if  Result <> '' then
        AddLog( Format('Read >> %s',[Result]) );
end;

function TFrmLN300AG6.GetValue(Idx:Integer):String;
var RdStr : String;
begin
    if Idx < 0 then Idx := 0;
    case Idx of
        0 : CommSend('MV 1'); // 전압
        1 : CommSend('MC 1'); // 전류
    end;
    RdStr := CommRead();
    RdStr := GetToKen(RdStr,CRLF);
    pnlValue.Caption := StringReplace(RdStr,' ','', [rfReplaceAll]);
    Result :=  pnlValue.Caption;
end;

procedure TFrmLN300AG6.BtnOnClick(Sender: TObject);
begin
    CommSend('SW 1');
end;

procedure TFrmLN300AG6.BtnOffClick(Sender: TObject);
begin
    if not ZGPIBdevice.Connected then exit;
    CommSend('SW 0');
end;

procedure TFrmLN300AG6.FormCreate(Sender: TObject);
begin
    INI.LoadData;

    if edtDevNo.Value <= 0 then exit;

    ZGPIBdevice.GPIBaddr := edtDevNo.Value;
    ZGPIBdevice.Connected := True;
end;

procedure TFrmLN300AG6.BtnCommedClearClick(Sender: TObject);
begin
    edtSend.Clear;
end;

procedure TFrmLN300AG6.BtnSendClick(Sender: TObject);
begin
    CommSend(edtSend.Text);      
//    CommRead(edtDevNo.Value);
end;

procedure TFrmLN300AG6.FormDestroy(Sender: TObject);
begin
    INI.SaveData;
    ZGPIBdevice.Connected := False;
end;

procedure TFrmLN300AG6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    INI.SaveData;
end;

procedure TFrmLN300AG6.BtnClearClick(Sender: TObject);
begin
    MemoLog.Lines.Clear;
end;

procedure TFrmLN300AG6.lbCommendListDblClick(Sender: TObject);
var
    Str, RdStr : string;
begin
    RdStr := lbCommendList.Items[ lbCommendList.ItemIndex ];
    GetToken(RdStr, ' : ');
    edtSend.Text := RdStr;

    BtnSend.OnClick(nil);
end;

procedure TFrmLN300AG6.SetValue(fValue: double; aEloadMode: TEloadMode = temCC);
var
    sCommand: string;
    fmin, fmax : double;
begin
     case aEloadMode of
         temCC: begin
            sCommand := 'CC';
         end;
         temCR: begin
            sCommand := 'CR';
           { fmin := StrToFloatDef(edtLIMIT_OHM_MIn.Text,10);
            fmax := StrToFloatDef(edtLIMIT_OHM_Max.Text,10);

            if NOT ( (fValue > fmin) and (fValue < fmax)) then
            begin
                if (fValue <> 0) then
                begin
                     fValue := fmin;
                    FrmLog.AddMessage('정저항 출력값 spec ng');
                end;
            end;}
         end;
         temCV: begin
            sCommand := 'CV';
         end;
         temCP: begin
            sCommand := 'CP';
         end;
     end;
     sCommand := Format('%s %f', [sCommand, fValue]);
     CommSend(sCommand);


     if fValue = 0  then
     begin
         CommSend('SW 0')
         
     end else
         CommSend('SW 1');
end;
     
procedure TFrmLN300AG6.XiButton3Click(Sender: TObject);
begin
    SetValue(edtCurrent.Value);
//    pnlValue.Caption := CommRead();
end;

procedure TFrmLN300AG6.XiButton4Click(Sender: TObject);
begin
    pnlValue.Caption := CommRead();
end;

procedure TFrmLN300AG6.Initialize();
begin
     CommSend('RV 0');
     CommSend('RC 1');
     CommSend('GC 0.3');
     CommSend('CC 0');
     CommSend('SW 0');
end;

procedure TFrmLN300AG6.btnInitialClick(Sender: TObject);
begin
    Initialize();
end;         

function TFrmLN300AG6.DevClose(Param: String): Integer;
begin
//
end;

function TFrmLN300AG6.DevInit(Param: String): Integer;
begin
//
end;

function TFrmLN300AG6.DevOpen(Param: String): Integer;
begin
//
end;

function TFrmLN300AG6.DevRead(Param: String): String;
begin
//
end;

function TFrmLN300AG6.DevSend(Param: String): Integer;
var
    fparam : double;
    RdStr,Str : string;

    aEloadMode : TEloadMode;
begin
    RdStr := Param;
    Str := GetToken(RdStr, ':');
    if (Str = 'CC') then
        aEloadMode := temCC
    else if (Str = 'CR') then
        aEloadMode := temCR
    else if (Str = 'CV') then
        aEloadMode := temCV
    else if (Str = 'CP') then
        aEloadMode := temCP;
    fparam := StrToFloatDef(RdStr,0);
    SetValue(fparam, aEloadMode);
end;

procedure TFrmLN300AG6.XiButton5Click(Sender: TObject);
begin
  inherited;
  SetValue(edtOhm.Value,temCR);
end;

end.
