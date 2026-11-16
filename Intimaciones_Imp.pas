unit Intimaciones_Imp;

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
  TIntima_Imp = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    BORRA: TJvBitBtn;
    ToolButton3: TToolButton;
    SALE: TJvBitBtn;
    Barra1: TStatusBar;
    DataSource1: TDataSource;
    FormularioEmb: TJvEmbeddedFormLink;
    frxReport2: TfrxReport;
    PC1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    DataSource2: TDataSource;
    ImageList2: TImageList;
    JvDBGrid2: TJvDBGrid;
    JvgGroupBox1: TJvgGroupBox;
    Label9: TLabel;
    ONOMB: TEdit;
    JvBitBtn1: TJvBitBtn;
    JvDBGrid1: TJvDBGrid;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SALEClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ImprimeConfirmacion();
    procedure BORRAClick(Sender: TObject);
    procedure Coloca1(nro:byte;valor:string);
    procedure JvDBGrid2CellClick(Column: TColumn);
    procedure ONOMBChange(Sender: TObject);
    procedure JvBitBtn1Click(Sender: TObject);
  private
    CONTRIBUYENTE,LOSOBJETOS:TADODataSet;{ Private declarations }
    fecha,respuesta,laidcuenta,dato,FechaAct,elcontrib,
    eldni,tipocta,lacuenta,lasucur,elbank,elidcontrib,elcuit,Filtro:string;
    Com1:TADOCommand;
  public
    Objetos:TObjetos;
    sumad,suma:double;
    gh:boolean;{ Public declarations }
  end;

var
  Intima_Imp: TIntima_Imp;

implementation

uses Unidad ,modulo;

{$R *.dfm}

procedure TIntima_Imp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FreeAndNil(CONTRIBUYENTE);
FreeAndNil(LOSOBJETOS);
FreeAndNil(Self);
end;

procedure TIntima_Imp.FormCreate(Sender: TObject);
begin
CONTRIBUYENTE:=TADODataSet.Create(nil);
DataSource1.DataSet:=CONTRIBUYENTE;
LOSOBJETOS:=TADODataSet.Create(Self);
DataSource2.DataSet:=LOSOBJETOS;
end;

procedure TIntima_Imp.BORRAClick(Sender: TObject);
begin
ImprimeConfirmacion();
end;

procedure TIntima_Imp.FormActivate(Sender: TObject);
begin
if not (gh) then begin
  gh:=true;
  FechaAct:=LeftStr(Fec_System(),10);
  PC1.ActivePage:=PC1.Pages[0];
  Coloca1(1,'');
  onomb.SetFocus;
end;
end;

procedure TIntima_Imp.Coloca1(nro:byte;valor:string);
var t,b,y:integer;
    tx:string;
