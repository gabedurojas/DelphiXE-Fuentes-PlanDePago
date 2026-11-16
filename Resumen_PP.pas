unit Resumen_PP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Forms,
  JvComponentBase, JvEmbeddedForms, Vcl.Menus, Data.DB, Vcl.StdCtrls,
  Vcl.Controls, JvExStdCtrls, JvBehaviorLabel, JvExExtCtrls, JvExtComponent,
  JvPanel, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, JvgGroupBox, ADODB, StrUtils, Dialogs, frxClass, frxDBSet,
  Vcl.Buttons, JvExButtons, JvBitBtn, Vcl.ToolWin, JvExComCtrls, JvToolBar,
  JvDBGridExport, Vcl.Mask,Objetos;

type
  TResumenPP = class(TForm)
    JvgGroupBox3: TJvgGroupBox;
    JvDBGrid2: TJvDBGrid;
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
    JvDBGridExcelExport1: TJvDBGridExcelExport;
    frxReport1: TfrxReport;
    labusqueda: TJvgGroupBox;
    Label5: TLabel;
    Label3: TLabel;
    busca: TJvBitBtn;
    fechaD: TMaskEdit;
    combodatos: TComboBox;
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
    procedure fechaDExit(Sender: TObject);
    procedure fechaDKeyPress(Sender: TObject; var Key: Char);
    procedure combodatosExit(Sender: TObject);
    procedure combodatosKeyPress(Sender: TObject; var Key: Char);
    procedure CargaCombos(nro:byte);
    procedure buscaClick(Sender: TObject);
  private
    gh:boolean;
    FechaActual,canplanes:string;
    { Private declarations }
  public
    //NroOpcion:integer;
    ConSelec:boolean;
    TITULARES,CANTIDAD:TADODataSet;
    NroOpcion:integer;{ Public declarations }
  end;

var
  ResumenPP: TResumenPP;

implementation

uses Modulo, Unidad, frm_filtro;

{$R *.dfm}

procedure TResumenPP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FreeAndNil(TITULARES);
FreeAndNil(CANTIDAD);
FreeAndNil(Self);
end;

procedure TResumenPP.FormCreate(Sender: TObject);
begin
gh:=false;
TITULARES:=TADODataSet.Create(nil);
CANTIDAD:=TADODataSet.Create(nil);
end;

procedure TResumenPP.FormActivate(Sender: TObject);
begin
if not(gh) then begin
  FechaActual:=LeftStr(Unidad.Fec_System,10);
  gh:=true;
  if Nroopcion = 1  then begin
    label12.Caption:='Resúmenes de Planes para Entrega';
    Consultas(1);
    labusqueda.Visible:=false;
  end
  else begin
    label12.Caption:='Reimpresión de Planes para Entrega';
    CargaCombos(1);
    labusqueda.Visible:=true;
    fechad.Text:=FechaActual;
    fechad.SetFocus;
  end;
end;
end;

procedure TResumenPP.buscaClick(Sender: TObject);
begin
   Consultas(1);
end;

procedure TResumenPP.CargaCombos(nro:byte);
begin
//  if nro=1 then Modulo2.CargaCombo(combodatos,'SELECT descripcion,idSubRubro FROM RubrosSub',modulo2.Sistema.ConectUsu,false);
  if nro=1 then Modulo2.CargaCombo(combodatos,'SELECT distinct municipio.dbo.Usuarios2.nombre, NroUsuario '
     + ' FROM PlanPago inner join municipio.dbo.Usuarios2 on municipio.dbo.Usuarios2.codusu = PlanPago.NroUsuario'
     + ' where planpago.NroPlan >=300000 order by 1',modulo2.Sistema.ConectDb,false);
end;

procedure TResumenPP.combodatosExit(Sender: TObject);
begin
 if combodatos.ItemIndex < 0 then begin
  messagedlg('Error!! Seleccione una Opcion válida',mterror,[mbok],0);
  combodatos.SetFocus;
end;
end;

procedure TResumenPP.combodatosKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  busca.SetFocus;
end;
end;

