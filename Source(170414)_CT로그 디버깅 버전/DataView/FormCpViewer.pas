unit FormCpViewer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AxCtrls, OleCtrls, VCF1, StdCtrls, Buttons, ComCtrls, IniFiles,
  Series, TeEngine, TeeProcs, Chart, Printers, Math, DPBLabel;

type
  TFrmCpViwer = class(TForm)
    Panel1: TPanel;
    ListItem: TListBox;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    BtnSave: TBitBtn;
    BtnPrint: TBitBtn;
    PrintDialog: TPrintDialog;
    SaveDialog: TSaveDialog;
    GroupBox1: TGroupBox;
    Edit_Title: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit_Min: TEdit;
    Label3: TLabel;
    Edit_Max: TEdit;
    Label4: TLabel;
    BtnRandom: TBitBtn;
    BtnCalc: TBitBtn;
    BtnClose: TBitBtn;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Sheet: TF1Book;
    ChartX: TChart;
    CheckBox_TEST: TCheckBox;
    Series1: TFastLineSeries;
    Series2: TPointSeries;
    Series3: TFastLineSeries;
    Series4: TFastLineSeries;
    ChartR: TChart;
    FastLineSeries1: TFastLineSeries;
    PointSeries1: TPointSeries;
    SheetXR: TF1Book;
    TabSheet3: TTabSheet;
    ChartHisto: TChart;
    CheckBox1: TCheckBox;
    Series5: TBarSeries;
    SheetHisto: TF1Book;
    procedure BtnRandomClick(Sender: TObject);
    procedure BtnCalcClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure DrawXRGraph();
    procedure DrawSheet();
    procedure DrawHistogram();
  public
    { Public declarations }
    DateTime_From, DateTime_To : TDateTime;
    procedure CpFileOpen(FileName : string);

  end;

var
  FrmCpViwer: TFrmCpViwer;
  function  StatExecute(Date_From, Date_To: TDateTime; FileName : String) : Boolean;
  //procedure WriteDataCP (FileName : string; ItemStr, ResultStr: string);

implementation

{$R *.dfm}

uses GenUtils, Hutil32;

const
    INVALID_VALUE = -99999;

function StatExecute(Date_From, Date_To: TDateTime; FileName : String) : Boolean;
var
	RdStr, Str  : string;
    F : TextFile;
    Date_Test : TDateTime;
begin
    if not FileExists(FileName) then exit;


    Result := True;
    FrmCpViwer := TFrmCpViwer.Create(Application);

    with FrmCpViwer do begin
        DateTime_From := Trunc(Date_From);
        DateTime_To   := Trunc(Date_To) + 1;
        CpFileOpen(FileName);

        ShowModal;
    end;
end;

{procedure WriteDataCP(FileName : string; ItemStr, ResultStr: string);
var
    wrstr, str, rdstr, minstr, maxstr: string;
    text: TextFile;
    buf: array[0..1024] of char;
    ini: TIniFile;
begin
    if not FileExists (FileName) then
    begin
        str := GetValidStr3 (ItemStr, rdstr, [' ']);
        StrPCopy (buf, str);
        ini := TIniFile.Create (FileName);

        with ini do begin
            WriteString ('Info', 'Name', rdstr);
            minstr := GetValueFromMask (buf, '%1');
            maxstr := GetValueFromMask (buf, '%2');
            WriteString ('Info', 'Min', minstr);
            WriteString ('Info', 'Max', maxstr);
            WriteString ('Data', '-- Date --', '-- Value --');
        end;
        ini.Free;
        try Append (text); except exit; end;

    end else begin
        AssignFile (text, FileName);
        try Append (text); except exit; end;
    end;

    wrstr := '"' + DateToStr (Date) + '" "' + resultstr + '"';
    WriteLn (text, wrstr);
    CloseFile (text);
end;
}
procedure TFrmCpViwer.CpFileOpen(FileName : string);
var
   text: TextFile;
   Str, Rdstr, ValStr, DateStr: string;
   Ini: TIniFile;
   SelDate : TDateTime;
