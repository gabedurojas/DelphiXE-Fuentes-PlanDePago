unit PlanesPagosTerrenos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ADODB, StdCtrls, LMDControl, LMDBaseControl, ComCtrls,
  LMDBaseGraphicControl, LMDGraphicControl, LMDScrollText, ExtCtrls, Grids,
  LMDCustomButton, LMDButton, Mask ,strUtils, LMDCustomComponent,DBClient,
  LMDContainerComponent, LMDMsg, RpDefine, RpBase, RpSystem, DBGrids, DB,
  Buttons, JvExButtons, JvBitBtn, ImgList, frxDesgnCtrls;

type THackStringGrid = class(TStringGrid);
type
  TPPlanesVtaTerreno = class(TForm)
    PLAN: TPageControl;
    TabSheet7: TTabSheet;
    PC1: TPageControl;
    TabSheet3: TTabSheet;
    Label16: TLabel;
    Label35: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    Label39: TLabel;
    Label38: TLabel;
    Label27: TLabel;
    DOMI1: TEdit;
    BARRIO1: TComboBox;
    CUIM1: TMaskEdit;
    CONTRIB: TEdit;
    ALTURA1: TMaskEdit;
    CALLE1: TComboBox;
    CARACTER: TComboBox;
    GroupBox6: TGroupBox;
    Image3: TImage;
    Label50: TLabel;
    TabSheet5: TTabSheet;
    grilla4: TStringGrid;
    TabSheet8: TTabSheet;
    Label15: TLabel;
    Label5: TLabel;
    Label21: TLabel;
    Label17: TLabel;
    Label23: TLabel;
    Label29: TLabel;
    Label8: TLabel;
    Label48: TLabel;
    Image2: TImage;
    Label49: TLabel;
    L1: TEdit;
    L2: TEdit;
    L4: TEdit;
    L3: TEdit;
    L6: TEdit;
    L7: TEdit;
    OBSERV: TEdit;
    L9: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    R1: TRadioButton;
    subrubro: TComboBox;
    Label7: TLabel;
    Image1: TImage;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label22: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label32: TLabel;
    CUOTAS: TComboBox;
    COEF: TEdit;
    VALCUOTAS: TEdit;
    NUMPLAN: TMaskEdit;
    VENC1: TMaskEdit;
    VENC2: TMaskEdit;
    VALSELLADO: TEdit;
    grilla5: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    valornafta: TEdit;
    Imptotal: TEdit;
    Acta: TEdit;
    litrosnafta: TEdit;
    Barra1: TStatusBar;
    GroupBox2: TGroupBox;
    C3: TCheckBox;
    C4: TCheckBox;
    Label6: TLabel;
    resol: TEdit;
    Label20: TLabel;
    elrubro: TComboBox;
    ELCUIM: TMaskEdit;
    grupo11105: TGroupBox;
    acepta: TButton;
    DBGrid1: TDBGrid;
    Label13: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    capital: TEdit;
    fecresol: TMaskEdit;
    fecactual: TMaskEdit;
    DataSource1: TDataSource;
    TyR: TCheckBox;
    Label28: TLabel;
    expte: TEdit;
    CBNS: TCheckBox;
    CBNC: TCheckBox;
    Label24: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    L8: TEdit;
    calcula: TJvBitBtn;
    Agrega_T: TJvBitBtn;
    BUSCUIM1: TJvBitBtn;
    Button1: TJvBitBtn;
    CONT: TJvBitBtn;
    Imprime: TJvBitBtn;
    Agrega: TJvBitBtn;
    BitBtn2: TJvBitBtn;
    DataSource2: TDataSource;
    Label31: TLabel;
    ComboBox1: TComboBox;
    ImageList1: TImageList;
    procedure CUOTASExit(Sender: TObject);
    procedure CUOTASKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Coloca1(nro:byte;valor:string);
    Function el_codigo(nro:byte;valor:string):string;
    procedure subrubroExit(Sender: TObject);
    procedure subrubroKeyPress(Sender: TObject; var Key: Char);
    procedure Limpiar();
    procedure NUMPLANKeyPress(Sender: TObject; var Key: Char);
    procedure VENC1KeyPress(Sender: TObject; var Key: Char);
    procedure VENC1Exit(Sender: TObject);
    procedure VENC2KeyPress(Sender: TObject; var Key: Char);
    procedure VENC2Exit(Sender: TObject);
    procedure litrosnaftaKeyPress(Sender: TObject; var Key: Char);
    procedure ActaKeyPress(Sender: TObject; var Key: Char);
    procedure ActaExit(Sender: TObject);
    procedure litrosnaftaExit(Sender: TObject);
    procedure BARRIO1Exit(Sender: TObject);
    procedure BARRIO1KeyPress(Sender: TObject; var Key: Char);
    procedure CALLE1Exit(Sender: TObject);
    procedure CALLE1KeyPress(Sender: TObject; var Key: Char);
    procedure ALTURA1KeyPress(Sender: TObject; var Key: Char);
    procedure ALTURA1Exit(Sender: TObject);
    procedure DOMI1KeyPress(Sender: TObject; var Key: Char);
    procedure CARACTERExit(Sender: TObject);
    procedure CARACTERKeyPress(Sender: TObject; var Key: Char);
    procedure Recalculo(nro:byte);
    procedure resolKeyPress(Sender: TObject; var Key: Char);
    procedure resolExit(Sender: TObject);
    procedure elrubroKeyPress(Sender: TObject; var Key: Char);
    procedure elrubroExit(Sender: TObject);
    procedure ImptotalKeyPress(Sender: TObject; var Key: Char);
    procedure aceptaClick(Sender: TObject);
    procedure fecresolExit(Sender: TObject);
    procedure fecactualExit(Sender: TObject);
    procedure capitalKeyPress(Sender: TObject; var Key: Char);
    procedure capitalExit(Sender: TObject);
    procedure fecresolKeyPress(Sender: TObject; var Key: Char);
    procedure fecactualKeyPress(Sender: TObject; var Key: Char);
    procedure expteKeyPress(Sender: TObject; var Key: Char);
    procedure expteExit(Sender: TObject);
    procedure CBNCClick(Sender: TObject);
    procedure CBNSClick(Sender: TObject);
    procedure calculaClick(Sender: TObject);
    procedure Agrega_TClick(Sender: TObject);
    procedure BUSCUIM1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ImprimeClick(Sender: TObject);
    procedure JvBitBtn1Click(Sender: TObject);
    procedure AgregaClick(Sender: TObject);
    procedure grilla5DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DOMI1Exit(Sender: TObject);
  private
    DataSet1,DataSet2,DataSet,DataSet3,ELCALCULO,RESULTADO,RESULTADODET:TADODataSet;
    Com1:TADOCommand;
    IdCombos:array of array of string;
    total_periodo:widestring;
    CuotaMinima:real;
    FechaAct,codigo1,codigo2,fechas,cobro1,cobro2,nrorec1,nrorec2,rub1,rub2,
    ValImpreso,Identificador,rubroselec,td,laprimerfecha,lasactas,elidentif,subrubroselec:string;
    posfx,posfy,posfin,pos_y,salto:double;
  public
    gh,facturas,conint:boolean;
    NSubRub,CodObj,totalfinan,tdr,dnipp:string;
    nrorubro,nrosubrubro,reg2,ctaspp:integer;
  end;

var
  PPlanesVtaTerreno: TPPlanesVtaTerreno;

implementation

uses modulo, Unidad, Busc_Cont,Fecha_PPagoEsp; //,Fecha_Fa;

{$R *.dfm}

procedure TPPlanesVtaTerreno.FormActivate(Sender: TObject);
var FECHA_PPESP: TFECHA_PPESP;
begin
if not(gh) then begin
  gh:=true;
  imprime.Enabled:=false;
  bitbtn2.Enabled:=false;
  ELCALCULO:=TADODataSet.Create(nil);
  ELCALCULO.ConnectionString:=modulo2.ConectDbPlanes;
  DataSource1.DataSet:=ELCALCULO;
  RESULTADO:=TADODataSet.Create(nil);
  RESULTADO.ConnectionString:=modulo2.ConectDbTFaltas;
  RESULTADODET:=TADODataSet.Create(nil);
  RESULTADODET.ConnectionString:=modulo2.ConectDbTFaltas;
  DataSource2.DataSet:=RESULTADODET;
  grupo11105.Visible:=false;
  label30.Caption:='...';
  CBNC.Checked:=true;
  CBNS.Checked:=false;
  setlength(IdCombos,5);
  FechaAct:=fechalarga(strcut(Fec_System(),10));
  FECHA_PPESP:= TFECHA_PPESP.create(self);
  FECHA_PPESP.OFECRESU.Text:=FechaAct;
  fecresol.Text:=strcut(Fec_System(),10);
  try
   FECHA_PPESP.ShowModal;
   FechaAct:=trim(FECHA_PPESP.OFECRESU.Text);
   fecactual.Text:=trim(FECHA_PPESP.OFECRESU.Text);
   conint:=FECHA_PPESP.coninteres;
   Barra1.Panels[1].Text:='Fecha de Actualización de Deuda: ' + FechaAct;
  finally
   FECHA_PPESP.Free;
  end;
  calcula.Enabled:=false;
  acepta.Enabled:=false;
  ST1.Scroll:=false;
  GroupBox4.Enabled:=false;
  plan.ActivePage:=plan.Pages[0];
  pc1.ActivePage:=pc1.Pages[0];
  PageControl1.ActivePage:=PageControl1.Pages[0];
  Image1.Picture.LoadFromFile(modulo2.path_todo + '\Imagenes\Munilg.bmp');
  Coloca1(0,'');
  CuotaMinima:=strtofloat(el_codigo(0,''));
  Coloca1(2,'');
  Coloca1(4,'');
  Coloca1(5,'');
  Coloca1(6,'');
  coloca1(10,'');
  grilla4.Cells[0,0]:='Nº DNI';              grilla4.Cells[1,0]:='Contribuyente';
  grilla4.Cells[2,0]:='CUIM';                grilla4.Cells[3,0]:='Barrio';
  grilla4.Cells[4,0]:='Calle';               grilla4.Cells[5,0]:='Altura';
  grilla4.Cells[15,0]:='Otro Domicilio';     grilla4.Cells[16,0]:='Tipo';

  grilla5.Cells[0,0]:='Nº Plan';             grilla5.Cells[1,0]:='Nro. Cuota';
  grilla5.Cells[2,0]:='Vencimiento';         grilla5.Cells[3,0]:='Importe Cuota';
  grilla5.Cells[4,0]:='Capital';             grilla5.Cells[5,0]:='Interes';
  grilla5.Cells[6,0]:='Periodo';

  label31.Visible:=false;
  combobox1.Visible:=false;
  elrubro.SetFocus;
