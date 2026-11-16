unit PlanPagoModifDom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Grids, DB, ADODB, DBCtrls, Buttons, ComCtrls,
  DBGrids, ExtCtrls, JvExButtons, JvBitBtn, Vcl.ToolWin, JvExComCtrls, JvToolBar,
  JvgGroupBox, JvComponentBase, JvEmbeddedForms, Vcl.ImgList;

type
  TPPModifDom = class(TForm)
    Barra1: TStatusBar;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox3: TGroupBox;
    DataSource7: TDataSource;
    DataSource2: TDataSource;
    PC1: TPageControl;
    TabSheet3: TTabSheet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid6: TDBGrid;
    Label14: TLabel;
    CUIM1: TMaskEdit;
    Label12: TLabel;
    NOMBRE: TEdit;
    Label13: TLabel;
    PROVINCIA: TComboBox;
    PISO1: TEdit;
    Label42: TLabel;
    ALTURA1: TMaskEdit;
    Label9: TLabel;
    CALLE1: TComboBox;
    Label38: TLabel;
    BARRIO1: TComboBox;
    Label8: TLabel;
    Label43: TLabel;
    DPTO1: TEdit;
    Label44: TLabel;
    MANZANA1: TEdit;
    Label45: TLabel;
    CASA1: TEdit;
    Label10: TLabel;
    TORRE1: TEdit;
    Label11: TLabel;
    SECTOR1: TEdit;
    Label47: TLabel;
    PARCELA1: TEdit;
    Label46: TLabel;
    LOTERURAL1: TEdit;
    Label20: TLabel;
    TELEFONO: TEdit;
    CARACTER: TComboBox;
    Label27: TLabel;
    DOMI1: TEdit;
    Label16: TLabel;
    Agrega: TBitBtn;
    JvToolBar1: TJvToolBar;
    ToolButton1: TToolButton;
    SALE: TJvBitBtn;
    Borrar: TJvBitBtn;
    ToolButton2: TToolButton;
    JvgGroupBox1: TJvgGroupBox;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    numplan: TEdit;
    JvBitBtn1: TJvBitBtn;
    titular: TEdit;
    fecplan: TMaskEdit;
    Label15: TLabel;
    L1: TLabel;
    FormularioEmb: TJvEmbeddedFormLink;
    Label1: TLabel;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure ColocaCombo(nro:byte);
    procedure Consultas(nro:byte);
    procedure FormActivate(Sender: TObject);
   // procedure Coloca1(nro:byte;valor:string);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid6CellClick(Column: TColumn);
    procedure NOMBREKeyPress(Sender: TObject; var Key: Char);
    procedure PROVINCIAKeyPress(Sender: TObject; var Key: Char);
    procedure BARRIO1KeyPress(Sender: TObject; var Key: Char);
    procedure CALLE1KeyPress(Sender: TObject; var Key: Char);
    procedure ALTURA1KeyPress(Sender: TObject; var Key: Char);
    procedure ALTURA1Exit(Sender: TObject);
    procedure PISO1KeyPress(Sender: TObject; var Key: Char);
    procedure DPTO1KeyPress(Sender: TObject; var Key: Char);
    procedure MANZANA1KeyPress(Sender: TObject; var Key: Char);
    procedure CASA1KeyPress(Sender: TObject; var Key: Char);
    procedure TORRE1KeyPress(Sender: TObject; var Key: Char);
    procedure SECTOR1KeyPress(Sender: TObject; var Key: Char);
    procedure PARCELA1KeyPress(Sender: TObject; var Key: Char);
    procedure LOTERURAL1KeyPress(Sender: TObject; var Key: Char);
    procedure DOMI1KeyPress(Sender: TObject; var Key: Char);
    procedure AgregaClick(Sender: TObject);
    procedure BARRIO1Exit(Sender: TObject);
    procedure CALLE1Exit(Sender: TObject);
    procedure PROVINCIAExit(Sender: TObject);
    procedure CARACTERExit(Sender: TObject);
    procedure TELEFONOKeyPress(Sender: TObject; var Key: Char);
    procedure SALEClick(Sender: TObject);
    procedure BorrarClick(Sender: TObject);
    procedure numplanKeyPress(Sender: TObject; var Key: Char);
    procedure titularKeyPress(Sender: TObject; var Key: Char);
    procedure fecplanKeyPress(Sender: TObject; var Key: Char);
    procedure fecplanExit(Sender: TObject);
    procedure JvBitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CARACTERKeyPress(Sender: TObject; var Key: Char);
    procedure PROVINCIAChange(Sender: TObject);
  private
    IdCombos:array of array of string;
    gh,modifi:boolean;
    FechaAct,codigo1,codigo2,fechas,cobro1,cobro2,nrorec1,nrorec2,rub1,rub2:string;
    total_periodo:widestring;

    PLANES,CONTRIBU:TADODataSet;
    Com1:TADOCommand;{ Private declarations }
  public
    { Public declarations }
  end;

