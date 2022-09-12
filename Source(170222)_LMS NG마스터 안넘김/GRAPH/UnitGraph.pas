{===============================================================================

    GRAPH CLASS.   초기버젼 (2005-11-03)
    + 2009-02-16 수정.  분할모드 추가.
                        채널이름표시기능 추가.
                        축 디자인 변경.

===============================================================================}
unit UnitGraph;

interface

uses
    Classes, FloatList, Graphics, SysUtils, Types, Windows, Math, INIFiles, jpeg;

type
    //--------------------------------------------------------------------------
    TAxisDirection = (ad_Left, ad_Right, ad_Top, ad_Bottom);

    TAxis = class(TObject)
    private
        propVisible : Boolean;

        fZoomMin, fZoomMax : Double;

        fLargeStep, fSmallStep, fStartStep : Double;

        function  GetGridStep : Double;
        procedure SetVisible(Param : Boolean);
        //procedure DrawLegned(Canvas : TCanvas; Rect : TRect);
    public
        AxisName : String;
        AxisColor : TColor;
        fAxisMin, fAxisMax : Double;
        ClientRect : TRect;

        sValueFormat : String;
        bInvert : Boolean;

        DrawRect : TRect;

        constructor Create();
        destructor  Destroy(); override;

        procedure DrawAxis(Canvas : TCanvas; Rect : TRect; AxisDir : TAxisDirection; bSimpleMode : Boolean = False);
        procedure SetAxisRange(fMin, fMax : Double; fStep : Double = 0);

        property  Visible  : Boolean read propVisible write SetVisible;
        property  AxisMin  : Double  read fZoomMin    write fZoomMin;
        property  AxisMax  : Double  read fZoomMax    write fZoomMax;
        property  AxisStep : Double  read fLargeStep  write fLargeStep;
    end;

    //--------------------------------------------------------------------------
    TChData = class(TFloatPointList)
    private

    public
        ChName : String;
        Color : TColor;
        Visible, Enabled : Boolean;
        RefAxisX, RefAxisY : TAxis;
        LegnedRect : TRect;
        constructor Create();
        destructor Destroy(); override;

        procedure DrawLegned(Canvas : TCanvas; Rect : TRect);
        procedure DrawValue (Canvas : TCanvas; Rect : TRect; ValStr : String);
        procedure DrawChannel(Canvas : TCanvas; Rect : TRect);

        procedure AddXY(fX, fY : Double);
        function  MeasValue(sItemName : String) : double;
    end;

    //--------------------------------------------------------------------------
    TGraph = class(TObject)
    private
        ChList    : TList;
        AxisList  : TList;
        propGraphRect : TRect;
        propBottomAxis, propLeftAxis, propRightAxis : TAxis;
    public
        bViewTitle  : Boolean;
        bViewLegend : Boolean;
        bViewSplit  : Boolean;

        Title : String;

       BackColor, FrontColor, LineColor, GridColor, AxisColor : TColor;

        LeftMargin, RightMargin, TopMargin, BottomMargin : Integer;

        constructor Create();
        destructor  Destroy(); override;

        // AXIS FUNCTIONS
        function   AddAxis() : TAxis;
        function   GetAxis(Index : Integer ) : TAxis;
        function   GetAxisIdx(Axis : TAxis) : Integer;
        function   GetAxisCount() : Integer;
        procedure  DeleteAxis(Index : Integer );
        procedure  ClearAxis();
        function   FindAxis(AxisName : String) : TAxis;

        procedure  SetBottomAxis(Axis : TAxis);
        procedure  SetLeftAxis(Axis : TAxis);
        procedure  SetRightAxis(Axis : TAxis);

        // CHANNEL FUNCTIONS
        function   AddChannel() : TChData;
        function   GetChannel(Index : Integer) : TChData;
        function   GetChannelCount() : Integer;
        procedure  DeleteChannel(ChIdx : Integer);
        procedure  DeleteAllChannel();
        function   FindChannel(ChannelName : String) : TChData;

        // DRAW FUNCTIONS
        procedure  DrawGraph(Canvas : TCanvas; Rect : TRect);
        procedure  DrawChannelValue(Canvas : TCanvas; Rect : TRect; bDrawBackGround : Boolean = True);

        // PROPERTY
        property   AxisCount    : Integer read GetAxisCount;
        property   ChannelCount : Integer read GetChannelCount;
        property   Axis[Index: Integer]    : TAxis   read GetAxis;
        property   Channel[Index: Integer] : TChData read GetChannel;
        property   GraphRect : TRect read propGraphRect;

        property   BottomAxis : TAxis read propBottomAxis write SetBottomAxis;
        property   LeftAxis   : TAxis read propLeftAxis   write SetLeftAxis;
        property   RightAxis  : TAxis read propRightAxis  write SetRightAxis;

        // FILE FUNCTIONS.
        procedure  LoadFromFile(FileName : String);
        procedure  SaveToFile(FileName : String);
        procedure  SaveToJPG(FileName : String);
        procedure  SaveToData(FileName : String);
        procedure  LoadFromRawData(FileName: String);
        procedure  SaveToRawData(FileName: String);

        procedure  ZoomRect(X1, Y1,  X2, Y2 : Integer);
        procedure  ZoomHorizental(X1, X2: Integer);
        procedure  ZoomOut();
        procedure  MoveXY(X1, Y1, X2, Y2: Integer);
        procedure  MoveX(X1, X2: Integer);
    end;

implementation

uses GenUtils;

const
    SMALL_GRID_COUNT = 5;
    AXIS_WIDTH       = 7;
    LEGEND_WIDTH     = 10;

//==============================================================================
constructor TAxis.Create();
begin
    inherited;
    fAxisMin      := 0;
    fAxisMax      := 100;
    AxisColor     := clBlack;
    AxisName      := 'AXIS';
    sValueFormat  := '0.###';
    Visible       := True;

    GetGridStep();
end;

destructor TAxis.Destroy();
begin
    inherited;
end;

procedure TAxis.SetVisible(Param : Boolean);
begin
    if propVisible <> Param then
    begin
        propVisible := Param;
    end;
end;

function TAxis.GetGridStep() : Double;
var nDigit : Integer;
    fValue, fStepValue : Double;
begin
    // fStep이 0 이면 자동스텝.
    if (fLargeStep <= 0) then
    begin
        // 눈금 최소시작점을 구한다.
        fValue := ABS(AxisMax - AxisMin);

        fStepValue := 1E+6;
        for nDigit := 6 downto -5 do begin
            if (fValue >= (5 * fStepValue) ) then fLargeStep := fStepValue * 0.5 else
            if (fValue >= (2 * fStepValue) ) then fLargeStep := fStepValue * 0.2 else
            if (fValue >= (1 * fStepValue) ) then fLargeStep := fStepValue * 0.1 else
                                                fLargeStep := 0;

            if (fLargeStep <> 0 ) then break;
            fStepValue := fStepValue / 10;
        end;

        if fLargeStep = 0 then
            fLargeStep := 1;
    end;

    fStartStep := AxisMin - Mod2(AxisMin, fLargeStep);
    if fStartStep < AxisMin then fStartStep := fStartStep + fLargeStep;

    fSmallStep := fLargeStep / SMALL_GRID_COUNT;
    Result := fStartStep;    