begin
sumad:=0;
try
 Modulo2.ObjConexion:=TADOConnection.Create(nil);
 Modulo2.ObjConexion.LoginPrompt:=false;
 Modulo2.ObjConexion.ConnectionString:=modulo2.Sistema.ConectInti;
 if nro = 1 then begin
  CONTRIBUYENTE.Close;
  CONTRIBUYENTE.Connection:=modulo2.ObjConexion;
  CONTRIBUYENTE.CommandText:='SELECT top 1000 Id,Contribuyente,NroDni,Barrio,Calle,Altura,Dpto,Mza,'
  + 'Casa,Torre,Domicilio FROM DeudaIntimacionContribuyente';
  CONTRIBUYENTE.Open;
  if CONTRIBUYENTE.IsEmpty then begin
    messagedlg('Contribuyente Inexistente...' + chr(13) + 'Por favor realice otra Busqueda..',mtWarning,[mbok,mbCancel],0);
  end
  else begin
    JvDBGrid2.Columns[0].Width:=50;           JvDBGrid2.Columns[1].Width:=250;
    JvDBGrid2.Columns[2].Width:=80;           JvDBGrid2.Columns[3].Width:=150;
    JvDBGrid2.Columns[4].Width:=150;          JvDBGrid2.Columns[5].Width:=70;
    JvDBGrid2.Columns[6].Width:=70;           JvDBGrid2.Columns[7].Width:=70;
    JvDBGrid2.Columns[8].Width:=70;           JvDBGrid2.Columns[9].Width:=70;
    JvDBGrid2.Columns[10].Width:=70;
  end;
  CONTRIBUYENTE.Connection:=nil;
 end;
 if nro = 2 then begin
  CONTRIBUYENTE.Close;
  CONTRIBUYENTE.Connection:=modulo2.ObjConexion;
  CONTRIBUYENTE.CommandText:='SELECT Id,Contribuyente,NroDni,Barrio,Calle,Altura,Dpto,Mza,'
  + 'Casa,Torre,Domicilio FROM DeudaIntimacionContribuyente where Contribuyente like ' + dato + ' order by 2';
  CONTRIBUYENTE.Open;
  if CONTRIBUYENTE.IsEmpty then begin
    messagedlg('Contribuyente Inexistente...' + chr(13) + 'Por favor realice otra Busqueda..',mtWarning,[mbok,mbCancel],0);
  end
  else begin
    JvDBGrid2.Columns[0].Width:=50;           JvDBGrid2.Columns[1].Width:=250;
    JvDBGrid2.Columns[2].Width:=80;           JvDBGrid2.Columns[3].Width:=150;
    JvDBGrid2.Columns[4].Width:=150;          JvDBGrid2.Columns[5].Width:=70;
    JvDBGrid2.Columns[6].Width:=70;           JvDBGrid2.Columns[7].Width:=70;
    JvDBGrid2.Columns[8].Width:=70;           JvDBGrid2.Columns[9].Width:=70;
    JvDBGrid2.Columns[10].Width:=70;
  end;
  CONTRIBUYENTE.Connection:=nil;
 end;
 if nro = 3 then begin
  LOSOBJETOS.Close;
  LOSOBJETOS.Connection:=modulo2.ObjConexion;
  LOSOBJETOS.CommandText:='SELECT Rubro,Codigoobjeto,ImporteDeuda,PeriodoDeuda '
  + ' FROM Fn_ContribuyentesDeudaObjetos (' + trim(CONTRIBUYENTE.Fields[0].AsString) + ')';
  LOSOBJETOS.Open;
  if LOSOBJETOS.IsEmpty then begin
    messagedlg('Contribuyente Inexistente...' + chr(13) + 'Por favor realice otra Busqueda..',mtWarning,[mbok,mbCancel],0);
  end
  else begin
   try
    JvDBGrid1.datasource.dataset.disablecontrols;
    JvDBGrid1.datasource.dataset.first;
    while not JvDBGrid1.datasource.dataset.eof do begin
      if  (trim(JvDBGrid1.Fields[3].Value)='') then begin
         //sumad := sumad + JvDBGrid1.datasource.dataset.fieldbyname('ImporteDeuda').asfloat;
         sumad := sumad + strtofloat(JvDBGrid1.datasource.dataset.fieldbyname('ImporteDeuda').AsString);
      end;
      JvDBGrid1.datasource.dataset.next;
    end;
   finally
    JvDBGrid1.datasource.dataset.enablecontrols;
   end;
    JvDBGrid1.Columns[0].Width:=250;          JvDBGrid1.Columns[1].Width:=80;
    JvDBGrid1.Columns[2].Width:=80;           JvDBGrid1.Columns[3].Width:=900;
  end;
  LOSOBJETOS.Connection:=nil;
 end;
 FreeAndNil(Modulo2.ObjConexion);
except
  on E: Exception do begin
    EnviarLog(Self.Caption, E.Message);
    //EnviarLog(Self.Caption, DataSet3.CommandText);
    // EnviarLog(self.Caption,Objetos.Identidad.Strings[t] + ' - ' + Parametro);
  end
end;
end;

procedure  TIntima_Imp.ImprimeConfirmacion();
var ReporteRst: TfrxReport;
    frxDB1,frxDB2: TfrxDBDataset;
    DtsObjetos:TClientDataSet;
    t,y:integer;
    Com1:TADOCommand;