var
  PPModifDom: TPPModifDom;

implementation

uses modulo, Unidad, Busc_Cont, Fecha_Fa, Objetos;  //Informa2, Cred_Pla;

{$R *.dfm}
procedure TPPModifDom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Modulo2.LiberarCombo(PROVINCIA);
Modulo2.LiberarCombo(BARRIO1);
Modulo2.LiberarCombo(CALLE1);
Modulo2.LiberarCombo(CARACTER);
FreeAndNil(PLANES);
FreeAndNil(CONTRIBU);
FreeAndNil(Self);
end;

procedure TPPModifDom.FormCreate(Sender: TObject);
begin
gh:=false;
PLANES:=TADODataSet.Create(nil);
Datasource2.DataSet:=PLANES;

CONTRIBU:=TADODataSet.Create(nil);
Datasource7.DataSet:=CONTRIBU;

end;


procedure TPPModifDom.FormActivate(Sender: TObject);
begin
if not(gh) then begin
  gh:=true;
  setlength(IdCombos,4);
  ColocaCombo(1);
  ColocaCombo(2);
  ColocaCombo(3);
  ColocaCombo(4);
  AGREGA.Enabled:=FALSE;
  PageControl1.ActivePage:=PageControl1.Pages[0];
  numplan.SetFocus;
end;
end;


procedure TPPModifDom.ColocaCombo(nro:byte);
begin
if nro=1 then Modulo2.CargaCombo(PROVINCIA,'SELECT Descrip,provincia FROM Provinc WHERE (Provincia > 10) ORDER BY DESCRIP',Modulo2.Sistema.ConectUsu, false);
if nro=2 then Modulo2.CargaCombo(BARRIO1,'SELECT Detalle, Id FROM Barrios ORDER BY Detalle',Modulo2.Sistema.ConectSeg, false);
if nro=3 then Modulo2.CargaCombo(CALLE1,'SELECT Descrip,calle FROM CALLES WHERE (Dpto_Polit=1) AND (LOCALIDAD=1) ORDER BY DESCRIP',Modulo2.Sistema.ConectUsu, false);
if nro=4 then Modulo2.CargaCombo(CARACTER,'SELECT DetalleTipo,TipoContribuyente FROM TiposContribuyentes',Modulo2.Sistema.ConectDb, false);
end;

procedure TPPModifDom.Consultas(nro:byte);
var param:string;
    Comando,txt:widestring;
    Cnx:TADOConnection;