procedure TResumenPP.Consultas(nro:byte);
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
      if Nroopcion = 1 then begin
        Comando:='SELECT Orden,Identificador,Detalle,Contribuyente,CantCuotas,ImporteCuota,FechaCarga,'
        + 'CantObjetos,EsPlan,rtrim(TipoEstado) + '' - '' + convert(nvarchar(5),NroUsuario) as Estado '
        + ' FROM dbo.Fn_ResumenPlanPago (' + Modulo2.Usuario.UsuNro + ' , ' + chr(39) + FechaActual + chr(39) + ')';
      end
      else begin
        Comando:='SELECT Orden,Identificador,Detalle,Contribuyente,CantCuotas,ImporteCuota,FechaCarga,'
        + 'CantObjetos,EsPlan,rtrim(TipoEstado) + '' - '' + convert(nvarchar(5),NroUsuario) as Estado '
        + ' FROM dbo.Fn_ResumenPlanPagoAdmin (' + TComboClase(combodatos.Items.Objects[combodatos.ItemIndex]).Param1
         + ' , ' + chr(39) + trim(fechad.Text ) + chr(39) + ')';
      end;
      TITULARES.Close;
      DTS1.DataSet:=TITULARES;
      TITULARES.Connection:=Cnx2;
      TITULARES.CommandText:=Comando;
      TITULARES.Open;
      if TITULARES.IsEmpty then begin
         if Nroopcion = 1 then messagedlg('La Busqueda no arrojó ningun Plan de Pago pendiente de Entrega..' ,mtWarning,[mbok],0)
           else messagedlg('La Busqueda no arrojó ningun Plan de Pago para la fecha y Usuario seleccionado..' ,mtWarning,[mbok],0);
      end
      else begin
       Barra1.Panels[1].Text:='Cant. Objetos: ' + IntToStr(TITULARES.RecordCount);
       JvDBGrid2.SetFocus;
      end;
      TITULARES.Connection:=nil;
     except
      on E: Exception do begin
        EnviarLog(Self.Caption, E.Message);
        EnviarLog(Self.Caption, comando);
     end;
 end;
 if nro=2 then begin
   try
    if Nroopcion = 1 then begin
      Comando:='SELECT COUNT(*) FROM PlanPago WHERE (NroUsuario = ' + Modulo2.Usuario.UsuNro + ')'
      + ' AND (CONVERT(char(10), FechaCarga, 103) = ' + chr(39) + FechaActual + chr(39) + ')'
      + ' AND (Entregado IS NULL) group by NroUsuario ';
    end
    else begin
      Comando:='SELECT COUNT(*) FROM PlanPago WHERE (NroUsuario = ' + TComboClase(combodatos.Items.Objects[combodatos.ItemIndex]).Param1 + ')'
      + ' AND (CONVERT(char(10), FechaCarga, 103) = ' + chr(39) + trim(fechad.Text) + chr(39) + ')'
      + ' AND (Entregado IS NULL) group by NroUsuario ';
    end;
      CANTIDAD.Close;
      CANTIDAD.Connection:=Cnx2;
      CANTIDAD.CommandText:=Comando;
      CANTIDAD.Open;
      if CANTIDAD.IsEmpty then begin
         messagedlg('La Busqueda no arrojó ningun Objeto pendiente de Entrega..' ,mtWarning,[mbok],0);
      end
      else begin
       canplanes:=trim(CANTIDAD.Fields[0].AsString);
      end;
      CANTIDAD.Connection:=nil;
   except
    on E: Exception do begin
      EnviarLog(Self.Caption, E.Message);
      EnviarLog(Self.Caption, comando);
   end;
 end;
end;
end;
Cnx2.Close;
FreeAndNil(Cnx2);
end;

procedure TResumenPP.JvDBGrid2DblClick(Sender: TObject);
begin
if not TITULARES.IsEmpty then begin
  ConSelec:=true;
  Close;
end;
end;

procedure TResumenPP.Filtrar1Click(Sender: TObject);
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

procedure TResumenPP.DesactivarFiltro1Click(Sender: TObject);
begin
DesactivarFiltro1.Checked:=true;
TITULARES.Filtered:=false;
Barra1.Panels[0].Style:=psText;
Barra1.Panels[0].Text:='Filtro: INACTIVO';
Barra1.Panels[2].Text:='Cant. Registros: ' + IntToStr(TITULARES.RecordCount);
end;


procedure TResumenPP.ExportaraExcel1Click(Sender: TObject);
begin
try
  JvDBGridExcelExport1.FileName:=Modulo2.Sistema.Path_todo  + '\ListaEntrega.xls' ;
  JvDBGridExcelExport1.ExportGrid;
  messagedlg('Archivo Exportado Correctamente...',mtWarning,[mbok],0);
except
  messagedlg('Error al Exportar...',mtError,[mbok],0);
