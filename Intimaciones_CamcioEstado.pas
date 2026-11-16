unit Intimaciones_CamcioEstado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB, Mask, Buttons, Grids, DBGrids,
  ExtCtrls, StrUtils, JvExDBGrids, JvDBGrid, JvgGroupBox, JvExButtons, JvBitBtn,
  ToolWin, JvExGrids, JvStringGrid, Menus, ImgList, JvDataEmbedded,Objetos,
  JvComponentBase, JvEmbeddedForms, JvExStdCtrls, JvGroupBox, frxClass,DBClient, MidasLib ,
  frxDBSet, RzTabs;

type THackStringGrid = class(TJvStringGrid);
type
  TIntima_CambiaEstado = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    confirma: TJvBitBtn;
    ToolButton3: TToolButton;
    SALE: TJvBitBtn;
    Barra1: TStatusBar;
    FormularioEmb: TJvEmbeddedFormLink;
    frxReport2: TfrxReport;
    PC1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    ImageList2: TImageList;
    Label7: TLabel;
    PopupMenu1: TPopupMenu;
    SeleccionarTodos1: TMenuItem;
    grilla1: TStringGrid;
    EliminarSeleccin1: TMenuItem;
    JvgGroupBox1: TJvgGroupBox;
    Label1: TLabel;
    filtrar: TJvBitBtn;
    L1: TComboBox;
    Edit3: TEdit;
    Panel1: TPanel;
    Label9: TLabel;
    L4: TComboBox;
    Aceptar: TJvBitBtn;
    cancela: TJvBitBtn;
    Label6: TLabel;
    L3: TMaskEdit;
    motivo: TEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SALEClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure confirmaClick(Sender: TObject);
    procedure Coloca1(nro:byte;valor:string);
    procedure grilla1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure grilla1Click(Sender: TObject);
    procedure SeleccionarTodos1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    function VerificaGrillaDeuda(grilla:string):boolean;
    procedure EliminarSeleccin1Click(Sender: TObject);
    procedure CargaCombos(nro:byte);
    procedure L4Exit(Sender: TObject);
    procedure L4KeyPress(Sender: TObject; var Key: Char);
    procedure L1Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure filtrarClick(Sender: TObject);
    procedure L1KeyPress(Sender: TObject; var Key: Char);
    procedure cancelaClick(Sender: TObject);
    procedure AceptarClick(Sender: TObject);
    procedure L3Exit(Sender: TObject);
    procedure L3KeyPress(Sender: TObject; var Key: Char);
    procedure VerUsuario(nro:byte);
  private
    CONTRIBUYENTE,LOSOBJETOS,DataSet3,DataSet4,DataSet2:TADODataSet;{ Private declarations }
    fecha,respuesta,laidcuenta,dato,FechaAct,elcontrib,
    eldni,tipocta,lacuenta,lasucur,elbank,elidcontrib,elcuit,Filtro,NroImp:string;
    DtsCuotas:TClientDataSet;
    Com1,Com2:TADOCommand;
  public
    Objetos:TObjetos;
    sumad,suma:double;
    selecfila:integer;
    observ:string;
    gh:boolean;{ Public declarations }
  end;

var
  Intima_CambiaEstado: TIntima_CambiaEstado;

implementation

uses Unidad ,modulo;

{$R *.dfm}

procedure TIntima_CambiaEstado.FormCreate(Sender: TObject);
begin
CONTRIBUYENTE:=TADODataSet.Create(nil);
DataSet2:=TADODataSet.Create(nil);
end;

