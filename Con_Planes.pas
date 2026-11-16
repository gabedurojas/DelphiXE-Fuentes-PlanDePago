unit Con_Planes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Mask, ComCtrls, ExtCtrls,
  DBCtrls, Buttons, JvExButtons, JvBitBtn, Vcl.ToolWin, JvExComCtrls, JvToolBar,
  JvComponentBase, JvEmbeddedForms, RzTabs, JvgGroupBox, JvComCtrls, RzTreeVw, Objetos,
  Vcl.ImgList;

type
  TConsultaPlanes = class(TForm)
    Barra: TStatusBar;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    FormularioEmb: TJvEmbeddedFormLink;
    JvToolBar1: TJvToolBar;
    ToolButton1: TToolButton;
    SALE: TJvBitBtn;
    JvgGroupBox1: TJvgGroupBox;
    Label25: TLabel;
    codobjeto: TEdit;
    numplan: TEdit;
    BUSCAR: TJvBitBtn;
    titular: TEdit;
    Label26: TLabel;
    Label42: TLabel;
    fecplan: TMaskEdit;
    Label12: TLabel;
    DBGrid2: TDBGrid;
    DataSource3: TDataSource;
    PageControl0: TRzPageControl;
    RzTabSheet1: TRzTabSheet;
    RzTabSheet2: TRzTabSheet;
    grupo2: TGroupBox;
    Label47: TLabel;
    Label27: TLabel;
    ESTADOS: TComboBox;
    OBSERV: TEdit;
    ASIGNA: TJvBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    PageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    Arbol: TRzTreeView;
    TabSheet7: TRzTabSheet;
    DBGrid1: TDBGrid;
    TabSheet8: TRzTabSheet;
    DBGrid3: TDBGrid;
    ImageList1: TImageList;
    GroupBox2: TGroupBox;
    Shape3: TShape;
    Shape2: TShape;
    Label43: TLabel;
    Label3: TLabel;
    TabSheet2: TRzTabSheet;
    grilla1: TStringGrid;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Shape1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Coloca1(nro:byte);
    procedure Limpiar(nro:byte);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure ESTADOSKeyPress(Sender: TObject; var Key: Char);
    procedure FECHA1KeyPress(Sender: TObject; var Key: Char);
    procedure ESTADOSExit(Sender: TObject);
    procedure OBSERVKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ASIGNAClick(Sender: TObject);
    procedure SALEClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageControl1Change(Sender: TObject);
    procedure ColocaCombo(nro:byte);
    procedure BUSCARClick(Sender: TObject);
    procedure PageControl0Change(Sender: TObject);
    procedure numplanKeyPress(Sender: TObject; var Key: Char);
    procedure codobjetoKeyPress(Sender: TObject; var Key: Char);
    procedure titularKeyPress(Sender: TObject; var Key: Char);
    procedure fecplanKeyPress(Sender: TObject; var Key: Char);
    procedure fecplanExit(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    gh:boolean;
    DataSet1,DataSet2,DataSet3,PLANES,OBJETOS,ESTADCUENTA:TADODataSet;
    Com1:TADOCommand;
    sumad,suma:double;
    idpag,ctadeuda,ctanodeuda:integer;
    FechaActual,estado,nroplan:string;
    IdCombo:Array of string;{ Private declarations }
  public
  Recibo:TRecibo;
    { Public declarations }
  end;

var
  ConsultaPlanes: TConsultaPlanes;

implementation

uses modulo, Unidad;

{$R *.dfm}
procedure TConsultaPlanes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Modulo2.LiberarCombo(ESTADOS);
FreeAndNil(PLANES);
FreeAndNil(OBJETOS);
FreeAndNil(ESTADCUENTA);
FreeAndNil(DataSet1);
FreeAndNil(DataSet2);
FreeAndNil(DataSet3);
FreeAndNil(Self);
end;

procedure TConsultaPlanes.FormCreate(Sender: TObject);
begin
Recibo:=TRecibo.Create;
DataSet1:=TADODataSet.Create(nil);
DataSet2:=TADODataSet.Create(nil);
DataSet3:=TADODataSet.Create(nil);
PLANES:=TADODataSet.Create(nil);
OBJETOS:=TADODataSet.Create(nil);
ESTADCUENTA:=TADODataSet.Create(nil);
gh:=false;
end;

procedure TConsultaPlanes.FormActivate(Sender: TObject);
begin
 if not gh then begin
  PageControl0.Pages[1].TabVisible:=false;
  ColocaCombo(1);
  if Modulo2.ObtenerNivelAcceso('152') = 1 then grupo2.Enabled:=true;
  FechaActual:=strcut(Fec_System(),10);
  PageControl0.ActivePage:=PageControl0.Pages[0];
  PageControl1.ActivePage:=PageControl1.Pages[0];
  grilla1.Cells[0,0]:='TipoTitular';
  grilla1.Cells[1,0]:='Apellido y Nombre';
  numplan.SetFocus;
 end;
end;

procedure TConsultaPlanes.Limpiar(nro:byte);
var b,t:integer;
begin
  if nro = 1 then begin
    PageControl0.Pages[1].TabVisible:=false;
    ColocaCombo(1);
    if Modulo2.ObtenerNivelAcceso('152') = 1 then grupo2.Enabled:=true;
    FechaActual:=strcut(Fec_System(),10);
    PageControl0.ActivePage:=PageControl0.Pages[0];
    PageControl1.ActivePage:=PageControl1.Pages[0];
    for b:=0 to grilla1.ColCount-1 do
      for t:=1 to grilla1.RowCount-1 do  grilla1.Cells[b,t]:='';
     grilla1.RowCount:=2;
    numplan.SetFocus;
  end;
end;

procedure TConsultaPlanes.ColocaCombo(nro:byte);
var t,b:integer;
var ty,tot,tot1,tot2,tot3:real;
begin
  if nro=1 then Modulo2.CargaCombo(ESTADOS,'SELECT Detalle,Id FROM TipoEstado ORDER BY Detalle',Modulo2.Sistema.ConectDb, false);
end;

procedure TConsultaPlanes.BUSCARClick(Sender: TObject);
begin
Coloca1(4)
end;

procedure TConsultaPlanes.numplanKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then begin
  Key := #0;
  CODOBJETO.SetFocus
  end
 else begin
   if ( StrScan('0123456789',Key) <> nil ) or  ( Key = Char(VK_BACK) ) then
   else Key := #0;
 end;
end;

procedure TConsultaPlanes.Coloca1(nro:byte);
var param:string;
    Comando:widestring;
    DataSet1, DataSet2:TADODataSet;
    Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Nivel6:TTreeNode;
    t,y,b,i:integer;
    Cnx2:TADOConnection;
begin
sumad:=0;
suma:=0;
ctadeuda:=0;
ctanodeuda:=0;
label6.Caption:='0';
label7.Caption:='0';

Cnx2:=TADOConnection.Create(nil);
Cnx2.LoginPrompt:=false;
if nro = 0 then begin
  Cnx2.ConnectionString:=Modulo2.Sistema.ConectDb;
  DataSet3.Connection:=Cnx2;
  DataSet3.Close;
  DataSet3.CommandText:='SELECT Id, IdTipoEstado, Detalle, Fecha, Activo,NroUsuario, Observaciones  '
     + 'FROM dbo.Fn_PlanPagoEstado(' + PLANES.FieldByName('NroPlan').AsString + ') where activo=1';
  DataSet3.Open;
  estado:=DataSet3.FieldByName('Detalle').AsString;
  label2.Caption:=estado;
end;
if nro = 1 then begin
  Cnx2.ConnectionString:=Modulo2.Sistema.ConectDb;
  Arbol.Items.Clear;
  Arbol.Items.Add(nil,'DATOS DEL PLAN');
  Arbol.Items[0].ImageIndex:=3;
  Arbol.Items[0].SelectedIndex:=3;
  Nivel1:=Arbol.Items.AddChild(Arbol.Items[0],'N° Plan: ' + PLANES.FieldByName('NroPlan').AsString);
  Nivel1.ImageIndex:=-1;Nivel1.SelectedIndex:=-1;
  Nivel1:=Arbol.Items.AddChild(Arbol.Items[0],'Titular: ' + PLANES.FieldByName('Contribuyente').AsString);
  Nivel1.ImageIndex:=-1;Nivel1.SelectedIndex:=-1;
  Nivel1:=Arbol.Items.AddChild(Arbol.Items[0],'Fecha Plan: ' + PLANES.FieldByName('FechaCarga').AsString);
  Nivel1.ImageIndex:=-1;Nivel1.SelectedIndex:=-1;
  Nivel1:=Arbol.Items.AddChild(Arbol.Items[0],'Cant. Cuotas: ' + PLANES.FieldByName('CantCuotas').AsString);
  Nivel1.ImageIndex:=-1;Nivel1.SelectedIndex:=-1;
  Nivel1:=Arbol.Items.AddChild(Arbol.Items[0],'Imp. Cuota: ' + PLANES.FieldByName('ImporteCuota').AsString);
  Nivel1.ImageIndex:=-1;Nivel1.SelectedIndex:=-1;
  Nivel1:=Arbol.Items.AddChild(Arbol.Items[0],'1er. Vto.: ' + PLANES.FieldByName('PrimerVto').AsString);
  Nivel1.ImageIndex:=-1;Nivel1.SelectedIndex:=-1;
  Nivel1:=Arbol.Items.AddChild(Arbol.Items[0],'Ult. Vto.: ' + PLANES.FieldByName('UltimoVto').AsString);
  Nivel1.ImageIndex:=-1;Nivel1.SelectedIndex:=-1;

  Nivel1:=Arbol.Items.Add(Arbol.Items[0],'Contribuyentes');
  Nivel1.ImageIndex:=1;Nivel1.SelectedIndex:=1;
  try
    DataSet2:=TADODataSet.Create(nil);
    DataSet2.Connection:=Cnx2;
    DataSet1:=TADODataSet.Create(nil);
    DataSet1.Connection:=Cnx2;
    DataSet1.CommandText:='SELECT Id, Cuim, Contribuyente, TipoContribuyente, '
    + 'Provincia, Barrio, Calle, Altura, Piso, Depto, Manzana, Casa, Torre, Sector, '
    + 'Parcela, LoteRural, Telefono, Domicilio, Dni, TipoDoc FROM dbo.Fn_PlanPagoContribuyente('
    + PLANES.FieldByName('NroPlan').AsString + ', NULL)';
    DataSet1.Open;
    for b:=0 to grilla1.ColCount-1 do
      for t:=1 to grilla1.RowCount-1 do  grilla1.Cells[b,t]:='';
      grilla1.RowCount:=2;
      for t:=1 to DataSet1.RecordCount do begin
        DataSet1.RecNo:=t;
        grilla1.RowCount:=t+1;
        grilla1.Cells[0,t]:=DataSet1.FieldByName('TipoContribuyente').AsString ;
        grilla1.Cells[1,t]:=DataSet1.FieldByName('Contribuyente').AsString;
        Nivel2:=Arbol.Items.AddChild(Nivel1,DataSet1.FieldByName('TipoContribuyente').AsString + ' -> ' + DataSet1.FieldByName('Contribuyente').AsString);
        Nivel2.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
        Nivel3:=Arbol.Items.AddChild(Nivel2,'N° Cuim: ' + DataSet1.FieldByName('Cuim').AsString);
        Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
        Nivel3:=Arbol.Items.AddChild(Nivel2,'TipoDoc: ' + DataSet1.FieldByName('TipoDoc').AsString);
        Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
        Nivel3:=Arbol.Items.AddChild(Nivel2,'N° Dni: ' + DataSet1.FieldByName('Dni').AsString);
        Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
        Nivel3:=Arbol.Items.AddChild(Nivel2,'Provincia: ' + DataSet1.FieldByName('Provincia').AsString);
        Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
        Nivel3:=Arbol.Items.AddChild(Nivel2,'Barrio: ' + DataSet1.FieldByName('Barrio').AsString);
        Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
        Nivel3:=Arbol.Items.AddChild(Nivel2,'Calle: ' + DataSet1.FieldByName('Calle').AsString);
        Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
        Nivel3:=Arbol.Items.AddChild(Nivel2,'Altura: ' + DataSet1.FieldByName('Altura').AsString);
        Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
        Nivel3:=Arbol.Items.AddChild(Nivel2,'Piso: ' + DataSet1.FieldByName('Piso').AsString);
        Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
        Nivel3:=Arbol.Items.AddChild(Nivel2,'Depto: ' + DataSet1.FieldByName('Depto').AsString);
        Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
        Nivel3:=Arbol.Items.AddChild(Nivel2,'Manzana: ' + DataSet1.FieldByName('Manzana').AsString);
        Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
        Nivel3:=Arbol.Items.AddChild(Nivel2,'Casa: ' + DataSet1.FieldByName('Casa').AsString);
        Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
        Nivel3:=Arbol.Items.AddChild(Nivel2,'Torre: ' + DataSet1.FieldByName('Torre').AsString);
        Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
        Nivel3:=Arbol.Items.AddChild(Nivel2,'Sector: ' + DataSet1.FieldByName('Sector').AsString);
        Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
        Nivel3:=Arbol.Items.AddChild(Nivel2,'Parcela: ' + DataSet1.FieldByName('Parcela').AsString);
        Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
        Nivel3:=Arbol.Items.AddChild(Nivel2,'LoteRural: ' + DataSet1.FieldByName('LoteRural').AsString);
        Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
        Nivel3:=Arbol.Items.AddChild(Nivel2,'Domicilio: ' + DataSet1.FieldByName('Domicilio').AsString);
        Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
        Nivel3:=Arbol.Items.AddChild(Nivel2,'N° Telefono: ' + DataSet1.FieldByName('Telefono').AsString);
        Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
      end;

    Nivel1:=Arbol.Items.Add(Arbol.Items[0],'Estados');
    Nivel1.ImageIndex:=9;
    Nivel1.SelectedIndex:=9;
    DataSet1.Close;
    DataSet1.CommandText:='SELECT Id, IdTipoEstado, Detalle, Fecha, Activo,NroUsuario, Observaciones  '
      + 'FROM dbo.Fn_PlanPagoEstado(' + PLANES.FieldByName('NroPlan').AsString + ')';
    DataSet1.Open;
    for t:=1 to DataSet1.RecordCount do begin
      DataSet1.RecNo:=t;
      Nivel2:=Arbol.Items.AddChild(Nivel1,DataSet1.FieldByName('Detalle').AsString);
      if DataSet1.FieldByName('Activo').AsBoolean then begin
        Nivel2.ImageIndex:=17;
        Nivel2.SelectedIndex:=17;
      end
      else begin
        Nivel2.ImageIndex:=15;
        Nivel2.SelectedIndex:=15;
      end;
      Nivel3:=Arbol.Items.AddChild(Nivel2,'Fecha: ' + DataSet1.FieldByName('Fecha').AsString);
      Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
      Nivel3:=Arbol.Items.AddChild(Nivel2,'NroUsuario: ' + DataSet1.FieldByName('NroUsuario').AsString);
      Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
      Nivel3:=Arbol.Items.AddChild(Nivel2,'Observaciones: ' + DataSet1.FieldByName('Observaciones').AsString);
      Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
    end;

    Nivel1:=Arbol.Items.Add(Arbol.Items[0],'Objetos');
    Nivel1.ImageIndex:=11;
    Nivel1.SelectedIndex:=11;
    DataSet1.Close;
    param:='';
    DataSet1.CommandText:='SELECT Id, Identificador, IdSubRubro, Objeto, DetalleObjeto, '
    + 'Rubro FROM dbo.Fn_PlanPagoObjeto(' + PLANES.FieldByName('NroPlan').AsString + ')';
    DataSet1.Open;
    for t:=1 to DataSet1.RecordCount do begin
      DataSet1.RecNo:=t;
      if param <> DataSet1.FieldByName('IdSubRubro').AsString then begin
        Nivel2:=Arbol.Items.AddChild(Nivel1,DataSet1.FieldByName('IdSubRubro').AsString + ' - ' + DataSet1.FieldByName('Rubro').AsString);
        param:=DataSet1.FieldByName('IdSubRubro').AsString;
      end;
      Nivel3:=Arbol.Items.AddChild(Nivel2,'Objeto: ' + DataSet1.FieldByName('Objeto').AsString);
      Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
      Nivel4:=Arbol.Items.AddChild(Nivel3,'Identificador: ' + DataSet1.FieldByName('Identificador').AsString);
      Nivel4.ImageIndex:=-1;Nivel4.SelectedIndex:=-1;
      Nivel4:=Arbol.Items.AddChild(Nivel3,'DetalleObjeto: ' + DataSet1.FieldByName('DetalleObjeto').AsString);
      Nivel4.ImageIndex:=-1;Nivel4.SelectedIndex:=-1;

      Nivel4:=Arbol.Items.AddChild(Nivel3,'Periodos Adeudados');
      Nivel4.ImageIndex:=5;
      Nivel4.SelectedIndex:=5;
      DataSet2.CommandText:='SELECT Id, Periodo, convert(varchar(10),FechaVencimiento,103) as FechaVencimiento, '
      + 'Capital, Interes, SubTotal, PorcientoDescuento, TotalDescuento, TotalPeriodo FROM dbo.PlanPagoObjetoPeriodo '
      + 'WHERE (IdPlanObjeto = ' +  DataSet1.FieldByName('Id').AsString + ') Order by Periodo';
      DataSet2.Open;
      for y:=1 to DataSet2.RecordCount do begin
       DataSet2.RecNo:=y;
       Nivel5:=Arbol.Items.AddChild(Nivel4,DataSet2.FieldByName('Periodo').AsString + ' -> ' + DataSet2.FieldByName('FechaVencimiento').AsString);
       Nivel5.ImageIndex:=-1;Nivel5.SelectedIndex:=-1;
       Nivel6:=Arbol.Items.AddChild(Nivel5,'Capital: ' + DataSet2.FieldByName('Capital').AsString);
       Nivel6.ImageIndex:=-1;Nivel6.SelectedIndex:=-1;
       Nivel6:=Arbol.Items.AddChild(Nivel5,'Interes: ' + DataSet2.FieldByName('Interes').AsString);
       Nivel6.ImageIndex:=-1;Nivel6.SelectedIndex:=-1;
       Nivel6:=Arbol.Items.AddChild(Nivel5,'SubTotal: ' + DataSet2.FieldByName('SubTotal').AsString);
       Nivel6.ImageIndex:=-1;Nivel6.SelectedIndex:=-1;
       Nivel6:=Arbol.Items.AddChild(Nivel5,'PorcientoDescuento: ' + DataSet2.FieldByName('PorcientoDescuento').AsString);
       Nivel6.ImageIndex:=-1;Nivel6.SelectedIndex:=-1;
       Nivel6:=Arbol.Items.AddChild(Nivel5,'TotalDescuento: ' + DataSet2.FieldByName('TotalDescuento').AsString);
       Nivel6.ImageIndex:=-1;Nivel6.SelectedIndex:=-1;
       Nivel6:=Arbol.Items.AddChild(Nivel5,'TotalPeriodo: ' + DataSet2.FieldByName('TotalPeriodo').AsString);
       Nivel6.ImageIndex:=-1;Nivel6.SelectedIndex:=-1;
      end;
      DataSet2.Close;
    end;
    DataSet1.Close;
    DataSet1.Connection:=nil;
    DataSet2.Connection:=nil;
  except
    on E: Exception do begin
      EnviarLog(Self.Caption, E.Message);
      EnviarLog(Self.Caption, comando);
    end;
  end;
  FreeAndNil(DataSet1);
end;
if nro =2 then begin
  Cnx2.ConnectionString:=Modulo2.Sistema.ConectDb;
  OBJETOS.Close;
  DataSource1.DataSet:=OBJETOS;
  OBJETOS.Connection:=Cnx2;
  OBJETOS.CommandText:='SELECT * FROM Fn_VLosPlanesdePagosObjetosPeriodos (' + PLANES.FieldByName('NroPlan').AsString +')';
  OBJETOS.Open;
  OBJETOS.Connection:=nil;
end;
if nro =3 then begin
  Cnx2.ConnectionString:=Modulo2.Sistema.ConectUsu;
  ESTADCUENTA.Close;
  DataSource3.DataSet:=ESTADCUENTA;
  ESTADCUENTA.Connection:=Cnx2;
  ESTADCUENTA.CommandText:='SELECT * FROM EstadoCuentaPlanPago (GETDATE(),' + PLANES.FieldByName('NroPlan').AsString +')';
  ESTADCUENTA.Open;
  ESTADCUENTA.Connection:=nil;

  /// recorro la grilla y sumamos las cuotas vencidas y con deuda
  try
    DBGrid3.datasource.dataset.disablecontrols;
    DBGrid3.datasource.dataset.first;
    while not DBGrid3.datasource.dataset.eof do begin
      if (trim(DBGrid3.Fields[6].Value)='DEUDA') and
        (trim(DBGrid3.Fields[11].Value)='VENCIDO') then begin
        sumad := sumad + DBGrid3.datasource.dataset.fieldbyname('totalcuota').asfloat;
        ctadeuda:=ctadeuda + 1;
        label6.Caption:=inttostr(ctadeuda) + ' por un Total de $ ' + floattostr(sumad);;
      end;
      DBGrid3.datasource.dataset.next;
    end;
  finally
    DBGrid3.datasource.dataset.enablecontrols;
  end;

  /// recorro la grilla y sumamos las cuotas NO vencidas y con deudas
  try
    DBGrid3.datasource.dataset.disablecontrols;
    DBGrid3.datasource.dataset.first;
    while not DBGrid3.datasource.dataset.eof do begin
      if (trim(DBGrid3.Fields[6].Value)='DEUDA')  and
        (trim(DBGrid3.Fields[11].Value)='SIN VENCER') then begin
        suma := suma + DBGrid3.datasource.dataset.fieldbyname('totalcuota').asfloat;
        ctanodeuda:=ctanodeuda+1;
        label7.Caption:=inttostr(ctanodeuda) + ' por un Total de $ ' + floattostr(suma);
      end;
      DBGrid3.datasource.dataset.next;
    end;
  finally
    DBGrid3.datasource.dataset.enablecontrols;
  end;

end;
if nro = 4 then begin
  Cnx2.ConnectionString:=Modulo2.Sistema.ConectDb;
  try
    PLANES.Close;
    if trim(numplan.Text) <> '' then comando:=trim(numplan.Text)
     else comando:='null';
    if trim(titular.Text) <> '' then comando:= comando +  ' , ' + chr(39) + trim(titular.Text) + chr(39)
     else comando:=comando + ' , null';
    if trim(fecplan.Text) <> '/  /' then comando:=comando + ' , ' + chr(39) + trim(fecplan.Text) + chr(39)
     else comando:=comando + ' , null';
    DataSource2.DataSet:=PLANES;
    PLANES.Connection:=Cnx2;
    PLANES.CommandText:='SELECT NroPlan, Contribuyente, TipoContribuyente, CantCuotas, '
    + 'ImporteCuota, IdTipoContribuyente, Estado, ParaImpresion, IdTipoEstado, NroCuim, '
    + 'FechaCarga, PrimerVto, UltimoVto FROM dbo.Fn_PlanPago(' + comando + ') ';
    PLANES.Open;
    if not PLANES.IsEmpty then begin
      Barra.Panels[1].Text:='Cant. Registros: ' + IntToStr(PLANES.RecordCount);
    end
    else begin
      messagedlg('Atencion no existen resultados de la busqueda, por favor ingrese otro valor',mtWarning,[mbok],0);
      numplan.SetFocus;
    end;
    PLANES.Connection:=nil;
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

procedure TConsultaPlanes.DBGrid2CellClick(Column: TColumn);
begin
 if trim(DBGrid2.Fields[0].Text) <> ''  then begin
  if trim(DBGrid2.Fields[8].Text) = '1'  then begin
    messagedlg('ATENCION, este Plan seleccionado esta de ''BAJA'', Imposible su Modificación de Estado...'
     + chr(13) + 'Por favor busque realice otra busqueda...',mtInformation,[mbok],0);
    numplan.SetFocus;
  end
  else begin
   if (trim(DBGrid2.Fields[8].Text) = '4') or (trim(DBGrid2.Fields[8].Text) = '6')  then begin
     messagedlg('ATENCION, este Plan seleccionado esta ''CANCELADO'', Imposible su Modificación de Estado...'
      + chr(13) + 'Por favor busque realice otra busqueda...',mtInformation,[mbok],0);
     numplan.SetFocus;
   end
   else begin
     Coloca1(0);
     Coloca1(1);
     Coloca1(2);
     Coloca1(3);
     PageControl0.Pages[1].TabVisible:=true;
     PageControl0.ActivePage:=PageControl0.Pages[1];
     PageControl1.ActivePage:=PageControl1.Pages[2];
     observ.Clear;
     estados.ItemIndex:=0;
     ESTADOS.SetFocus;
   end;
  end;
 end;
end;

procedure TConsultaPlanes.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var t:byte;
begin
  if trim(DBGrid2.Fields[8].Text) = '3' then t:=1
  else t:=2;
  case t of
   1:begin
     DBGrid2.Canvas.Brush.Color:=clLime;
     DBGrid2.Canvas.FillRect(Rect);
     DBGrid2.Canvas.Font.Color:= clBlack;
   end;
   2:begin
     DBGrid2.Canvas.Brush.Color:=clWindow;
     DBGrid2.Canvas.FillRect(Rect);
     DBGrid2.Canvas.Font.Color:= clBlack;
   end;
  end;
  DBGrid2.DefaultDrawColumnCell(Rect,Datacol,Column,State);
end;

procedure TConsultaPlanes.SALEClick(Sender: TObject);
begin
Close;
end;

procedure TConsultaPlanes.titularKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  FECPLAN.SetFocus;
end
else begin
  if ( StrScan('0123456789abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ%. /°-',Key) <> nil ) or
      ( Key = Char(VK_BACK) ) then
   else Key := #0;
end;
end;

procedure TConsultaPlanes.ESTADOSKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then begin
  OBSERV.SetFocus;
end;                                                          
end;

procedure TConsultaPlanes.FECHA1KeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then begin
 OBSERV.SetFocus;
end;  
end;

procedure TConsultaPlanes.fecplanExit(Sender: TObject);
var kl:Tdatetime;
begin
{try
  kl:=strtodate(trim(fecplan.Text));
except
  messagedlg('La Fecha Ingresada No es Válida',mterror,[mbok],0);
  fecplan.SetFocus;
end; }
end;

procedure TConsultaPlanes.fecplanKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  BUSCAR.SetFocus;
end;
end;

procedure TConsultaPlanes.ESTADOSExit(Sender: TObject);
begin
if ESTADOS.ItemIndex < 0 then begin
  messagedlg('Debe seleccionar un Tipo de Estado válido',mtError,[mbok],0);
  ESTADOS.SetFocus;
end;
end;

procedure TConsultaPlanes.OBSERVKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then begin
  if ASIGNA.Enabled = true then ASIGNA.SetFocus;
end;
end;

procedure TConsultaPlanes.PageControl0Change(Sender: TObject);
begin
  if PageControl0.ActivePageIndex = 1 then begin
   estados.SetFocus;
  end;
end;

procedure TConsultaPlanes.PageControl1Change(Sender: TObject);
begin
//if PC1.ActivePageIndex = 1 then CUOTAS.SetFocus;
end;

procedure TConsultaPlanes.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var t:byte;
begin
if (trim(DBGrid3.Fields[6].Text) = 'DEUDA') and (trim(DBGrid3.Fields[11].Text) = 'VENCIDO') then t:=1
 else  t:=2;
  case t of
   1:begin
     DBGrid3.Canvas.Brush.Color:=clLime;
     DBGrid3.Canvas.FillRect(Rect);
     DBGrid3.Canvas.Font.Color:= clBlack;
   end;
   2:begin
     DBGrid3.Canvas.Brush.Color:=clWindow;
     DBGrid3.Canvas.FillRect(Rect);
     DBGrid3.Canvas.Font.Color:= clBlack;
   end;
  end;
  DBGrid3.DefaultDrawColumnCell(Rect,Datacol,Column,State);
end;

procedure TConsultaPlanes.ASIGNAClick(Sender: TObject);
var gf:integer;
var txt:string;
    comando:widestring;
    Cnx2:TADOConnection;
begin
gf:=messagedlg('Confirma el Cambio de Estado del Plan de Pago Seleccionado?'
    ,mtWarning,[mbok,mbCancel],0);
if gf = 1 then begin
  if (trim(estados.Text)='CANCELADO') or (trim(estados.Text)='CANCELACION AUTOMATICA') then  begin
  // if ((estados.ItemIndex=2) or (estados.ItemIndex=3)) then begin
    if sumad > 0 then begin
      messagedlg('Imposible Asignar este Estado, por encontrarse el Plan con ' + inttostr(ctadeuda) + ' CUOTAS DEUDORAS por un Importe Total de $' + floattostr(sumad) ,mtError,[mbok],0);
      ESTADOS.SetFocus;
    end
    else begin
      if suma > 0 then begin
        messagedlg('Imposible Asignar este Estado, por encontrarse el Plan con ' + inttostr(ctanodeuda) + ' CUOTAS Impagas por un Importe Total de $' + floattostr(suma) ,mtError,[mbok],0);
        ESTADOS.SetFocus;
      end
      else begin
       try
         Cnx2:=TADOConnection.Create(nil);
         Cnx2.LoginPrompt:=false;
         Cnx2.ConnectionString:=Modulo2.Sistema.ConectDb;
         Com1:=TADOCommand.Create(nil);
         Com1.Connection:=Cnx2;
         Com1.CommandText:='UPDATE PlanPagoEstado SET Activo=0 WHERE (NroPlan=' + trim(PLANES.FieldByName('NroPlan').AsString) + ');';
         Com1.Execute;
         comando:='SPA_PlanPagoEstado '
         + trim(PLANES.FieldByName('NroPlan').AsString) + ' , '
         + TComboClase(ESTADOS.Items.Objects[ESTADOS.ItemIndex]).Param1 + ' ,'
         + chr(39) + trim(observ.Text) + chr(39)  + ' , '
         + modulo2.Usuario.UsuNro + ' , '
         + chr(39) + modulo2.Sistema.MyHost + chr(39) + ' , '
         + chr(39) + modulo2.Sistema.MyIP + chr(39);
         Com1.CommandText:=comando;
         Com1.Execute;
         messagedlg('Estado del Plan Modificado correctamente!',mtConfirmation,[mbok],0);
         Limpiar(1);
       except
         messagedlg('Error a la Modificar el estado de este Plan de Pago...!',mtError,[mbok],0);
       end;
       FreeAndNil(Com1);
       FreeAndNil(Cnx2);
     end;
   end;
  end
  else begin
    try
      Cnx2:=TADOConnection.Create(nil);
      Cnx2.LoginPrompt:=false;
      Cnx2.ConnectionString:=Modulo2.Sistema.ConectDb;
      Com1:=TADOCommand.Create(nil);
      Com1.Connection:=Cnx2;
      Com1.CommandText:='UPDATE PlanPagoEstado SET Activo=0 WHERE (NroPlan=' + trim(PLANES.FieldByName('NroPlan').AsString) + ');';
      Com1.Execute;
      comando:='SPA_PlanPagoEstado '
      + trim(PLANES.FieldByName('NroPlan').AsString) + ' , '
      + TComboClase(ESTADOS.Items.Objects[ESTADOS.ItemIndex]).Param1 + ' ,'
      + chr(39) + trim(observ.Text) + chr(39)  + ' , '
      + modulo2.Usuario.UsuNro + ' , '
      + chr(39) + modulo2.Sistema.MyHost + chr(39) + ' , '
      + chr(39) + modulo2.Sistema.MyIP + chr(39);
      Com1.CommandText:=comando;
      Com1.Execute;
      messagedlg('Estado del Plan Modificado correctamente!',mtConfirmation,[mbok],0);
      Limpiar(1);
    except
      messagedlg('Error a la Modificar el estado de este Plan de Pago...!',mtError,[mbok],0);
    end;
    FreeAndNil(Com1);
    Cnx2.Close;
    FreeAndNil(Cnx2);
  end;
end;
end;

procedure TConsultaPlanes.codobjetoKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  TITULAR.SetFocus;
end;
end;

end.