end;
end;

procedure TPPlanesVtaTerreno.FormCreate(Sender: TObject);
begin
gh:=false;
DataSet:=TADODataSet.Create(nil);
DataSet1:=TADODataSet.Create(nil);
DataSet2:=TADODataSet.Create(nil);
end;

procedure TPPlanesVtaTerreno.Coloca1(nro:byte;valor:string);
var t,b,a:integer;
var val,resul:string;
var ty,tot,tot1,tot2,tot3:real;

    Procedure mostrando(cadena:string);
    begin
      Dialogo.MessageFont.Size:=15;
      Dialogo.MessageFont.Color:=clRed;
      Dialogo.CaptionTitle:='E R R O R... ';
      Dialogo.ShowMessage('El N° de Resolución: ' + cadena );
    end;

begin
if nro=0 then begin   // valor del sellado de los planes de pago
  DataSet.Close;
  DataSet.ConnectionString:=modulo2.ConectDbPlanes;
  DataSet.CommandText:='SELECT ImporteSellado FROM PlanesConfig WHERE (Activo = 1)';
  DataSet.Open;
  valsellado.Text:=trim(DataSet.Fields[0].AsString);
  DataSet.Close;
end;
if nro=1 then begin  // cant de cuotas normales
  val:=el_codigo(10,'');
  DataSet.Close;
  CUOTAS.Clear;
  DataSet.ConnectionString:=modulo2.ConectDbPlanes;
  if val = '2200201' then begin
   if combobox1.ItemIndex=0 then begin
    DataSet.CommandText:='SELECT NroCuota FROM PlanesCoefVentaTerrenoNormal where (IdConfig=1)';
    DataSet.Open;
   end
   else begin
    DataSet.CommandText:='SELECT NroCuota FROM PlanesCoefVentaTerreno where (IdConfig=1)';
    DataSet.Open;
   end;
  end
  else begin
   if val='1120201' then begin  // multas de transito
    DataSet.CommandText:='SELECT PlanesCoef.NroCuota FROM PlanesCoef '
    + 'INNER JOIN PlanesConfig ON PlanesCoef.IdConfig = PlanesConfig.Id '
    + 'WHERE (PlanesConfig.Activo = 1) and (PlanesCoef.NroCuota= ' + inttostr(ctaspp) + ')';
    DataSet.Open;
   end
   else begin
    DataSet.CommandText:='SELECT PlanesCoef.NroCuota FROM PlanesCoef '
    + 'INNER JOIN PlanesConfig ON PlanesCoef.IdConfig = PlanesConfig.Id WHERE (PlanesConfig.Activo = 1)';
    DataSet.Open;
   end;
  end;
  for t:=1 to DataSet.RecordCount  do begin
    DataSet.RecNo:=t;
    CUOTAS.Items.Insert(t-1,trim(DataSet.Fields[0].AsString));
  end;
  DataSet.Close;
  CUOTAS.ItemIndex:=0;
end;
if nro=2 then begin   // valor del combustible de transito
  DataSet1.Close;
  DataSet1.ConnectionString:=modulo2.ConectDbTFaltas;
  DataSet1.CommandText:='SELECT precio FROM TipoCombustible WHERE  (Detalle= ''Nafta Super'')';
  DataSet1.Open;
  valornafta.Text:=trim(DataSet1.Fields[0].AsString);
  DataSet1.Close;
end;
if nro=3 then begin   {Incorporando datos de las Cuotas y Vencimientos}
 for b:=0 to grilla5.ColCount-1 do
   for t:=1 to grilla5.RowCount-1 do  grilla5.Cells[b,t]:='';
 grilla5.RowCount:=2;
 tot1:=0;
 tot2:=0;
 tot3:=0;
 for t:=1 to strtoint(trim(CUOTAS.Text)) do begin
  grilla5.RowCount:=t+1;
  grilla5.Cells[0,t]:=completa1(trim(NUMPLAN.Text),8,'0');
  grilla5.Cells[1,t]:=completa1(inttostr(t),2,'0');
  if t=1 then grilla5.Cells[2,t]:=trim(VENC1.Text)
    else grilla5.Cells[2,t]:=fechaCuotas(trim(VENC1.Text),t-1);
  //Calculamos el valor de la cuota
  try
   tot:=strtofloat(cambia(redondeo(trim(VALCUOTAS.Text),2),chr(44),chr(46)));
  except
   tot:=strtofloat(cambia(redondeo(trim(VALCUOTAS.Text),2),chr(46),chr(44)));
  end;
  grilla5.Cells[3,t]:=floattostr(tot);
  tot1:=tot1 + tot;

  //El Capital
  try
   ty:=strtofloat(cambia(trim(L6.Text),chr(44),chr(46)));
  except
   ty:=strtofloat(cambia(trim(L6.Text),chr(46),chr(44)));
  end;
  ty:=ty/strtoint(trim(CUOTAS.Text));
  ty:=strtofloat(redondeo(floattostr(ty),2));
  grilla5.Cells[4,t]:=floattostr(ty);

  //Los Intereses
  try
   ty:=strtofloat(cambia(redondeo(trim(grilla5.Cells[3,t]),2),chr(44),chr(46))) - strtofloat(cambia(redondeo(trim(grilla5.Cells[4,t]),2),chr(44),chr(46)));
  except
   ty:=strtofloat(cambia(redondeo(trim(grilla5.Cells[3,t]),2),chr(46),chr(44))) - strtofloat(cambia(redondeo(trim(grilla5.Cells[4,t]),2),chr(46),chr(44)));
  end;
  tot3:=strtofloat(redondeo(floattostr(ty),2));
  grilla5.Cells[5,t]:='0';//floattostr(tot3);
  grilla5.Cells[6,t]:=RightStr(grilla5.Cells[2,t],4)+strcut_midle(grilla5.Cells[2,t],4,5);
 end;
end;
if nro=4 then begin
  DataSet.Close;
  CARACTER.Clear;
  DataSet.ConnectionString:=modulo2.ConectDbPlanes;
  DataSet.CommandText:='SELECT DetalleTipo FROM TiposContribuyentes WHERE  (TipoContribuyente <= 2) ORDER BY DetalleTipo desc;';
  DataSet.Open;
  for t:=1 to DataSet.RecordCount  do begin
   DataSet.RecNo:=t;
   CARACTER.Items.Insert(t-1,trim(DataSet.Fields[0].AsString));
  end;
  CARACTER.ItemIndex:=0;
  DataSet.Close;
end;
if nro=5 then begin
  DataSet2.Close;
  BARRIO1.Clear;
  DataSet2.ConnectionString:=modulo2.ConectDbSeguridad;
  DataSet2.CommandText:='SELECT detalle FROM Barrios ORDER BY detalle;';
  DataSet2.Open;
  for t:=1 to DataSet2.RecordCount  do begin
   DataSet2.RecNo:=t;
   BARRIO1.Items.Insert(t-1,trim(DataSet2.Fields[0].AsString));
  end;
  BARRIO1.ItemIndex:=0;
  DataSet2.Close;
end;
if nro=6 then begin
  DataSet2.Close;
  CALLE1.Clear;
  DataSet2.ConnectionString:=modulo2.ConectDbMuni;
  DataSet2.CommandText:='SELECT distinct Descrip FROM CALLES WHERE (Dpto_Polit=1) AND (LOCALIDAD=1) '
  + ' and descrip <> ''CALLE SIN NOMBRE'' and descrip <> ''DESCONOCIDO'' and descrip <> ''DESCONOCIDA'' and DESCRIP <> ''S/N'' ORDER BY DESCRIP';
  DataSet2.Open;
  for t:=1 to DataSet2.RecordCount  do begin
   DataSet2.RecNo:=t;
   CALLE1.Items.Insert(t-1,trim(DataSet2.Fields[0].AsString));
  end;
  CALLE1.ItemIndex:=0;
  DataSet2.Close;