begin

    Ini := TIniFIle.Create (FileName);
    try
        Edit_Title.Text := ini.ReadString ('Info', 'Name', '');
        Edit_Min.Text   := ini.ReadString ('Info', 'Min', '');
        Edit_Max.Text   := ini.ReadString ('Info', 'Max', '');
    finally
        Ini.Free;
    end;

    AssignFile (text, FileName);
    try
   	    Reset (text);
    except
        exit;
    end;

    ListItem.Clear;
    while not EOF (text) do
    begin
        ReadLn (text, rdstr);
        if (Rdstr <> '') then
        if (Rdstr[1] = '"') then begin
            DateStr := CaptureString (Rdstr, Rdstr);
            if Trim(datestr) <> '' then begin
            try
                SelDate := StrToDate (DateStr);
            except
                continue;
            end;


            if (SelDate >= DateTime_From) and (SelDate < DateTime_To) then begin
                ValStr := CaptureString (rdstr, rdstr);

                if (Trim(ValStr) <> '') and (IsFloatNumeric (ValStr)) then
                begin
                    Str := DateToStr (SelDate) + ',' + ValStr;
                    ListItem.Items.Add(Str);
                end;
            end;
         end;
      end;
   end;
   CloseFile (text);
end;

{
 CP file format

 [Info]
 Name = test name
 Min  = 1
 Max  = 10

 [Data]
 "test date" "test value"

}

//------------------------------------------------------------------------------
procedure TFrmCpViwer.BtnRandomClick(Sender: TObject);
var i : Integer;
    fValue : Double;
    Str : String;
begin
    ListItem.Clear;
    for i:= 1 to 100 do begin
        if (Random(10) > 5) then
            fValue := 100 + Random(999) / 100
        else
            fValue := 100 - Random(999) / 100;

        Str := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ', ' + FormatFloat('0.00', fValue);
        ListItem.Items.Add( Str );
    end;
end;

procedure TFrmCpViwer.BtnCalcClick(Sender: TObject);
begin
    DrawSheet();
    DrawXRGraph();
    DrawHistogram();
end;

procedure TFrmCpViwer.DrawSheet();
var i, Count : Integer;
    fValue : Double;
    nRow, nCol : Integer;
    Str : String;
    CpMode : Integer;
begin
    nCol := 4;
    Count := ListItem.Count;
    Sheet.ClearRange(12, 1, Sheet.MaxRow, Sheet.MaxCol, F1ClearValues);

    if Edit_Title.Text <> '' then
        Sheet.TextRC[2, 3] := Edit_Title.Text
    else
        Sheet.TextRC[2, 3] := ' ';
    Sheet.NumberRC[5, 3] := Count;

    Sheet.TextRC[3, 3] := FormatDateTime('yyyy-mm-dd', DateTime_From)
                + ' ~ ' + FormatDateTime('yyyy-mm-dd', DateTime_To);

    CpMode := 0;
    // 하한값.
    fValue := StrToFloatDef(Edit_Min.Text , INVALID_VALUE);
    if fValue <> INVALID_VALUE then
    begin
        Sheet.NumberRC[6, 3] := fValue;
        CpMode := CpMode + 1;
    end
    else
        Sheet.TextRC[6, 3] := '-';

    // 상한값.
    fValue := StrToFloatDef(Edit_Max.Text , INVALID_VALUE);
    if fValue <> INVALID_VALUE then
    begin
        Sheet.NumberRC[7, 3] := fValue;
        CpMode := CpMode + 2;
    end
        else Sheet.TextRC[7, 3] := '-';


    nRow := 12;
    Str := Format('(D%d:D%d)', [nRow, nRow + Count]);
    with Sheet do begin
        FormulaRC[8, 3] := 'MIN'     + Str;
        FormulaRC[9, 3] := 'MAX'     + Str;
        FormulaRC[5, 5] := 'AVERAGE' + Str;
        FormulaRC[6, 5] := 'VAR'     + Str;
        FormulaRC[7, 5] := 'STDEV'   + Str;

        case CpMode of
            0: begin
                TextRC[8, 5] := '-';
                TextRC[9, 5] := '-';
            end;

            1: begin
                FormulaRC[8, 5] := '(E5-C6)/(3*E6)';
                TextRC[9, 5] := '-';
            end;

            2: begin
                FormulaRC[8, 5] := '(C7-E5)/(3*E6)';
                TextRC[9, 5] := '-';
            end;

            3: begin
                FormulaRC[8, 5] := '(C7-C6)/(6*E6)';
                FormulaRC[9, 5] := '(1-ABS(((C7+C6)/2-E5)/((C7-C6)/2)))*E8';
            end;
        end;
    end;

    for i:=0 to Count-1 do begin
        Str := ListItem.Items[i];
        Sheet.TextRC[nRow, 3]   := GetToken(Str, ',');
        Sheet.NumberRC[nRow, 2] := i+1;

        fValue := StrToFloatDef(Str, INVALID_VALUE);
        if fValue <> INVALID_VALUE then
            Sheet.NumberRC[nRow, 4] := fValue
        else
            Sheet.TextRC[nRow, 4] := '';
        Inc(nRow);
    end;