end;

procedure TAxis.SetAxisRange(fMin, fMax : Double; fStep : Double = 0);
begin
    fAxisMin   := MIN(fMin, fMax);
    fAxisMax   := MAX(fMin, fMax);
    fZoomMin :=  fAxisMin;
    fZoomMax :=  fAxisMax;

    fLargeStep := fStep;

    GetGridStep;
end;


procedure SetCanvasTextAngle(Canvas: TCanvas; Angle: Word);
var
  LogRec: TLOGFONT;
  NewFont, OldFont: HFont;
begin
    GetObject(Canvas.Font.Handle, SizeOf(LogRec), Addr(LogRec));
    LogRec.lfEscapement := Angle * 10;
    NewFont := CreateFontIndirect(LogRec);
    OldFont := SelectObject(Canvas.Font.Handle, NewFont);
    DeleteObject(OldFont);
    Canvas.Font.Handle := NewFont;
end;

//------------------------------------------------------------------------------
// 그래프 축을 그린다.
procedure TAxis.DrawAxis(Canvas : TCanvas; Rect : TRect; AxisDir : TAxisDirection; bSimpleMode : Boolean = False);
var i, x, y, nCount : Integer;
    fValue, fStep : Double;
    Str : String;
    GridWGap, GridHGap  : Integer;
    nStartPos, nEndPos : Integer;
begin
    if AxisMin >= AxisMax then exit;

    // 마지막 그린영역이 Client영역으로 남는다.
    ClientRect := Rect;

    // fStep이 0 이면 자동스텝.
    GetGridStep();

    with Canvas do begin
        Brush.Style := bsClear;
        Pen.Width   := 1;
        Pen.Color   := AxisColor;
        Pen.Style   := psSolid;
        Font.Color  := AxisColor;
        Font.Size   := 8;

        GridWGap := Round(TextWidth('0') * 1.5);
        GridHGap := Round(TextHeight('0') * 0.6);

        case AxisDir of
            //------------------------------------------------------------------
            ad_Left : begin
                if not bInvert then begin
                    nStartPos := Rect.Bottom;
                    nEndPos   := Rect.Top;
                end else begin
                    nStartPos := Rect.Top;
                    nEndPos   := Rect.Bottom;
                end;

                // Draw Vertical Line.
                MoveTo( Rect.Right-1, Rect.Top);
                LineTo( Rect.Right-1, Rect.Bottom);

                if (bSimpleMode) then
                begin
                    // Draw MAX Number.
                    MoveTo( Rect.Right - GridWGap, Rect.Top);
                    LineTo( Rect.Right,            Rect.Top);

                    Str := FormatFloat(sValueFormat, AxisMax);
                    x := Rect.Right - TextWidth(Str + ' ') - GridWGap;
                    if (not bInvert) then y := Rect.Top
                                     else y := Rect.Bottom - Round(TextHeight(Str));
                    TextOut(x, y, Str);

                    // Draw MIN Number.
                    MoveTo( Rect.Right - GridWGap, Rect.Bottom);
                    LineTo( Rect.Right,            Rect.Bottom);

                    Str := FormatFloat(sValueFormat, AxisMin);
                    x := Rect.Right - TextWidth(Str + ' ') - GridWGap;
                    if (not bInvert) then y := Rect.Bottom - Round(TextHeight(Str))
                                     else y := Rect.Top;
                    TextOut(x, y, Str);

                end else
                begin
                    nCount := 0;
                    if (fStartStep > AxisMin)  then fValue := (fStartStep - fLargeStep)
                                               else fValue := fStartStep;

                    while (fValue <= AxisMax) do
                    begin
                        if (fValue >= AxisMin) then
                        begin
                            y := Round(RescaleData(AxisMin , AxisMax, nStartPos, nEndPos, fValue));
                            if (nCount mod SMALL_GRID_COUNT = 0) then
                            begin
                                MoveTo( Rect.Right - Round(GridWGap * 2.5), y);
                                LineTo( Rect.Right, y);

                                // Draw Number.
                                Str := FormatFloat(sValueFormat, fValue);
                                x := Rect.Right - TextWidth(Str + ' ') - GridWGap;
                                if (not bInvert) then y := y - Round(TextHeight(Str)* 1.2)
                                                 else y := y + Round(TextHeight(Str)* 0.2);


                                if (y > Rect.Top) then
                                TextOut(x, y, Str);
                            end else begin // Draw Small Grid..
                                MoveTo( Rect.Right - GridWGap, y);
                                LineTo( Rect.Right, y);
                            end;
                        end;
                        fValue := fValue + fSmallStep;
                        Inc(nCount);
                    end;
                end;

                // Draw AxisName
                if (AxisName <> '') then
                begin
                    Str := AxisName;
                    x := Rect.Left + 2;
                    y := (Rect.Bottom + Rect.Top + TextWidth(Str)) div 2;

                    Font.Style := [fsBold];
                    if Length(Str) > 3 then
                        SetCanvasTextAngle(Canvas, 90);
                    TextOut(x, y, Str);
                    Font.Style := [];
                end;
            end;


            //------------------------------------------------------------------
            ad_Bottom : begin
                // Draw Vertical Line.
                MoveTo( Rect.Left,  Rect.Top+1);
                LineTo( Rect.Right, Rect.Top+1);

                if not bInvert then begin
                    nStartPos := Rect.Left;
                    nEndPos   := Rect.Right;
                end else begin
                    nStartPos := Rect.Right;
                    nEndPos   := Rect.Left;
                end;

                nCount := 0;
                if (fStartStep > AxisMin) then fValue := (fStartStep - fLargeStep)
                                           else fValue := fStartStep;

                while (fValue <= AxisMax) do
                begin
                    if (fValue >= AxisMin) then
                    begin
                        x := Round(RescaleData(AxisMin , AxisMax, nStartPos, nEndPos, fValue));
                        if (nCount mod SMALL_GRID_COUNT = 0) then
                        begin
                            // 눈금을 그린다.
                            Canvas.MoveTo(x, Rect.Top );
                            Canvas.LineTo(x, Rect.Top + GridHGap * 2);

                            Str := FormatFloat('0.###', fValue);
                            x := x - (TextWidth(Str) div 2);
                            y := Rect.Top + GridHGap * 2;
                            Canvas.TextOut(x, y, Str);
                        end else begin
                            Canvas.MoveTo(x, Rect.Top );
                            Canvas.LineTo(x, Rect.Top + GridHGap);
                        end;
                    end;
                    fValue := fValue + fSmallStep;
                    Inc(nCount);
                end;

                // Draw AxisName
                if (AxisName <> '') then begin
                    x := (Rect.Left + Rect.Right - TextWidth(AxisName)) div 2;
                    y := Rect.Top + (GridHGap * 4);

                    Font.Style := [fsBold];
                    TextOut(x, y, AxisName);
                    Font.Style := [];
                end;
            end;
            //------------------------------------------------------------------
            ad_Right : begin
                // Draw Vertical Line.
                MoveTo( Rect.Left+1, Rect.Top);
                LineTo( Rect.Left+1, Rect.Bottom);

                if not bInvert then begin
                    nStartPos := Rect.Bottom;
                    nEndPos   := Rect.Top;
                end else begin
                    nStartPos := Rect.Top;
                    nEndPos   := Rect.Bottom;
                end;

                nCount := 0;
                if (fStartStep > AxisMin) then fValue := (fStartStep - fLargeStep)
                                           else fValue := fStartStep;

                while (fValue <= AxisMax) do
                begin
                    if (fValue >= AxisMin) then
                    begin
                        y := Round(RescaleData(AxisMin , AxisMax, nStartPos, nEndPos, fValue));
                        if (nCount mod SMALL_GRID_COUNT = 0) then
                        begin
                            MoveTo( Rect.Left + Round(GridWGap * 2.5), y);
                            LineTo( Rect.Left, y);

                            // Draw Number.
                            Str := FormatFloat(sValueFormat, fValue);
                            x := Rect.Left + TextWidth(' ') + GridWGap;
                            if (not bInvert) then y := y - Round(TextHeight(Str)* 1.2)
                                             else y := y + Round(TextHeight(Str)* 0.2);


                            if (y > Rect.Top) then
                            TextOut(x, y, Str);
                        end else begin // Draw Small Grid..
                            MoveTo( Rect.Left + GridWGap, y);
                            LineTo( Rect.Left, y);
                        end;
                    end;
                    fValue := fValue + fSmallStep;
                    Inc(nCount);
                end;

                // Draw AxisName
                if (AxisName <> '') then
                begin
                    Str := AxisName;
                    x := Rect.Right - 2;//  - TextWidth(Str);
                    y := (Rect.Bottom + Rect.Top - TextWidth(Str)) div 2;

                    Font.Style := [fsBold];
                    SetCanvasTextAngle(Canvas, 270);
                    TextOut(x, y, Str);
                    Font.Style := [];
                end;
            end;
            //------------------------------------------------------------------
            ad_Top : begin
                // 기능구현이 안되어 있음..
                MoveTo( Rect.Left,  Rect.Bottom-1);
                LineTo( Rect.Right, Rect.Bottom-1);
            end;
        end;
    end;
