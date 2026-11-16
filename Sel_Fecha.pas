unit Sel_Fecha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvgGroupBox, Buttons, JvExButtons, JvBitBtn, JvExStdCtrls,
  JvBehaviorLabel, JvExExtCtrls, JvExtComponent, JvPanel,  Vcl.ExtCtrls,
  Vcl.Mask, RzEdit, DateUtils;

type
  TIngresoFecha = class(TForm)
    JvgGroupBox2: TJvgGroupBox;
    Label2: TLabel;
    Agrega1: TJvBitBtn;
    Panel3: TPanel;
    JvPanel2: TJvPanel;
    JvBehaviorLabel2: TJvBehaviorLabel;
    Label1: TLabel;
    FechaImp: TRzDateTimeEdit;
    procedure Agrega1Click(Sender: TObject);
    procedure Panel3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FechaImpChange(Sender: TObject);
    procedure FechaImpKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    ConCod:boolean;
    FechaAct:string;{ Public declarations }
  end;

var
  IngresoFecha: TIngresoFecha;

implementation

uses Modulo, Unidad;

{$R *.dfm}

procedure TIngresoFecha.FechaImpChange(Sender: TObject);
var t:integer;
begin
t:=DaysBetween(StrToDate(FechaAct), StrToDate(FechaImp.Text));
if (t > 30) then
  messagedlg('La diferencia entre la fecha Actual y la ingresada no puede ser mayor a 30 días',mterror,[mbok],0)
else if (t < 0)  then
   messagedlg('La fecha ingresada no puede ser menor a la fecha Actual',mterror,[mbok],0)
else
Agrega1.Enabled:=true;
end;

procedure TIngresoFecha.FechaImpKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  if Agrega1.Enabled then Agrega1.SetFocus;
end;

procedure TIngresoFecha.FormActivate(Sender: TObject);
begin
FechaImp.Text:=FechaAct;
end;

procedure TIngresoFecha.FormCreate(Sender: TObject);
begin
ConCod:=false;
end;

procedure TIngresoFecha.Label1Click(Sender: TObject);
begin
Close;
end;

procedure TIngresoFecha.Panel3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture();
Perform( WM_SYSCOMMAND, $F012, 0 );
end;

procedure TIngresoFecha.Agrega1Click(Sender: TObject);
var gf:byte;
begin
ConCod:=true;
Close;
end;

end.