end;

procedure TFrmCpViwer.DrawHistogram();
var i, Idx, nCol, nRow : Integer;
    Str, RdStr, ValStr : String;
    fValue, fMinValue, fMaxValue, fValueRange, fStepValue : Double;

    fLevel : array [1..10] of Double;
    nCount : array [1..10] of Integer;
begin
    SheetHisto.ClearRange(2, 2, Sheet.MaxRow, Sheet.MaxCol, F1ClearValues);

    ChartHisto.Title.Text.Clear;
    ChartHisto.Series[0].Clear;

    if ListItem.Count < 1 then exit;

    for i:=1 to 10 do nCount[i] := 0;

    //
    fMinValue := 99999;
    fMAxValue := -99999;
    for i:=0 to ListItem.Count-1 do begin
        RdStr := ListItem.Items[i];
        GetToken(RdStr, ',');
        fValue := StrToFloatDef(RdStr, INVALID_VALUE);
        fMinValue := MIN(fMinValue, fValue);
        fMaxValue := MAX(fMAxValue, fValue);
    end;
    fValueRange := (fMaxValue - fMinValue);
    fStepValue  := fValueRange / 10;

    for i:=1 to 10 do begin
        fLevel[i] := fMinValue + fValueRange * i / 10;
    end;

    for i:=0 to ListItem.Count-1 do begin
        RdStr := ListItem.Items[i];
        GetToken(RdStr, ',');
        fValue := StrToFloatDef(RdStr, INVALID_VALUE);
        if (fValue <> INVALID_VALUE) then begin
            for Idx:=1 to 10 do begin
                if fValue < fLevel[Idx] then
                    break;
            end;
            nCount[Idx] := nCount[Idx] + 1;
        end;
    end;

    ChartHisto.Title.Text.Add('HISTOGRAM - ' + Edit_Title.Text);
    for i:=1 to 10 do begin
        SheetHisto.NumberRC[2, i+1] := fLevel[i];
        SheetHisto.NumberRC[3, i+1] := nCount[i];
        ChartHisto.Series[0].AddXY(fLevel[i], nCount[i]);
    end;
end;

procedure TFrmCpViwer.DrawXRGraph();
var i, nCol, nRow : Integer;
    Str, RdStr, DateStr, ValStr : String;
    PrevDate, CurrDate : TDateTime;
    fXValue, fRValue : Double;
    function XY2RC(Col, Row: Integer) : String;
    var Str : String;
        Val : Integer;
    begin

        Val := Ord('Z') - Ord('A') + 1;
        Col := Col - 1;

        if Col > Val then
            Str := Char(Ord('A')+ (Col div Val)-1) +
                   Char(Ord('A')+ (Col mod Val))
        else
            Str := Char(Ord('A')+ Col);

        Result := Str + IntToStr(Row);
    end;

    function GetRCStr(C1, R1, C2, R2: Integer) : String;
    begin
        Result := XY2RC(C1, R1) + ':' + XY2RC(C2, R2);
    end;

    procedure MakeGraph();
    var Str : String;
    begin
        if nRow < 5 then exit;
        Str := GetRCStr(nCol, 4, nCol, nRow-1);

        SheetXR.FormulaRC[2, nCol] := Format('AVERAGE(%s)', [Str]);
        SheetXR.FormulaRC[3, nCol] := Format('MAX(%s) - MIN(%s)', [Str, Str]);

        Str     := SheetXR.TextRC[1, nCol];
        GetToken( Str, '-');
        
        fXValue := SheetXR.NumberRC[2, nCol];
        fRValue := SheetXR.NumberRC[3, nCol];

        with ChartX do begin
            Series[0].Add(fXValue, Str);
            Series[1].Add(fXValue, Str);
            Series[2].Add(StrToFloatDef(Edit_Min.Text, 0), Str);
            Series[3].Add(StrToFloatDef(Edit_Max.Text, 0), Str);
        end;

        with ChartR do begin
            Series[0].Add(fRValue, Str);
            Series[1].Add(fRValue, Str);
        end;
    end;