procedure TIntima_CambiaEstado.FormActivate(Sender: TObject);
begin
 if not (gh) then begin
  gh:=true;
  FechaAct:=LeftStr(Fec_System(),10);
  PC1.ActivePage:=PC1.Pages[0];
  grilla1.Cells[0,0]:='Orden';            grilla1.Cells[1,0]:='Selec';
  grilla1.Cells[2,0]:='NroIntimacion';    grilla1.Cells[3,0]:='NroLote';
  grilla1.Cells[4,0]:='Contribuyente';    grilla1.Cells[5,0]:='NroDni';
  grilla1.Cells[6,0]:='Barrio';           grilla1.Cells[7,0]:='Calle';
  grilla1.Cells[8,0]:='Altura';           grilla1.Cells[9,0]:='Depto.';
  grilla1.Cells[10,0]:='Manzana';         grilla1.Cells[11,0]:='Casa';
  grilla1.Cells[12,0]:='Torre';           grilla1.Cells[13,0]:='Domicilio';
  grilla1.Cells[14,0]:='ImporteDeuda';    grilla1.Cells[15,0]:='Estado';
  verusuario(1);
  if dato <> '0' then  CargaCombos(2)
   else CargaCombos(1);
  //CargaCombos(1);
  motivo.Visible:=false;
  l3.Visible:=false;
  label6.Visible:=false;
  l3.Text:= FechaAct;
  panel1.Visible:=false;
  L1.SetFocus;
 end;
end;

procedure TIntima_CambiaEstado.verusuario(nro:byte);
var t,b:integer;
    Cnx2:TADOConnection;
begin
 Cnx2:=TADOConnection.Create(nil);
 Cnx2.LoginPrompt:=false;
 Cnx2.ConnectionString:=Modulo2.Sistema.ConectInti;
 if nro=1 then begin
  DataSet2.Close;
  DataSet2.Connection:=Cnx2;
  DataSet2.CommandText:='SELECT NroUsuario as Nrousuario FROM Fn_IntimacionAdmin  (' + modulo2.Usuario.UsuNro + ')';
  DataSet2.Open;
  if not Dataset2.IsEmpty then dato:=DataSet2.Fields[0].AsString
   else dato:='0';
  DataSet2.Connection:=nil;
 end;
 Cnx2.Close;
 FreeAndNil(Cnx2);
end;

procedure TIntima_CambiaEstado.Edit3Exit(Sender: TObject);
begin
  if (trim(Edit3.Text) = '') or (trim(Edit3.Text) = '0') then begin
    messagedlg('Error!! Ingrese un Valor válido',mterror,[mbok],0);
    Edit3.SetFocus;
  end;
end;

procedure TIntima_CambiaEstado.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then begin
    Key := #0;
    filtrar.SetFocus;
  end
  else begin
//   if l1.ItemIndex < 2 then begin
//    if ( StrScan('0123456789',Key) <> nil ) or
//        ( Key = Char(VK_BACK) ) then
//     else Key := #0;
//   end
//   else begin
//    if ( StrScan('ABCDEFGHIJKLMNÑOPQRSTUVWXYZ',Key) <> nil ) or
//        ( Key = Char(VK_BACK) ) then
//     else Key := #0;
//   end;
  end;
end;

procedure TIntima_CambiaEstado.EliminarSeleccin1Click(Sender: TObject);
var b,t:integer;
begin
 for b:=0 to grilla1.ColCount-1 do
   for t:=1 to grilla1.RowCount-1 do  grilla1.Cells[1,t]:='';
   verificagrilladeuda('grilla1');
end;

procedure TIntima_CambiaEstado.filtrarClick(Sender: TObject);
begin
 if l1.ItemIndex = 1 then begin
  Dato:= '(dbo.IntimacionContribuyente.Id= ' + trim(edit3.Text) + ') order by 1' ;
  Coloca1(2,dato);
 end;
 if l1.ItemIndex = 0 THEN BEGIN
  Dato:='(dbo.IntimacionContribuyente.nrolote = ' + trim(edit3.Text) + ') order by 1' ;
  Coloca1(2,dato);
 end;
 if l1.ItemIndex = 2 THEN BEGIN
  Dato:='(dbo.IntimacionContribuyente.Contribuyente LIKE ' + chr(39) + chr(37)
    + AnsiReplaceStr(trim(Edit3.Text),chr(39),chr(33)) + chr(37) + chr(39) +') order by 1' ;
  Coloca1(2,dato);
 end;