end;
if nro=7 then begin
  elcalculo.Close;
  if td='22002' then begin
   if combobox1.ItemIndex=0 then begin
    ELCALCULO.CommandText:='SELECT * FROM fx_CalculaPlanesPago22002 (' + trim(capital.Text)
    + ',' + chr(39) + trim(fecresol.Text) + chr(39) + ',' + chr(39) + trim(fecactual.Text) + chr(39) + ',0)'
   end
   else begin
    ELCALCULO.CommandText:='SELECT * FROM fx_CalculaPlanesPago22002 (' + trim(capital.Text)
    + ',' + chr(39) + trim(fecresol.Text) + chr(39) + ',' + chr(39) + trim(fecactual.Text) + chr(39) + ',1)'
   end;
  end
  else begin
   ELCALCULO.CommandText:='SELECT * FROM fx_CalculaPlanesPago11105 (' + trim(capital.Text)
   + ',' + chr(39) + trim(fecresol.Text) + chr(39) + ',' + chr(39) + trim(fecactual.Text) + chr(39) + ')';
  end;
  ELCALCULO.Open;
  totalfinan:=trim(ELCALCULO.Fields[3].AsString);
  label30.Caption:=trim(ELCALCULO.Fields[0].AsString);
end;
if nro=8 then begin
  DataSet2.Close;
  subrubro.Clear;
  DataSet2.ConnectionString:=modulo2.ConectDbPlanes;
  DataSet2.CommandText:='SELECT Abreviatura,IdSubRubro from PlanesRubros WHERE (IdRubro = ' + valor + ') ORDER BY Abreviatura;';
  DataSet2.Open;
  SetLength(IdCombos[1],DataSet2.RecordCount);
  for a:=1 to DataSet2.RecordCount  do begin
   DataSet2.RecNo:=a;
   subrubro.Items.Insert(a-1,trim(DataSet2.Fields[0].AsString));
   IdCombos[1,a-1]:=DataSet2.Fields[1].AsString;
  end;
  subrubro.ItemIndex:=0;
  DataSet2.Close;
end;
if nro=9 then begin
 if nrosubrubro=1120207 then begin     // MULTA BROMATOLOGICA DE LA DIR DE BROMA
  DataSet2.Close;
  DataSet2.ConnectionString:=modulo2.ConectDbTFaltas;
  DataSet2.CommandText:='SELECT precio FROM TipoCombustible WHERE (Detalle=''Nafta Especial'')';
  DataSet2.Open;
  valornafta.Text:=trim(DataSet2.Fields[0].AsString);
  DataSet2.Close;
 end
 else begin
  DataSet2.Close;
  DataSet2.ConnectionString:=modulo2.ConectDbTFaltas;
  DataSet2.CommandText:='SELECT precio FROM TipoCombustible WHERE (Detalle=''Nafta Super'')';
  DataSet2.Open;
  valornafta.Text:=trim(DataSet2.Fields[0].AsString);
  DataSet2.Close;
 end;
end;
if nro=10 then begin
  DataSet2.Close;
  elrubro.Clear;
  DataSet2.ConnectionString:=modulo2.ConectDbMuni;
  DataSet2.CommandText:='SELECT nombre,idrubro FROM rubros WHERE (idrubro = 11105) OR (idrubro = 11202) or (idrubro = 22002) or (idrubro = 11103) ORDER BY nombre;';
  DataSet2.Open;
  SetLength(IdCombos[0],DataSet2.RecordCount);
  for a:=1 to DataSet2.RecordCount do begin
   DataSet2.RecNo:=a;
   elrubro.Items.Insert(a-1,trim(DataSet2.Fields[0].AsString));
   IdCombos[0,a-1]:=DataSet2.Fields[1].AsString;
  end;
  elrubro.ItemIndex:=0;
  DataSet2.Close;
end;
if nro=11 then begin
  DataSet1.Close;
  DataSet1.ConnectionString:=modulo2.ConectDbTFaltas;
  DataSet1.CommandText:='SELECT precio FROM TipoCombustible WHERE  (Detalle=''Nafta Especial'')';
  DataSet1.Open;
  valornafta.Text:=trim(DataSet1.Fields[0].AsString);
  DataSet1.Close;
end;
if nro=12 then begin
  RESULTADO.Close;
  RESULTADO.CommandText:='exec TF_PlanPagoCabecera ' + chr(39) + Trim(resol.Text) + chr(39) ;
  RESULTADO.Open;
  resul:=RESULTADO.Fields[0].AsString;
  if RESULTADO.Fields[0].AsString <> '1'  then begin
   valornafta.Text:=RESULTADO.Fields[3].AsString;
   litrosnafta.Text:=RESULTADO.Fields[1].AsString;
   ctaspp:=strtoint(RESULTADO.Fields[6].AsString);
   cuim1.Text:=RESULTADO.Fields[10].AsString;
   elidentif:=RESULTADO.Fields[11].AsString;
   if trim(RESULTADO.Fields[2].AsString)='Comun' then cbnc.Checked:=true
    else cbns.Checked:=true;
   RESULTADODET.Close;
   RESULTADODET.CommandText:='exec TF_PlanPagoDetalle ' + chr(39) + Trim(resol.Text) + chr(39) ;
   RESULTADODET.Open;
   lasactas:=trim(RESULTADODET.Fields[0].AsString);
   observ.Text:='Actas incluidas en este plan de pago ' + trim(RESULTADODET.Fields[0].AsString);
   button1.SetFocus;
  end
  else begin
   Mostrando(trim(resol.Text) + ' No Existe ...' + chr(13) + 'Imposible seguir la Carga del Plan de Pago' );
   resol.SetFocus;
  end;
end;
end;

function TPPlanesVtaTerreno.el_codigo(nro:byte;valor:string):string;
var txt:string;
begin
if nro = 0 then begin
  DataSet2.ConnectionString:=modulo2.ConectDbPlanes;
  DataSet2.CommandText:='SELECT MinimoCuota FROM PlanesConfig WHERE (Activo=1)';
end;
if nro = 1 then begin
  txt:=CUOTAS.Text;
  DataSet2.ConnectionString:=modulo2.ConectDbPlanes;
  DataSet2.CommandText:='SELECT PlanesCoef.Coeficiente FROM PlanesCoef '
  + 'INNER JOIN PlanesConfig ON PlanesCoef.IdConfig = PlanesConfig.Id '
  + 'WHERE (PlanesConfig.Activo = 1) AND  (PlanesCoef.NroCuota=' +  txt + ');';
end;
if nro = 2 then begin
  txt:=NUMPLAN.Text;
  DataSet2.ConnectionString:=modulo2.ConectDbPlanes;
  DataSet2.CommandText:='SELECT NroPlan FROM Planes WHERE (NroPlan=' +  txt + ');';
end;
if nro = 3 then begin  // coef de ventas de terreno
  txt:=CUOTAS.Text;
  if combobox1.ItemIndex=0 then begin
   DataSet2.CommandText:='SELECT Coeficiente FROM PlanesCoefVentaTerrenoNormal where (IdConfig=1) AND (NroCuota=' +  txt + ')';
   DataSet2.Open;
  end
  else begin
   DataSet2.CommandText:='SELECT Coeficiente FROM PlanesCoefVentaTerreno where (IdConfig=1) AND (NroCuota=' +  txt + ')';
   DataSet2.Open;
  end;
end;
if nro = 4 then begin
  txt:=valor;
  DataSet2.ConnectionString:=modulo2.ConectDbPlanes;
  DataSet2.CommandText:='SELECT NroEstado FROM PlanesEstadosDet WHERE (NroPlan=' +  txt + ') AND (Activo=1);';
end;
if nro = 5 then begin
  txt:=valor;
  DataSet2.ConnectionString:=modulo2.ConectDbPlanes;
  DataSet2.CommandText:='SELECT TipoContribuyente FROM TiposContribuyentes WHERE (DetalleTipo=' + chr(39) + txt + chr(39) + ');';
end;
if nro = 6 then begin
  txt:=valor;
  DataSet2.ConnectionString:=modulo2.ConectDbSeguridad;
  DataSet2.CommandText:='SELECT id FROM BARRIOS WHERE (detalle=' + chr(39) + txt + chr(39) + ');';
end;
if nro = 7 then begin
  txt:=valor;
  DataSet2.ConnectionString:=modulo2.ConectDbMuni;
  DataSet2.CommandText:='SELECT Calle FROM CALLES WHERE (Descrip=' + chr(39) + txt + chr(39) + ');';
end;
if nro = 9 then begin
  txt:=valor;
  DataSet2.ConnectionString:=modulo2.ConectDbMuni;
  DataSet2.CommandText:='SELECT Max(Anio) FROM ImpuestosDescuentos WHERE '
  + '(Rubro=' + chr(39) + txt + chr(39) + ') and (AplicaAlTotal=0);';
end;
if nro = 10 then begin
  txt:=SUBRUBRO.Text;
  DataSet2.ConnectionString:=modulo2.ConectDbPlanes;
  DataSet2.CommandText:='SELECT IdSubRubro FROM PlanesRubros WHERE (Abreviatura= ' + chr(39) +  txt + chr(39) + ');';