end;


//==============================================================================
constructor TChData.Create();
begin
    inherited;

    ChName  := 'CHANNEL';
    Visible := True;
end;

destructor TChData.Destroy();
begin
    inherited;
end;

procedure TChData.AddXY(fX, fY : Double);
var Value : TFloatPoint;
begin
    try
        Value.X := fX;
        Value.Y := fY;
        Self.Add(Value);
    except
    end;
end;

procedure TChData.DrawLegned(Canvas : TCanvas; Rect : TRect);
var Str : String;
begin
    LegnedRect := Rect;

    with Canvas do begin
        Font.Size := 8;
        if Visible then begin
            Font.Color := Color;
            Pen.Color := Color;
            Pen.Width := 1;
            Pen.Style := psSolid;
            Str :=  Format(' ■ %s', [ChName]);
        end else begin
            Font.Color := clSilver;
            Pen.Color := clSilver;
            Pen.Width := 1;
            Pen.Style := psDot;
            Str :=  Format(' □ %s', [ChName]);
        end;

        Brush.Color := clWhite;
        Brush.Style := bsSolid;
        Rectangle(Rect);

        Rect.Left   := Rect.Left   + 1;
        Rect.Top    := Rect.Top    + 1;
        Rect.Bottom := Rect.Bottom - 1;
        Rect.Right  := Rect.Right  - 1;

        DrawText(Handle, PChar(Str), Length(Str), Rect, DT_LEFT or
                DT_SINGLELINE or DT_VCENTER);
    end;
end;

procedure TChData.DrawValue(Canvas : TCanvas; Rect : TRect; ValStr : String);
begin
 {   with Canvas do begin

        Rect.Top    := Rect.Top + 1;
        Rect.Bottom := Rect.Bottom - 1;
        Rect.Right  := Rect.Right - 1;
        Rect.Left   := Rect.Right - Canvas.TextWidth(ValStr);

        Brush.Color := clWhite;
        Brush.Style := bsSolid;
        FillRect(Rect);

        Font.Style := [];
        if Visible then Font.Color := Color
                   else Font.Color := clSilver;

        Font.Size  := 9;
        DrawText(Handle, PChar(ValStr), Length(ValStr), Rect, DT_RIGHT or
                DT_SINGLELINE or DT_VCENTER);
    end; }
end;


// Rect영역에 채널데이터를 표시한다.
procedure TChData.DrawChannel(Canvas : TCanvas; Rect : TRect);

    // 그래프의 X/Y 좌표값을 얻어온다.
    function GetPoint(fXValue, fYValue : Double) : TPoint;
    var nStartPos, nEndPos : Integer;
    begin
        // X 죄표를 얻는다.
        if (not RefAxisX.bInvert) then begin
            nStartPos := Rect.Left;
            nEndPos   := Rect.Right;
        end else begin
            nStartPos := Rect.Right;
            nEndPos   := Rect.Left;
        end;
        Result.X := Round(RescaleData(RefAxisX.AxisMin, RefAxisX.AxisMax, nStartPos, nEndPos, fXValue));

        if Result.X < Rect.Left  then Result.X := Rect.Left else
        if Result.X > Rect.Right then Result.X := Rect.Right;

        // Y 죄표를 얻는다.
        if (not RefAxisY.bInvert) then begin
            nStartPos := Rect.Bottom;
            nEndPos   := Rect.Top;
        end else begin
            nStartPos := Rect.Top;
            nEndPos   := Rect.Bottom;
        end;
        Result.Y := Round(RescaleData(RefAxisY.AxisMin, RefAxisY.AxisMax, nStartPos, nEndPos, fYValue));

        if Result.Y < Rect.Top    then Result.Y := Rect.Top else
        if Result.Y > Rect.Bottom then Result.Y := Rect.Bottom;
    end;


var Idx, nStep : Integer;
    Pt : TPoint;
begin
    // 참조축이 없거나 데이터가 없을경우에는 exit;
    if (RefAxisX = nil) or (RefAxisY = nil) or (Count < 1) then exit;
    
    try
        with Canvas do
        begin
            Pen.Color := Color;
            Pen.Width := 1;
            Pen.Style := psSolid;
            Brush.Color := Color;

            Pt := GetPoint(Data[0].x, Data[0].y);
            MoveTo(Pt.x, Pt.y);

            // 그래프 데이터가 많을경우에 속도를 위해서...
            nStep := (Count div 5000) + 1;
            //nStep := 1;

            Idx := 1;
            while (Idx < Count) do
            begin
                Pt := GetPoint(Data[Idx].x, Data[Idx].y);
                LineTo(Pt.x, Pt.y);
                Idx := Idx + nStep;
                // Canvas.Ellipse(Pt.x-4, Pt.y-4, Pt.x+4, Pt.y+4 );
            end;
        end;
    finally
    end;