end;

procedure TIntima_CambiaEstado.CargaCombos(nro:byte);
begin
  if nro=1 then Modulo2.CargaCombo(L4,'SELECT DetalleEstado,NroEstado FROM TiposEstados where nroestado in (2,4,3,6) '
    + ' and BoletaDeuda=0 order by 1',modulo2.Sistema.ConectInti,false);
  if nro=2 then Modulo2.CargaCombo(L4,'SELECT DetalleEstado,NroEstado FROM TiposEstados where nroestado in (2,4,3,6,9) '
    + ' and BoletaDeuda=0 order by 1',modulo2.Sistema.ConectInti,false);
end;

procedure TIntima_CambiaEstado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FreeAndNil(CONTRIBUYENTE);
FreeAndNil(DataSet2);
FreeAndNil(Self);
end;

function TIntima_CambiaEstado.VerificaGrillaDeuda(grilla:string):boolean;
var j,a:integer;
begin
 selecfila:=0;
 Result:=true;
 for j:=1 to grilla1.RowCount-1 do begin
  if trim(grilla1.Cells[1,j])='X' then begin
   selecfila:=selecfila+1;
   Result:=false;
   break;
  end;
 end;
end;

procedure TIntima_CambiaEstado.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of
   VK_F4 : begin
      aceptar.Click;
   end;
   VK_F3 : begin
     filtrar.Click;
   end;
 end;
end;

procedure TIntima_CambiaEstado.confirmaClick(Sender: TObject);
begin
panel1.Visible:=true;
motivo.Visible :=false;
l3.Visible :=false ;
label6.Visible :=false ;
l4.SetFocus;
end;

procedure TIntima_CambiaEstado.grilla1Click(Sender: TObject);
begin
 if grilla1.Cells[0,grilla1.Row] <> '' then begin
  if trim(grilla1.Cells[1,grilla1.Row])='' then grilla1.Cells[1,grilla1.Row]:='X'
   else grilla1.Cells[1,grilla1.Row]:='';
  verificagrilladeuda('grilla1');
 end;
end;

///// aca solo habilito la columna 1
procedure TIntima_CambiaEstado.grilla1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if (ACol=2) then grilla1.Options := grilla1.Options + [goEditing]
   else grilla1.Options := grilla1.Options - [goEditing];
end;

procedure TIntima_CambiaEstado.AceptarClick(Sender: TObject);
var t,y,gf,p,u:integer;
    Com1:TADOCommand;