end;
end;

procedure TResumenPP.fechaDExit(Sender: TObject);
var kl:Tdatetime;
begin
try
  kl:=strtodate(trim(fechaD.Text));
except
  messagedlg('La Fecha Ingresada No es Válida',mterror,[mbok],0);
  fechaD.SetFocus;
end;
end;

procedure TResumenPP.fechaDKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then combodatos.SetFocus
else begin
  if ( StrScan('0123456789',Key) <> nil ) or
     ( Key = Char(VK_BACK) ) then
  else Key := #0;
end;
end;

procedure TResumenPP.Imprimir1Click(Sender: TObject);
var ReporteRst: TfrxReport;
    frxDB1:TfrxDBDataset;
    t,y,gf:integer;
    dmi:widestring;
    tmp:string;
    Com1:TADOCommand;
    ps:boolean;
    Cnx2:TADOConnection;
begin
gf:=messagedlg('Desea Imprimir los Planes de la Generados por el Usuario seleccionado?...' ,mtWarning,[mbok,mbCancel],0);
if gf = 1 then begin
   /// llamamos al proceso que cambia el estado de los planes a Entregado (E)
  Cnx2:=TADOConnection.Create(nil);
  Cnx2.LoginPrompt:=false;
  Cnx2.ConnectionString:=Modulo2.Sistema.ConectDb;
  Com1:=TADOCommand.Create(nil);
  Com1.Connection:=Cnx2;
    try
    for t:=1 to TITULARES.RecordCount do begin
      TITULARES.RecNo:=t;
      Com1.CommandText :='SPP_PlanesPagoMovimiento '
      + TITULARES.FieldByName('Identificador').AsString + ' , '
      + TITULARES.FieldByName('EsPlan').AsString + ' , '
      + '0 , '
      + modulo2.Usuario.UsuNro + ' , '
      + chr(39) + modulo2.Sistema.MyHost + chr(39) + ' , '
      + chr(39) + modulo2.Sistema.MyIP + chr(39);
      Com1.Execute;
    end;
    ps:=true;
  except
    on E: Exception do begin
      ps:=false;
      EnviarLog(Self.Caption, E.Message);
      EnviarLog(Self.Caption, Com1.CommandText);
    end;
  end;
  Com1.Connection:=nil;
  FreeAndNil(Com1);
  Cnx2.Close;
  FreeAndNil(Cnx2);
  try
    ReporteRst:=TfrxReport.Create(nil);
    frxDB1:=TfrxDBDataset.Create(nil);
    frxDB1.DataSet:=TITULARES;
    frxDB1.UserName:='frxDBDataset1';

    ReporteRst.LoadFromFile(Modulo2.Sistema.Path_todo + '\Reportes\ResumenUsu.fr3');
    TfrxPictureView(ReporteRst.FindObject('Logo1')).Picture.LoadFromFile(Modulo2.Sistema.Path_todo + '\Imagenes\LogoM2.jpg');
    //ReporteRst.Variables['Fecha'] := QuotedStr(trim(fechad.Text));
    if Nroopcion = 1 then begin
      ReporteRst.Variables['Fecha'] := QuotedStr(FechaActual);
      ReporteRst.Variables['Usuario'] := QuotedStr(Modulo2.Usuario.UsuNombre);
      ReporteRst.Variables['NroUsuario'] := QuotedStr(Modulo2.Usuario.UsuNro);
    end
    else begin
      ReporteRst.Variables['Fecha'] := QuotedStr(trim(fechad.Text));
      ReporteRst.Variables['Usuario'] := QuotedStr(trim(trim(combodatos.Text)));
      ReporteRst.Variables['NroUsuario'] := QuotedStr(TComboClase(combodatos.Items.Objects[combodatos.ItemIndex]).Param1);
    end;
    ReporteRst.ShowReport;
  except
    on E: Exception do EnviarLog(Self.Caption, 'Error en Reporte ' + E.Message);
  end;
  FreeAndNil(frxDB1);
  FreeAndNil(ReporteRst);
end;
end;

procedure TResumenPP.PopupMenu1Popup(Sender: TObject);
begin
Filtrar1.Enabled:=not TITULARES.IsEmpty;
Imprimir1.Enabled:=not TITULARES.IsEmpty;
ExportaraExcel1.Enabled:=not TITULARES.IsEmpty;
end;

procedure TResumenPP.SALEClick(Sender: TObject);
begin
Close;
end;

end.
