unit Sel_Periodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvgGroupBox, Buttons, JvExButtons, JvBitBtn, JvExStdCtrls,
  JvBehaviorLabel, JvExExtCtrls, JvExtComponent, JvPanel,  Vcl.ExtCtrls,
  Vcl.Mask, RzEdit, DateUtils, RzCmboBx;

type
  TIngresoPeriodo = class(TForm)
    JvgGroupBox2: TJvgGroupBox;
    Label2: TLabel;
    Agrega1: TJvBitBtn;
    Panel3: TPanel;
    JvPanel2: TJvPanel;
    JvBehaviorLabel2: TJvBehaviorLabel;
    Label1: TLabel;
    PERIODO: TRzComboBox;
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
    Peri:string;{ Public declarations }
  end;

var
  IngresoPeriodo: TIngresoPeriodo;

implementation

uses Modulo, Unidad;

{$R *.dfm}

procedure TIngresoPeriodo.FechaImpChange(Sender: TObject);
begin
Agrega1.Enabled:=true;
end;

procedure TIngresoPeriodo.FechaImpKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  if Agrega1.Enabled then Agrega1.SetFocus;
end;

procedure TIngresoPeriodo.FormActivate(Sender: TObject);
begin
PERIODO.ItemIndex:=PERIODO.Items.IndexOf(Peri);
end;

procedure TIngresoPeriodo.FormCreate(Sender: TObject);
begin
ConCod:=false;
end;

procedure TIngresoPeriodo.Label1Click(Sender: TObject);
begin
Close;
end;

procedure TIngresoPeriodo.Panel3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture();
Perform( WM_SYSCOMMAND, $F012, 0 );
end;

procedure TIngresoPeriodo.Agrega1Click(Sender: TObject);
var gf:byte;
begin
ConCod:=true;
Close;
end;

end.