end;


function TChData.MeasValue(sItemName : String): double;
var i, Idx1, Idx2, nPulseCount : Integer;
    fValue, fOldValue, fTemp : Double;
    fMax, fMin, fSum, fAve, fHigh, fLow, fDuty, fFreq, fMid, fLowWidth, fHighWidth : Double;
    fTime, fStartTime, fEndTime : Double;
    DataList, DutyList, FreqList, LoWidthList, HiWidthList : TFloatList;
    bHighFirst : Boolean;
const
    INVALID_VALUE = -9999;
begin
    Result := INVALID_VALUE;
    if (Count < 1) then exit; 

    // 2) 값을 측정한다.
    fMax  := -1E9;
    fMin  :=  1E9;
    fAve  :=  INVALID_VALUE;
    fHigh :=  INVALID_VALUE;
    fLow  :=  INVALID_VALUE;
    fDuty :=  INVALID_VALUE;
    fFreq :=  INVALID_VALUE;
    fSum  :=  0;

    DataList    := TFloatList.Create;
    DutyList    := TFloatList.Create;
    FreqList    := TFloatList.Create;
    LoWidthList := TFloatList.Create;
    HiWidthList := TFloatList.Create;
    try
        //---------------------------------------
        // MIN, MAX, AVE값 측정.
        for i:=0 to Count-1 do begin
            fValue := Data[i].y;
            if (fValue > fMax) then fMax := fValue;
            if (fValue < fMin) then fMin := fValue;
            fSum := fSum + fValue;
            DataList.Add(fValue);
        end;
        fAve := fSum / Count;

        //---------------------------------------
        // HIGH, LOW값 측정.
        if (Count > 50) then begin
            Idx1 := Round(Count * 0.9);
            Idx2 := Round(Count * 0.1);

            DataList.Sort;
            fHigh := DataList.Data[Idx1];   // 상위 10%위치의 값.
            fLow  := DataList.Data[Idx2];   // 하위 10%위치의 값.
            // fMid  := (fHigh + fLow) / 2;
        end;

        fMid  := (fMax + fMin) / 2;

        //---------------------------------------
        // DUTY, FREQ 측정..
        fStartTime  := -1;
        fEndTime    := -1;
        nPulseCount := 0;

        fOldValue := Data[0].y;
        for i:=1 to Count-1 do
        begin
            fTime  := Data[i].x;
            fValue := Data[i].y;
            //WriteDebugStr(FloatToStr(fTime)+','+FloatToStr(fValue));
            // 중간지점.
            if ((fOldValue <= fMid) and (  fValue > fMid )) or
               ((fOldValue >= fMid) and (  fValue < fMid )) then
            begin
                //------------------------------------
                if (fStartTime < 0) then begin// 시작지점..
                    fStartTime := Data[i].x;

                    // 처음시작시 High 우선인지 확인.
                    if (nPulseCount = 0) then
                        bHighFirst := (fValue > fMid);
                end else
                //------------------------------------
                if (fEndTime < 0) then begin
                    fEndTime := Data[i].x;
                end else
                //------------------------------------
                begin
                    //
                    //    +---------+         +--
                    //    |         |         |
                    //  --+         +---------+
                    //    fStart    fEnd     fTime
                    //

                    // 1) 주파수를 측정한다.
                    fFreq := 1 / (fTime - fStartTime);  // Hz단위로 표시..
                    FreqList.Add(fFreq);


                    // 2) Low / High Width를 측정한다.
                    if bHighFirst then begin
                        fHighWidth := (fEndTime - fStartTime);
                        fLowWidth  := (fTime - fEndTime);
                    end else begin
                        fLowWidth  := (fEndTime - fStartTime);
                        fHighWidth := (fTime - fEndTime);
                    end;
                    LoWidthList.Add(fLowWidth);
                    HiWidthList.Add(fHighWidth);

                    fDuty := fHighWidth / (fLowWidth + fHighWidth ) * 100;
                    DutyList.Add(fDuty);
                    fStartTime := fTime;
                    fEndTime   := -1;
                    Inc(nPulseCount);
                end;
            end;
            fOldValue := fValue;
        end;

        // 한주기 이상되었을 경우 측정한 값들의 평균값 계산.
        if (nPulseCount > 0) then
        begin
            {FOR i := 0 to DutyList.Count-1 do
            begin
                WriteDebugStr(FloatToStr( DutyList.Data[I]));
            end;
            }
            if (DutyList.Count > 2) then begin
                fDuty := (DutyList.Sum - DutyList.Max -  DutyList.Min) / (DutyList.Count - 2);
            end else begin
                fDuty := DutyList.Ave;
            end;
            fFreq      := FreqList.Ave;
            fLowWidth  := LoWidthList.Ave;
            fHighWidth := HiWidthList.Ave;
        end;

{
ELSE BEGIN
                        // 3) Duty를 측정한다.

                    END;

}


        // 3) 결과값 RETRUN.
        if (sItemName = 'MAX')     then fValue := fMax  else
        if (sItemName = 'MIN')     then fValue := fMin  else
        if (sItemName = 'HIGH')    then fValue := fHigh else
        if (sItemName = 'LOW')     then fValue := fLow  else
        if (sItemName = 'AVE')     then fValue := fAve  else
        if (sItemName = 'FILTER_AVE')     then
        begin
            if (fAve < 0) then
                fAve := 0;
            fValue := fAve;
        end else
        if (sItemName = 'FREQ')    then fValue := fFreq else
        if (sItemName = 'DUTY')    then
        begin
            fValue := fDuty;
        end else
        if (sItemName = 'CHECKDUTY')    then
        BEGIN
            fTemp := ((Trunc(fHigh * 1000) - Trunc(fLow*1000))/1000);
            if (fTemp < 0) or
               (fHigh < fLow) or
               (fTemp < 0.5) THEN
            BEGIN
                IF (fAve > 4) THEN
                begin
                    fDuty := 100;
                end else if (fAve < 1) then begin
                    fDuty := 0;
                end else begin
                    fValue := fDuty;
                end;
            END;
            fValue := fDuty;
        END else
        if (sItemName = 'LOWIDTH') then
            fValue := fLowWidth
        else
        if (sItemName = 'HIWIDTH') then
            fValue := fHighWidth
        else exit;

        Result := fValue;
    finally
        DataList.Free;
        DutyList.Free;
        FreqList.Free;
        LoWidthList.Free;
        HiWidthList.Free;
    end;
end;

//==============================================================================
// GRAPH MODULE

constructor TGraph.Create();
begin
    inherited;

    ChList   := TList.Create;
    AxisList := TList.Create;

    Title := '';

    LeftMargin   := 2;
    RightMargin  := 2;
    TopMargin    := 2;
    BottomMargin := 4;

    BackColor    := clSilver;
    FrontColor   := clBlack;
    LineColor    := clGray;
    GridColor    := clGray;
    AxisColor    := clBlack;