end;
if nro = 11 then begin
  DataSet2.ConnectionString:=modulo2.ConectDbMuni;
  DataSet2.CommandText:='SELECT IdImpu FROM Impuestos WHERE (Rubro=' + valor + ');';
end;
if nro = 12 then begin
  txt:=ELRUBRO.Text;
  DataSet2.ConnectionString:=modulo2.ConectDbMuni;
  DataSet2.CommandText:='SELECT IdRubro FROM Rubros WHERE (nombre=' + chr(39) +  txt + chr(39) + ');';
end;
if nro = 13 then begin
  //SELECT idrubro FROM rubros WHERE (idrubro = 11105) OR (idrubro = 11202) or (idrubro = 22002) or (idrubro = 11103) ORDER BY nombre
  txt:=ELRUBRO.Text;
  DataSet2.ConnectionString:=modulo2.ConectDbMuni;
  DataSet2.CommandText:='SELECT idrubro FROM rubros WHERE (nombre=' + chr(39) +  txt + chr(39) + ');';
end;
if nro = 14 then begin
  txt:=SUBRUBRO.Text;
  DataSet2.ConnectionString:=modulo2.ConectDbPlanes;
  DataSet2.CommandText:='SELECT TextoImpreso FROM PlanesRubros WHERE (Abreviatura=' + chr(39) +  txt + chr(39) + ');';
end;
if nro = 15 then begin
  txt:=SUBRUBRO.Text;
  DataSet2.ConnectionString:=modulo2.ConectDbPlanes;
  DataSet2.CommandText:='SELECT idsubrubro FROM PlanesRubros WHERE (Abreviatura=' + chr(39) +  txt + chr(39) + ');';
end;
DataSet2.Open;
if DataSet2.RecordCount <> 0 then el_codigo:=DataSet2.Fields[0].AsString
else el_codigo:='';
DataSet2.Close;
end;

procedure tPPlanesVtaTerreno.Recalculo(nro:byte);
var ty,ty1,vf:real;
var txt,ger:string;
var p:integer;
begin
 txt:=el_codigo(3,inttostr(nrorubro));
 ty:=0;
 ty1:=0;
 vf:=0;
 for p:=1 to grilla5.RowCount-1 do begin
  if trim(grilla5.Cells[5,P]) <> '' then begin
   try
    ty:=ty + strtofloat(cambia(grilla5.Cells[5,P],chr(44),chr(46)));
    vf:=vf + strtofloat(cambia(grilla5.Cells[3,P],chr(44),chr(46)));
   except
    ty:=ty + strtofloat(cambia(grilla5.Cells[5,P],chr(46),chr(45)));
    vf:=vf + strtofloat(cambia(grilla5.Cells[3,P],chr(44),chr(46)));
   end;
  end;
 end;
 L4.Text:=redondeo(floattostr(ty),2);
 L7.Text:=redondeo(floattostr(vf),2);
 L6.Text:=imptotal.Text;
 L2.Text:=imptotal.Text;
 ty:=0;ty1:=0;
 ger:=inttostr(nrorubro);
 Coloca1(1,inttostr(nrorubro));
end;

procedure tPPlanesVtaTerreno.Limpiar();
var t,y:integer;
begin
for t:=0 to grilla5.ColCount-1 do
  for y:=1 to grilla5.RowCount-1 do grilla5.Cells[t,y]:='';
grilla5.RowCount:=2;

PageControl1.ActivePage:=PageControl1.Pages[0];
PLAN.ActivePage:=PLAN.Pages[0];
end;

procedure TPPlanesVtaTerreno.CUOTASExit(Sender: TObject);
var valc,val,total:real;
var txt,ger:string;
begin
 if CUOTAS.ItemIndex < 0 then begin
  messagedlg('ERROR!! No El Nro de Cuota Ingresado!!',mterror,[mbok],0);
  CUOTAS.SetFocus;
 end
 else begin
  ger:=el_codigo(10,'');
  if ger = '2200201' then begin
   l9.Text:=trim(cuotas.Text);
   txt:=inttostr(nrorubro);
   try
    val:=strtofloat(cambia(el_codigo(3,txt),chr(44),chr(46)));
    total:=strtofloat(cambia(L2.Text,chr(44),chr(46)));
   except
    val:=strtofloat(cambia(el_codigo(3,txt),chr(46),chr(44)));
    total:=strtofloat(cambia(L2.Text,chr(46),chr(44)));
   end;
   COEF.Text:=floattostr(val);
   valc:=total * val;
   // pregunto si es con interes
   if conint then begin
    VALCUOTAS.Text:=floattostr(valc);
    VENC1.Text:=FechaAct;
   end
   else begin
    VALCUOTAS.Text:=floattostr(strtofloat(imptotal.text) / strtoint(trim(cuotas.Text)));
    VENC1.Text:=FechaAct;
   end;
   //VALCUOTAS.Text:=floattostr(valc);
   //VENC1.Text:=FechaAct;
  end
  else begin
   l9.Text:=trim(cuotas.Text);
   txt:=inttostr(nrorubro);
   try
    val:=strtofloat(cambia(el_codigo(1,txt),chr(44),chr(46)));
    total:=strtofloat(cambia(L2.Text,chr(44),chr(46)));
   except
    val:=strtofloat(cambia(el_codigo(1,txt),chr(46),chr(44)));
    total:=strtofloat(cambia(L2.Text,chr(46),chr(44)));
   end;
   COEF.Text:=floattostr(val);
   valc:=total * val;
   // pregunto si es con interes
   if conint then begin
    VALCUOTAS.Text:=floattostr(valc);
    VENC1.Text:=FechaAct;
    if (valc < CuotaMinima) then begin
     messagedlgpos('Error!! El Valor de la Cuota no Puede ser menor a $ ' + floattostr(CuotaMinima) + chr(13)
     + 'Por Favor intente nuevamente con otro valor de Cuota.',mterror,[mbok],0,screen.Width div 3,screen.Height div 3);
     if (td='22002') or (td='11105') then  begin
      acta.Enabled:=false;
      litrosnafta.Enabled:=false;
      button1.Enabled:=false;
      grupo11105.Visible:=true;
      capital.SetFocus;
     end
     else begin
      grupo11105.Visible:=false;
      acta.Enabled:=true;
      litrosnafta.Enabled:=true;
      button1.Enabled:=true;
      imptotal.ReadOnly:=true;
      imptotal.Enabled:=false;
      litrosnafta.SetFocus;
     end;
    end;
   end
   else begin
    VALCUOTAS.Text:=floattostr(strtofloat(imptotal.text) / strtoint(trim(cuotas.Text)));
    VENC1.Text:=FechaAct;
    if (strtofloat(VALCUOTAS.Text) < CuotaMinima) then begin
     messagedlgpos('Error!! El Valor de la Cuota no Puede ser menor a $ ' + floattostr(CuotaMinima) + chr(13)
     + 'Por Favor intente nuevamente con otro valor de Cuota.',mterror,[mbok],0,screen.Width div 3,screen.Height div 3);
     if (td='22002') or (td='11105') then  begin
      acta.Enabled:=false;
      litrosnafta.Enabled:=false;
      button1.Enabled:=false;
      grupo11105.Visible:=true;
      capital.SetFocus;
     end
     else begin
      grupo11105.Visible:=false;
      acta.Enabled:=true;
      litrosnafta.Enabled:=true;
      button1.Enabled:=true;
      imptotal.ReadOnly:=true;
      imptotal.Enabled:=false;
      litrosnafta.SetFocus;
     end;
    end;
   end;
  end;
 end;
end;

procedure TPPlanesVtaTerreno.CUOTASKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then VENC1.SetFocus;
end;
 
procedure TPPlanesVtaTerreno.subrubroExit(Sender: TObject);
begin
 tdr:=el_codigo(13,'');
 if subrubro.ItemIndex < 0 then begin
  messagedlgpos('ERROR!! El SubRubro Ingresado es Incorrecto!!',mterror,[mbok],
    0,screen.Width div 3,screen.Height div 3);
  subrubro.SetFocus;
 end
 else begin
  if tdr <> '' then begin
   if (tdr = '22002')  or (tdr='11103') or (tdr='11105') then begin
    cbnc.Enabled:=false;
    cbns.Enabled:=false;
    nrorubro:=strtoint(LeftStr(tdr,5));
    nrosubrubro:=strtoint(tdr);
    ValImpreso:=el_codigo(14,'');
    subrubroselec:=el_codigo(15,'');
    coloca1(9,''); // cargamos las cuotas
    expte.SetFocus;
   end
   else begin
    cbnc.Enabled:=true;
    cbns.Enabled:=true;
    nrorubro:=strtoint(LeftStr(tdr,5));
    nrosubrubro:=strtoint(tdr);
    ValImpreso:=el_codigo(14,'');
    subrubroselec:=el_codigo(15,'');
    coloca1(9,''); // cargamos las cuotas
   end;
  end;
 end;
end;

