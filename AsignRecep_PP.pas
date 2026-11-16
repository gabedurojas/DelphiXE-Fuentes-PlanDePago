unit AsignRecep_PP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Forms,
  JvComponentBase, JvEmbeddedForms, Vcl.Menus, Data.DB, Vcl.StdCtrls,
  Vcl.Controls, JvExStdCtrls, JvBehaviorLabel, JvExExtCtrls, JvExtComponent,
  JvPanel, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, JvgGroupBox, ADODB, StrUtils, Dialogs, frxClass, frxDBSet,
  Vcl.Buttons, JvExButtons, JvBitBtn, Vcl.ToolWin, JvExComCtrls, JvToolBar,
  JvDBGridExport, Vcl.Graphics, JvDBUltimGrid;

type
  TAsignaRecepcion = class(TForm)
    JvgGroupBox3: TJvgGroupBox;
    Barra1: TStatusBar;
    DTS1: TDataSource;
    PopupMenu1: TPopupMenu;
    Filtrar1: TMenuItem;
    DesactivarFiltro1: TMenuItem;
    N1: TMenuItem;
    Imprimir1: TMenuItem;
    N2: TMenuItem;
    ExportaraExcel1: TMenuItem;
    FormularioEmb: TJvEmbeddedFormLink;
    JvToolBar1: TJvToolBar;
    Label12: TLabel;
    ToolButton1: TToolButton;
    SALE: TJvBitBtn;
    JvDBUltimGrid1: TJvDBUltimGrid;
    JvDBGridExcelExport1: TJvDBGridExcelExport;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Consultas(nro:byte);
    procedure JvDBGrid2DblClick(Sender: TObject);
    procedure Filtrar1Click(Sender: TObject);
    procedure DesactivarFiltro1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SALEClick(Sender: TObject);
    procedure ExportaraExcel1Click(Sender: TObject);
    procedure JvDBUltimGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    gh:boolean;
    FechaActual:string;
    { Private declarations }
  public
    ConSelec:boolean;
    TITULARES:TADODataSet;
    NroOpcion:byte;{ Public declarations }
  end;

var
  AsignaRecepcion: TAsignaRecepcion;

implementation

uses Modulo, Unidad, frm_filtro;

{$R *.dfm}

procedure TAsignaRecepcion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FreeAndNil(TITULARES);
FreeAndNil(Self);
end;

procedure TAsignaRecepcion.FormCreate(Sender: TObject);
begin
gh:=false;
TITULARES:=TADODataSet.Create(nil);
end;

procedure TAsignaRecepcion.FormActivate(Sender: TObject);
begin
if not(gh) then begin
  FechaActual:=LeftStr(Unidad.Fec_System,10);
  gh:=true;
  Consultas(1);
end;
end;

procedure TAsignaRecepcion.Consultas(nro:byte);
var param:string;
    Comando:widestring;
    t:integer;
    Cnx2:TADOConnection;
begin
Cnx2:=TADOConnection.Create(nil);
Cnx2.LoginPrompt:=false;
Cnx2.ConnectionString:=Modulo2.Sistema.ConectDb;
if nro = 1  then begin
  try
    Comando:='SELECT Orden, Identificador, Detalle, Contribuyente, CantCuotas, ImporteCuota, '
    + 'FechaCarga, CantObjetos, EsPlan, Estado FROM dbo.Fn_ResumenPlanPagoRec (NULL,NULL)';
    TITULARES.Close;
    DTS1.DataSet:=TITULARES;
    TITULARES.Connection:=Cnx2;
    TITULARES.CommandText:=Comando;
    TITULARES.Open;
    if TITULARES.IsEmpty then begin
       messagedlg('La Busqueda no arrojó ningun Objeto pendiente de Entrega..' ,mtWarning,[mbok],0);
    end
    else begin
     Barra1.Panels[1].Text:='Cant. Objetos: ' + IntToStr(TITULARES.RecordCount);
     JvDBUltimGrid1.SetFocus;
    end;
    TITULARES.Connection:=nil;
  except
    on E: Exception do begin
      EnviarLog(Self.Caption, E.Message);
      EnviarLog(Self.Caption, comando);
    end;
  end;
end;

Cnx2.Close;
FreeAndNil(Cnx2);
end;

procedure TAsignaRecepcion.JvDBGrid2DblClick(Sender: TObject);
begin
if not TITULARES.IsEmpty then begin
  ConSelec:=true;
  Close;
end;
end;

procedure TAsignaRecepcion.JvDBUltimGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if trim(TITULARES.FieldByName('Estado').AsString) = 'R' then begin
    JvDBUltimGrid1.Canvas.Brush.Color:=$00739DC8;
    JvDBUltimGrid1.Canvas.FillRect(Rect);
    JvDBUltimGrid1.Canvas.Font.Color:= clBlack;
    JvDBUltimGrid1.DefaultDrawColumnCell(Rect,Datacol,Column,State);
end;
end;

procedure TAsignaRecepcion.Filtrar1Click(Sender: TObject);
var Frm_Filtros:TFrm_Filtros;
    t:integer;
    valor:string;