{
    BackColor    := clWhite;
    FrontColor   := clWhite;
    LineColor    := clBlack;
    GridColor    := clSilver;
}
    bViewTitle   := True;
    bViewLegend  := True;


    // 기본적인 X, Y축을 생성한다.
    BottomAxis := AddAxis;
    BottomAxis.AxisColor := clBlack;

    LeftAxis := AddAxis;
    LeftAxis.AxisColor := clBlack;
end;

destructor TGraph.Destroy();
begin
    // 채널을 삭제하고 메모리를 해제한다.
    DeleteAllChannel;
    ChList.Free;

    // 축을 삭제하고 메모리를 해제한다.
    ClearAxis;
    AxisList.Free;

    inherited;
end;

// AXIS ------------------------------------------------------------------------
function TGraph.AddAxis() : TAxis;
var NewAxis : TAxis;
begin
    Result := nil;

    NewAxis := TAxis.Create;
    try
        AxisList.Add(NewAxis);
        NewAxis.AxisColor :=  AxisColor;
        Result := NewAxis;
    except
    end;
end;

function TGraph.GetAxis( Index : Integer ) : TAxis;
begin
    if (Index >= 0) and ( Index < AxisList.Count) then begin
        Result := AxisList[Index];
    end else
        Result := nil;
end;

function TGraph.GetAxisIdx(Axis : TAxis) : Integer;
var i : Integer;
begin
    Result := -1;
    if Axis = nil then exit;
    for i:= 0 to AxisList.Count-1 do begin
        if (Axis = AxisList[i]) then begin
            Result := i;
            break;
        end;
    end;
end;

function TGraph.GetAxisCount() : Integer;
begin
    Result := AxisList.Count;
end;

procedure TGraph.DeleteAxis(Index : Integer );
var i : Integer;
    Axis : TAxis;
    ChData : TChData;
begin
    Axis := GetAxis(Index);
    if (Axis <> nil) then
    begin
        // 해당축을 가지고있는 채널을 찾아 nil 처리한다.
        for i:= 0 to ChList.Count-1 do begin
            ChData := TChData(ChList[i]);
            if (ChData.RefAxisX = Axis) then ChData.RefAxisX := nil;
            if (ChData.RefAxisY = Axis) then ChData.RefAxisY := nil;
        end;
        if (Self.LeftAxis   = Axis) then Self.LeftAxis   := nil;
        if (Self.BottomAxis = Axis) then Self.BottomAxis := nil;

        // 축을 제거한다.
        Axis.Free;
        AxisList.Delete(Index);
    end;
end;

procedure TGraph.ClearAxis();
var i : Integer;
    ChData : TChData;
begin
    // Axis Pointer를 모두 해제한다.
    for i:= 0 to ChList.Count-1 do begin
        ChData := TChData(ChList[i]);
        ChData.RefAxisX := nil;
        ChData.RefAxisY := nil;
    end;
    Self.propLeftAxis   := nil;
    Self.propBottomAxis := nil;

    // 2011.01.12 해제를 역순으로 한다..
    for i:= AxisList.Count-1 downto 0 do
        TAxis(AxisList[i]).Free;
    AxisList.Clear;
end;

function TGraph.FindAxis(AxisName : String) : TAxis;
var i : Integer;
    Axis : TAxis;
begin
    Result := nil;
    for i:= 0 to GetAxisCount()-1 do
    begin
        Axis := GetAxis(i);
        if ( Axis <> nil ) and (Axis.AxisName = AxisName) then
        begin
            Result := Axis;
            break;
        end;
    end
end;

// 그래프의 기본 BOTTOM 축을 변경한다.
procedure TGraph.SetBottomAxis(Axis : TAxis);
var i : Integer;
begin
    propBottomAxis := Axis;

    // 채널리스트의 RefAxis X를 일괄적으로 변경한다.
    for i:= 0 to ChList.Count-1 do begin
        TChData(ChList[i]).RefAxisX := propBottomAxis;
    end;
end;

// 그래프의 기본 LEFT 축을 변경한다.
procedure TGraph.SetLeftAxis(Axis : TAxis);
begin
    propLeftAxis := Axis;
end;

// 그래프의 기본 RIGHT 축을 변경한다.
procedure TGraph.SetRightAxis(Axis : TAxis);
begin
    propRightAxis := Axis;
end;

// CHANNEL.---------------------------------------------------------------------
function  TGraph.AddChannel() : TChData;
var NewChannel : TChData;
begin
    Result := nil;

    NewChannel := TChData.Create;
    try

        ChList.Add(NewChannel);
        Result := NewChannel;

        // 디폴트값으로 그래프의 X, Y축을 자동으로 할당한다.
        Result.RefAxisX := Self.BottomAxis;
        Result.RefAxisY := Self.LeftAxis;
        Result.Color    := RGB(Random(255), Random(255), Random(255)); // NewAxis.AxisColor;
    except
    end;
end;

function  TGraph.GetChannel(Index : Integer) : TChData;
begin
    if (Index >= 0) and ( Index < ChList.Count) then begin
        Result := ChList[Index];
    end else
        Result := nil;
end;


function  TGraph.GetChannelCount() : Integer;
begin
    Result := ChList.Count;
end;

procedure TGraph.DeleteChannel(ChIdx : Integer);
var ChData : TChData;
begin
    if (ChIdx >= 0) and ( ChIdx < AxisList.Count) then begin
        ChData := TChData(ChList[ChIdx]);
        ChData.Clear;
        ChList.Delete(ChIdx);
    end;
end;

procedure TGraph.DeleteAllChannel();
var i : Integer;
    ChData : TChData;
begin
    //각 채널데이터를 해제한다.
    for i:= ChList.Count-1 downto 0 do begin
        ChData := TChData(ChList[i]);
        ChData.Clear;
        TChData(ChList[i]).Free;
    end;
    ChList.Clear;
end;

function TGraph.FindChannel(ChannelName : String) : TChData;
var i : Integer;
    ChData : TChData;
begin
    Result := nil;
    for i:= 0 to GetChannelCount()-1 do
    begin
        ChData := GetChannel(i);
        if ( ChData <> nil ) and (ChData.ChName = ChannelName) then
        begin
            Result := ChData;
            break;
        end;
    end
end;



procedure TGraph.DrawGraph(Canvas : TCanvas; Rect : TRect);
var
    i, x, y, dx, dy, maxdx, nCount, nStartPos, nEndPos : Integer;
    Axis : TAxis;
    DRect : TRect;
    fValue : Double;
