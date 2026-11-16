unit ResumenAuditoria_PP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  StdCtrls, JvgGroupBox, ADODB, DB, JvExStdCtrls, JvBehaviorLabel,
  JvExExtCtrls, JvExtComponent, JvPanel, ExtCtrls, RzCmboBx, Vcl.Buttons,
  JvExButtons, JvBitBtn, StrUtils, Objetos, frxClass, frxDBSet, Vcl.Mask,
  JvComponentBase, JvEmbeddedForms, Vcl.ImgList,ComObj,DBClient, RzTabs,
  Vcl.ToolWin, JvExComCtrls, JvToolBar;

type
  TAuditoriaPP = class(TForm)
    JvgGroupBox3: TJvgGroupBox;
    Barra1: TStatusBar;
    DTS1: TDataSource;
    Panel3: TPanel;
    JvPanel2: TJvPanel;
    JvBehaviorLabel2: TJvBehaviorLabel;
    PopupMenu1: TPopupMenu;
    Filtrar1: TMenuItem;
    DesactivarFiltro1: TMenuItem;
    N1: TMenuItem;
    Imprimir1: TMenuItem;
    N2: TMenuItem;
    ExportaraExcel1: TMenuItem;
    labusqueda: TJvgGroupBox;
    Label5: TLabel;
    busca: TJvBitBtn;
    fechaD: TMaskEdit;
    Label2: TLabel;
    fechah: TMaskEdit;
    PorTodoslosRubros1: TMenuItem;
    PorUnRubroEspedifico1: TMenuItem;
    N3: TMenuItem;
    PorUnUsuarioEspecifico1: TMenuItem;
    ImageList1: TImageList;
    FormularioEmb: TJvEmbeddedFormLink;
    PorTodoslosUsuarios1: TMenuItem;
    N4: TMenuItem;
    PorFechas1: TMenuItem;
    Label3: TLabel;
    combodatos: TComboBox;
    frxReport1: TfrxReport;
    RE: TRichEdit;
    PC1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    JvDBGrid2: TJvDBGrid;
    DTS2: TDataSource;
    JvDBGrid1: TJvDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Consultas(nro:byte);
    procedure JvPanel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure JvDBGrid2DblClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure DesactivarFiltro1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure buscaClick(Sender: TObject);
    procedure fechaDExit(Sender: TObject);
    procedure fechahExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fechaDKeyPress(Sender: TObject; var Key: Char);
    procedure fechahKeyPress(Sender: TObject; var Key: Char);
    procedure ExportaraExcel1Click(Sender: TObject);
    procedure PorTodoslosRubros1Click(Sender: TObject);
    procedure PorFechas1Click(Sender: TObject);
    procedure CargaCombos(nro:byte);
    procedure PorUnRubroEspedifico1Click(Sender: TObject);
    procedure PorUnUsuarioEspecifico1Click(Sender: TObject);
    procedure PorTodoslosUsuarios1Click(Sender: TObject);
    procedure combodatosExit(Sender: TObject);
    procedure combodatosKeyPress(Sender: TObject; var Key: Char);
    procedure SALEClick(Sender: TObject);
  private
    gh:boolean;
    FechaActual,casos,descri,titulo,titulo1:string;
    { Private declarations }
  public
    ConSelec:boolean;
    sumad,suma:double;
    sumapb,sumacanc,sumavig:integer;
    TITULARES,DETALLE:TADODataSet;
    NroOpcion:byte;{ Public declarations }
  end;

var
  AuditoriaPP: TAuditoriaPP;

implementation

uses Modulo, Unidad;

{$R *.dfm}

procedure TAuditoriaPP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FreeAndNil(TITULARES);
FreeAndNil(DETALLE);
FreeAndNil(Self);
end;

procedure TAuditoriaPP.FormCreate(Sender: TObject);
begin
gh:=false;
TITULARES:=TADODataSet.Create(nil);
DETALLE:=TADODataSet.Create(nil);
end;

procedure TAuditoriaPP.FormActivate(Sender: TObject);
begin
if not(gh) then begin
  gh:=true;
  FechaActual:=LeftStr(Unidad.Fec_System,10);
  fechad.Text :=  FechaActual;
  fechah.Text :=  FechaActual;
  labusqueda.Visible:=true;
  label3.Visible:=false;
  combodatos.Visible:=false;
  fechad.SetFocus;
  casos:='0';
  PC1.ActivePage:=PC1.Pages[0];
