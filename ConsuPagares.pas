unit ConsuPagares;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Mask, DB, ADODB, Grids,
  DBGrids,ToolWin, JvExButtons, JvBitBtn, JvComponentBase, JvEmbeddedForms;

type
  TEstadistica_Pagares = class(TForm)
    Barra1: TStatusBar;
    GroupBox1: TGroupBox;
    R1: TRadioButton;
    R4: TRadioButton;
    CARNET: TEdit;
    Label11: TLabel;
    Label6: TLabel;
    CODIGO: TMaskEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    FECEMI: TMaskEdit;
    Label1: TLabel;
    FECVEN: TMaskEdit;
    Label3: TLabel;
    R2: TRadioButton;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    R3: TRadioButton;
    R5: TRichEdit;
    Label5: TLabel;
    buscar: TJvBitBtn;
    Button1: TJvBitBtn;
    GroupBox4: TGroupBox;
    pagare: TJvBitBtn;
    Label2: TLabel;
    PS1: TMaskEdit;
    Label4: TLabel;
    PS2: TMaskEdit;
    PS3: TMaskEdit;
    Label8: TLabel;
    Label9: TLabel;
    pend: TCheckBox;
    Shape4: TShape;
    Label45: TLabel;
    Shape2: TShape;
    Label13: TLabel;
    Label7: TLabel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    JvBitBtn1: TJvBitBtn;
    FormularioEmb: TJvEmbeddedFormLink;
    afiliado: TJvBitBtn;
    Label12: TLabel;
    procedure R1Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure R4Click(Sender: TObject);
    procedure CARNETKeyPress(Sender: TObject; var Key: Char);
    procedure CODIGOExit(Sender: TObject);
    procedure CODIGOKeyPress(Sender: TObject; var Key: Char);
    procedure FECEMIKeyPress(Sender: TObject; var Key: Char);
    procedure FECVENKeyPress(Sender: TObject; var Key: Char);
    procedure FECEMIExit(Sender: TObject);
    procedure FECVENExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure R3Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure buscarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure pagareClick(Sender: TObject);
    procedure Coloca1(nro:byte;valor:string);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvBitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure afiliadoClick(Sender: TObject);
  private
    gh,TodoOk:boolean;
    IdCombos:array of array of string;
    CANTIDADES,DETALLE,DataSet1:TADODataSet;
    Com1:TADOCommand;
    //FechaActual:string;{
    { Private declarations }
  public
    id:string;
    { Public declarations }
  end;

var
  Estadistica_Pagares: TEstadistica_Pagares;

implementation

uses Modulo, Unidad,SplashForm,Busc_Cont;

{$R *.dfm}

procedure TEstadistica_Pagares.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
FreeAndNil(DataSet1);
FreeAndNil(Self);
end;

procedure TEstadistica_Pagares.FormCreate(Sender: TObject);
begin
gh:=false;
DataSet1:=TADODataSet.Create(nil);
DataSet1.ConnectionString:=Modulo2.Sistema.ConectDb;
end;

procedure TEstadistica_Pagares.FormActivate(Sender: TObject);
begin
if not(gh) then begin
  gh:=true;
  CANTIDADES:=TADODataSet.Create(nil);
  CANTIDADES.ConnectionString:=Modulo2.Sistema.ConectDb;
  DataSource1.DataSet:=CANTIDADES;
  DETALLE:=TADODataSet.Create(nil);
  DETALLE.ConnectionString:=Modulo2.Sistema.ConectDb;
  Datasource2.DataSet:=DETALLE;
  FECVEN.Text:=strcut(Fec_System(),10);
  FECEMI.Text:=FECVEN.Text;
  afiliado.Visible:=false;
  codigo.SetFocus;
end;
end;


procedure TEstadistica_Pagares.JvBitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TEstadistica_Pagares.afiliadoClick(Sender: TObject);
var Bus_Titulares:TBus_Titulares;
begin
Bus_Titulares:= TBus_Titulares.create(self);
try
//  Bus_Titulares.ShowModal;
//  carnet.Text:=Bus_Titulares.elcuim;
//  label5.Caption:=strcut(Bus_Titulares.elnombre,50);
//  if (trim(carnet.Text) = '') or (trim(carnet.Text) = '...') then TodoOk:=false
//  else TodoOk:=true;
//  buscar.SetFocus;
finally
  Bus_Titulares.Free;
