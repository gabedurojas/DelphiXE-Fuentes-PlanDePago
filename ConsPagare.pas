unit ConsPagare;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids,StdCtrls, Mask, ExtCtrls, ADODB, Buttons,
  JvComponentBase, JvEmbeddedForms, RzTreeVw, RzPanel, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvgGroupBox, RzTabs, JvExButtons,
  JvBitBtn, Vcl.ToolWin, Data.DB, Objetos, Vcl.ImgList;

type
  TConsultaPagare = class(TForm)
    Barra1: TStatusBar;
    ToolBar1: TToolBar;
    Label7: TLabel;
    ToolButton1: TToolButton;
    SALE: TJvBitBtn;
    FormularioEmb: TJvEmbeddedFormLink;
    PC1: TRzPageControl;
    TabSheet2: TRzTabSheet;
    TabSheet1: TRzTabSheet;
    JvgGroupBox1: TJvgGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Buscar: TJvBitBtn;
    FECHA: TMaskEdit;
    NROPAGARE: TEdit;
    CONTRIBU: TEdit;
    NRODNI: TEdit;
    JvgGroupBox2: TJvgGroupBox;
    JvDBUltimGrid1: TJvDBUltimGrid;
    DataSource1: TDataSource;
    grupo2: TGroupBox;
    Label47: TLabel;
    Label27: TLabel;
    ESTADOS: TComboBox;
    OBSERV: TEdit;
    ASIGNA: TJvBitBtn;
    grilla1: TStringGrid;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    PageControl1: TRzPageControl;
    RzTabSheet1: TRzTabSheet;
    Arbol: TRzTreeView;
    ImageList1: TImageList;
    procedure BuscarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ColocaCombo();
    procedure NROPAGAREKeyPress(Sender: TObject; var Key: Char);
    procedure FECHAKeyPress(Sender: TObject; var Key: Char);
    procedure CONTRIBUKeyPress(Sender: TObject; var Key: Char);
    procedure NRODNIKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBUltimGrid1CellClick(Column: TColumn);
    procedure SALEClick(Sender: TObject);
    procedure Coloca1(nro:byte);
    procedure ASIGNAClick(Sender: TObject);
    procedure Limpiar(nro:byte);
    procedure ESTADOSExit(Sender: TObject);
    procedure ESTADOSKeyPress(Sender: TObject; var Key: Char);
    procedure OBSERVKeyPress(Sender: TObject; var Key: Char);
  private
    Com1:TADOCommand;
    PAGARE,DataSet1,DataSet2,DataSet3:TADODataSet;{ Private declarations }
  public
    gh:boolean;{ Public declarations }
  end;

var
  ConsultaPagare: TConsultaPagare;

implementation

{$R *.dfm}

uses Modulo, Unidad;


procedure TConsultaPagare.FormActivate(Sender: TObject);
begin
if not(gh) then begin
  gh:=true;
  PC1.Pages[1].TabVisible:=false;
  ColocaCombo;
  PC1.ActivePage:=PC1.Pages[0];
  grilla1.Cells[0,0]:='CUIM';
  grilla1.Cells[1,0]:='Apellido y Nombre';
  nropagare.SetFocus;
end;
end;

procedure TConsultaPagare.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Modulo2.LiberarCombo(ESTADOS);
FreeAndNil(PAGARE);
FreeAndNil(Self);
end;

procedure TConsultaPagare.Limpiar(nro:byte);
begin
  if nro = 1 then begin
    PC1.Pages[1].TabVisible:=false;
    ColocaCombo;
    PC1.ActivePage:=PC1.Pages[0];
    nropagare.SetFocus;
  end;
end;

procedure TConsultaPagare.FormCreate(Sender: TObject);
begin
DataSet1:=TADODataSet.Create(nil);
DataSet1.ConnectionString:=modulo2.Sistema.ConectDb;
DataSet2:=TADODataSet.Create(nil);
DataSet2.ConnectionString:=modulo2.Sistema.ConectDb;
DataSet3:=TADODataSet.Create(nil);
DataSet3.ConnectionString:=modulo2.Sistema.ConectDb;
PAGARE:=TADODataSet.Create(nil);
PAGARE.ConnectionString:=Modulo2.Sistema.ConectDb;
DataSource1.DataSet:=PAGARE;
end;

procedure TConsultaPagare.Coloca1(nro:byte);
var t:integer;
    Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Nivel6:TTreeNode;
begin
  Modulo2.ObjConexion:=TADOConnection.Create(nil);
  Modulo2.ObjConexion.LoginPrompt:=false;
  Modulo2.ObjConexion.ConnectionString:=Modulo2.Sistema.ConectDb;

if nro = 0 then begin
  DataSet3.Close;
  DataSet3.Connection:=Modulo2.ObjConexion;
  DataSet3.CommandText:='SELECT Id, IdTipoEstado, Detalle, convert(char(10),Fecha,103) as Fecha, Activo,NroUsuario, Observaciones  '
     + 'FROM dbo.Fn_PlanPagoPagareEstado(' + PAGARE.FieldByName('NroPagare').AsString + ') where activo=1';
  DataSet3.Open;
  label5.Caption:=trim(DataSet3.FieldByName('Detalle').AsString);
