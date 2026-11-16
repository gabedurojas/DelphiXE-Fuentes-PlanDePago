unit IncluirAniosPrescriptos;

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
  TAgregaAniosaPlanes = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    Barra1: TStatusBar;
    Label7: TLabel;
    imprime: TJvBitBtn;
    ToolButton2: TToolButton;
    SALE: TJvBitBtn;
    JvGroupBox2: TJvGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label1: TLabel;
    elcodobjeto: TEdit;
    elsubrubro: TComboBox;
    anio: TEdit;
    Edit1: TEdit;
    Label2: TLabel;
    FormularioEmb: TJvEmbeddedFormLink;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SALEClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Coloca1(nro:byte;valor:string);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure imprimeClick(Sender: TObject);
    procedure CargaCombos(nro:byte);
    procedure elsubrubroExit(Sender: TObject);
    procedure elsubrubroKeyPress(Sender: TObject; var Key: Char);
    procedure elcodobjetoExit(Sender: TObject);
    procedure elcodobjetoKeyPress(Sender: TObject; var Key: Char);
    procedure anioExit(Sender: TObject);
    procedure anioKeyPress(Sender: TObject; var Key: Char);
  private
    LOSOBJETOS,DataSet3:TADODataSet;{ Private declarations }
    fecha,respuesta,laidcuenta,dato,FechaAct,elcontrib,
    eldni,tipocta,lacuenta,lasucur,elbank,elidcontrib,elcuit,Filtro,NroImp:string;
    Com1:TADOCommand;
  public
    Objetos:TObjetos;
    sumad,suma:double;
    gh:boolean;{ Public declarations }
  end;

var
  AgregaAniosaPlanes: TAgregaAniosaPlanes;

implementation

uses Unidad ,modulo;

{$R *.dfm}
procedure TAgregaAniosaPlanes.FormCreate(Sender: TObject);
begin
LOSOBJETOS:=TADODataSet.Create(nil);
DataSet3:=TADODataSet.Create(nil);
end;


procedure TAgregaAniosaPlanes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FreeAndNil(LOSOBJETOS);
FreeAndNil(DataSet3);
FreeAndNil(Self);
end;

procedure TAgregaAniosaPlanes.FormActivate(Sender: TObject);
begin
if not (gh) then begin
  gh:=true;
  CargaCombos(1);
  elsubrubro.SetFocus;
  imprime.Enabled:=false;
end;
end;

procedure TAgregaAniosaPlanes.Coloca1(nro:byte;valor:string);
var t,b,y:integer;
    tx:string;
    texto:widestring;
begin
 Modulo2.ObjConexion:=TADOConnection.Create(nil);
 Modulo2.ObjConexion.LoginPrompt:=false;
 Modulo2.ObjConexion.ConnectionString:=modulo2.Sistema.ConectInti;
 if nro = 0 then begin
  LOSOBJETOS.Close;
  Modulo2.ObjConexion.ConnectionString:=modulo2.Sistema.ConectSeg;
  LOSOBJETOS.Connection:=modulo2.ObjConexion;
  //if TComboClase(elsubrubro.Items.Objects[elsubrubro.ItemIndex]).Param1 = '1111104' then
  //   texto:='SPP_ContribuyentesDebitosObjetos 0 , ' + trim(elcodobjeto.Text)+ ', null';
  if TComboClase(elsubrubro.Items.Objects[elsubrubro.ItemIndex]).Param1 = '1111201' then
    texto:='SPP_ContribuyentesDebitosObjetos 11112,' + chr(39) + trim(elcodobjeto.Text) + chr(39) + ',null';
  if (TComboClase(elsubrubro.Items.Objects[elsubrubro.ItemIndex]).Param1 = '1111601') or
     (TComboClase(elsubrubro.Items.Objects[elsubrubro.ItemIndex]).Param1 = '1120501') then
     texto:='SPP_ContribuyentesDebitosObjetos 11205, null ,' + trim(elcodobjeto.Text);
  LOSOBJETOS.CommandText:=texto;
  LOSOBJETOS.Open;
   if strtoint(LOSOBJETOS.Fields[0].AsString) > 0 then begin
         label38.Caption:=LOSOBJETOS.Fields[0].AsString;
   end
   else begin
     //if TComboClase(elsubrubro.Items.Objects[elsubrubro.ItemIndex]).Param1 = '1111104' then begin
     //   messagedlg('ERROR!! Este Nro Plan de Pago No Existe  o No Presenta Deuda, y/o esta Dado de Baja. Imposible su Carga..',mterror,[mbok],0);
      //  valor:='No';
      //  label38.Caption:='Objeto inexistente';
     //   elcodobjeto.Clear;
     //   elcodobjeto.SetFocus;
     //end;
     if TComboClase(elsubrubro.Items.Objects[elsubrubro.ItemIndex]).Param1 = '1111201' then begin
         messagedlg('ERROR!! Esta Patente No Existe o ya posee un Debito asociado.. Imposible su Carga..',mterror,[mbok],0);
         valor:='No';
         label38.Caption:='Objeto inexistente';
         elcodobjeto.Clear;
         elcodobjeto.SetFocus;
     end;
     if (TComboClase(elsubrubro.Items.Objects[elsubrubro.ItemIndex]).Param1 = '1111601') or
        (TComboClase(elsubrubro.Items.Objects[elsubrubro.ItemIndex]).Param1 = '1120501') then begin
           messagedlg('ERROR!! Este Inmueble NO esta Habilitado. Imposible su Carga..',mterror,[mbok],0);
           valor:='No';
           label38.Caption:='Objeto inexistente';
           elcodobjeto.Clear;
           elcodobjeto.SetFocus;
        end;
   end;
   LOSOBJETOS.Connection:=nil;
 end;