begin
t:=messagedlg('Confirma el Cambio de Estados para las Intimaciones seleccionadas?',mtWarning,[mbok,mbCancel],0);
if t = 1 then begin
 if selecfila = 0 then begin
  messagedlg('            I M P O S I B L E   C O N F I R M A R ' + chr(13)
  + 'porque no existe ninguna Intimación Seleccionada ',mtError,[mbok],0);
  panel1.Visible:=false;
  grilla1.SetFocus;
 end
 else begin
   Com1:=TADOCommand.Create(nil);
   Com1.ConnectionString:=Modulo2.Sistema.ConectInti;
   for gf:=1 to grilla1.RowCount-1 do begin
    if (grilla1.Cells[1,gf] = 'X') then begin
     try
      Com1.CommandText :='UPDATE IntimacionContribuyenteEstado SET Activo=0 '
      + ' where (IdIntimacionContribuyente='+ trim(grilla1.Cells[2,gf]) + ')';
      Com1.Execute;
      if dato <> '0' then begin
       if l4.ItemIndex = 0 then begin    //baja
        Com1.CommandText :='SPA_IntimacionContribuyenteEstado ' + trim(grilla1.Cells[2,gf])
        + ' , ' + TComboClase(L4.Items.Objects[L4.ItemIndex]).Param1
        + ' , 1 , '  + modulo2.Usuario.UsuNro
        + ' , ' + chr(39) + trim(motivo.Text) + chr(39);
        Com1.Execute;
       end
       else begin
        if l4.ItemIndex = 4 then begin  /// pasa intimacion a boleta
         Com1.CommandText :='SPA_IntimacionContribuyenteEstado ' + trim(grilla1.Cells[2,gf])
         + ' , ' + TComboClase(L4.Items.Objects[L4.ItemIndex]).Param1
         + ' , 1 , '  + modulo2.Usuario.UsuNro  + ' , null';
         Com1.Execute;
                    // corre el proceso de importacion a boleta de deuda
         Com2:=TADOCommand.Create(nil);
         Com2.ConnectionString:=Modulo2.Sistema.ConectBolDeuda;
         Com2.CommandText :='SPP_ImportaIntimacion ' + trim(grilla1.Cells[2,gf]) ;
         Com2.Execute;
        end
        else begin
         Com1.CommandText :='SPA_IntimacionContribuyenteEstado ' + trim(grilla1.Cells[2,gf])
         + ' , ' + TComboClase(L4.Items.Objects[L4.ItemIndex]).Param1
         + ' , 1 , '  + modulo2.Usuario.UsuNro + ' , null';
          Com1.Execute;
        end;
       end;
      end
      else begin
       if l4.ItemIndex = 0 then begin  // baja
        Com1.CommandText :='SPA_IntimacionContribuyenteEstado ' + trim(grilla1.Cells[2,gf])
        + ' , ' + TComboClase(L4.Items.Objects[L4.ItemIndex]).Param1
        + ' , 1 , '  + modulo2.Usuario.UsuNro
        + ' , ' + chr(39) + trim(motivo.Text) + chr(39);
        Com1.Execute;
       end
       else begin
        Com1.CommandText :='SPA_IntimacionContribuyenteEstado ' + trim(grilla1.Cells[2,gf])
        + ' , ' + TComboClase(L4.Items.Objects[L4.ItemIndex]).Param1
        + ' , 1 , '  + modulo2.Usuario.UsuNro + ' , null';
        Com1.Execute;
       end;
      end;
     except
      on E: Exception do begin
       EnviarLog(Self.Caption, E.Message);
       EnviarLog(Self.Caption, Com1.CommandText);
      end;
     end;
    end;
   end;
   messagedlg('Estados Guardados Correctamente!!',mtConfirmation,[mbok],0);
   for p:=0 to grilla1.ColCount-1 do
     for u:=1 to grilla1.RowCount-1 do grilla1.Cells[p,u]:='';
   grilla1.RowCount:=2;
   panel1.Visible:=false;
   motivo.Clear;
   edit3.Clear;
   l1.SetFocus;
   CONTRIBUYENTE.Close;
   FreeAndNil(Com1);
   FreeAndNil(Com2);
 end;
end;
end;

procedure TIntima_CambiaEstado.cancelaClick(Sender: TObject);
begin
  messagedlg('Ud. Ha Cancelado la Opcion de Asignar Estados a las Intimaciones seleccionadas',mtInformation,[mbok],0);
  panel1.Visible:=false;
  l1.SetFocus;
end;

procedure TIntima_CambiaEstado.L1Exit(Sender: TObject);
begin
if L1.ItemIndex < 0 then begin
  messagedlg('Error!! Seleccione una opción válida',mterror,[mbok],0);
  L1.SetFocus;
end;
end;

procedure TIntima_CambiaEstado.L1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  edit3.SetFocus;
end;
end;

procedure TIntima_CambiaEstado.L3Exit(Sender: TObject);
var fec:Tdatetime;
begin
  try
   fec:=strtodate(trim(L3.Text));
   aceptar.SetFocus;
   observ:='Se presento en Oficina el dia ' + trim(l3.Text);
  except
    messagedlg('La fecha es Erronea!!',mterror,[mbok],0);
    L3.SetFocus;
  end;
end;

