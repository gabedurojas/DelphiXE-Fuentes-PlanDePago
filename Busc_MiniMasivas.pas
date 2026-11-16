unit Busc_MiniMasivas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  StdCtrls, JvgGroupBox, ADODB, DB, JvExStdCtrls, JvBehaviorLabel,
  JvExExtCtrls, JvExtComponent, JvPanel, ExtCtrls, RzCmboBx, Vcl.Buttons,
  JvExButtons, JvBitBtn, StrUtils, Objetos, RzTabs;

type
  TBus_MiniMasiva = class(TForm)
    JvgGroupBox3: TJvgGroupBox;
    Barra1: TStatusBar;
    DTS1: TDataSource;
    Panel3: TPanel;
    JvPanel2: TJvPanel;
    JvBehaviorLabel2: TJvBehaviorLabel;
    Label1: TLabel;
    JvgGroupBox1: TJvgGroupBox;
    LB1: TLabel;
    ODNI: TEdit;
    Buscar: TJvBitBtn;
    Label25: TLabel;
    ONOMB: TEdit;
    PC1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    JvDBGrid2: TJvDBGrid;
    JvBitBtn1: TJvBitBtn;
    JvgGroupBox2: TJvgGroupBox;
    JvDBGrid1: TJvDBGrid;
    DTS2: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Consultas(nro:byte);
    procedure JvPanel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ODNIKeyPress(Sender: TObject; var Key: Char);
    procedure BuscarClick(Sender: TObject);
    procedure ONOMBKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid2DblClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure JvDBGrid2CellClick(Column: TColumn);
  private
    gh:boolean;
    ColCli:array of char;
    { Private declarations }
  public
    ConSelec:boolean;
    TITULARES,DATOS:TADODataSet;
    NroOpcion:byte;{ Public declarations }
  end;

var
  Bus_MiniMasiva: TBus_MiniMasiva;

implementation

uses Modulo, Unidad, frm_filtro;

{$R *.dfm}

procedure TBus_MiniMasiva.FormCreate(Sender: TObject);
begin
gh:=false;
TITULARES:=TADODataSet.Create(nil);
DATOS:=TADODataSet.Create(nil);
end;

procedure TBus_MiniMasiva.FormActivate(Sender: TObject);
begin
if not(gh) then begin
  gh:=true;
  ONOMB.SetFocus;
  PC1.ActivePage:=PC1.Pages[0];
  //if NroOpcion = 2 then begin
  //  JvgGroupBox1.Visible:=false;
  //  Consultas(NroOpcion);
  //end;
end;
end;

procedure TBus_MiniMasiva.BuscarClick(Sender: TObject);
begin
if (TRIM(onomb.Text)='') and (trim(odni.Text)='')  then begin
 messagedlg('Error.. No Existe ningun Contribuyente segun el Criterio de Busqueda..Por Favor realice otra búsqueda.',mterror,[mbok],0);
 onomb.SetFocus;
 end
 else Consultas(1);
end;

procedure TBus_MiniMasiva.Consultas(nro:byte);
var param:string;
    Comando:widestring;
begin
Modulo2.ObjConexion:=TADOConnection.Create(nil);
Modulo2.ObjConexion.LoginPrompt:=false;
Modulo2.ObjConexion.ConnectionString:=Modulo2.Sistema.ConectInti;
try
  if nro = 1 then begin
    if trim(ONOMB.Text) <> '' then param:=chr(39) + trim(ONOMB.Text) + chr(39) + ' , '
    else param:='NULL , ';
    if trim(ODNI.Text) <> '' then param:=param + trim(ODNI.Text) + ' , '
    else param:=param + 'NULL';
    Comando:='SELECT NumeroIntimacion,Contribuyente, CantidadObjetos,IdMasiva '
    + 'FROM dbo.Fn_MiniMasivasContribuyentes (' + param + ') ORDER BY Contribuyente';
    TITULARES.Close;
    DTS1.DataSet:=TITULARES;
    TITULARES.Connection:=Modulo2.ObjConexion;
    TITULARES.CommandText:=Comando;
    TITULARES.Open;
    TITULARES.Connection:=nil;
  end;
  if nro = 2 then begin
    Comando:='SELECT NumeroIntimacion,Rubro ,CodigoObjeto, PeriodoDesde,PeriodoHasta '
    + ' FROM Fn_MiniMasivasContribuyentesObjetos ('+TITULARES.Fields[0].AsString +')';
    DATOS.Close;
    DTS2.DataSet:=DATOS;
    DATOS.Connection:=Modulo2.ObjConexion;
    DATOS.CommandText:=Comando;
    DATOS.Open;
    DATOS.Connection:=nil;
  end;
  if TITULARES.IsEmpty then begin
     messagedlg('Error.. La Busqueda no arrojo ninguna Intimacion..' + chr(13)
     + 'Por favor realice otra busqueda.' ,mterror,[mbok],0);
  end
  else begin
   Barra1.Panels[1].Text:='Cant. Intimaciones: ' + IntToStr(TITULARES.RecordCount);
   JvDBGrid2.SetFocus;
  end;
except
  on E: Exception do begin
    EnviarLog(Self.Caption, E.Message);
    EnviarLog(Self.Caption, comando);
  end;
end;
Modulo2.ObjConexion.Close;
FreeAndNil(Modulo2.ObjConexion);
end;

procedure TBus_MiniMasiva.JvDBGrid2CellClick(Column: TColumn);
begin
if not TITULARES.IsEmpty then begin
  PC1.ActivePage:=PC1.Pages[1];
   Consultas(2);
end;
end;

procedure TBus_MiniMasiva.JvDBGrid2DblClick(Sender: TObject);
begin
if not TITULARES.IsEmpty then begin
  PC1.ActivePage:=PC1.Pages[1];
  Consultas(2);
end;
end;

procedure TBus_MiniMasiva.JvPanel2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture();
Perform( WM_SYSCOMMAND, $F012, 0 );
end;

procedure TBus_MiniMasiva.Label1Click(Sender: TObject);
begin
ConSelec:=false;
Close;
end;

procedure TBus_MiniMasiva.ODNIKeyPress(Sender: TObject; var Key: Char);
begin
if key =#13 then begin
  Key := #0;
  buscar.SetFocus;
end
else begin
  if ( StrScan('0123456789',Key) <> nil ) or
      ( Key = Char(VK_BACK) ) then
   else Key := #0;
end;
end;

procedure TBus_MiniMasiva.ONOMBKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  ODNI.SetFocus;
end
else begin
  if ( StrScan('0123456789abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ%. /°-',Key) <> nil ) or
      ( Key = Char(VK_BACK) ) then
   else Key := #0;
end;
end;

end.