begin
    with Canvas do begin

        // Fill BackGround.
        Brush.Color := BackColor;
        FillRect(Rect);

        dy := TextHeight('0');
        dx := TextWidth('0');

        // 그래프 영역을 계산한다.
        propGraphRect.Left   := Rect.Left   + (dx * LeftMargin);
        propGraphRect.Right  := Rect.Right  - (dx * RightMargin);
        propGraphRect.Top    := Rect.Top    + (dy * TopMargin);
        propGraphRect.Bottom := Rect.Bottom - (dy * BottomMargin);


        //----------------------------------------------------
        // DRAW TITLE...
        if (bViewTitle) and ( Title <> '') then begin
            propGraphRect.Top  := Rect.Top    + Round(dy * 2.5);

            Font.Size   := 10;
            Font.Color  := clBlack;
            Font.Style  := [fsBold];
            Brush.Style := bsClear;
            x := (Rect.Left + Rect.Right - TextWidth( Title ) ) div 2;// + GraphRect.Left;
            y := GraphRect.Top - Round(TextHeight(Title) * 1.5);
            TextOut(x, y, Title);
            Font.Style  := [];
        end else
            propGraphRect.Top  := Rect.Top    + (dy * 1);


        //----------------------------------------------------
        // DRAW LEGEND
        if (bViewLegend) and (not bViewSplit) then
        begin
            // 그릴 폭을 계산한다.
            maxdx := 0;// ;
            for i := 0 to ChList.Count-1 do begin
                if not Channel[i].Visible then continue;
                maxdx := MAX( maxdx, TextWidth(' ■ ' + Channel[i].ChName + '  '));
            end;

            if maxdx > 0 then
            begin
                if maxdx < (dx * LEGEND_WIDTH) then maxdx := (dx * LEGEND_WIDTH);

                propGraphRect.Right := propGraphRect.Right - maxdx;
                DRect.Left  := GraphRect.Right + dx;
                DRect.Right := DRect.Left + maxdx;

                nCount := 0;
                for i := 0 to ChList.Count-1 do begin
                    if not Channel[i].Visible then continue;

                    DRect.Top    := GraphRect.Top + (nCount* dy*2);
                    DRect.Bottom := DRect.Top + dy*2 - 1;

                    Channel[i].DrawLegned(Canvas, DRect);
                    Inc(nCount);
                end;
            end;
        end;

        //----------------------------------------------------
        // DRAW LEFT & RIGHT AXIS;
        if (not bViewSplit) then begin

            for i:= 0 to AxisList.Count-1 do
            begin
                Axis := GetAxis(i);
                if (Axis = nil) or (Axis = BottomAxis) or (Axis = LeftAxis) or (Axis = RightAxis) then continue;

                if (Axis.Visible) then
                begin
                    DRect := propGraphRect;
                    DRect.Right        := DRect.Left     + (dx * AXIS_WIDTH );
                    propGraphRect.Left := DRect.Right;

                    Axis.DrawAxis(Canvas, DRect, ad_Left);
                end;
            end;

            // DRAW Left Axis;
            if (LeftAxis <> nil) then
            begin
                if (LeftAxis.Visible) then
                begin
                    DRect := propGraphRect;
                    DRect.Right        := DRect.Left     + (dx * AXIS_WIDTH);
                    propGraphRect.Left := DRect.Right;

                    LeftAxis.DrawAxis(Canvas, DRect, ad_Left);
                end else                 
                   LeftAxis.GetGridStep; // 축을 그리지 않을경우 Grid를 위해 Step만 계산한다.
            end;

            // DRAW Right Axis;
            if (RightAxis <> nil) and (RightAxis.Visible) then
            begin
                DRect := propGraphRect;
                DRect.Left          := DRect.Right - (dx * AXIS_WIDTH);
                propGraphRect.Right := DRect.Left;

                RightAxis.DrawAxis(Canvas, DRect, ad_Right);
            end;
        end else begin
            // Split인경우 축을 그릴 공간만 확보.
            DRect := GraphRect;
            DRect.Right        := DRect.Left     + (dx * AXIS_WIDTH);
            propGraphRect.Left := DRect.Right;
        end;

        // DRAW BOTTOM AXIS;
        if (BottomAxis <> nil) then
        begin
            if (BottomAxis.Visible) then begin
                DRect.Left   := propGraphRect.Left;
                DRect.Top    := propGraphRect.Bottom;
                DRect.Right  := propGraphRect.Right;
                DRect.Bottom := Rect.Bottom;
                BottomAxis.DrawAxis(Canvas, DRect, ad_Bottom);
            end else
               BottomAxis.GetGridStep;   // 축을 그리지 않을경우 Grid를 위해 Step만 계산한다.
        end;

        // 채널데이터를 그린다.
        DrawChannelValue(Canvas, GraphRect);
    end;
end;


// 채널데이터를 그린다.
procedure TGraph.DrawChannelValue(Canvas : TCanvas; Rect : TRect; bDrawBackGround : Boolean = True);
var i,dx, dy, x, y : Integer;
    DRect : TRect;
    nStartPos, nEndPos : Integer;
    fValue : Double;
begin
    with Canvas do begin
        dy := TextHeight('0');
        dx := TextWidth('0');

        // DRAW GRAPH AREA..
        if bDrawBackGround then
        begin
            Canvas.Pen.Width   := 1;
            Canvas.Pen.Style   := psDot;
            Canvas.Pen.Color   := GridColor;
            Canvas.Brush.Color := FrontColor;
            Rectangle(Rect.Left, Rect.Top, Rect.Right+1, Rect.Bottom+1);

            // Draw X Grid.
            if ( BottomAxis <> nil) then
            begin
                if not BottomAxis.bInvert then begin
                    nStartPos := Rect.Left;
                    nEndPos   := Rect.Right;
                end else begin
                    nStartPos := Rect.Right;
                    nEndPos   := Rect.Left;
                end;

                fValue := BottomAxis.fStartStep;
                while (fValue < BottomAxis.AxisMax) do begin
                    x := Round( RescaleData(BottomAxis.AxisMin, BottomAxis.AxisMax, nStartPos, nEndPos, fValue));
                    MoveTo(x, Rect.Top);
                    LineTo(x, Rect.Bottom);
                    fValue := fvalue + BottomAxis.fLargeStep;
                end;
            end;

            // Draw Y Grid.
            if (not bViewSplit) and (LeftAxis <> nil) then
            begin
                if not LeftAxis.bInvert then begin
                    nStartPos := Rect.Bottom;
                    nEndPos   := Rect.Top;
                end else begin
                    nStartPos := Rect.Top;
                    nEndPos   := Rect.Bottom;
                end;

                fValue := LeftAxis.fStartStep;
                while (fValue < LeftAxis.AxisMax) do begin
                    y := Round( RescaleData(LeftAxis.AxisMin, LeftAxis.AxisMax, nStartPos, nEndPos, fValue));
                    MoveTo(Rect.Left,  y);
                    LineTo(Rect.Right, y);
                    fValue := fValue + LeftAxis.fLargeStep;
                end;
            end;
        end;

        // DRAW CHANNEL
        if (bViewSplit) then begin

            for i := 0 to ChList.Count-1 do
            begin
                if (Channel[i].RefAxisY = nil) then continue;

                // DRAW AXIS
                DRect.Left   := Rect.Left - (dx * AXIS_WIDTH);
                DRect.Right  := Rect.Left - 2;
                DRect.Top    := Rect.Top + (i+0) * (Rect.Bottom - Rect.Top) div ChList.Count;
                DRect.Bottom := Rect.Top + (i+1) * (Rect.Bottom - Rect.Top) div ChList.Count - 3;
                Channel[i].RefAxisY.DrawAxis(Canvas, DRect, ad_Left, True);

                // DRAW CHANNAL
                DRect.Left   := Rect.Left;
                DRect.Right  := Rect.Right;
                Channel[i].DrawChannel(Canvas, DRect);

                // DRAW SPLIT LINE.
                if (i < ChList.Count-1) then begin
                    Canvas.Pen.Color   := LineColor;
                    Canvas.Pen.Width   := 2;
                    Canvas.Pen.Style   := psSolid;
                    Canvas.Brush.Style := bsClear;
                    MoveTo(Rect.Left+1,  DRect.Bottom + 1);
                    LineTo(Rect.Right,   DRect.Bottom + 1);
                end;


                // DRAW LEGEND
                if (bViewLegend) then begin
                    DRect.Left   := Rect.Right - TextWidth(Channel[i].ChName) - (dx * 5);
                    DRect.Right  := Rect.Right - (dx    );
                    DRect.Top    := DRect.Top + Round(dy * 0.3);
                    DRect.Bottom := DRect.Top + dy*2 - 1;
                    Channel[i].DrawLegned(Canvas, DRect);
                end;
            end;
        end else
        begin
            for i := 0 to ChList.Count-1 do begin
                if Channel[i].Visible then
                    Channel[i].DrawChannel(Canvas, Rect);
            end;
        end;

        // DRAW GRAPH AREA..
        if bDrawBackGround then
        begin
            Canvas.Pen.Color   := LineColor;
            Canvas.Pen.Width   := 2;
            Canvas.Pen.Style   := psSolid;
            Canvas.Brush.Style := bsClear;
            Rectangle(Rect.Left+1, Rect.Top+1, Rect.Right+1, Rect.Bottom+1);
        end;
    end;