begin
try
  Modulo2.Filtro.Columna.Clear;
  Modulo2.Filtro.Tipo.Clear;
  Modulo2.Filtro.Valor:='';
  Modulo2.Filtro.Patron:=false;
  Barra1.Panels[0].Style:=psOwnerDraw;

  Frm_Filtros:=TFrm_Filtros.Create(nil);

  for t:=0 to TITULARES.FieldCount-1 do begin
    Modulo2.Filtro.Columna.Append(TITULARES.Fields[t].DisplayName);
    if TITULARES.Fields[t].DataType in [ftDate, ftTime, ftDateTime] then Modulo2.Filtro.Tipo.Append('F');
    if TITULARES.Fields[t].DataType in [ftString, ftFmtMemo, ftWideString, ftFixedWideChar, ftWideMemo] then Modulo2.Filtro.Tipo.Append('C');
    if TITULARES.Fields[t].DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency,
    ftBCD, ftBytes, ftVarBytes, ftAutoInc, ftLargeint, ftLongWord, ftShortint, ftByte, ftExtended, ftSingle] then Modulo2.Filtro.Tipo.Append('N');
  end;
  Frm_Filtros.COLUMNA.Items.AddStrings(Modulo2.Filtro.Columna);
  if Filtrar1.Checked then Frm_Filtros.FILTRO.Text:=TITULARES.Filter;

  Frm_Filtros.ShowModal;
  try
    if not Frm_Filtros.Cancelado then begin
      TITULARES.Filtered:=false;
      TITULARES.Filter:=Frm_Filtros.FILTRO.Text;
      TITULARES.Filtered:=true;
      Barra1.Panels[0].Text:='Filtro: ACTIVO';
      Filtrar1.Checked:=true;
      DesactivarFiltro1.Enabled:=true;
    end;
    Barra1.Panels[2].Text:='Cant. Registros: ' + IntToStr(TITULARES.RecordCount);
  except
    on E: Exception do begin
       ShowMessage(E.Message);
       EnviarLog(Self.Caption, E.Message);
    end;
  end;
finally
  Frm_Filtros.free;
end
end;


procedure TAsignaRecepcion.DesactivarFiltro1Click(Sender: TObject);
begin
DesactivarFiltro1.Checked:=true;
TITULARES.Filtered:=false;
Barra1.Panels[0].Style:=psText;
Barra1.Panels[0].Text:='Filtro: INACTIVO';
Barra1.Panels[2].Text:='Cant. Registros: ' + IntToStr(TITULARES.RecordCount);
end;


procedure TAsignaRecepcion.ExportaraExcel1Click(Sender: TObject);
begin
try
  JvDBGridExcelExport1.FileName:=Modulo2.Sistema.Path_todo  + '\ListaRec.xls' ;
  JvDBGridExcelExport1.ExportGrid;
  messagedlg('Archivo Exportado Correctamente...',mtWarning,[mbok],0);
except
  messagedlg('Error al Exportar...',mtError,[mbok],0);
end;
end;

procedure TAsignaRecepcion.Imprimir1Click(Sender: TObject);
var Com1:TADOCommand;
    gf:integer;
    Cnx2:TADOConnection;
begin
gf:=messagedlg('UD. va a cambiará el estado a RECEPCIONADO ' + chr(13)
             + 'en la base de Datos, Desea Continuar?...' ,mtWarning,[mbok,mbCancel],0);
if gf = 1 then begin
   /// llamamos al proceso que cambia el estado de los planes a Entregado (E)
  Cnx2:=TADOConnection.Create(nil);
  Cnx2.LoginPrompt:=false;
  Cnx2.ConnectionString:=Modulo2.Sistema.ConectDb;
  Com1:=TADOCommand.Create(nil);
  Com1.Connection:=Cnx2;
  try

    Com1.CommandText :='SPP_PlanesPagoMovimiento '
    + TITULARES.FieldByName('Identificador').AsString + ' , '
    + TITULARES.FieldByName('EsPlan').AsString + ' , '
    + '1 , '
    + modulo2.Usuario.UsuNro + ' , '
    + chr(39) + modulo2.Sistema.MyHost + chr(39) + ' , '
    + chr(39) + modulo2.Sistema.MyIP + chr(39);
    Com1.Execute;
  except
    on E: Exception do begin
      EnviarLog(Self.Caption, E.Message);
      EnviarLog(Self.Caption, Com1.CommandText);
    end;
  end;
  FreeAndNil(Com1);
  Cnx2.Close;
  FreeAndNil(Cnx2);
  Consultas(1);
end;
end;


procedure TAsignaRecepcion.PopupMenu1Popup(Sender: TObject);
begin
Filtrar1.Enabled:=not TITULARES.IsEmpty;
Imprimir1.Enabled:=not TITULARES.IsEmpty;
ExportaraExcel1.Enabled:=not TITULARES.IsEmpty;
end;


procedure TAsignaRecepcion.SALEClick(Sender: TObject);
begin
Close;
end;

end.