end;
if nro = 1 then begin
  DataSet2.Close;
  DataSet2.Connection:=Modulo2.ObjConexion;
  DataSet2.CommandText:='SELECT Cuim,Contribuyente FROM PlanPagoPagare where (NroPagare = '
     + PAGARE.FieldByName('NroPagare').AsString + ') order by 2';
  DataSet2.Open;
  for t:=1 to DataSet2.RecordCount do begin
      DataSet2.RecNo:=t;
      grilla1.RowCount:=t+1;
      grilla1.Cells[0,t]:=DataSet2.FieldByName('Cuim').AsString ;
      grilla1.Cells[1,t]:=DataSet2.FieldByName('Contribuyente').AsString;
  end;
end;
if nro = 2 then begin
  Arbol.Items.Clear;
  Arbol.Items.Add(nil,'DATOS DEL PLAN');
  Arbol.Items[0].ImageIndex:=3;
  Arbol.Items[0].SelectedIndex:=3;

  Nivel1:=Arbol.Items.AddChild(Arbol.Items[0],'N° Plan: ' + PAGARE.FieldByName('NroPagare').AsString);
  Nivel1.ImageIndex:=-1;Nivel1.SelectedIndex:=-1;
  Nivel1:=Arbol.Items.AddChild(Arbol.Items[0],'Titular: ' + PAGARE.FieldByName('Nombre').AsString);
  Nivel1.ImageIndex:=-1;Nivel1.SelectedIndex:=-1;
  Nivel1:=Arbol.Items.AddChild(Arbol.Items[0],'Fecha Plan: ' + PAGARE.FieldByName('FechaCarga').AsString);
  Nivel1.ImageIndex:=-1;Nivel1.SelectedIndex:=-1;
  Nivel1:=Arbol.Items.AddChild(Arbol.Items[0],'Importe Pagare: ' + PAGARE.FieldByName('Importe').AsString);
  Nivel1.ImageIndex:=-1;Nivel1.SelectedIndex:=-1;

  Nivel1:=Arbol.Items.Add(Arbol.Items[0],'Estados');
  Nivel1.ImageIndex:=9;
  Nivel1.SelectedIndex:=9;
  DataSet1.Close;
  DataSet1.Connection:=Modulo2.ObjConexion;
  DataSet1.CommandText:='SELECT Id, IdTipoEstado, Detalle, Fecha, Activo,NroUsuario, Observaciones  '
     + 'FROM dbo.Fn_PlanPagoPagareEstado(' + PAGARE.FieldByName('NroPagare').AsString + ')';
  DataSet1.Open;
    for t:=1 to DataSet1.RecordCount do begin
    DataSet1.RecNo:=t;
    Nivel2:=Arbol.Items.AddChild(Nivel1,DataSet1.FieldByName('Detalle').AsString);
      Nivel3:=Arbol.Items.AddChild(Nivel2,'Fecha: ' + DataSet1.FieldByName('Fecha').AsString);
      Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
      Nivel3:=Arbol.Items.AddChild(Nivel2,'NroUsuario: ' + DataSet1.FieldByName('NroUsuario').AsString);
      Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
      Nivel3:=Arbol.Items.AddChild(Nivel2,'Observaciones: ' + DataSet1.FieldByName('Observaciones').AsString);
      Nivel3.ImageIndex:=-1;Nivel2.SelectedIndex:=-1;
    end;
  end;
end;

procedure TConsultaPagare.ColocaCombo();
begin
Modulo2.CargaCombo(ESTADOS,'SELECT Detalle,Id FROM TipoEstadoPagare ORDER BY id',Modulo2.Sistema.ConectDb, false);
end;

procedure TConsultaPagare.ASIGNAClick(Sender: TObject);
var gf:integer;
var txt:string;
    comando:widestring;
begin
gf:=messagedlg('Confirma el Cambio de Estado del Plan de Pago Seleccionado?'
    ,mtWarning,[mbok,mbCancel],0);