end;
end;

procedure TAuditoriaPP.buscaClick(Sender: TObject);
begin
 Consultas(1);
 consultas(2);
end;

procedure TAuditoriaPP.CargaCombos(nro:byte);
begin
  if nro=1 then Modulo2.CargaCombo(combodatos,'SELECT descripcion,idSubRubro FROM RubrosSub',modulo2.Sistema.ConectUsu,false);
  if nro=2 then Modulo2.CargaCombo(combodatos,'SELECT distinct municipio.dbo.Usuarios2.nombre, NroUsuario '
     + ' FROM PlanPago inner join municipio.dbo.Usuarios2 on municipio.dbo.Usuarios2.codusu = PlanPago.NroUsuario',modulo2.Sistema.ConectDb,false);
end;

procedure TAuditoriaPP.combodatosExit(Sender: TObject);
begin
if combodatos.ItemIndex < 0 then begin
  messagedlg('Error!! Seleccione una Opcion válida',mterror,[mbok],0);
  combodatos.SetFocus;
end;
end;

procedure TAuditoriaPP.combodatosKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  busca.SetFocus;
end;
end;

procedure TAuditoriaPP.Consultas(nro:byte);
var param:string;
    Comando,Coman:widestring;
    t,a:integer;
    Cnx2:TADOConnection;
begin
Cnx2:=TADOConnection.Create(nil);
Cnx2.LoginPrompt:=false;
Cnx2.ConnectionString:=Modulo2.Sistema.ConectDb;
if nro = 1  then begin
sumad:=0;
  try
      if casos = '0' then t:=0;
      if casos = '1' then t:=1;
      if casos = '2' then t:=2;
      if casos = '3' then t:=3;
      if casos = '4' then t:=4;
      case t of
        0:begin   ///  ---por fechas
            Comando:='SPE_EstadisticasPlanesPago 0 , null '
            + ' , ' + chr(39) + trim(fechad.Text) + chr(39)
            + ' , ' + chr(39) + trim(fechah.Text) + chr(39) + ' , null';
            descri:='';
            titulo:='CodUsuario';
            titulo1:='Nombre Usuario';
        end;
        1:begin   //--- por todos los rubros
            Comando:='SPE_EstadisticasPlanesPago 1 , null '
            + ' , ' + chr(39) + trim(fechad.Text) + chr(39)
            + ' , ' + chr(39) + trim(fechah.Text) + chr(39) + ' , null';
            descri:=' A TODOS LOS RUBROS.';
            titulo:='IdSubRubro';
            titulo1:='Detalle Rubro';
        end;
        2:begin   //  -- por un rubro especifico
            Comando:='SPE_EstadisticasPlanesPago 2 , null '
            + ' , ' + chr(39) + trim(fechad.Text) + chr(39)
            + ' , ' + chr(39) + trim(fechah.Text) + chr(39)
            + ' , ' + chr(39) + trim(combodatos.Text) + chr(39);
            descri:=' AL RUBRO: ' + trim(combodatos.Text);
            titulo:='IdSubRubro';
            titulo1:='Detalle Rubro';
        end;
        3:begin   // ----por todos los usuarios
            Comando:='SPE_EstadisticasPlanesPago 4 , null '
            + ' , ' + chr(39) + trim(fechad.Text) + chr(39)
            + ' , ' + chr(39) + trim(fechah.Text) + chr(39) + ' , null';
            descri:=' A TODOS LOS USUARIOS.';
            titulo:='CodUsuario';
            titulo1:='Nombre Usuario';
        end;
        4:begin   // ----por un usuario en particular
            Comando:='SPE_EstadisticasPlanesPago 3 , ' + TComboClase(combodatos.Items.Objects[combodatos.ItemIndex]).Param1
            + ' , ' + chr(39) + trim(fechad.Text) + chr(39)
            + ' , ' + chr(39) + trim(fechah.Text) + chr(39) + ' , null';
            descri:=' AL USUARIO: ' + trim(combodatos.Text);
            titulo:='CodUsuario';
            titulo1:='Nombre Usuario';
        end;
      end;
    TITULARES.Close;
    DTS1.DataSet:=TITULARES;
    TITULARES.Connection:=Cnx2;
    TITULARES.CommandText:=Comando;
    TITULARES.Open;
    if TITULARES.IsEmpty then begin
       messagedlg('La Busqueda no arrojó ningun Resulado, por favor realice otra busqueda..' ,mtWarning,[mbok],0);
       fechad.SetFocus;
    end
    else begin
     JvDBGrid2.Columns[0].Width:=100;
     JvDBGrid2.Columns[1].Width:=450;
     JvDBGrid2.Columns[2].Width:=100;
     Barra1.Panels[1].Text:='Cant. Objetos: ' + IntToStr(TITULARES.RecordCount);
     /////
     try
      JvDBGrid2.datasource.dataset.disablecontrols;
      JvDBGrid2.datasource.dataset.first;
      while not JvDBGrid2.datasource.dataset.eof do begin
        //if (trim(JvDBGrid2.Fields[6].Value)='DEUDA') and
        //   (trim(JvDBGrid2.Fields[11].Value)='VENCIDO') then begin
           sumad := sumad + JvDBGrid2.datasource.dataset.fieldbyname('CantidadPlanes').asfloat;
           //ctadeuda:=ctadeuda + 1;
           //label6.Caption:=inttostr(ctadeuda) + ' por un Total de $ ' + floattostr(sumad);;
        //end;
        JvDBGrid2.datasource.dataset.next;
      end;
    finally
      JvDBGrid2.datasource.dataset.enablecontrols;
    end;

     JvDBGrid2.SetFocus;
    end;
    TITULARES.Connection:=nil;
  except
    on E: Exception do begin
      EnviarLog(Self.Caption, E.Message);
      EnviarLog(Self.Caption, comando);
    end;
  end;