begin
t:=messagedlg('Confirma la Impresión de la Intimación seleccionada?',mtWarning,[mbok,mbCancel],0);
 if t = 1 then begin

   Com1:=TADOCommand.Create(nil);
   Com1.ConnectionString:=Modulo2.Sistema.ConectInti;
    try
      Com1.CommandText :='UPDATE DeudaIntimacionContribuyente SET Impreso=1, '
      + ' FechaImpresion=' + chr(39) + FechaAct + chr(39)
      + ', NroUsuario=' + modulo2.Usuario.UsuNro
      + ' where (id='+ trim(CONTRIBUYENTE.Fields[0].AsString) + ')';
      Com1.Execute;
  except
    on E: Exception do begin
      EnviarLog(Self.Caption, E.Message);
      EnviarLog(Self.Caption, Com1.CommandText);
    end;
  end;
  FreeAndNil(Com1);

    try
      ReporteRst:=TfrxReport.Create(nil);
      frxDB1:=TfrxDBDataset.Create(nil);
      frxDB1.DataSet:=LOSOBJETOS;
      frxDB1.UserName:='frxDBDataset1';
      ReporteRst.DataSets.Add(frxDB1);

      ReporteRst.LoadFromFile(Modulo2.Sistema.Path_todo + '\Reportes\Imp_Intimacion.fr3');
      TfrxPictureView(ReporteRst.FindObject('Logo1')).Picture.LoadFromFile(Modulo2.Sistema.Path_todo + '\Imagenes\LogoM2.jpg');
      TfrxPictureView(ReporteRst.FindObject('Logo2')).Picture.LoadFromFile(Modulo2.Sistema.Path_todo + '\Imagenes\FirmaSebastianRojas.bmp');
      ReporteRst.Variables['ElqueSuscribe'] := QuotedStr(trim(CONTRIBUYENTE.Fields[1].AsString));
      ReporteRst.Variables['NroDni'] := QuotedStr(trim(CONTRIBUYENTE.Fields[2].AsString));
      ReporteRst.Variables['Barrio'] := QuotedStr(trim(CONTRIBUYENTE.Fields[3].AsString));
      ReporteRst.Variables['Calle'] := QuotedStr(trim(CONTRIBUYENTE.Fields[4].AsString));
      ReporteRst.Variables['Altura'] := QuotedStr(trim(CONTRIBUYENTE.Fields[5].AsString));
      ReporteRst.Variables['Dpto'] := QuotedStr(trim(CONTRIBUYENTE.Fields[6].AsString));
      ReporteRst.Variables['Mza'] := QuotedStr(trim(CONTRIBUYENTE.Fields[7].AsString));
      ReporteRst.Variables['Casa'] := QuotedStr(trim(CONTRIBUYENTE.Fields[8].AsString));
      ReporteRst.Variables['Torre'] := QuotedStr(trim(CONTRIBUYENTE.Fields[9].AsString));
      ReporteRst.Variables['DomTitular'] := QuotedStr(trim(CONTRIBUYENTE.Fields[10].AsString));
      ReporteRst.Variables['Total'] := QuotedStr(floattostr(sumad));
      //ReporteRst.Variables['LugarFecha'] := QuotedStr('FORMOSA, ' + FechaToStr(FechaAct,'DDMMAAAA'));
      ReporteRst.Variables['NroUsuario'] := QuotedStr(Modulo2.Usuario.UsuNro);
      ReporteRst.ShowReport;
    except
      on E: Exception do EnviarLog(Self.Caption, 'Error en Reporte ' + E.Message);
    end;
    FreeAndNil(frxDB1);
    FreeAndNil(ReporteRst);
    FreeAndNil(DtsObjetos);
 end;
end;

procedure TIntima_Imp.JvBitBtn1Click(Sender: TObject);
begin
onomb.Clear;
Coloca1(1,'');
LOSOBJETOS.Close;
end;

procedure TIntima_Imp.JvDBGrid2CellClick(Column: TColumn);
begin
 coloca1(3,'');
 PC1.ActivePage:=PC1.Pages[1];
end;

procedure TIntima_Imp.ONOMBChange(Sender: TObject);
begin
  If length(ONOMB.text) > 1 then begin
    if RightStr(Filtro,1) = '=' then Dato:=Filtro + trim(ONOMB.Text)
     else Dato:=Filtro + QuotedStr( chr(37) + trim(ONOMB.Text) + chr(37));
     Coloca1(2,dato);
     Barra1.Panels[1].Text:='Cant. Registros: ' + inttostr(CONTRIBUYENTE.RecordCount);
  end;
end;

procedure TIntima_Imp.SALEClick(Sender: TObject);
begin
Close;
end;

end.