end;

// 그래프 데이터를 파일로 저장한다.

procedure TGraph.SaveToJPG(FileName : String);
var Bitmap : Graphics.TBitmap;
    JPEG : TJPEGImage;
begin
    Bitmap := Graphics.TBitmap.Create;
    JPEG := TJPEGImage.Create;
    try
        Bitmap.Width  := 800;
        Bitmap.Height := 600;
        DrawGraph(Bitmap.Canvas, RECT(0,0,800,600));

        JPEG.Assign(Bitmap);
        JPEG.SaveToFile(FileName);
    finally
        JPEG.Free;
        Bitmap.Free;
    end;
end;

procedure TGraph.LoadFromRawData(FileName : String);
begin
    //
end;

procedure TGraph.SaveToRawData(FileName : String);
var i, j : Integer;
    WtStr : String;
    f: TextFile;
    ChData : TChData;
begin
    {// 채널정보가 없으면 저장안함.
    if Graph.ChannelCount < 1 then exit;

    if FileExists (FileName) then DeleteFile(pChar(FileName));

    AssignFile (f, FileName);
    try
        ReWrite(f);
        WriteLn (f, '[INFO]');
        WriteLn (f, Format('TITLE=%s',   [Graph.Title]));
        WriteLn (f, Format('DATE=%s',    [DateTimeToStr(Now())]));
        WriteLn (f, Format('COUNT=%d',   [Graph.ChannelCount]));

        for j:= 0 to Graph.ChannelCount-1 do begin
            ChData := TChData(Graph.Channel[j]);
            WtStr := Format('CH%.2d=%s#%f~%f,%f,%f~%f,%f',
                              [j+1,
                              ChData.ChName,
                              ChData.RefAxisX.fAxisMin,
                              ChData.RefAxisX.fAxisMax,
                              ChData.RefAxisX.AxisStep,
                              ChData.RefAxisY.fAxisMin,
                              ChData.RefAxisY.fAxisMax,
                              ChData.RefAxisY.AxisStep]);
            WriteLn (f, WtStr);
        end;

        WriteLn (f, '[DATA]');
        for i:= 0 to Graph.Channel[0].Count-1 do
        begin
            WtStr := IntToStr(i) + ',' + FormatFloat('0.00', ChData.Data[i].x) + ',';
            for j:= 0 to Graph.ChannelCount-1 do begin
                ChData := TChData(Graph.Channel[j]);
                WtStr := WtStr + FormatFloat('0.00', ChData.Data[i].y) + ',';
            end;
            WriteLn (f, WtStr);
        end;
        Flush (f);

    finally
        CloseFile (f);
    end;   }
end;

procedure TGraph.SaveToFile(FileName : String);
var i : Integer;
    INI : TIniFile;
    Section, WtStr : String;
    Axis : TAxis;
    ChData : TChData;
begin
    INI := TIniFile.Create(FileName);
    try
        // 그래프 정보 저장.
        Section := 'GRAPH';
        INI.WriteString(Section,  'Title',        Title);
        INI.WriteString(Section,  'Color',        Format('%.8x,%.8x,%.8x,%.8x', [BackColor, FrontColor, LineColor, GridColor]));
        INI.WriteString(Section,  'Margin',       Format('%d,%d,%d,%d', [LeftMargin, RightMargin, TopMargin, BottomMargin]));
        INI.WriteInteger(Section, 'AxisCount',    GetAxisCount);
        INI.WriteInteger(Section, 'ChannelCount', GetChannelCount);
        INI.WriteInteger(Section, 'BottomAxis',   GetAxisIdx(BottomAxis));
        INI.WriteInteger(Section, 'LeftAxis',     GetAxisIdx(LeftAxis));

        // AXIS 정보 저장.
        Section := 'AXIS';
        for i:= 0 to AxisList.Count-1 do begin
            Axis := TAxis(AxisList[i]);
            WtStr := Format('%f,%f,%f,%d,%.8x,%s', [Axis.AxisMin, Axis.AxisMax, Axis.AxisStep, Ord(Axis.Visible), Axis.AxisColor, Axis.AxisName]);
            INI.WriteString(Section, Format('Axis%d',[i+1]), WtStr);
        end;

        // 채널정보 저장.
        Section := 'CHANNEL';
        for i:= 0 to ChList.Count-1 do
        begin
            ChData := TChData(ChList[i]);
            WtStr := Format('%d,%d,%d,%.8x,%s',
                [GetAxisIdx(ChData.RefAxisX), GetAxisIdx(ChData.RefAxisY), Ord(ChData.Visible), ChData.Color, ChData.ChName]);
            INI.WriteString(Section, Format('CH%d',[i+1]), WtStr);
        end;
    finally
        INI.Free;
    end;
end;

// 그래프 데이터를 로딩한다.
procedure TGraph.LoadFromFile(FileName : String);
var i, nCount : Integer;
    INI : TIniFile;
    Section, RdStr : String;
    Axis : TAxis;
    ChData : TChData;