end;
if nro=2 then begin
sumapb:=0;
sumacanc:=0;
sumavig:=0;
  try
      if casos = '3' then a:=0;
      if casos = '4' then a:=1;
      case a of
        0:begin   ///  ---por todos los usuarios
            Coman:='SPE_EstadisticasPlanesPagoDetalle 0 , null '
            + ' , ' + chr(39) + trim(fechad.Text) + chr(39)
            + ' , ' + chr(39) + trim(fechah.Text) + chr(39);
        end;
        1:begin   //--- por un usuario
            Coman:='SPE_EstadisticasPlanesPagoDetalle 1 , '  + TComboClase(combodatos.Items.Objects[combodatos.ItemIndex]).Param1
            + ' , ' + chr(39) + trim(fechad.Text) + chr(39)
            + ' , ' + chr(39) + trim(fechah.Text) + chr(39);
        end;
      end;
    DETALLE.Close;
    DTS2.DataSet:=DETALLE;
    DETALLE.Connection:=Cnx2;
    DETALLE.CommandText:=Coman;
    DETALLE.Open;
    DETALLE.Connection:=nil;
      /// recorro la grilla y sumamos las cuotas vencidas y con deuda
    try
      JvDBGrid1.datasource.dataset.disablecontrols;
      JvDBGrid1.datasource.dataset.first;
      while not JvDBGrid1.datasource.dataset.eof do begin
        if (trim(JvDBGrid1.Fields[4].Value)='BAJA') then  sumapb := sumapb + 1 ;
        if (trim(JvDBGrid1.Fields[4].Value)='CANCELADO')
           OR (trim(JvDBGrid1.Fields[4].Value)='CANCELACION AUTOMATICA') then sumacanc:=sumacanc + 1;
        if (trim(JvDBGrid1.Fields[4].Value)='VIGENTE') then sumavig:=sumavig + 1;
        JvDBGrid1.datasource.dataset.next;
      end;
    finally
      JvDBGrid1.datasource.dataset.enablecontrols;
    end;
    DETALLE.Connection:=nil;
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

procedure TAuditoriaPP.JvDBGrid2DblClick(Sender: TObject);
begin
if not TITULARES.IsEmpty then begin
  ConSelec:=true;
  Close;
end;
end;

procedure TAuditoriaPP.JvPanel2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture();
Perform( WM_SYSCOMMAND, $F012, 0 );
end;

procedure TAuditoriaPP.Label1Click(Sender: TObject);
begin
Close;
end;

procedure TAuditoriaPP.DesactivarFiltro1Click(Sender: TObject);
begin
labusqueda.Visible:=true;
label3.Visible:=false;
combodatos.Visible:=false;
fechad.SetFocus;
casos:='0';
TITULARES.Close;
DETALLE.Close;
end;