end;
  buscar.SetFocus;
end;

procedure TEstadistica_Pagares.Coloca1(nro:byte;valor:string);
var txt:string;
begin
if nro=1 then begin
  CANTIDADES.Close;
    if (R1.Checked = true) then txt:=txt + ' (nropagare=' + trim(codigo.Text) + ')  order by 1 ';
    if (R2.Checked = true) then txt:=txt + ' (convert(smalldatetime,Fecha) BETWEEN ' + chr(39)+ trim(FECEMI.Text) + chr(39) + ' AND ' + chr(39) + trim(FECVEN.Text) + chr(39) + ') order by 1';
    if (R3.Checked = true) then txt:=txt + ' (Cuim=' + chr(39) + trim(carnet.Text) + chr(39) + ') order by 1';
    if (R4.Checked = true) then txt:=txt + ' ';
    Cantidades.CommandText:='SELECT distinct Id,NroPagare,CantPlanesPago,CONVERT(char(10),Fecha,103) AS Fecha,Cuim,Contribuyente,'
       +'Importe,OtroImporte,Observaciones,Usu_A,CONVERT(char(10),FechaAlta,103) AS FechaAlta,Usuario,Confirmado'
       + ' FROM LosPlanesPagoPagare where ' + txt ;
    cantidades.Open;
    if CANTIDADES.RecordCount > 0 then groupbox2.Caption:='Total de Pagares Encontrados : ' + inttostr(CANTIDADES.RecordCount)
         else groupbox2.Caption:='Total de Pagares Encontrados : 0';
end;
if nro=2 then begin
  detalle.Close;
    if (R1.Checked = true) then txt:=txt + ' (nropagare=' + trim(codigo.Text) + ') ';
    if (R2.Checked = true) then txt:=txt + ' (convert(smalldatetime,Fecha) BETWEEN ' + chr(39)+ trim(FECEMI.Text) + chr(39) + '  AND ' + chr(39) + trim(FECVEN.Text) + chr(39) + ')';
    if (R3.Checked = true) then txt:=txt + ' (Cuim=' + chr(39) + trim(carnet.Text) + chr(39) + ')';
    if (R4.Checked = true) then txt:=txt + ' ';
      DETALLE.CommandText:='SELECT distinct Id,NroPagare,convert(char(10),Fecha,103) as Fecha,NroPlan,Rubro,CodigoObjeto,Cuim,Contribuyente,'
      + 'Importe,OtroImporte,Observaciones,Cuotas,CuotasAdeudadas, convert(char(10),Fecha_A,103) as FechaAlta '
      + ' FROM  LosPlanesPagosPagareDetalle WHERE '+ txt + ' ORDER BY 1;';
      DETALLE.Open;
      if detalle.RecordCount > 0 then groupbox3.Caption:='Total de Pagares con Detalle Encontrados : ' + inttostr(detalle.RecordCount)
         else groupbox3.Caption:='Total de Pagares con Detalle : 0';
end;
end;

procedure TEstadistica_Pagares.buscarClick(Sender: TObject);
begin
ps1.Text:='00000';
ps2.Text:='00000';
ps3.Text:='00000';
label9.Caption:='...';
pagare.Enabled:=false;
coloca1(1,'');
coloca1(2,'');
end;

procedure TEstadistica_Pagares.R1Click(Sender: TObject);
begin
label6.Visible:=true;
codigo.Visible:=true;
codigo.SetFocus;
label1.Visible:=false;
label3.Visible:=false;
fecemi.Visible:=false;
fecven.Visible:=false;
label11.Visible:=false;
label5.Visible:=false;
afiliado.Visible:=false;
carnet.Visible:=false;
end;

procedure TEstadistica_Pagares.R2Click(Sender: TObject);
begin
CODIGO.Visible:=false;
label6.Visible:=false;
label1.Visible:=true;
label3.Visible:=true;
fecemi.Visible:=true;
fecven.Visible:=true;
label11.Visible:=false;
label5.Visible:=false;
carnet.Visible:=false;
afiliado.Visible:=false;
fecemi.SetFocus;
end;