procedure TIntima_CambiaEstado.L3KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  aceptar.SetFocus;
end;
end;

procedure TIntima_CambiaEstado.L4Exit(Sender: TObject);
begin
 if L4.ItemIndex < 0 then begin
  messagedlg('Error!! Seleccione una opción válida',mterror,[mbok],0);
  L4.SetFocus;
 end
 else begin
  if dato <> '0' then begin  // admin
   if l4.ItemIndex = 0 then begin //baja
    motivo.Visible :=true;
    label6.Visible :=true;
    l3.Visible:=false;
    label6.Caption := 'Motivo:';
    motivo.SetFocus;
   end
   else begin
    l3.Visible:=false;
    label6.Visible:=false;
    motivo.Visible :=false;
    aceptar.SetFocus;
   end;
  end
  else begin
   if l4.ItemIndex = 0 then begin  // baja
    motivo.Visible :=true;
    l3.Visible:=false;
    label6.Visible :=true;
    label6.Caption := 'Motivo:';
    motivo.SetFocus;
   end
   else begin
    l3.Visible:=false;
    motivo.Visible :=false;
    label6.Visible:=false;
    aceptar.SetFocus;
   end;
  end;
 end;
end;

procedure TIntima_CambiaEstado.L4KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
 Key := #0;
 if dato <> '0' then begin
  if l4.ItemIndex = 0 then begin
   l3.Visible:=false;
   label6.Visible :=true;
   label6.Caption := 'Motivo:';
   motivo.Visible :=true;
   motivo.SetFocus;
  end
  else begin
   if l4.ItemIndex = 4 then begin
    motivo.Visible :=false;
    l3.Visible:=false;
    label6.Visible:=false;
    aceptar.SetFocus;
   end
   else begin
    l3.Visible:=false;
    label6.Visible:=false;
    motivo.Visible :=false;
    aceptar.SetFocus;
   end;
  end;
 end
 else begin
  if trim(l4.Text) = 'Se Presento en Oficina' then begin
   motivo.Visible :=false;
   l3.Visible:=true;
   label6.Caption := 'Fecha:';
   label6.Visible:=true;
   l3.SetFocus;
  end
  else begin
   if trim(l4.Text) = 'Baja' then begin
    motivo.Visible :=true;
    l3.Visible:=false;
    label6.Caption := 'Motivo:';
    motivo.SetFocus;
   end
   else begin
    l3.Visible:=false;
    motivo.Visible :=false;
    label6.Visible:=false;
    aceptar.SetFocus;
   end;
  end;
 end;
end;
end;

procedure TIntima_CambiaEstado.Coloca1(nro:byte;valor:string);
var t,b,y,p,u:integer;
    tx:string;