begin
    SheetXR.ClearRange(1, 2, Sheet.MaxRow, Sheet.MaxCol, F1ClearValues);

    with ChartX do
        for i:=0 to SeriesList.Count-1 do Series[i].Clear;

    with ChartR do begin
        for i:=0 to SeriesList.Count-1 do Series[i].Clear;
    end;

    // Make Sheet.
    nCol := 1;
    nRow := 1;
    PrevDate := 0;
    for i:=0 to ListItem.Count-1 do begin

        RdStr   := ListItem.Items[i];
        DateStr := GetToken(RdStr, ',');
        ValStr  := RdStr;

        CurrDate := StrToDate(DateStr);

        if (PrevDate <> CurrDate) then
        begin
            if (nCol > 1) then begin
                MakeGraph();
            end;
            PrevDate := CurrDate;
            Inc(nCol);
            SheetXR.TextRC[1, nCol] := DateStr;
            nRow := 4;
        end;

        SheetXR.NumberRC[nRow, nCol] := StrToFloatDef(ValStr, 0);
        Inc(nRow);
    end;
    MakeGraph();
end;

procedure TFrmCpViwer.BtnPrintClick(Sender: TObject);
var H, W : Integer;
    DrawRect : TRect;
    Str : String;
begin
    if PrintDialog.Execute then begin
        case PageControl.TabIndex of
            0: begin
                Sheet.PrintGridLines := False;
                Sheet.PrintLandscape := False;
                Sheet.FilePrint (False);
            end;

            1: begin
                with Printer do
                begin
                    Printer.Orientation := poLandscape;
                    W := PageWidth;
                    H := PageHeight;

                    BeginDoc;

                    Str := 'X-R관리도 [' + Edit_Title.Text + ']';
                    Canvas.Font.Size := 12;
                    Canvas.Font.Color := clBlue;
                    DrawRect := RECT( Round(W*0.1), Round(H*0.1), Round(W*0.9),  Round(H*0.2));
                    DrawText(Canvas.Handle, PChar(Str), Length(Str), DrawRect,
                        DT_CENTER or DT_VCENTER or DT_SINGLELINE);

                    DrawRect := RECT( Round(W*0.1), Round(H*0.2), Round(W*0.9),  Round(H*0.60));
                    ChartX.PrintResolution := -50;
                    ChartX.PrintPartialCanvas(Canvas, DrawRect);

                    DrawRect := RECT( Round(W*0.1), Round(H*0.65), Round(W*0.9), Round(H*0.9));
                    ChartR.PrintResolution := -50;
                    ChartR.PrintPartialCanvas(Canvas, DrawRect);
                    EndDoc;
                end;
            end;

            2: begin
                with Printer do
                begin
                    Printer.Orientation := poLandscape;
                    W := PageWidth;
                    H := PageHeight;
                    DrawRect := RECT( Round(W*0.1), Round(H*0.1), Round(W*0.9),  Round(H*0.9));

                    BeginDoc;
                    ChartHisto.PrintResolution := -50;
                    ChartHisto.PrintPartialCanvas(Canvas, DrawRect);
                    EndDoc;
                end;

            end;
        end;
        
    end;
end;

procedure TFrmCpViwer.BtnSaveClick(Sender: TObject);
begin
	if SaveDialog.Execute then begin
        case PageControl.TabIndex of
            0: Sheet.Write  (SaveDialog.FileName, F1FileExcel5);
            1: SheetXR.Write(SaveDialog.FileName, F1FileExcel5);
            2: SheetHisto.Write(SaveDialog.FileName, F1FileExcel5);
        end;
    end;
end;

procedure TFrmCpViwer.BtnCloseClick(Sender: TObject);
begin
    Close();
end;

procedure TFrmCpViwer.FormShow(Sender: TObject);
begin
    BtnCalcClick(Sender);
    PageControl.ActivePageIndex := 0;
end;

end.