procedure TEstadistica_Pagares.R4Click(Sender: TObject);
begin
CODIGO.Visible:=false;
fecemi.Visible:=false;
fecven.Visible:=false;
carnet.Visible:=false;
label6.Visible:=false;
label1.Visible:=false;
label3.Visible:=false;
label11.Visible:=false;
afiliado.Visible:=false;
label5.Visible:=false;
buscar.SetFocus;
end;

procedure TEstadistica_Pagares.CARNETKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then begin
  if trim(CARNET.Text)<> '00000000/00' then begin
    if R3.Checked then CODIGO.SetFocus;
    if R1.Checked then FECEMI.SetFocus;
  end
  else AFILIADO.SetFocus;
end;
end;

procedure TEstadistica_Pagares.CODIGOExit(Sender: TObject);
begin
if (trim(CODIGO.Text) = '')  then begin  //OR (trim(CODIGO.Text) = '00000')
  messagedlg('Error!! No hay Nº de Pagare Ingresado.',mterror,[mbok],0);
  CODIGO.SetFocus;
end;
end;

procedure TEstadistica_Pagares.CODIGOKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then buscar.SetFocus
else begin
  if ( StrScan('0123456789',Key) <> nil ) or
      ( Key = Char(VK_BACK) ) then
   else Key := #0;
end;
end;

procedure TEstadistica_Pagares.FECEMIKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then FECVEN.SetFocus;
end;

procedure TEstadistica_Pagares.FECVENKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then Buscar.SetFocus;
end;

procedure TEstadistica_Pagares.FECEMIExit(Sender: TObject);
var fec:Tdatetime;
begin
try
 fec:=strtodate(trim(FECEMI.Text));
except
  messagedlg('La fecha es Erronea!!',mterror,[mbok],0);
  FECEMI.SetFocus;
end;
end;

procedure TEstadistica_Pagares.FECVENExit(Sender: TObject);
var fec:Tdatetime;
begin
try
 fec:=strtodate(trim(FECVEN.Text));
except
  messagedlg('La fecha es Erronea!!',mterror,[mbok],0);
  FECVEN.SetFocus;
end;
end;

procedure TEstadistica_Pagares.R3Click(Sender: TObject);
begin
CODIGO.Visible:=false;
label6.Visible:=false;
label5.Visible:=false;
label1.Visible:=false;
label3.Visible:=false;
fecemi.Visible:=false;
fecven.Visible:=false;
label11.Visible:=true;
label5.Visible:=true;
afiliado.Visible:=true;
carnet.Visible:=true;
afiliado.SetFocus;
end;

procedure TEstadistica_Pagares.DBGrid1TitleClick(Column: TColumn);
begin
CANTIDADES.IndexFieldNames:=Column.FieldName;
end;

procedure TEstadistica_Pagares.DBGrid2TitleClick(Column: TColumn);
begin
DETALLE.IndexFieldNames:=Column.FieldName;
end;

procedure TEstadistica_Pagares.Button1Click(Sender: TObject);
var p,t:integer;
var texto:widestring;
begin
R5.Clear;
R5.Lines.Add(groupbox2.Caption);
for p:=1 to CANTIDADES.RecordCount do begin
  texto:='';
  CANTIDADES.RecNo:=p;
  if p=1 then begin
    texto:='Id' + chr(9) + 'NroPagare' + chr(9) + 'Fecha' + chr(9) + 'Cuim' + chr(9) + 'Contribuyente'
           + chr(9) + 'Importe' + chr(9) + 'OtroImporte' + chr(9) + 'Observaciones' + chr(9) + 'Usu_A'
           + chr(9) + 'FechaAlta' + chr(9) + 'Usuario';
    R5.Lines.Add(texto);
    texto:='';
  end;
  for t:=0 to CANTIDADES.FieldCount-1 do begin
    texto:=texto + CANTIDADES.Fields[t].AsString + chr(9);
  end;
  R5.Lines.Add(texto);