procedure TAuditoriaPP.ExportaraExcel1Click(Sender: TObject);
var linha, coluna : integer;
var planilha : variant;
var valorcampo : string;
begin
  //DTS1.CachedUpdates := true;
  planilha:= CreateoleObject('Excel.Application');
  planilha.WorkBooks.add(1);
  planilha.visible := true;
  DTS1.DataSet.First;
  for linha := 0 to DTS1.DataSet.RecordCount - 1 do
  begin
    for coluna := 1 to DTS1.DataSet.FieldCount do
    begin
      valorcampo := DTS1.DataSet.Fields[coluna - 1].AsString;
      planilha.cells[linha + 2,coluna] := valorCampo;
    end;
    DTS1.DataSet.Next;
  end;
  for coluna := 1 to DTS1.DataSet.FieldCount do
  begin
    valorcampo := DTS1.DataSet.Fields[coluna - 1].DisplayLabel;
    planilha.cells[1,coluna] := valorcampo;
  end;
  planilha.columns.Autofit;
end;

procedure TAuditoriaPP.fechaDExit(Sender: TObject);
var kl:Tdatetime;
begin
try
  kl:=strtodate(trim(fechaD.Text));
except
  messagedlg('La Fecha Ingresada No es Válida',mterror,[mbok],0);
  fechaD.SetFocus;
end;
end;

procedure TAuditoriaPP.fechaDKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then FECHAh.SetFocus
else begin
  if ( StrScan('0123456789',Key) <> nil ) or
     ( Key = Char(VK_BACK) ) then
  else Key := #0;
end;
end;

procedure TAuditoriaPP.fechahExit(Sender: TObject);
var kl:Tdatetime;
begin
try
  kl:=strtodate(trim(fechah.Text));
     if strtodate(fechah.Text) < strtodate(fechad.Text) then begin
     messagedlgpos('La FECHA HASTA no puede ser menor a la anterior!!',mterror,[mbok],0,screen.Width div 3,screen.Height div 3);
     fechah.SetFocus;
  end
  else begin
    if combodatos.Visible then combodatos.SetFocus
       else  busca.SetFocus;
  end;
except
  messagedlg('La Fecha Ingresada No es Válida',mterror,[mbok],0);
end;
end;

procedure TAuditoriaPP.fechahKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  if combodatos.Visible then combodatos.SetFocus
   else    busca.SetFocus;
end
else begin
  if ( StrScan('0123456789',Key) <> nil ) or
     ( Key = Char(VK_BACK) ) then
  else Key := #0;
end;
end;

procedure TAuditoriaPP.Imprimir1Click(Sender: TObject);
var ReporteRst: TfrxReport;
    frxDB1,frxDB2:TfrxDBDataset;
    DtsObjetos,DtsObjetos2, DtsGrilla2:TClientDataSet;
    t,y:integer;