procedure TPPlanesVtaTerreno.subrubroKeyPress(Sender: TObject; var Key: Char);
begin
 if key =#13 then begin
   tdr:=el_codigo(10,'');
   if tdr <> '' then nrosubrubro:=strtoint(tdr);
   if (td='22002') or (td='11105') or (td='11103') then  begin
    acta.Enabled:=false;
    litrosnafta.Enabled:=false;
    button1.Enabled:=false;
    expte.Enabled:=true;
    expte.Clear;
    expte.SetFocus;
   end
   else begin
    if tdr='1120201' then begin  // multas de transito
     acta.Enabled:=false;
     expte.Enabled:=false;
     litrosnafta.Enabled:=false;
     resol.Enabled:=true;
     resol.Clear;
     resol.SetFocus;
    end
    else begin
     coloca1(9,'');
     acta.Enabled:=true;
     expte.Clear;
     expte.Enabled:=True;
     resol.Clear;
     resol.Enabled:=false;
     litrosnafta.Enabled:=true;
     button1.Enabled:=true;
     imptotal.ReadOnly:=true;
     imptotal.Enabled:=false;
     acta.SetFocus;
    end;
   end;
 end;
end;

procedure TPPlanesVtaTerreno.NUMPLANKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then VENC1.SetFocus;
end;

procedure TPPlanesVtaTerreno.VENC1KeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then VENC2.SetFocus; 
end;

procedure TPPlanesVtaTerreno.VENC1Exit(Sender: TObject);
var kl:Tdatetime;
var gt:integer;
begin
 try
   kl:=strtodate(trim(VENC1.Text));
   gt:=strtoint(trim(CUOTAS.Text))-1;
   VENC2.Text:=fechaCuotas(trim(VENC1.Text),strtoint(trim(CUOTAS.Text))-1);
   Coloca1(3,'0');
  except begin
   messagedlgpos('La Fecha Ingresada No es Válida',mterror,[mbok],0,screen.Width div 3,screen.Height div 3);
   VENC1.SetFocus;
  end;
 end;
end;

procedure TPPlanesVtaTerreno.VENC2KeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then begin
  plan.Enabled:=true;
  PLAN.ActivePage:=PLAN.Pages[0];
  PC1.ActivePage:=PLAN.Pages[0];
  BUSCUIM1.SetFocus;
end;
end;

procedure TPPlanesVtaTerreno.VENC2Exit(Sender: TObject);
var kl:Tdatetime;
begin
  try
   kl:=strtodate(trim(VENC2.Text));
  except begin
    messagedlgpos('La Fecha Ingresada No es Válida',mterror,[mbok],0,screen.Width div 3,screen.Height div 3);
    VENC2.SetFocus;
    end;
  end;
end;

procedure TPPlanesVtaTerreno.litrosnaftaKeyPress(Sender: TObject; var Key: Char);
begin
 if key =#13 then begin
   button1.SetFocus;
 end
 else begin
    if ( StrScan('0123456789',Key) <> nil ) or  ( Key = Char(VK_BACK) ) then
    else Key := #0;
 end;
end;

procedure TPPlanesVtaTerreno.ActaKeyPress(Sender: TObject; var Key: Char);
begin
 if key =#13 then begin
  if nrosubrubro=1120207 then expte.SetFocus
   else begin
   resol.Enabled:=true;
   resol.SetFocus;
  end;
 end
 else begin
    if ( StrScan('0123456789',Key) <> nil ) or ( Key = Char(VK_BACK) ) then
    else Key := #0;
 end;
end;

procedure TPPlanesVtaTerreno.ActaExit(Sender: TObject);
begin
 if (trim(acta.Text)='')  or (trim(acta.Text)='0') or (trim(acta.Text)='000000')  then begin
    messagedlg('Error!! Nro de Acta de Infraccion Incorrecto, por favor Ingrese otro Valor',mterror,[mbok],0);
    acta.SetFocus;
 end
 else begin
  l1.Text:=trim(acta.Text);
 end;
end;

procedure TPPlanesVtaTerreno.litrosnaftaExit(Sender: TObject);
begin
 if (trim(litrosnafta.Text)='')  or (trim(litrosnafta.Text)='0')
 or (trim(litrosnafta.Text)='00')or (trim(litrosnafta.Text)='000') then begin
   messagedlg('Error!! Cantidad de Litros de Nafta Incorrecto, por favor Ingrese otro Valor',mterror,[mbok],0);
      litrosnafta.SetFocus;
 end;
end;

procedure TPPlanesVtaTerreno.BARRIO1Exit(Sender: TObject);
begin
if BARRIO1.ItemIndex < 0 then begin
  messagedlg('ERROR!! No Existe el Barrio Ingresado!!',mterror,[mbok],0);
  BARRIO1.SetFocus;
end;
end;

procedure TPPlanesVtaTerreno.BARRIO1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  CALLE1.SetFocus;
end;
end;

procedure TPPlanesVtaTerreno.CALLE1Exit(Sender: TObject);
begin
if CALLE1.ItemIndex < 0 then begin
  messagedlg('ERROR!! No Existe la Calle Ingresada!!',mterror,[mbok],0);
  CALLE1.SetFocus;
end;
end;

procedure TPPlanesVtaTerreno.CALLE1KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then begin
   Key := #0;
   ALTURA1.SetFocus;
 end;
end;

procedure TPPlanesVtaTerreno.ALTURA1KeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then domi1.SetFocus;
end;

procedure TPPlanesVtaTerreno.ALTURA1Exit(Sender: TObject);
begin
if (trim(ALTURA1.Text) = '') or (trim(altura1.text)='0') or (trim(altura1.text)='00')
   or (trim(altura1.text)='000') then begin
  messagedlg('ERROR!! Nro. de Altura de Calle incorrecto',mterror,[mbok],0);
  ALTURA1.Text:='0000';
end
else domi1.SetFocus;
end;

procedure TPPlanesVtaTerreno.DOMI1KeyPress(Sender: TObject; var Key: Char);
begin
 if key =#13 then begin
  if (trim(barrio1.Text)='DESCONOCIDO') and (trim(calle1.Text)='CALLE S/N') then  begin
   if (trim(DOMI1.Text)='') then begin
     messagedlg('Error!! Domicilio Incorrecto, por favor Ingrese otro Valor',mterror,[mbok],0);
     DOMI1.SetFocus;
   end
   else begin
     caracter.SetFocus;
   end;
  end;
 end;
end;


procedure TPPlanesVtaTerreno.CARACTERExit(Sender: TObject);
begin
if CARACTER.ItemIndex < 0 then begin
  messagedlgpos('ERROR!! No Existe el RUBRO Ingresado!!',mterror,[mbok],0,screen.Width div 3,screen.Height div 3);
  CARACTER.SetFocus;
end
end;

procedure TPPlanesVtaTerreno.CARACTERKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then Agrega_T.SetFocus;
end;

procedure TPPlanesVtaTerreno.resolKeyPress(Sender: TObject; var Key: Char);
begin
 if key =#13 then begin
   if (td='22002') or (td='11105') or (td='11103') then  begin
    if td='22002' then begin
     grupo11105.Visible:=true;
     label24.Caption:='Meses de Diferencia';
     label31.Visible:=true;
     combobox1.Visible:=true;
     capital.SetFocus;
     imptotal.ReadOnly:=true;
     imptotal.Enabled:=false;
    end
    else begin
     grupo11105.Visible:=true;
     label24.Caption:='Dias de Diferencia';
     label31.Visible:=false;
     combobox1.Visible:=false;
     capital.SetFocus;
     imptotal.ReadOnly:=true;
     imptotal.Enabled:=false;
    end;
   end
   else begin
    tdr:=el_codigo(10,'');
    if tdr <> '' then nrosubrubro:=strtoint(tdr);
    if tdr='1120201' then begin  // multas de transito
     coloca1(12,'');
     l1.Text:=trim(resol.Text)
    end
    else begin
     grupo11105.Visible:=false;
     imptotal.ReadOnly:=true;
     imptotal.Enabled:=false;
     litrosnafta.SetFocus;
    end;
   end;
 end;  
end;

procedure TPPlanesVtaTerreno.resolExit(Sender: TObject);
begin
 if (trim(resol.Text)='')  or (trim(resol.Text)='0')  then begin
    messagedlg('Error!! Nro de Resolucion Incorrecto, por favor Ingrese otro Valor',mterror,[mbok],0);
    resol.SetFocus;
 end;
end;

procedure TPPlanesVtaTerreno.elrubroKeyPress(Sender: TObject; var Key: Char);
begin
 if key = chr(13) then begin
  Key := #0;
  if td='22002' then label14.Caption:='Meses de Diferencia'
     else label14.Caption:='Dias de Diferencia';
  subrubro.SetFocus;
 end;
end;

procedure TPPlanesVtaTerreno.elrubroExit(Sender: TObject);
begin
 td:=el_codigo(12,'');
 if td <> '' then begin
   rubroselec:=td;
   Coloca1(8,td);
    if td='22002' then label14.Caption:='Meses de Diferencia'
     else   label14.Caption:='Dias de Diferencia'
 end
 else begin
  messagedlgpos('El Rubro Ingresado es Incorrecto!!',mterror,[mbok],0,screen.Width div 3,screen.Height div 3);
  elrubro.SetFocus;
 end;
end;