begin
Cnx:=TADOConnection.Create(nil);
Cnx.LoginPrompt:=false;
Cnx.ConnectionString:=Modulo2.Sistema.ConectDb;
if nro = 1 then  begin
  try
    PLANES.Close;
    if trim(numplan.Text) <> '' then comando:=trim(numplan.Text)
     else comando:='null';
    if trim(titular.Text) <> '' then comando:= comando +  ' , ' + chr(39) + trim(titular.Text) + chr(39)
     else comando:=comando + ' , null';
    if trim(fecplan.Text) <> '/  /' then comando:=comando + ' , ' + chr(39) + trim(fecplan.Text) + chr(39)
     else comando:=comando + ' , null';

    DataSource2.DataSet:=PLANES;
    PLANES.Connection:=Cnx;
    PLANES.CommandText:='SELECT NroPlan,FechaCarga,NroCuim,Contribuyente,CantCuotas,ImporteCuota,estado '
    + ' FROM dbo.Fn_PlanPago(' + comando + ') ';
    PLANES.Open;
    if not PLANES.IsEmpty then begin
      Barra1.Panels[1].Text:='Cant. Registros: ' + IntToStr(PLANES.RecordCount);
    end
    else begin
        messagedlg('Atencion no existen resultados de la busqueda, por favor realice otra busqueda',mtWarning,[mbok],0);
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
if nro = 2  then begin
  L1.Caption:=trim(DBGrid2.Fields[0].Text);
  CONTRIBU.Close;
  CONTRIBU.Connection:=Cnx;
  CONTRIBU.CommandText:='SELECT Cuim,Contribuyente,Provincia,Barrio,Calle,Altura,Piso,Depto,Manzana,Casa,Torre,Sector,'
  +'Parcela,LoteRural,Telefono, Domicilio,' //DetalleTipo,
  +'idcalle,idbarrio,TipoContribuyente FROM Fn_PlanPagoContribuyente (' + DBGrid2.Fields[0].Text + ',null) ';
  CONTRIBU.Open;
  if not CONTRIBU.IsEmpty then begin
    DBGrid6.Columns[0].Width:=90;
    DBGrid6.Columns[1].Width:=200;
    DBGrid6.Columns[2].Width:=80;
    DBGrid6.Columns[3].Width:=80;
    DBGrid6.Columns[4].Width:=100;
  end;
  CONTRIBU.Connection:=nil;
end;
Cnx.Close;
FreeAndNil(Cnx);
end;


procedure TPPModifDom.JvBitBtn1Click(Sender: TObject);
begin
Consultas(1);
end;

procedure TPPModifDom.BorrarClick(Sender: TObject);
begin
CUIM1.Text:='00-00000000-0';
NOMBRE.Clear;
provincia.ItemIndex:=0;
barrio1.ItemHeight:=0;
calle1.ItemIndex:=0;
ALTURA1.Text:='00000';
PISO1.Clear;
DPTO1.Clear;
MANZANA1.Clear;
CASA1.Clear;
TORRE1.Clear;
SECTOR1.Clear;
PARCELA1.Clear;
LOTERURAL1.Clear;
DOMI1.Clear;
telefono.Clear;
AGREGA.Enabled:=FALSE;
caracter.ItemIndex:=0;
CONTRIBU.Close;
end;

procedure TPPModifDom.numplanKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then titular.SetFocus
else begin
  if ( StrScan('0123456789',Key) <> nil ) or
     ( Key = Char(VK_BACK) ) then
  else Key := #0;
end;
end;

procedure TPPModifDom.fecplanExit(Sender: TObject);
var kl:Tdatetime;
begin
{try
  kl:=strtodate(trim(fecplan.Text));
except
  messagedlg('La Fecha Ingresada No es Válida',mterror,[mbok],0);
  fecplan.SetFocus;
end;  }
end;

procedure TPPModifDom.fecplanKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then jvbitbtn1.SetFocus;
end;

procedure TPPModifDom.DBGrid2CellClick(Column: TColumn);
begin
if trim(DBGrid2.Fields[0].Text) <> ''  then Consultas(2);
end;