begin
sumad:=0;
 try
 Modulo2.ObjConexion:=TADOConnection.Create(nil);
 Modulo2.ObjConexion.LoginPrompt:=false;
 Modulo2.ObjConexion.ConnectionString:=modulo2.Sistema.ConectInti;
 if nro = 2 then begin
  CONTRIBUYENTE.Close;
  CONTRIBUYENTE.Connection:=modulo2.ObjConexion;
  CONTRIBUYENTE.CommandText:='SELECT dbo.IntimacionContribuyente.Id, dbo.IntimacionContribuyente.IdContribuyente,'
  + 'dbo.IntimacionContribuyente.Contribuyente, dbo.IntimacionContribuyente.NroDni, dbo.IntimacionContribuyente.Barrio,'
  + 'dbo.IntimacionContribuyente.Calle, dbo.IntimacionContribuyente.Altura, dbo.IntimacionContribuyente.Dpto,'
  + 'dbo.IntimacionContribuyente.Mza, dbo.IntimacionContribuyente.Casa,dbo.IntimacionContribuyente.Torre, '
  + 'dbo.IntimacionContribuyente.Domicilio, dbo.IntimacionContribuyente.ImporteDeuda, dbo.IntimacionContribuyente.Impreso,'
  + 'dbo.IntimacionContribuyenteEstado.Activo, dbo.IntimacionContribuyenteEstado.IdTipoEstado, '
  + 'dbo.IntimacionContribuyente.NroLote,dbo.TiposEstados.DetalleEstado '
  + ' FROM dbo.IntimacionContribuyente INNER JOIN '
  + ' dbo.IntimacionContribuyenteEstado ON dbo.IntimacionContribuyente.Id = dbo.IntimacionContribuyenteEstado.IdIntimacionContribuyente '
  + ' inner join dbo.TiposEstados on dbo.TiposEstados.NroEstado = dbo.IntimacionContribuyenteEstado.IdTipoEstado'
  + ' WHERE (dbo.IntimacionContribuyenteEstado.Activo = 1) and ' +  valor;
  CONTRIBUYENTE.Open;
   if CONTRIBUYENTE.IsEmpty then begin
    messagedlg('Contribuyente Inexistente...' + chr(13) + 'Por favor realice otra Busqueda..',mtWarning,[mbok,mbCancel],0);
    for p:=0 to grilla1.ColCount-1 do
     for u:=1 to grilla1.RowCount-1 do grilla1.Cells[p,u]:='';
     grilla1.RowCount:=2;
   end
   else begin
    for t:=1 to CONTRIBUYENTE.RecordCount do begin
     CONTRIBUYENTE.RecNo:=t;
     grilla1.RowCount:=t + 1;
     grilla1.Cells[0,t]:=StrFill(IntToStr(t),2,'0','');
     grilla1.Cells[1,t]:='';
     grilla1.Cells[2,t]:=CONTRIBUYENTE.FieldByName('Id').AsString;
     grilla1.Cells[3,t]:=CONTRIBUYENTE.FieldByName('NroLote').AsString;
     grilla1.Cells[4,t]:=CONTRIBUYENTE.FieldByName('Contribuyente').AsString;
     grilla1.Cells[5,t]:=CONTRIBUYENTE.FieldByName('NroDni').AsString;
     grilla1.Cells[6,t]:=CONTRIBUYENTE.FieldByName('Barrio').AsString;
     grilla1.Cells[7,t]:=CONTRIBUYENTE.FieldByName('Calle').AsString;
     grilla1.Cells[8,t]:=CONTRIBUYENTE.FieldByName('Altura').AsString;
     grilla1.Cells[9,t]:=CONTRIBUYENTE.FieldByName('Dpto').AsString;
     grilla1.Cells[10,t]:=CONTRIBUYENTE.FieldByName('Mza').AsString;
     grilla1.Cells[11,t]:=CONTRIBUYENTE.FieldByName('Casa').AsString;
     grilla1.Cells[12,t]:=CONTRIBUYENTE.FieldByName('Torre').AsString;
     grilla1.Cells[13,t]:=CONTRIBUYENTE.FieldByName('Domicilio').AsString;
     grilla1.Cells[14,t]:=CONTRIBUYENTE.FieldByName('ImporteDeuda').AsString;
     grilla1.Cells[15,t]:=CONTRIBUYENTE.FieldByName('DetalleEstado').AsString;
    end;
    Barra1.Panels[1].Text:='Cant. Registros: ' + inttostr(CONTRIBUYENTE.RecordCount);
   end;
  CONTRIBUYENTE.Connection:=nil;
 end;
 FreeAndNil(Modulo2.ObjConexion);
 except
  on E: Exception do begin
    EnviarLog(Self.Caption, E.Message);
  end
 end;
end;

procedure TIntima_CambiaEstado.SALEClick(Sender: TObject);
begin
Close;
end;

procedure TIntima_CambiaEstado.SeleccionarTodos1Click(Sender: TObject);
var b,t:integer;
begin
 for b:=0 to grilla1.ColCount-1 do
   for t:=1 to grilla1.RowCount-1 do  grilla1.Cells[1,t]:='X';
   verificagrilladeuda('grilla1');
end;

end.