procedure TPPlanesVtaTerreno.ImptotalKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then begin
  L2.Text:=redondeo(trim(Imptotal.Text),2);
  L6.Text:=redondeo(trim(Imptotal.Text),2);
  L3.Text:=trim(subrubro.Text);
  GroupBox4.Enabled:=true;
  coloca1(1,'');
  cuotas.SetFocus;
  Recalculo(1);
end;
end;

procedure TPPlanesVtaTerreno.aceptaClick(Sender: TObject);
var b,t:integer;
begin
   for b:=0 to grilla5.ColCount-1 do
    for t:=1 to grilla5.RowCount-1 do  grilla5.Cells[b,t]:='';
  grilla5.RowCount:=2;
 imptotal.Text:=totalfinan;
 label30.Caption:='...';
 grupo11105.Visible:=false;
 GroupBox4.Enabled:=true;
 coloca1(1,'');
 cuotas.SetFocus;
 Recalculo(1);
 acepta.Enabled:=false;
end;

procedure TPPlanesVtaTerreno.fecresolExit(Sender: TObject);
var fec:Tdatetime;
begin
  try
    fec:=strtodate(fecresol.Text);
  except
    messagedlgpos('La fecha es Erronea!!',mterror,[mbok],0,screen.Width div 3,screen.Height div 3);
    fecresol.SetFocus;
  end;
  if strtodate(fecresol.Text) > strtodate(strcut(Fec_System(),10)) then  begin
    messagedlgpos('La Fecha de Resolución NO puede ser mayor a la fecha actual',mterror,[mbok],0,
    screen.Width div 3,screen.Height div 3);
    fecresol.SetFocus;
  end
  else begin
   if td='22002' then begin
    combobox1.SetFocus;
   end
   else begin
    calcula.Enabled:=true;
    calcula.SetFocus;
   end;
  end;
end;
 
procedure TPPlanesVtaTerreno.fecactualExit(Sender: TObject);
var kl:Tdatetime;
begin
  try
   kl:=strtodate(trim(fecactual.Text));
  except
   messagedlgpos('La Fecha ingresada No es Válida',mterror,[mbok],0,screen.Width div 3,screen.Height div 3);
   fecactual.SetFocus;
  end;
  if strtodate(trim(fecactual.Text)) < strtodate(trim(fecresol.Text)) then  begin
   messagedlgpos('La Fecha de Calculo NO puede ser Menor a la fecha de Resolución',mterror,[mbok],0,
   screen.Width div 3,screen.Height div 3);
   fecactual.SetFocus;
  end
  else begin
   if strtodate(trim(fecactual.Text)) > strtodate(strcut(Fec_System(),10)) then  begin
    messagedlgpos('La Fecha de Calculo NO puede ser mayor a la fecha actual',mterror,[mbok],0,
    screen.Width div 3,screen.Height div 3);
    fecactual.SetFocus;
   end
   else begin
    if strtodate(trim(fecactual.Text)) = strtodate(trim(fecresol.Text)) then  begin
     messagedlgpos('La Fecha de Calculo NO puede ser Igual a la fecha de Resolución',mterror,[mbok],0,
     screen.Width div 3,screen.Height div 3);
     fecresol.SetFocus;
    end
    else begin
     calcula.SetFocus;
    end;
   end;
  end;
end;

procedure TPPlanesVtaTerreno.capitalKeyPress(Sender: TObject; var Key: Char);
begin
if key =#13 then begin
  Key := #0;
 fecresol.SetFocus;
end
else begin
    if ( StrScan('0123456789.',Key) <> nil ) or  ( Key = Char(VK_BACK) ) then
    else Key := #0;
end;
end;

procedure TPPlanesVtaTerreno.capitalExit(Sender: TObject);
begin
if (trim(capital.Text)='')  or (trim(capital.Text)='0') then begin
    messagedlg('Error!! Valor del Capital Incorrecto, por favor Ingrese otro Valor',mterror,[mbok],0);
    capital.SetFocus;
end;
end;

procedure TPPlanesVtaTerreno.fecresolKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  if strtodate(fecresol.Text) > strtodate(strcut(Fec_System(),10)) then  begin
    messagedlgpos('La Fecha de Resolución NO puede ser mayor a la fecha actual',mterror,[mbok],0,
    screen.Width div 3,screen.Height div 3);
    fecresol.SetFocus;
  end
  else begin
    if td='22002' then begin
     combobox1.SetFocus;
    end
    else begin
     calcula.Enabled:=true;
     calcula.SetFocus;
    end;
  end;
end;
end;

procedure TPPlanesVtaTerreno.fecactualKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
   if strtodate(trim(fecactual.Text)) = strtodate(trim(fecresol.Text)) then  begin
    messagedlgpos('La Fecha de Calculo NO puede ser Igual a la fecha de Resolución',mterror,[mbok],0,
    screen.Width div 3,screen.Height div 3);
    fecresol.SetFocus;
   end
   else begin
    combobox1.SetFocus;
   end;
end;
end;

procedure TPPlanesVtaTerreno.expteKeyPress(Sender: TObject; var Key: Char);
begin
if key =#13 then begin
  if nrosubrubro=1120207 then litrosnafta.SetFocus
     else resol.SetFocus;
end;
end;

procedure TPPlanesVtaTerreno.expteExit(Sender: TObject);
begin
if (trim(expte.Text)='')  or (trim(expte.Text)='0')  then begin
    messagedlg('Error!! Nro de Expediente Incorrecto, por favor Ingrese otro Valor',mterror,[mbok],0);
    expte.SetFocus;
end
else begin
  if (rubroselec='22002') or (rubroselec='11105') then begin
    l1.Text:=trim(expte.Text);
  end;
end;
end;

procedure TPPlanesVtaTerreno.CBNCClick(Sender: TObject);
begin
 if CBNC.Checked then begin
  Coloca1(2,'');
  CBNS.Checked:=False;
  tdr:=el_codigo(10,'');
  if tdr <> '' then nrosubrubro:=strtoint(tdr);
  if tdr='1120201' then button1.SetFocus
   else litrosnafta.SetFocus;
 end;
end;

procedure TPPlanesVtaTerreno.CBNSClick(Sender: TObject);
begin
 if CBNS.Checked then begin
  Coloca1(11,'');
  CBNC.Checked:=False;
  tdr:=el_codigo(10,'');
  if tdr <> '' then nrosubrubro:=strtoint(tdr);
  if tdr='1120201' then button1.SetFocus
   else litrosnafta.SetFocus;
 end;
end;

procedure TPPlanesVtaTerreno.calculaClick(Sender: TObject);
begin
coloca1(7,'');
acepta.Enabled:=true;
acepta.SetFocus;
calcula.Enabled:=false;
end;

procedure TPPlanesVtaTerreno.Agrega_TClick(Sender: TObject);
var t:integer;

  function busca():boolean;
  var p:integer;
  begin
  Result:=true;
  if grilla4.Cells[0,1] <> '' then begin
    for p:=1 to grilla4.RowCount-1 do
      if (grilla4.Cells[16,p]=trim(CARACTER.Text))  then Result:=false;
  end;
  end;

  function busca2():boolean;
    var p:integer;
  begin
    Result:=true;
    if ((nrorubro=11116) or (nrorubro=11205))
      and (trim(CARACTER.Text) = 'RESPONSABLE DE PAGO') then Result:=false;
  end;

begin
  if busca then begin
   if (grilla4.RowCount > 1) and (trim(grilla4.Cells[0,1])<>'') then begin
     t:=grilla4.RowCount;
     grilla4.RowCount:=grilla4.RowCount+1;
   end
   else t:=1;
   grilla4.Cells[0,t]:=trim(CUIM1.Text);
   grilla4.Cells[1,t]:=cambia(trim(CONTRIB.Text),chr(39),chr(33));
   grilla4.Cells[2,t]:=trim(ELCUIM.Text);
   grilla4.Cells[3,t]:=trim(BARRIO1.Text);
   grilla4.Cells[4,t]:=trim(CALLE1.Text);
   grilla4.Cells[5,t]:=trim(ALTURA1.Text);
   grilla4.Cells[15,t]:=cambia(trim(DOMI1.Text),chr(39),chr(33));
   if t = 1 then begin
    grilla4.Cells[16,t]:='TITULAR';
    Agrega_T.Caption:='Agregar Resp.';
    C3.Checked:=true;
    reg2:=1;
   end
   else begin
    grilla4.Cells[16,t]:=trim(CARACTER.Text);
    Agrega_T.Enabled:=false;
    C4.Checked:=true;
    reg2:=2;
   end;
   CUIM1.Text:='00000000';
   CONTRIB.Clear;
   BARRIO1.ItemIndex:=0;
   calle1.ItemIndex:=0;
   altura1.Clear;
   domi1.Clear;
   elcuim.Text:='00-00000000-0';
  end
  else begin
   messagedlg('Advertencia!! No se PERMITE distinto Contribuyente con el mismo Tipo de Caracter',mtWarning,[mbok],0);
   caracter.SetFocus;
  end;

  if t=2 then begin
    PLAN.ActivePage:=PLAN.Pages[1];
    observ.SetFocus;
  end
  else begin
   if tyr.Checked=true then  begin
    t:=grilla4.RowCount;
    grilla4.RowCount:=grilla4.RowCount+1;
    grilla4.Cells[0,t]:=trim(grilla4.Cells[0,1]);
    grilla4.Cells[1,t]:=cambia(trim(grilla4.Cells[1,1]),chr(39),chr(33));
    grilla4.Cells[2,t]:=trim(grilla4.Cells[2,1]);
    grilla4.Cells[3,t]:=trim(grilla4.Cells[3,1]);
    grilla4.Cells[4,t]:=trim(grilla4.Cells[4,1]);
    grilla4.Cells[5,t]:=trim(grilla4.Cells[5,1]);
    grilla4.Cells[15,t]:=cambia(trim(grilla4.Cells[15,1]),chr(39),chr(33));
    grilla4.Cells[16,t]:='RESPONSABLE DE PAGO';
    c4.Checked:=true;
    tyr.Checked:=false;
    reg2:=2;
    PLAN.ActivePage:=PLAN.Pages[1];
    observ.SetFocus;
   end
   else begin
    PLAN.ActivePage:=PLAN.Pages[0];
    PC1.ActivePage:=PC1.Pages[0];
    BUSCUIM1.SetFocus;
   end;
  end;
  observ.Enabled:=true;