end;



procedure TAgregaAniosaPlanes.CargaCombos(nro:byte);
begin
if nro=1 then Modulo2.CargaCombo(elsubrubro,'SELECT descripcion,idSubRubro FROM Fn_Subrubros (1) order by 2',modulo2.Sistema.ConectInti,false);
end;



procedure TAgregaAniosaPlanes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
     VK_F2 : begin
         imprime.Click;
     end;
  end;
end;

procedure TAgregaAniosaPlanes.imprimeClick(Sender: TObject);
var t,y,a:integer;
begin
a:=messagedlg('Desea Guardar los datos de este Año Prescripto?',mtWarning,[mbok,mbCancel],0);
if a = 1 then begin
  try
    Com1:=TADOCommand.Create(nil);
    Com1.ConnectionString:=modulo2.Sistema.ConectSeg;
    Com1.CommandText:='SPA_ObjetoIntimadoParaMoratoria ' + trim(label38.Caption)
    + ' , ' + TComboClase(elsubrubro.Items.Objects[elsubrubro.ItemIndex]).Param1
    + ' , ' + trim(anio.Text)
    + ' , ' + modulo2.Usuario.UsuNro;
    Com1.Execute;
    messagedlg('Objeto y Años guardados correctamente!',mtConfirmation,[mbok],0);
  except
    EnviarLog(self.Caption,Com1.CommandText);
    messagedlg('ERROR al Guardar los datos',mterror,[mbok],0);
  end;
  FreeAndNil(Com1);
end;
end;

procedure TAgregaAniosaPlanes.anioExit(Sender: TObject);
begin
  if  Length(anio.Text) < 4 then begin
     messagedlg('ERROR!! Este Campo Año esta incompleto, por favor verificar que contenga los 4 caracteres exigidos...',mterror,[mbok],0);
     anio.SetFocus;
  end
  else begin
   if (trim(anio.Text) = '') or (trim(anio.Text) = '0000') then begin
    messagedlg('Error!! Ingrese un Año válido..',mterror,[mbok],0);
    anio.SetFocus;
   end
   else begin
     if strtoint(anio.Text) >= 2012 then begin
      messagedlg('Error!! Ingrese un Año anterior al 2012..',mterror,[mbok],0);
      anio.SetFocus;
     end
   end;
  end;
end;

procedure TAgregaAniosaPlanes.anioKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;

end
else begin
  if ( StrScan('0123456789',Key) <> nil ) or
      ( Key = Char(VK_BACK) ) then
   else Key := #0;
end;
end;



procedure TAgregaAniosaPlanes.elcodobjetoExit(Sender: TObject);
begin
if (trim(elcodobjeto.Text) = '') or (trim(elcodobjeto.Text) = '0') then begin
  messagedlg('Error!! Ingrese un Codigo de Objeto válido..',mterror,[mbok],0);
  elcodobjeto.SetFocus;
end
else begin
    if (elsubrubro.ItemIndex=35) or (elsubrubro.ItemIndex=37) or (elsubrubro.ItemIndex=34) then begin
      coloca1(0,'');
    end
    else label38.Caption:=trim(elcodobjeto.Text);
    //coloca1(0,'');
    if trim(label38.Caption)='Objeto inexistente' then begin
      elcodobjeto.SetFocus;

    end;
end;
end;

procedure TAgregaAniosaPlanes.elcodobjetoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then begin
    Key := #0;
    if (elsubrubro.ItemIndex=35) or (elsubrubro.ItemIndex=37) or (elsubrubro.ItemIndex=34) then begin
      coloca1(0,'');
    end
    else label38.Caption:=trim(elcodobjeto.Text);
    if trim(label38.Caption)='Objeto inexistente' then begin
      elcodobjeto.SetFocus;

    end;
  end
  else begin
    if (elsubrubro.ItemIndex=35) or (elsubrubro.ItemIndex=37) then begin
        if ( StrScan('0123456789',Key) <> nil ) or
          ( Key = Char(VK_BACK) ) then
        else Key := #0;
    end;
    if (elsubrubro.ItemIndex=34) then begin
        if ( StrScan('0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',Key) <> nil ) or
          ( Key = Char(VK_BACK) ) then
        else Key := #0;
    end;
  end;
end;


procedure TAgregaAniosaPlanes.elsubrubroExit(Sender: TObject);
begin
if elsubrubro.ItemIndex < 0 then begin
  messagedlg('Error!! Seleccione un SubRubro válido',mterror,[mbok],0);
  elsubrubro.SetFocus;
end;
end;

procedure TAgregaAniosaPlanes.elsubrubroKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  label37.Caption:='Codigo Objeto:';
  if True then

  if TComboClase(elsubrubro.Items.Objects[elsubrubro.ItemIndex]).Param1 = '1111201' then label37.Caption:='Dominio:';
  if (TComboClase(elsubrubro.Items.Objects[elsubrubro.ItemIndex]).Param1 = '1120501')
  or (TComboClase(elsubrubro.Items.Objects[elsubrubro.ItemIndex]).Param1 = '1111601')  then label37.Caption:='Partida Nro:';
  elcodobjeto.SetFocus;
end;
end;

procedure TAgregaAniosaPlanes.SALEClick(Sender: TObject);
begin
Close;
end;

end.