procedure TPPModifDom.DBGrid6CellClick(Column: TColumn);
begin
if not(CONTRIBU.IsEmpty) then begin
  CUIM1.Text:=trim(CONTRIBU.Fields[0].AsString);
  NOMBRE.Text:=trim(CONTRIBU.Fields[1].AsString);
  PROVINCIA.ItemIndex:=PROVINCIA.Items.IndexOf(trim(CONTRIBU.Fields[2].AsString));
  BARRIO1.ItemIndex:=BARRIO1.Items.IndexOf(trim(CONTRIBU.Fields[3].AsString));
  CALLE1.ItemIndex:=CALLE1.Items.IndexOf(trim(CONTRIBU.Fields[4].AsString));
  ALTURA1.Text:=trim(CONTRIBU.Fields[5].AsString);
  PISO1.Text:=trim(CONTRIBU.Fields[6].AsString);
  DPTO1.Text:=trim(CONTRIBU.Fields[7].AsString);
  MANZANA1.Text:=trim(CONTRIBU.Fields[8].AsString);
  CASA1.Text:=trim(CONTRIBU.Fields[9].AsString);
  TORRE1.Text:=trim(CONTRIBU.Fields[10].AsString);
  SECTOR1.Text:=trim(CONTRIBU.Fields[11].AsString);
  PARCELA1.Text:=trim(CONTRIBU.Fields[12].AsString);
  LOTERURAL1.Text:=trim(CONTRIBU.Fields[13].AsString);
  TELEFONO.Text:=trim(CONTRIBU.Fields[14].AsString);
  DOMI1.Text:=trim(CONTRIBU.Fields[15].AsString);
  CARACTER.Text:=trim(CONTRIBU.Fields[18].AsString);
  groupbox3.Enabled:=true;
  provincia.SetFocus;
end;
end;

procedure TPPModifDom.NOMBREKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then PROVINCIA.SetFocus;
end;

procedure TPPModifDom.PROVINCIAKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then BARRIO1.SetFocus;
end;

procedure TPPModifDom.BARRIO1KeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then CALLE1.SetFocus;
end;

procedure TPPModifDom.CALLE1KeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then ALTURA1.SetFocus;
end;

procedure TPPModifDom.ALTURA1KeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then PISO1.SetFocus;
end;

procedure TPPModifDom.ALTURA1Exit(Sender: TObject);
begin
if trim(ALTURA1.Text) = '' then ALTURA1.Text:='0';
end;

procedure TPPModifDom.PISO1KeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then DPTO1.SetFocus;
end;

procedure TPPModifDom.DPTO1KeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then MANZANA1.SetFocus;
end;

procedure TPPModifDom.MANZANA1KeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then CASA1.SetFocus;
end;

procedure TPPModifDom.CASA1KeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then TORRE1.SetFocus;
end;

procedure TPPModifDom.TORRE1KeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then SECTOR1.SetFocus;
end;

procedure TPPModifDom.SALEClick(Sender: TObject);
begin
close;
end;

procedure TPPModifDom.SECTOR1KeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then PARCELA1.SetFocus;
end;

procedure TPPModifDom.PARCELA1KeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then LOTERURAL1.SetFocus;
end;

procedure TPPModifDom.LOTERURAL1KeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then telefono.SetFocus;
end;

procedure TPPModifDom.DOMI1KeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then agrega.SetFocus;
end;

procedure TPPModifDom.AgregaClick(Sender: TObject);
var gf:integer;
    txt:string;
    Cnx:TADOConnection;
begin
gf:=messagedlg('Desea Modificar el Domicilio Postal de este Titular?'
    ,mtWarning,[mbok,mbCancel],0);