end;

procedure TPPlanesVtaTerreno.BUSCUIM1Click(Sender: TObject);
var Bus_Contribuyentes:TBus_Contribuyentes;
begin
Bus_Contribuyentes:= TBus_Contribuyentes.create(self);
 try
  if trim(cuim1.Text) <> '00000000' then  Bus_Contribuyentes.ODNI.Text:=cuim1.Text
   else Bus_Contribuyentes.ODNI.Text:='00000000';
  Bus_Contribuyentes.ShowModal;
  CUIM1.Text:=Bus_Contribuyentes.L2.Caption;
  ELCUIM.Text:=Bus_Contribuyentes.L3.Caption;
  CONTRIB.Text:=strcut(Bus_Contribuyentes.L1.Caption,50);
  barrio1.ItemIndex:=barrio1.Items.IndexOf(trim(Bus_Contribuyentes.Label8.Caption));
  calle1.ItemIndex:=calle1.Items.IndexOf(trim(Bus_Contribuyentes.Label10.Caption));
  altura1.Text:=Bus_Contribuyentes.Label11.Caption;
 finally
  Bus_Contribuyentes.Free;
  barrio1.SetFocus;
 end;

 if trim(contrib.Text)='...' then begin
  if agrega_t.Enabled then agrega_t.Enabled:=false;
  GroupBox6.visible:=true;
  buscuim1.SetFocus;
 end
 else  begin
  if trim(ELCUIM.Text)='00-00000000-0' then begin
    //messagedlg('Advertencia!!.. No se PERMITE mismo Contribuyente Titular y Resp. Pago',mtWarning,[mbOk],0);
    if agrega_t.Enabled then agrega_t.Enabled:=false;
    if CONT.Enabled then CONT.Enabled:=false;
    GroupBox6.visible:=true;
    buscuim1.SetFocus;
  end
  else begin
    if not agrega_t.Enabled then agrega_t.Enabled:=true;
    if GroupBox6.visible then GroupBox6.visible:=false;
    if R1.Checked = true then Recalculo(1);//El cálculo de Importes
    barrio1.SetFocus;
  end;
 end;
end;

procedure TPPlanesVtaTerreno.Button1Click(Sender: TObject);
var tot:real;
    gf:integer;
begin
 gf:=messagedlgpos('ATENCION!! Desea Calcular el Valor del Plan de Pago',mtInformation,[mbok,mbCancel],0,screen.Width div 3,screen.Height div 3);
 if gf=1 then begin
  tot:=0;
  tot:=strtofloat(cambia(litrosnafta.Text,chr(44),chr(46))) * strtofloat(cambia(valornafta.Text,chr(44),chr(46)));
  imptotal.Text:=redondeo(floattostr(tot),2);
  L2.Text:=redondeo(floattostr(tot),2);
  L6.Text:=redondeo(floattostr(tot),2);
  L3.Text:=trim(subrubro.Text);
  GroupBox4.Enabled:=true;
  coloca1(1,'');
  cuotas.SetFocus;
 end
 else begin
  //
 end;
end;

procedure TPPlanesVtaTerreno.ImprimeClick(Sender: TObject);
var gf:integer;
begin
  gf:=messagedlgpos('Desea Imprimir el Formulario del Plan de Pago de ' + trim(subrubro.Text) + '?'
      ,mtInformation,[mbok,mbCancel],0,screen.Width div 3,screen.Height div 3);
  if gf = 1 then begin
    if reg2 = 1 then begin
      messagedlg('ATENCION!! Falta Seleccionar el Responsable para este Plan de Pago',mterror,[mbok],0);
      PLAN.ActivePage:=PLAN.Pages[0];
      PC1.ActivePage:=PC1.Pages[0];
      BUSCUIM1.SetFocus;
    end
    else begin
     // RvS.Execute;
    end;
  end;
end;

procedure TPPlanesVtaTerreno.JvBitBtn1Click(Sender: TObject);
var gf:integer;
var la_fecha,el_anio,el_anio2,respo,cod3,imp1,imp2,el_id,codbar1,codbar2,tabla:string;
var la_deu:real;
begin
 gf:=messagedlgpos('Desea Imprimir el Recibo del Sellado y de la 1° Cta. de este Plan de Pago'
    ,mtInformation,[mbok,mbCancel],0,screen.Width div 3,screen.Height div 3);
 if gf = 1 then begin
  imp2:='07';
  rub2:='11104';
  codigo2:='';
  codigo2:='927'; {Codigo2 es para el Sellado}
  codigo2:=codigo2 + importetobanco(trim(VALSELLADO.Text),8,2,'0');{es el importe del Sellado}
  la_fecha:=strcut(Fec_System(),10);
  if strtodate(trim(VENC1.Text)) >  strtodate(la_fecha) then la_fecha:=trim(VENC1.Text);
  fechas:=la_fecha;
  el_anio:=inttostr(mda(la_fecha,1));
  el_anio2:=el_anio[3]+el_anio[4];
  codigo2:=codigo2 + el_anio2;
  codigo2:=codigo2 + completa1(fecha_dif('01/01/' + el_anio,la_fecha),3,'0');
  cod3:=el_anio2 + completa1(fecha_dif('01/01/' + el_anio,la_fecha),3,'0');
  codigo2:=codigo2 + completa1(modulo2.UsuPuntoV,2,'0') + strcut_midle(el_anio,3,4);
  codigo2:=codigo2 + imp2 + '00';
  cobro2:=modulo2.UsuPuntoV + el_anio2 + ' - ' + imp2 + '00';
  try
   Com1:=TADOCommand.Create(nil);
   Com1.ConnectionString:=modulo2.ConectDbMuni;
   Com1.CommandText:='BEGIN TRANSACTION;';
   Com1.Execute;
   DataSet1.ConnectionString:=modulo2.ConectDbMuni;
   DataSet1.CommandText:='darmaximonro ' + chr(39) + 'TASAANUALLIQUIDACION'  + chr(39) + ' , ' + modulo2.UsuPuntoV;
   DataSet1.Open;
   codigo2:=codigo2 + completa1(DataSet1.Fields[0].AsString,7,'0') + '0';
   nrorec2:=completa1(DataSet1.Fields[0].AsString,7,'0');
   DataSet1.Close;
   codigo2:=codigo2 + importetobanco(trim(VALSELLADO.Text),8,2,'0');{es el importe del Sellado}
   codigo2:=codigo2 + el_anio2;
   codigo2:=codigo2 + completa1(fecha_dif('01/01/' + el_anio,la_fecha),3,'0');
   codigo2:=codigo2 + digito(codigo2,1);
   codbar2:=codigo_barra(codigo2);

   Com1.ConnectionString:=modulo2.ConectDbMuni;
   Com1.CommandText:='INSERT INTO TasaAnualLiquidacion (CUIM,NRO_DOC,NOMRAZ,respopag,MONTO1V,PRIMERV,MONTO2V,'
   +' SEGUNDV,CODBAR41,CODBAR42,CODBAR43,CODBARF,IDRUBRO,CODIGOOBJETO,PUNTOV,NROCUOTA,CODUSUIMPRIME,Varios,'
   + 'SubRubro,observaciones)'
   + ' VALUES (' + chr(39) + grilla4.Cells[2,reg2] + chr(39)
   + ' , ' + inttodni(grilla4.Cells[0,reg2])
   + ' , ' + chr(39) + strcut(cambia(trim(grilla4.Cells[1,reg2]),chr(39),chr(33)),50) + chr(39)
   + ' , ' + chr(39) + strcut(cambia(trim(grilla4.Cells[1,reg2]),chr(39),chr(33)),50) + chr(39)
   + ' , ' + cambia(trim(VALSELLADO.Text),chr(44),chr(46))
   + ' , ' + chr(39) + la_fecha + chr(39)
   + ' , ' + cambia(trim(VALSELLADO.Text),chr(44),chr(46))
   + ' , ' + chr(39) + la_fecha + chr(39)
   + ' , ' + el_anio
   + ' , ' + imp2
   + '00 ,' + nrorec2
   + ' , ' + chr(39) + codigo2 + chr(39)
   + ' , ' + rub2
   + ' , ' + chr(39) + trim(NUMPLAN.Text) + chr(39)
   + ' , ' + modulo2.UsuPuntoV
   + ' , ' + l9.Text
   + ' , ' + modulo2.UsuNro
   + ' , 0 , 1110408 '
   + ' , ' + chr(39) + 'Segun Resol N° ' + trim(resol.Text) +
      ' - Expte. N°: '+ trim(expte.Text) + ' - Acta. N°: ' + trim(acta.Text) + chr(39) + ');';
   Com1.Execute;
   Com1.CommandText:='COMMIT TRANSACTION';
   Com1.Execute;
  except
   Com1.CommandText:='ROLLBACK TRANSACTION';
   Com1.Execute;
  end;
 end;