begin
 try
    DtsObjetos:=TClientDataSet.Create(nil);
    DtsObjetos.FieldDefs.Clear;
    DtsObjetos.Active:=False;
    with DtsObjetos.FieldDefs.AddFieldDef do begin
      Name:='Orden';
      DataType:=ftInteger;
    end;
    with DtsObjetos.FieldDefs.AddFieldDef do begin
      Name:='Dato';
      DataType:=ftString;Size:=150;
    end;
    with DtsObjetos.FieldDefs.AddFieldDef do begin
      Name:='Detalle';
      DataType:=ftString;Size:=250;
    end;
    with DtsObjetos.FieldDefs.AddFieldDef do begin
      Name:='Cantidad';
      DataType:=ftString;Size:=100;
    end;
    DtsObjetos.CreateDataSet;
    DtsObjetos.Active:=True;
    y:=1;
     //// recorremos el dbgrid
     with JvDBGrid2.DataSource.DataSet do  begin
       First; //Vamos al primer registro...
       while not Eof do begin//Recorramos el DataSet hasta el ultimo registro...
          DtsObjetos.Append;
          DtsObjetos.FieldValues['Orden']:=y;
          DtsObjetos.FieldValues['Dato']:=JvDBGrid2.DataSource.DataSet.Fields[0].AsString;
          DtsObjetos.FieldValues['Detalle']:=JvDBGrid2.DataSource.DataSet.Fields[1].AsString;
          DtsObjetos.FieldValues['Cantidad']:=JvDBGrid2.DataSource.DataSet.Fields[2].AsString;
          DtsObjetos.Post;
          y:=y+1;
          Next;  //Vamos al siguiente registro..
       end;
     end;

    DtsObjetos2:=TClientDataSet.Create(nil);
    DtsObjetos2.FieldDefs.Clear;
    DtsObjetos2.Active:=False;
    with DtsObjetos2.FieldDefs.AddFieldDef do begin
      Name:='Orden';
      DataType:=ftInteger;
    end;
    with DtsObjetos2.FieldDefs.AddFieldDef do begin
      Name:='NroPlan';
      DataType:=ftInteger;
    end;
    with DtsObjetos2.FieldDefs.AddFieldDef do begin
      Name:='CantidadObjetos';
      DataType:=ftInteger;
    end;
    with DtsObjetos2.FieldDefs.AddFieldDef do begin
      Name:='CantidadCuotas';
      DataType:=ftInteger;
    end;
    with DtsObjetos2.FieldDefs.AddFieldDef do begin
      Name:='ImporteCuota';
      DataType:=ftString;Size:=50;
    end;
    with DtsObjetos2.FieldDefs.AddFieldDef do begin
      Name:='DetalleEstado';
      DataType:=ftString;Size:=50;
    end;
    with DtsObjetos2.FieldDefs.AddFieldDef do begin
      Name:='Usuario';
      DataType:=ftString;Size:=150;
    end;
    DtsObjetos2.CreateDataSet;
    DtsObjetos2.Active:=True;
    t:=1;
     //// recorremos el dbgrid
     with JvDBGrid1.DataSource.DataSet do  begin
       First; //Vamos al primer registro...
       while not Eof do begin//Recorramos el DataSet hasta el ultimo registro...
          DtsObjetos2.Append;
          DtsObjetos2.FieldValues['Orden']:=t;
          DtsObjetos2.FieldValues['NroPlan']:=JvDBGrid1.DataSource.DataSet.Fields[0].AsString;
          DtsObjetos2.FieldValues['CantidadObjetos']:=JvDBGrid1.DataSource.DataSet.Fields[1].AsString;
          DtsObjetos2.FieldValues['CantidadCuotas']:=JvDBGrid1.DataSource.DataSet.Fields[2].AsString;
          DtsObjetos2.FieldValues['ImporteCuota']:=JvDBGrid1.DataSource.DataSet.Fields[3].AsString;
          DtsObjetos2.FieldValues['DetalleEstado']:=JvDBGrid1.DataSource.DataSet.Fields[4].AsString;
          DtsObjetos2.FieldValues['Usuario']:=JvDBGrid1.DataSource.DataSet.Fields[5].AsString;
          DtsObjetos2.Post;
          t:=t+1;
          Next;  //Vamos al siguiente registro..
       end;
     end;

  except
    on E: Exception do EnviarLog(Self.Caption, E.Message);
  end;