begin
    ClearAxis;
    DeleteAllChannel;
    
    INI := TIniFile.Create(FileName);
    try
        // 그래프 정보 저장.
        Section := 'GRAPH';
        Title := INI.ReadString(Section,  'Title',        Title);

        // Color
        RdStr := INI.ReadString(Section,  'Color', '');
        BackColor  := StrToIntDef( GetToken(RdStr, ','), clWhite );
        FrontColor := StrToIntDef( GetToken(RdStr, ','), clWhite );
        LineColor  := StrToIntDef( GetToken(RdStr, ','), clBlack );
        GridColor  := StrToIntDef( GetToken(RdStr, ','), clSilver);

        // Margin
        RdStr := INI.ReadString(Section,  'Margin', '');
        LeftMargin   := StrToIntDef( GetToken(RdStr, ','), 2 );
        RightMargin  := StrToIntDef( GetToken(RdStr, ','), 2 );
        TopMargin    := StrToIntDef( GetToken(RdStr, ','), 3 );
        BottomMargin := StrToIntDef( GetToken(RdStr, ','), 3 );

        // AXIS 정보를 읽는다.
        nCount := INI.ReadInteger('GRAPH', 'AxisCount',  0);
        for i:= 0 to nCount-1 do begin
            RdStr := INI.ReadString('AXIS', Format('Axis%d',[i+1]), '');
            Axis           := AddAxis;
            Axis.AxisMin   := StrToFloatDef(GetToken(RdStr, ','), 0);
            Axis.AxisMax   := StrToFloatDef(GetToken(RdStr, ','), 100);
            Axis.AxisStep  := StrToFloatDef(GetToken(RdStr, ','), 0);
            Axis.Visible   := GetToken(RdStr, ',') <> '0';
            Axis.AxisColor := HexToIntDef(GetToken(RdStr, ','), clBlack);
            Axis.AxisName  := RdStr;
        end;
        BottomAxis := GetAxis( INI.ReadInteger(Section, 'BottomAxis', -1));
        LeftAxis   := GetAxis( INI.ReadInteger(Section, 'LeftAxis'  , -1));

        // CHANNEL 정보를 읽는다.
        nCount := INI.ReadInteger('GRAPH', 'ChannelCount',  0);
        for i:= 0 to nCount-1 do begin
            RdStr := INI.ReadString('CHANNEL', Format('CH%d',[i+1]), '');
            ChData := AddChannel;
            ChData.RefAxisX := GetAxis( StrToIntDef( GetToken(RdStr, ','), -1));
            ChData.RefAxisY := GetAxis( StrToIntDef( GetToken(RdStr, ','), -1));
            ChData.Visible  := GetToken(RdStr, ',') <> '0';
            ChData.Color    := HexToIntDef(GetToken(RdStr, ','), clBlack);
            ChData.ChName   := RdStr;
        end;
    finally
        INI.Free;
    end;
end;

procedure TGraph.ZoomRect(X1, Y1, X2, Y2: Integer);
var i : Integer;
    fMin, fMax : Double;
    Axis : TAxis;
begin
    if (X2 > X1) and (Y2 > Y1) then
    begin
        for i:= 0 to AxisList.Count-1 do
        begin
            Axis := GetAxis(i);
            if (Axis = BottomAxis) then begin
                fMin := RescaleData(GraphRect.Left, GraphRect.Right, Axis.AxisMin, Axis.AxisMax, X1);
                fMax := RescaleData(GraphRect.Left, GraphRect.Right, Axis.AxisMin, Axis.AxisMax, X2);

                Axis.AxisMin := fMin;
                Axis.AxisMax := fMax;
            end else begin
                fMin := RescaleData(GraphRect.Top, GraphRect.Bottom, Axis.AxisMax, Axis.AxisMin, Y2);
                fMax := RescaleData(GraphRect.Top, GraphRect.Bottom, Axis.AxisMax, Axis.AxisMin, Y1);

                Axis.AxisMin := fMin;
                Axis.AxisMax := fMax;
            end;
        end;
    end else begin
        ZoomOut;
    end;
end;

procedure TGraph.ZoomHorizental(X1, X2: Integer);
var i : Integer;
    fMin, fMax : Double;
    Axis : TAxis;
begin
    if (X2 > X1)then
    begin
        if (BottomAxis <> nil) then begin
            fMin := RescaleData(GraphRect.Left, GraphRect.Right, BottomAxis.AxisMin, BottomAxis.AxisMax, X1);
            fMax := RescaleData(GraphRect.Left, GraphRect.Right, BottomAxis.AxisMin, BottomAxis.AxisMax, X2);

            BottomAxis.AxisMin := fMin;
            BottomAxis.AxisMax := fMax;
        end;
    end else begin
        ZoomOut;
    end;
end;


procedure TGraph.ZoomOut;
var i : Integer;
    Axis : TAxis;
begin
    // 전체축의 Zoom..
    for i:= 0 to AxisList.Count-1 do begin
        Axis := GetAxis(i);
        Axis.fZoomMin := Axis.fAxisMin;
        Axis.fZoomMax := Axis.fAxisMax;
    end;
end;

procedure TGraph.MoveXY(X1, Y1, X2, Y2: Integer);
var i : Integer;
    fMin, fMax : Double;
    Axis : TAxis;
begin
    for i:= 0 to AxisList.Count-1 do
    begin
        Axis := GetAxis(i);
        if (Axis = BottomAxis) then begin
            fMin := RescaleData(GraphRect.Left, GraphRect.Right, Axis.AxisMin, Axis.AxisMax, X1);
            fMax := RescaleData(GraphRect.Left, GraphRect.Right, Axis.AxisMin, Axis.AxisMax, X2);

            Axis.AxisMin := Axis.AxisMin + (fMin - fMax);
            Axis.AxisMax := Axis.AxisMax + (fMin - fMax);
        end else begin
            fMin := RescaleData(GraphRect.Top, GraphRect.Bottom, Axis.AxisMax, Axis.AxisMin, Y1);
            fMax := RescaleData(GraphRect.Top, GraphRect.Bottom, Axis.AxisMax, Axis.AxisMin, Y2);

            Axis.AxisMin := Axis.AxisMin + (fMin - fMax);
            Axis.AxisMax := Axis.AxisMax + (fMin - fMax);
        end;
    end;
end;

procedure TGraph.MoveX(X1, X2 : Integer);
var i : Integer;
    fMin, fMax : Double;
    Axis : TAxis;
begin
    if (BottomAxis <> nil) then begin
        fMin := RescaleData(GraphRect.Left, GraphRect.Right, BottomAxis.AxisMin, BottomAxis.AxisMax, X1);
        fMax := RescaleData(GraphRect.Left, GraphRect.Right, BottomAxis.AxisMin, BottomAxis.AxisMax, X2);

        BottomAxis.AxisMin := BottomAxis.AxisMin + (fMin - fMax);
        BottomAxis.AxisMax := BottomAxis.AxisMax + (fMin - fMax);
    end;
end;


procedure TGraph.SaveToData(FileName: String);
begin
//
end;


end.