end;

procedure TPPlanesVtaTerreno.AgregaClick(Sender: TObject);

var gf,t,r:integer;
var el_id,txt,txt1,identif:string;
var vf:real;

   Procedure mostrando(cadena:string);
    begin
      Dialogo.MessageFont.Size:=15;
      Dialogo.MessageFont.Color:=clFuchsia;
      Dialogo.CaptionTitle:='Nuevo Plan de Pagos';
      Dialogo.ShowMessage('El N° de PLAN Asignado es:' + chr(13) + cadena);
    end;
    
begin
gf:=messagedlgpos('Desea Guardar los Datos del Plan de Pago?',mtInformation,[mbCancel,mbok],0,screen.Width div 3,screen.Height div 3);
if gf=1 then begin
  if reg2 = 1 then begin
   messagedlg('ATENCION!! Imposible guardar el Plan de Pago' + chr(13) + 'por Falta de un Responsable de Pago',mterror,[mbok],0);
   PLAN.ActivePage:=PLAN.Pages[0];
   PC1.ActivePage:=PC1.Pages[0];
   BUSCUIM1.SetFocus;
  end
  else begin
    Com1:=TADOCommand.Create(nil);
    Com1.ConnectionString:=modulo2.ConectDbPlanes;
    try
     Com1.CommandText:='BEGIN TRANSACTION;';
     Com1.Execute;
     if tdr='1120201' then identif:=elidentif
      else identif:='null';
     Com1.CommandText:='INSERT INTO Planes (CodigoObjeto,Rubro,CantCuotas,ImporteCuota,PrimerVenc,UltimoVenc,UsuCarga,'
     + 'FechaCarga,Observaciones,NroPlanRef,IdSubRubro,puntov,identificador) VALUES ('
     + chr(39) + trim(L1.Text) + chr(39)
     + ' , ' + td
     + ' , ' + trim(l9.Text)
     + ' , ' + cambia(trim(VALCUOTAS.Text),chr(44),chr(46))
     + ' , ' + chr(39) + trim(VENC1.Text) + chr(39)
     + ' , ' + chr(39) + trim(VENC2.Text) + chr(39)
     + ' , ' + modulo2.UsuNro
     + ' , ' + chr(39) + Fec_System() + chr(39)
     + ' , ' + chr(39) + cambia(trim(OBSERV.Text),chr(39),chr(33)) + chr(39)
     + ' , null , ' +  subrubroselec //tdr
     + ' , ' + Modulo2.UsuPuntoV
     + ' , ' + identif + ');';
     Com1.Execute;

     Com1.CommandText:='SELECT @@IDENTITY AS Id';
     DataSet1.Recordset:=Com1.Execute;
     DataSet1.Open;
     NUMPLAN.Text:=trim(DataSet1.Fields[0].AsString);
     DataSet1.Close;
     for t:=1 to grilla4.RowCount-1 do begin
      Com1.CommandText:='INSERT INTO PlanesContribuyentes (NroPlan,NroCuim,Nombre,NroBarrio,NroCalle,Altura,'
      +'NroProvincia,Domicilio,TipoContribuyente) VALUES ('
      + NUMPLAN.Text
      + ' , ' + chr(39) + grilla4.Cells[2,t] + chr(39)
      + ' , ' + chr(39) + strcut(cambia(trim(grilla4.Cells[1,t]),chr(39),chr(33)),50) + chr(39)
      + ' , ' + el_codigo(6,grilla4.Cells[3,t])
      + ' , ' + el_Codigo(7,grilla4.Cells[4,t])
      + ' , ' + trim(grilla4.Cells[5,t])  + ' , 38 '
      + ' , ' + chr(39) + grilla4.Cells[15,t] + chr(39)
      + ' , ' + el_codigo(5,grilla4.Cells[16,t]) + ');';
      Com1.Execute;
     end;

     Com1.CommandText:='INSERT INTO PlanesEstadosDet (NroPLan,NroEstado,Usuario,PuntoV,Activo)'
     + ' VALUES (' + NUMPLAN.Text + ' , 0 , ' + modulo2.UsuNro + ' , ' + Modulo2.UsuPuntoV + ' , 1 )';
     Com1.Execute;

     if trim(grilla5.Cells[0,1]) <> '' then begin
      for t:=1 to grilla5.RowCount-1 do begin
       Com1.CommandText:='INSERT INTO PlanesPeriodos (NroPLan,Periodo,Capital,Interes,saldo,'
       + 'FechaVencimiento,Tipo,SubRubro) VALUES (' + NUMPLAN.Text
       + ' , ' + trim(grilla5.Cells[6,t])
       + ' , ' + chr(39) + grilla5.Cells[4,t] + chr(39)
       + ' , ' + chr(39) + grilla5.Cells[5,t] + chr(39)
       + ' , 0 '
       + ' , ' + chr(39) + grilla5.Cells[2,t] + chr(39)
       + ' , ' + chr(39) + 'N' + chr(39)
       + ' , ' + rubroselec + ');';  //subrubroselec + ');';
       Com1.Execute;
      end;
     end;

     for t:=1 to grilla5.RowCount-1 do begin
      Com1.CommandText:='INSERT INTO PlanesCuotas (NroPLan,NroCuota,FechaVencimiento,ImporteTotal,Capital,Intereses)'
      + 'VALUES (' + NUMPLAN.Text
      + ' , ' + grilla5.Cells[1,t]
      + ' , ' + chr(39) + grilla5.Cells[2,t] + chr(39)
      + ' , ' + cambia(grilla5.Cells[3,t],chr(44),chr(46))
      + ' , ' + cambia(grilla5.Cells[4,t],chr(44),chr(46))
      + ' , ' + cambia(grilla5.Cells[5,t],chr(44),chr(46)) + ');';
      Com1.Execute;
     end;

     Agrega.Enabled:=false;
     AuditAccesos(trim(NUMPLAN.Text),'A');
     Com1.CommandText:='COMMIT TRANSACTION';
     Com1.Execute;
     label49.Caption:='EL Plan de Pago se Guardo con Exito';
     Image2.Picture.LoadFromFile(modulo2.path_todo + '\Imagenes\button_ok.ico');
     Mostrando(trim(NUMPLAN.Text));
     Imprime.Enabled:=true;
     BitBtn2.Enabled:=true;
    except
     Com1.CommandText:='ROLLBACK TRANSACTION';
     Com1.Execute;
     Imprime.Enabled:=false;
     BitBtn2.Enabled:=false;
     label49.Caption:='Error al Guardar el Plan de Pago.';
     Image2.Picture.LoadFromFile(modulo2.path_todo + '\Imagenes\button_cancel.ico');
    end;
    com1.Free;
  end;
end;
end;

procedure TPPlanesVtaTerreno.grilla5DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  dx: Integer;
begin
 with Sender as TStringGrid do with Canvas do
  begin
    // selección del color de fondo
    if gdFixed in State then Brush.Color :=  clBtnFace
    else
      //if gdSelected in State then Brush.Color := clInfoBk //aca donde se pone el color de las filas selecciondas
      //else
        if Odd(ARow) then Brush.Color := clInfoBk //clInfoBk cl3DLight  aca donde se pone el color de las filas
        else Brush.Color := clwindow;
    // pintado del fondo
    FillRect(Rect);
    // selección del color de las filas
    if gdSelected in State then Font.Color:=clBlack //clWhite
    else Font.Color := clBlack;
    // dibujado del texto
    TextOut(Rect.Left+1, Rect.Top, Cells[ACol, ARow]);
  End;
end;

procedure TPPlanesVtaTerreno.ComboBox1Exit(Sender: TObject);
begin
  if ComboBox1.ItemIndex < 0 then begin
    messagedlg('Error!! Seleccione un Tipo de Interes válido',mterror,[mbok],0);
    ComboBox1.SetFocus;
  end
  else begin
    calcula.Enabled:=true;
    calcula.SetFocus;
  end;
end;

procedure TPPlanesVtaTerreno.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
  Key := #0;
  calcula.Enabled:=true;
  calcula.SetFocus;
end;
end;

procedure TPPlanesVtaTerreno.DOMI1Exit(Sender: TObject);
begin
 if (trim(barrio1.Text)='DESCONOCIDO') and (trim(calle1.Text)='CALLE S/N') then  begin
   if (trim(DOMI1.Text)='') then begin
    messagedlg('Error!! Domicilio Incorrecto, por favor Ingrese otro Valor',mterror,[mbok],0);
    DOMI1.SetFocus;
   end;
 end;
end;

end.