if gf = 1 then begin
  try
     Com1:=TADOCommand.Create(nil);
     Com1.ConnectionString:=modulo2.Sistema.ConectDb;

     if trim(TComboClase(ESTADOS.Items.Objects[ESTADOS.ItemIndex]).Param1) = '5' then  begin
        Com1.CommandText:='update PlanPagoPagare set Anulado=1 ,FechaAnulado=getdate()'
        + ', MotivoAnulado=' + CHR(39) + TRIM(observ.Text) + CHR(39)
        + ', UsuAnulado=' + modulo2.Usuario.UsuNro
        + ' where (id =' + trim(PAGARE.FieldByName('IdPagare').AsString)+');';
        Com1.Execute;
     end
     else begin
       Com1.CommandText:='update PlanPagoPagare set Anulado=0 , FechaAnulado=null, UsuAnulado=null,'
        + 'MotivoAnulado=null where (id =' + trim(PAGARE.FieldByName('IdPagare').AsString)+') and Anulado=1;';
        Com1.Execute;
     end;

     Com1.CommandText:='UPDATE PlanPagoPagareEstado SET Activo=0 WHERE (IdPlanPagoPagare=' + trim(PAGARE.FieldByName('IdPagare').AsString) + ');';
     Com1.Execute;

     comando:='SPA_PlanPagoPagareEstado '  + trim(PAGARE.FieldByName('IdPagare').AsString)
      + ' , '  + TComboClase(ESTADOS.Items.Objects[ESTADOS.ItemIndex]).Param1
      + ' , '  + chr(39) + trim(observ.Text) + chr(39)
      + ' , '  + modulo2.Usuario.UsuNro
      + ' , '  + chr(39) + modulo2.Sistema.MyHost + chr(39)
      + ' , '  + chr(39) + modulo2.Sistema.MyIP + chr(39);
     Com1.CommandText:=comando;
     Com1.Execute;
     messagedlg('Estado del Pagare Modificado correctamente!',mtConfirmation,[mbok],0);
     Limpiar(1);
  except
    messagedlg('Error a la Modificar el estado de este Pagare...!',mtError,[mbok],0);
  end;
  com1.Free;
end;
end;

procedure TConsultaPagare.BuscarClick(Sender: TObject);
var txt:widestring;
begin
if (TRIM(NROPAGARE.Text)='') AND (trim(CONTRIBU.Text) = '/  /') and (trim(CONTRIBU.Text)='') and (trim(NRODNI.Text)='') then begin
 messagedlg('Error.. No Existe ningun Pagare segun el Criterio de Busqueda.. Por Favor realice otra búsqueda.',mterror,[mbok],0);
 NROPAGARE.SetFocus;
 end
 else BEGIN
  try
    if trim(NROPAGARE.Text) <> '' then txt:= trim(NROPAGARE.Text)
      else txt:='NULL';
    if trim(FECHA.Text) <>  '/  /' then txt:=txt + ' , ' + chr(39) + trim(FECHA.Text) + chr(39)
      else txt:=txt + ', NULL ';
    if trim(CONTRIBU.Text) <> '' then txt:=txt + ' , ' + chr(39) + trim(CONTRIBU.Text) + chr(39) + ' , '
      else txt:=txt +' , NULL ';
    if trim(NRODNI.Text) <> '' then txt:=txt + ' , ' + trim(NRODNI.Text) + ' , '
     else txt:=txt + ', NULL';

    PAGARE.Close;
    PAGARE.CommandText:='SELECT IdPagare, NroPagare, Fecha, NroCuim, Nombre, TipoDoc, '
      + 'NroDni, Importe, OtroImporte, Observaciones, FechaCarga, UsuarioCarga, Confirmado, '
      + 'FechaConfirma, UsuarioConfirma, Anulado, FechaAnulado, MotivoAnulacion, UsuarioAnulacion '
      + ' FROM dbo.Fn_PlanPagoPagare(' + txt + ')';
    PAGARE.Open;
     if not PAGARE.IsEmpty then begin
        Barra1.Panels[1].Text:='Cant. Registros: ' + IntToStr(PAGARE.RecordCount);
      end
      else begin
         messagedlg('Atencion no existen resultados de la busqueda, por favor ingrese otro valor',mtWarning,[mbok],0);
         nropagare.SetFocus;
      end;
  except
  //
  end;
end;
END;

procedure TConsultaPagare.NRODNIKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  Buscar.SetFocus;
end
else begin
  if ( StrScan('0123456789',Key) <> nil ) or
      ( Key = Char(VK_BACK) ) then
   else Key := #0;
end;
end;

procedure TConsultaPagare.NROPAGAREKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  FECHA.SetFocus;
end
else begin
  if ( StrScan('0123456789',Key) <> nil ) or
      ( Key = Char(VK_BACK) ) then
   else Key := #0;
end;
end;

procedure TConsultaPagare.OBSERVKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then asigna.SetFocus;
end;

procedure TConsultaPagare.SALEClick(Sender: TObject);
begin
close;
end;

procedure TConsultaPagare.CONTRIBUKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  NRODNI.SetFocus;
end;
end;

procedure TConsultaPagare.ESTADOSExit(Sender: TObject);
begin
if ESTADOS.ItemIndex < 0 then begin
  messagedlg('Debe seleccionar un Tipo de ESTADO válido',mtError,[mbok],0);
  ESTADOS.SetFocus;
end;
end;

procedure TConsultaPagare.ESTADOSKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then observ.SetFocus;
end;

procedure TConsultaPagare.FECHAKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  CONTRIBU.SetFocus;
end
end;

procedure TConsultaPagare.JvDBUltimGrid1CellClick(Column: TColumn);
begin
if not PAGARE.IsEmpty then begin
   coloca1(0);
   coloca1(1);
   coloca1(2);
   PC1.Pages[1].TabVisible:=true;
   PC1.ActivePage:=PC1.Pages[1];
   estados.SetFocus;
end;
end;

end.