end;
texto:='';
R5.Lines.Add(texto);
R5.Lines.Add(groupbox3.Caption);

  Splash := TSplash.Create(Application);
  Splash.Show;
  Splash.ProgressBar1.Max:=800;
  for p:=1 to DETALLE.RecordCount do begin
    Splash.ProgressBar1.Position:=1;
    texto:='';
    DETALLE.RecNo:=p;
    Splash.Label3.Caption:=inttostr(p);
    Splash.Update;
    if p=1 then begin
      texto:='Id' + chr(9) + 'NroPagare' + chr(9) + 'Fecha' + chr(9)
           + 'NroPlan' + chr(9) + 'Rubro.' + chr(9) + 'Cuim' + chr(9)
           + 'Contribuyente' + chr(9) + 'Importe' + chr(9)+ 'OtroImporte'+ chr(9)
           + 'Observaciones' + chr(9) + 'Cuotas' + chr(9)+ 'CuotasAdeudadas' + chr(9)+ 'FechaAlta';
      R5.Lines.Add(texto);
      texto:='';
    end;
    for t:=0 to DETALLE.FieldCount-1 do begin
          texto:=texto + DETALLE.Fields[t].AsString + chr(9);
    end;
    R5.Lines.Add(texto);
  end;
R5.SelectAll;
R5.CopyToClipboard;
Splash.Hide;
Splash.Free;
messagedlg('Se Copiaron los Datos con exito, listo para pegarlos a Excel',mtwarning,[mbok],0);
end;

procedure TEstadistica_Pagares.DBGrid1CellClick(Column: TColumn);
begin
{SELECT Id,NroPagare,CantPlanesPago,CONVERT(char(10),Fecha,103) AS Fecha,Cuim,Contribuyente,'
       +'Importe,OtroImporte,Observaciones,Usu_A,CONVERT(char(10),FechaAlta,103) AS FechaAlta,Usuario,Confirmado}
id:=trim(CANTIDADES.Fields[0].AsString);
PS1.Text:=trim(CANTIDADES.Fields[1].AsString);
PS2.Text:=trim(CANTIDADES.Fields[6].AsString);
PS3.Text:=trim(CANTIDADES.Fields[7].AsString);
label9.Caption:=trim(CANTIDADES.Fields[5].AsString);
if trim(CANTIDADES.Fields[12].AsString)='False' then pagare.Enabled:=true
  else pagare.Enabled:=false;
end;

procedure TEstadistica_Pagares.pagareClick(Sender: TObject);
var gf,t:integer;
begin
gf:=messagedlg('Desea COnfirmar la Entrega de este Pagaré N°' + trim(ps1.Text)
    ,mtWarning,[mbok,mbCancel],0);
  if gf = 1 then begin
    try
      Com1:=TADOCommand.Create(nil);
      Com1.ConnectionString:=Modulo2.Sistema.ConectDb;

      Com1.CommandText:='BEGIN TRANSACTION;';
      Com1.Execute;

      Com1.CommandText:='update PlanesPagares set confirmado=1 '
      + ' ,Fecha_Confirma=GetDate() ,Usu_Confirma=' + Modulo2.usuario.UsuNro
      + ' where (id= ' + id + ');';
      Com1.Execute;

      Com1.CommandText:='COMMIT TRANSACTION';
      Com1.Execute;
      Barra1.Panels[1].Text:='Datos Guardados Correctamente!!';
      ps1.Text:='00000';
      ps2.Text:='00000';
      ps3.Text:='00000';
      label9.Caption:='...';
      pagare.Enabled:=false;
    except
      Com1.CommandText:='ROLLBACK TRANSACTION';
      Com1.Execute;
      Barra1.Panels[1].Text:='ERROR al Guardar los Datos!!';
    end;
    Com1.Free;
  end;
end;

procedure TEstadistica_Pagares.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
  var h:byte;
begin
if not(CANTIDADES.IsEmpty) then begin
  h:=1;
  if trim(DBGrid1.Fields[12].Text) = 'True' then h:=1
   else h:=0;
  case h of
    0:begin
      DBGrid1.Canvas.Brush.Color:=clWindow; //Confirmado
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.Canvas.Font.Color:= clBlack;
      end;
    1:begin
      DBGrid1.Canvas.Brush.Color:=clYEllow;//Pendientes
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.Canvas.Font.Color:= clBlack;
      end;
  end;
  DBGrid1.DefaultDrawColumnCell(Rect,Datacol,Column,State);
end;
end;

end.