if gf = 1 then begin
  try
    Cnx:=TADOConnection.Create(nil);
    Cnx.LoginPrompt:=false;
    Cnx.ConnectionString:=Modulo2.Sistema.ConectDb;

    Com1:=TADOCommand.Create(nil);
    Com1.Connection:=Cnx;
    txt:=' WHERE (Cuim=' + chr(39) + trim(CUIM1.Text) + chr(39) + ') AND (NroPLan =' + trim(L1.Caption) + ');';
    //Com1.CommandText:='UPDATE PlanPagoContribuyente SET Nombre=' + chr(39) + cambia(trim(NOMBRE.Text),chr(39),chr(33)) + chr(39)
    Com1.CommandText:='UPDATE PlanPagoContribuyente SET NroProvincia=' + TComboClase(provincia.Items.Objects[provincia.ItemIndex]).Param1
    + ' ,IdBarrio=' + TComboClase(barrio1.Items.Objects[barrio1.ItemIndex]).Param1
    + ' ,NroCalle=' + TComboClase(CALLE1.Items.Objects[CALLE1.ItemIndex]).Param1
    + ' ,Altura=' + trim(ALTURA1.Text)
    + ' ,Piso=' + chr(39) + trim(PISO1.Text) + chr(39)
    + ' ,Depto=' + chr(39) + trim(DPTO1.Text) + chr(39)
    + ' ,Manzana=' + chr(39) + trim(MANZANA1.Text) + chr(39)
    + ' ,Casa=' + chr(39) + trim(CASA1.Text) + chr(39)
    + ' ,Torre=' + chr(39) + trim(TORRE1.Text) + chr(39)
    + ' ,Sector=' + chr(39) + trim(SECTOR1.Text) + chr(39)
    + ' ,Parcela=' + chr(39) + trim(PARCELA1.Text) + chr(39)
    + ' ,LoteRural=' + chr(39) + trim(LOTERURAL1.Text) + chr(39)
    + ' ,telefono=' + chr(39) + trim(telefono.Text) + chr(39)
    + ' ,Domicilio=' + chr(39) + trim(DOMI1.Text) + chr(39) + txt ;
    //+ ' ,IdTipoContribuyente=' + TComboClase(caracter.Items.Objects[caracter.ItemIndex]).Param1 + txt ;  //IdCombos[3,caracter.ItemIndex] + txt;
    Com1.Execute;
    messagedlg('El Domicilio de este ' + trim(caracter.Text) + ' fue Correctamente modificado' ,mtConfirmation,[mbok],0);
    //Barra1.Panels[0].Text:='Los Datos se Guardaron Satisfactoriamente';
    groupbox3.Enabled:=false;
    agrega.Enabled:=false;
    borrar.Click;
  except
    messagedlg('Error al Modificar el Domicilio del ' + trim(caracter.Text) ,mtError,[mbok],0);
    provincia.SetFocus;
    //Barra1.Panels[0].Text:='Error al Guardar los Datos';
  end;
  FreeAndNil(Com1);
  FreeAndNil(Cnx);
end;
end;

procedure TPPModifDom.BARRIO1Exit(Sender: TObject);
begin
if BARRIO1.ItemIndex < 0 then begin
  messagedlg('Debe seleccionar un Tipo de Barrio válido',mtError,[mbok],0);
  BARRIO1.SetFocus;
end;
end;

procedure TPPModifDom.CALLE1Exit(Sender: TObject);
begin
if CALLE1.ItemIndex < 0 then begin
  messagedlg('Debe seleccionar un Tipo de CALLE válido',mtError,[mbok],0);
  CALLE1.SetFocus;
end;
end;

procedure TPPModifDom.PROVINCIAChange(Sender: TObject);
begin
  if NOT AGREGA.Enabled  then  AGREGA.Enabled:=TRUE;
end;

procedure TPPModifDom.PROVINCIAExit(Sender: TObject);
begin
if PROVINCIA.ItemIndex < 0 then begin
  messagedlg('Debe seleccionar un Tipo de PROVINCIA válido',mtError,[mbok],0);
  PROVINCIA.SetFocus;
end;
end;

procedure TPPModifDom.CARACTERExit(Sender: TObject);
begin
if CARACTER.ItemIndex < 0 then begin
  messagedlg('Debe seleccionar un Tipo de CARACTER válido',mtError,[mbok],0);
  CARACTER.SetFocus;
end;
end;

procedure TPPModifDom.CARACTERKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then agrega.SetFocus;
end;

procedure TPPModifDom.TELEFONOKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  DOMI1.SetFocus;
end
else begin
  if ( StrScan('0123456789- ',Key) <> nil ) or
      ( Key = Char(VK_BACK) ) then
   else Key := #0;
end;
//if key = chr(13) then DOMI1.SetFocus;
end;

procedure TPPModifDom.titularKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  fecplan.SetFocus;
end
else begin
  if ( StrScan('0123456789abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ%. /°-',Key) <> nil ) or
      ( Key = Char(VK_BACK) ) then
   else Key := #0;
end;
end;

end.
