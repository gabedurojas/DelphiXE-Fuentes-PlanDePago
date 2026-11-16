unit Canc_Objetos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Mask, ComCtrls, ExtCtrls,
  DBCtrls, Buttons, JvExButtons, JvBitBtn, Vcl.ToolWin, JvExComCtrls, JvToolBar,
  JvComponentBase, JvEmbeddedForms, RzTabs, JvgGroupBox, JvComCtrls, RzTreeVw, Objetos,
  Vcl.ImgList, RzEdit, JvExDBGrids, JvDBGrid;

type
  TCancelaObjetos = class(TForm)
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
    PageControl0: TRzPageControl;
    RzTabSheet1: TRzTabSheet;
    RzTabSheet2: TRzTabSheet;
    PageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet8: TRzTabSheet;
    ImageList1: TImageList;
    JvgGroupBox2: TJvgGroupBox;
    JvgGroupBox3: TJvgGroupBox;
    Label15: TLabel;
    TOTAL: TRzNumericEdit;
    CALCULAR: TJvBitBtn;
    ReciboBtn: TJvBitBtn;
    Arbol: TRzTreeView;
    JvDBGrid1: TJvDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Coloca1(nro:byte);
    procedure Limpiar(nro:byte);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure SALEClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageControl1Change(Sender: TObject);
    procedure ColocaCombo(nro:byte);
    procedure BUSCARClick(Sender: TObject);
    procedure numplanKeyPress(Sender: TObject; var Key: Char);
    procedure codobjetoKeyPress(Sender: TObject; var Key: Char);
    procedure titularKeyPress(Sender: TObject; var Key: Char);
    procedure fecplanKeyPress(Sender: TObject; var Key: Char);
    procedure fecplanExit(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure CALCULARClick(Sender: TObject);
  private
    gh:boolean;
    DataSet1,PLANES,OBJETOS:TADODataSet;
    Com1:TADOCommand;
    idpag:integer;
    FechaActual,estado,nroplan:string;
    CantCuotas:integer;
    IdCombo:Array of string;{ Private declarations }
  public
  Recibo:TRecibo;
    { Public declarations }
  end;

var
  CancelaObjetos: TCancelaObjetos;

implementation

uses modulo, Unidad;

{$R *.dfm}
procedure TCancelaObjetos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FreeAndNil(PLANES);
FreeAndNil(OBJETOS);
FreeAndNil(Self);
end;

procedure TCancelaObjetos.FormCreate(Sender: TObject);
begin
Recibo:=TRecibo.Create;
PLANES:=TADODataSet.Create(nil);
OBJETOS:=TADODataSet.Create(nil);
gh:=false;
end;

procedure TCancelaObjetos.FormActivate(Sender: TObject);
begin
if not gh then begin
  PageControl0.Pages[1].TabVisible:=false;
  ColocaCombo(1);

  FechaActual:=strcut(Fec_System(),10);
  PageControl0.ActivePage:=PageControl0.Pages[0];
  PageControl1.ActivePage:=PageControl1.Pages[0];

  numplan.SetFocus;
end;
end;

procedure TCancelaObjetos.Limpiar(nro:byte);
var b,t:integer;
begin
  if nro = 1 then begin
    PageControl0.Pages[1].TabVisible:=false;
    ColocaCombo(1);
    FechaActual:=strcut(Fec_System(),10);
    PageControl0.ActivePage:=PageControl0.Pages[0];
    PageControl1.ActivePage:=PageControl1.Pages[0];
    numplan.SetFocus;
  end;
end;


procedure TCancelaObjetos.ColocaCombo(nro:byte);
var t,b:integer;
var ty,tot,tot1,tot2,tot3:real;
begin
//  if nro=1 then Modulo2.CargaCombo(ESTADOS,'SELECT Detalle,Id FROM TipoEstado ORDER BY Detalle',Modulo2.Sistema.ConectDb, false);
end;

procedure TCancelaObjetos.BUSCARClick(Sender: TObject);
var param:string;
    Comando,txt:widestring;
begin
Modulo2.ObjConexion:=TADOConnection.Create(nil);
Modulo2.ObjConexion.LoginPrompt:=false;
Modulo2.ObjConexion.ConnectionString:=Modulo2.Sistema.ConectDb;
  try
    PLANES.Close;
    if trim(numplan.Text) <> '' then comando:=trim(numplan.Text)
     else comando:='null';
    if trim(titular.Text) <> '' then comando:= comando +  ' , ' + chr(39) + trim(titular.Text) + chr(39)
     else comando:=comando + ' , null';
    if trim(fecplan.Text) <> '/  /' then comando:=comando + ' , ' + chr(39) + trim(fecplan.Text) + chr(39)
     else comando:=comando + ' , null';
    DataSource2.DataSet:=PLANES;
    PLANES.Connection:=Modulo2.ObjConexion;
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
Modulo2.ObjConexion.Close;
FreeAndNil(Modulo2.ObjConexion);
end;

procedure TCancelaObjetos.numplanKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  CODOBJETO.SetFocus
end
else begin
  if ( StrScan('0123456789',Key) <> nil ) or
     ( Key = Char(VK_BACK) ) then
  else Key := #0;
end;
//if key = chr(13) then jvbitbtn1.SetFocus;
end;

procedure TCancelaObjetos.Coloca1(nro:byte);
var param:string;
    Comando:widestring;
    DataSet1, DataSet2:TADODataSet;
    Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Nivel6:TTreeNode;
    t,y,b:integer;
begin
if nro = 0 then begin
  Modulo2.ObjConexion:=TADOConnection.Create(nil);
  Modulo2.ObjConexion.LoginPrompt:=false;
  Modulo2.ObjConexion.ConnectionString:=Modulo2.Sistema.ConectDb;
  DataSet1:=TADODataSet.Create(nil);
  DataSet1.Connection:=Modulo2.ObjConexion;
  DataSet1.CommandText:='SELECT IdTipoEstado FROM dbo.Fn_PlanPagoEstado(' + PLANES.FieldByName('NroPlan').AsString + ') where activo=1';
  DataSet1.Open;
  estado:=DataSet1.FieldByName('IdTipoEstado').AsString;
  DataSet1.Close;
  FreeAndNil(DataSet1);
  //label2.Caption:=estado;
end;
if nro = 1 then begin
  Modulo2.ObjConexion:=TADOConnection.Create(nil);
  Modulo2.ObjConexion.LoginPrompt:=false;
  Modulo2.ObjConexion.ConnectionString:=Modulo2.Sistema.ConectDb;

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

    DataSet1:=TADODataSet.Create(nil);
    DataSet1.Connection:=Modulo2.ObjConexion;
    DataSet1.CommandText:='SELECT Id, Cuim, Contribuyente, TipoContribuyente, '
    + 'Provincia, Barrio, Calle, Altura, Piso, Depto, Manzana, Casa, Torre, Sector, '
    + 'Parcela, LoteRural, Telefono, Domicilio, Dni, TipoDoc FROM dbo.Fn_PlanPagoContribuyente('
    + PLANES.FieldByName('NroPlan').AsString + ', NULL)';
    DataSet1.Open;

      for t:=1 to DataSet1.RecordCount do begin
        DataSet1.RecNo:=t;
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
    //estado:=DataSet1.FieldByName('Detalle').AsString;
    //label2.Caption:=estado;
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
    DataSet1.Close;
  except
    on E: Exception do begin
      EnviarLog(Self.Caption, E.Message);
      EnviarLog(Self.Caption, comando);
    end;
  end;
  FreeAndNil(DataSet1);
end;
if nro =2 then begin
  Modulo2.ObjConexion:=TADOConnection.Create(nil);
  Modulo2.ObjConexion.LoginPrompt:=false;
  Modulo2.ObjConexion.ConnectionString:=Modulo2.Sistema.ConectDb;
  OBJETOS.Close;
  DataSource1.DataSet:=OBJETOS;
  OBJETOS.Connection:=Modulo2.ObjConexion;
  OBJETOS.CommandText:='SELECT Id, Rubro, CodigoObjeto, Identificador, FechaCarga, '
  + 'Cancelado FROM dbo.Fn_PlanPagoObjetoCancel(' + PLANES.FieldByName('NroPlan').AsString +')';
  OBJETOS.Open;
  OBJETOS.Connection:=nil;
end;
if nro = 3 then begin
  Modulo2.ObjConexion:=TADOConnection.Create(nil);
  Modulo2.ObjConexion.LoginPrompt:=false;
  Modulo2.ObjConexion.ConnectionString:=Modulo2.Sistema.ConectDb;
  DataSet1:=TADODataSet.Create(nil);
  DataSet1.Connection:=Modulo2.ObjConexion;
  DataSet1.CommandText:='SELECT SUM(Capital + Interes) FROM dbo.PlanPagoObjetoPeriodo '
  + 'WHERE (IdPlanObjeto=' + OBJETOS.FieldByName('Id').AsString +')';
  DataSet1.Open;
  TOTAL.Text:=DataSet1.Fields[0].AsString;
  CALCULAR.Enabled:=true;
  DataSet1.Close;
  FreeAndNil(DataSet1);
end;
Modulo2.ObjConexion.Close;
FreeAndNil(Modulo2.ObjConexion);
end;

procedure TCancelaObjetos.DBGrid2CellClick(Column: TColumn);
begin
if not PLANES.IsEmpty then begin
   Coloca1(0);
   Coloca1(1);
   Coloca1(2);
   PageControl0.Pages[1].TabVisible:=true;
   PageControl0.ActivePage:=PageControl0.Pages[1];

   if Estado <> '0' then messagedlg('Atención el Plan Seleccionado NO SE ENCUENTRA VIGENTE!!'+ chr(13)
   + 'NO se permitirá la cancelación de objeto',mtWarning,[mbok],0);
 end;
end;

procedure TCancelaObjetos.SALEClick(Sender: TObject);
begin
Close;
end;

procedure TCancelaObjetos.titularKeyPress(Sender: TObject; var Key: Char);
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

procedure TCancelaObjetos.fecplanExit(Sender: TObject);
var kl:Tdatetime;
begin
{try
  kl:=strtodate(trim(fecplan.Text));
except
  messagedlg('La Fecha Ingresada No es Válida',mterror,[mbok],0);
  fecplan.SetFocus;
end; }
end;

procedure TCancelaObjetos.fecplanKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  BUSCAR.SetFocus;
end;
end;

procedure TCancelaObjetos.PageControl1Change(Sender: TObject);
begin
//if PC1.ActivePageIndex = 1 then CUOTAS.SetFocus;
end;

procedure TCancelaObjetos.CALCULARClick(Sender: TObject);
var t:integer;
    comando:widestring;
    pso:boolean;
begin
t:=messagedlg('Desea Confirmar la CANCELACION del Objeto Seleccionado?',mtWarning,[mbok,mbCancel],0);
if t = 1 then begin
  pso:=false;
  try
    DataSet1:=TADODataSet.Create(nil);
    DataSet1.ConnectionString:=Modulo2.Sistema.ConectDb;

    DataSet1.CommandText:='EXEC SPP_PlanPagoObjetoCancelado '
    + PLANES.FieldByName('NroPlan').AsString + ' , '
    + OBJETOS.FieldByName('Id').AsString + ' , '
    + modulo2.Usuario.UsuNro + ' , '
    + chr(39) + modulo2.Sistema.MyHost + chr(39) + ' , '
    + chr(39) + modulo2.Sistema.MyIP + chr(39);
    DataSet1.Open;
    if DataSet1.Fields[0].AsString = 'OK' then begin
      messagedlg('Datos guardados correctamente!',mtWarning,[mbok],0);
      pso:=true;
    end
    else begin
      CantCuotas:=StrToInt(DataSet1.Fields[0].AsString);
      messagedlg('Para cancelar el objeto debe realizar el pago de al menos: '
      + DataSet1.Fields[0].AsString + ' CUOTAS, por un total de $ ' + DataSet1.Fields[1].AsString
      + chr(13) + 'Las cuotas a imprimir son: ' + DataSet1.Fields[2].AsString,mtWarning,[mbok],0);
      ReciboBtn.Enabled:=true;
    end;
    DataSet1.Close;
  except
    on E: Exception do begin
      EnviarLog(Self.Caption, E.Message);
      EnviarLog(Self.Caption, Com1.CommandText);
      messagedlg('ERROR al Guardar los datos',mterror,[mbok],0);
    end;
  end;
  FreeAndNil(DataSet1);
  if pso then Coloca1(3);
end;
end;

procedure TCancelaObjetos.codobjetoKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  TITULAR.SetFocus;
end;
end;

procedure TCancelaObjetos.JvDBGrid1CellClick(Column: TColumn);
begin
if not OBJETOS.IsEmpty then begin
  TOTAL.Text:='0';
  ReciboBtn.Enabled:=false;
  CALCULAR.Enabled:=false;
  if not OBJETOS.FieldByName('Cancelado').AsBoolean then Coloca1(3);
end;
end;

end.