/// imprimiendo
try
  ReporteRst:=TfrxReport.Create(nil);
  frxDB1:=TfrxDBDataset.Create(nil);
  frxDB1.DataSet:=DtsObjetos;
  frxDB1.UserName:='frxDBDataset1';
  ReporteRst.DataSets.Add(frxDB1);

  frxDB2:=TfrxDBDataset.Create(nil);
  frxDB2.DataSet:=DtsObjetos2;
  frxDB2.UserName:='frxDBDataset2';
  ReporteRst.DataSets.Add(frxDB2);

  ReporteRst.LoadFromFile(Modulo2.Sistema.Path_todo + '\Reportes\ResumenAuditoriaPP.fr3');
  TfrxPictureView(ReporteRst.FindObject('Logo1')).Picture.LoadFromFile(Modulo2.Sistema.Path_todo + '\Imagenes\LogoM2.jpg');
  TfrxPictureView(ReporteRst.FindObject('Logo2')).Picture.LoadFromFile(Modulo2.Sistema.Path_todo + '\Imagenes\logoformosa.jpg');

  if casos='0' then  ReporteRst.Variables['ELtituloReporte'] :=  QuotedStr('Resumen de Cantidad de Planes Realizados');
  if (casos='1') or (casos='2') then  ReporteRst.Variables['ELtituloReporte'] := QuotedStr('Resumen de Cantidad de Objetos involucrados en los Planes de Pagos');
  if (casos='3') or (casos='4')  then  ReporteRst.Variables['ELtituloReporte'] := QuotedStr('Resumen de Cantidad de Planes Realizados');
  if casos='0' then begin
    ReporteRst.Variables['Detalle'] :=  QuotedStr('');
    ReporteRst.Variables['CantPlanes'] := QuotedStr('Cantidad de Planes: ' + trim(floattostr(sumad))
    + '    ----    Estado Vigente: ' + trim(inttostr(sumavig))
    + '    /  Estado Cancelado: ' + trim(inttostr(sumacanc))
    + '    /  Estado Baja: ' + trim(inttostr(sumapb)));
  end
    else ReporteRst.Variables['Detalle'] := QuotedStr('correspondiente a ');
  //ReporteRst.Variables['CantPlanes'] := QuotedStr('Cantidad de Planes: ' + trim(floattostr(sumad)));
  ReporteRst.Variables['ElqueSuscribe'] := QuotedStr(trim(fechad.Text));
  ReporteRst.Variables['NroDni'] := QuotedStr(trim(fechah.Text));
  ReporteRst.Variables['NomTitular'] := QuotedStr(descri);
  ReporteRst.Variables['DomTitular'] := QuotedStr(titulo);
  ReporteRst.Variables['CuimTitular'] := QuotedStr(titulo1);
  ReporteRst.Variables['Fecha'] := QuotedStr(FechaActual);
  ReporteRst.Variables['Usuario'] := QuotedStr(Modulo2.Usuario.UsuNombre);
  ReporteRst.Variables['NroUsuario'] := QuotedStr(Modulo2.Usuario.UsuNro);
  ReporteRst.ShowReport;
except
  on E: Exception do EnviarLog(Self.Caption, 'Error en Reporte ' + E.Message);
end;
FreeAndNil(frxDB1);
FreeAndNil(frxDB2);
FreeAndNil(ReporteRst);
FreeAndNil(DtsObjetos);
FreeAndNil(DtsObjetos2);
end;

procedure TAuditoriaPP.PopupMenu1Popup(Sender: TObject);
begin
// Filtrar1.Enabled:=not TITULARES.IsEmpty;
 desactivarfiltro1.Enabled:=not TITULARES.IsEmpty;
 Imprimir1.Enabled:=not TITULARES.IsEmpty;
 ExportaraExcel1.Enabled:=not TITULARES.IsEmpty;
end;

procedure TAuditoriaPP.PorFechas1Click(Sender: TObject);
begin
//labusqueda.Visible:=true;
//label3.Visible:=false;
//combodatos.Visible:=false;
//fechad.SetFocus;
//casos:='0';
end;

procedure TAuditoriaPP.PorTodoslosRubros1Click(Sender: TObject);
begin
DETALLE.Close;
TITULARES.Close;
labusqueda.Visible:=true;
label3.Visible:=true;
label3.Caption:='RUBRO: TODOS LOS RUBROS';
combodatos.Visible:=false;
fechad.SetFocus;
casos:='1';
end;

procedure TAuditoriaPP.PorTodoslosUsuarios1Click(Sender: TObject);
begin
DETALLE.Close;
TITULARES.Close;
labusqueda.Visible:=true;
label3.Visible:=true;
label3.Caption:='USUARIO: TODOS LOS USUARIOS';
combodatos.Visible:=false;
fechad.SetFocus;
casos:='3';
end;

procedure TAuditoriaPP.PorUnRubroEspedifico1Click(Sender: TObject);
begin
DETALLE.Close;
TITULARES.Close;
labusqueda.Visible:=true;
label3.Visible:=true;
label3.Caption:='RUBRO: ';
cargacombos(1);
combodatos.Visible:=true;
fechad.SetFocus;
casos:='2';
end;

procedure TAuditoriaPP.PorUnUsuarioEspecifico1Click(Sender: TObject);
begin
DETALLE.Close;
TITULARES.Close;
labusqueda.Visible:=true;
label3.Visible:=true;
label3.Caption:='USUARIO: ';
cargacombos(2);
combodatos.Visible:=true;
fechad.SetFocus;
casos:='4';
end;

procedure TAuditoriaPP.SALEClick(Sender: TObject);
begin
close;
end;

end.
