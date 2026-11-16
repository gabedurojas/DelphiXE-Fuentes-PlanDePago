unit BoletoDeuda_ImpNew;

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
  TIntima_ImpNew = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    imprime: TJvBitBtn;
    ToolButton3: TToolButton;
    SALE: TJvBitBtn;
    Barra1: TStatusBar;
    FormularioEmb: TJvEmbeddedFormLink;
    frxReport2: TfrxReport;
    PC1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    ImageList2: TImageList;
    Label7: TLabel;
    TabSheet3: TRzTabSheet;
    JvDBGrid3: TJvDBGrid;
    DataSource2: TDataSource;
    PopupMenu1: TPopupMenu;
    SeleccionarTodos1: TMenuItem;
    grilla5: TStringGrid;
    EliminarSeleccin1: TMenuItem;
    JvGroupBox2: TJvGroupBox;
    Label28: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Label29: TLabel;
    grilla2: TJvStringGrid;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SALEClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imprimeClick(Sender: TObject);
    procedure Coloca1(nro:byte;valor:string);
    procedure JvDBGrid3CellClick(Column: TColumn);
    procedure SeleccionarTodos1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    function VerificaGrillaDeuda(grilla:string):boolean;
    procedure EliminarSeleccin1Click(Sender: TObject);
    procedure grilla2DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure grilla2Click(Sender: TObject);
  private
    CONTRIBUYENTE,LOSOBJETOS,DataSet3,DataSet4:TADODataSet;{ Private declarations }
    fecha,respuesta,laidcuenta,dato,FechaAct,elcontrib,fechalote,
    eldni,tipocta,lacuenta,lasucur,elbank,elidcontrib,elcuit,Filtro,NroImp:string;
    DtsCuotas:TClientDataSet;
    Com1:TADOCommand;
  public
    Objetos:TObjetos;
    sumad,suma:double;
    selecfila:integer;
    gh:boolean;{ Public declarations }
  end;

var
  Intima_ImpNew: TIntima_ImpNew;

implementation

uses Unidad ,modulo;

{$R *.dfm}

procedure TIntima_ImpNew.EliminarSeleccin1Click(Sender: TObject);
var b,t:integer;
begin
for b:=0 to grilla2.ColCount-1 do
   for t:=1 to grilla2.RowCount-1 do  grilla2.Cells[1,t]:='';
   verificagrilladeuda('grilla2');
end;

procedure TIntima_ImpNew.FormActivate(Sender: TObject);
begin
if not (gh) then begin
  gh:=true;
  FechaAct:=LeftStr(Fec_System(),10);
  PC1.ActivePage:=PC1.Pages[0];
  Coloca1(0,'');
  CheckBox1.Checked:=true;
  grilla2.Cells[0,0]:='Orden';            grilla2.Cells[1,0]:='Imprime';
  grilla2.Cells[2,0]:='NroBoletoDeuda';    grilla2.Cells[3,0]:='NroLote';
  grilla2.Cells[4,0]:='Contribuyente';
  grilla2.Cells[5,0]:='NroDni';           grilla2.Cells[6,0]:='Barrio';
  grilla2.Cells[7,0]:='Calle';            grilla2.Cells[8,0]:='Altura';
  grilla2.Cells[9,0]:='Depto.';
  grilla2.Cells[10,0]:='Manzana';         grilla2.Cells[11,0]:='Casa';
  grilla2.Cells[12,0]:='Torre';           grilla2.Cells[13,0]:='Domicilio';
  grilla2.Cells[14,0]:='ImporteDeuda';    grilla2.Cells[15,0]:='IdContrib';
  grilla2.Cells[16,0]:='Impreso';         grilla2.Cells[17,0]:='ID';

  grilla5.Cells[0,0]:='Rubro';            grilla5.Cells[1,0]:='Capital';
  grilla5.Cells[2,0]:='Interes';          grilla5.Cells[3,0]:='ImporteDeuda';
  grilla5.Cells[4,0]:='PeriodoDeuda';
end;
end;

procedure TIntima_ImpNew.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FreeAndNil(CONTRIBUYENTE);
FreeAndNil(LOSOBJETOS);
FreeAndNil(DataSet3);
FreeAndNil(DataSet4);
FreeAndNil(Self);
end;

procedure TIntima_ImpNew.FormCreate(Sender: TObject);
begin
CONTRIBUYENTE:=TADODataSet.Create(nil);
LOSOBJETOS:=TADODataSet.Create(nil);
DataSet3:=TADODataSet.Create(nil);
DataSource2.DataSet:=DataSet3;
DataSet4:=TADODataSet.Create(nil);
end;

function TIntima_ImpNew.VerificaGrillaDeuda(grilla:string):boolean;
var j,a:integer;
begin
selecfila:=0;
Result:=true;
for j:=1 to grilla2.RowCount-1 do begin
    if trim(grilla2.Cells[1,j])='X' then begin
      selecfila:=selecfila+1;
      break;
    end;
end;
end;

procedure TIntima_ImpNew.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
     VK_F4 : begin
         imprime.Click;
     end;
     VK_F9 : begin
       //  limpia.Click;
     end;
  end;
end;

procedure TIntima_ImpNew.imprimeClick(Sender: TObject);
var ReporteRst: TfrxReport;
    frxDB1,frxDB2: TfrxDBDataset;
    t,y,gf:integer;
    Com1:TADOCommand;
begin
t:=messagedlg('Confirma la Impresión de la Boleta de Deuda seleccionada?',mtWarning,[mbok,mbCancel],0);
if t = 1 then begin
 if selecfila = 0 then begin
 //if not verificagrilladeuda('grilla1') then begin
   messagedlg('            I M P O S I B L E   I M P R I M I R ' + chr(13)
   + 'porque no existe ninguna Intimación Seleccionada ',mtError,[mbok],0);
   grilla2.SetFocus;
 end
 else begin
   for gf:=1 to grilla2.RowCount-1 do begin
    if (grilla2.Cells[1,gf] = 'X') then begin
      Com1:=TADOCommand.Create(nil);
      Com1.ConnectionString:=Modulo2.Sistema.ConectInti;
      try
        Com1.CommandText :='UPDATE IntimacionContribuyente SET Impreso=1, '
        + ' FechaImpresion=' + chr(39) + FechaAct + chr(39)
        + ' where (id='+ trim(grilla2.Cells[2,gf]) + ')';
        Com1.Execute;
      except
        on E: Exception do begin
         EnviarLog(Self.Caption, E.Message);
         EnviarLog(Self.Caption, Com1.CommandText);
        end;
      end;

      FreeAndNil(Com1);
      Coloca1(3,trim(grilla2.Cells[2,gf]));
      try
        DtsCuotas:=TClientDataSet.Create(nil);
        DtsCuotas.FieldDefs.Clear;
        DtsCuotas.Active:=False;
        with DtsCuotas.FieldDefs.AddFieldDef do begin
          Name:='Rubro';DataType:=ftString;Size:=50;
        end;
        with DtsCuotas.FieldDefs.AddFieldDef do begin
          Name:='Capital';DataType:=ftString;Size:=25;
        end;
        with DtsCuotas.FieldDefs.AddFieldDef do begin
          Name:='Interes';DataType:=ftString;Size:=25;
        end;
        with DtsCuotas.FieldDefs.AddFieldDef do begin
          Name:='ImporteDeuda';DataType:=ftString;Size:=25;
        end;
        with DtsCuotas.FieldDefs.AddFieldDef do begin
          Name:='PeriodoDeuda';DataType:=ftString;Size:=250;
        end;
        DtsCuotas.CreateDataSet;
        DtsCuotas.Active:=True;
        for t:=1 to Grilla5.RowCount-1 do begin
         DtsCuotas.Append;
         DtsCuotas.FieldValues['Rubro']:=grilla5.Cells[0,t];
         DtsCuotas.FieldValues['Capital']:=grilla5.Cells[1,t];
         DtsCuotas.FieldValues['Interes']:=grilla5.Cells[2,t];
         DtsCuotas.FieldValues['ImporteDeuda']:=grilla5.Cells[3,t];
         DtsCuotas.FieldValues['PeriodoDeuda']:=grilla5.Cells[4,t];
         DtsCuotas.Post;
        end;
      except
        on E: Exception do EnviarLog(Self.Caption, E.Message);
      end;

      ///imprimiendo
      try
        ReporteRst:=TfrxReport.Create(nil);
        frxDB1:=TfrxDBDataset.Create(nil);
        frxDB1.DataSet:=DtsCuotas;
        frxDB1.UserName:='frxDBDataset1';
        ReporteRst.DataSets.Add(frxDB1);
        ReporteRst.LoadFromFile(Modulo2.Sistema.Path_todo + '\Reportes\Imp_BoletoDeuda.fr3');
        TfrxPictureView(ReporteRst.FindObject('Logo1')).Picture.LoadFromFile(Modulo2.Sistema.Path_todo + '\Imagenes\LogoM2.jpg');
        TfrxPictureView(ReporteRst.FindObject('Logo2')).Picture.LoadFromFile(Modulo2.Sistema.Path_todo + '\Imagenes\logoformosa.jpg');
        ReporteRst.Variables['NroImp'] := QuotedStr(trim(grilla2.Cells[2,gf]));
        ReporteRst.Variables['NroLote'] :=  QuotedStr(trim(grilla2.Cells[3,gf]));
        ReporteRst.Variables['ElqueSuscribe'] := QuotedStr(trim(grilla2.Cells[4,gf]));
        ReporteRst.Variables['NroDni'] := QuotedStr(trim(grilla2.Cells[5,gf]));
        ReporteRst.Variables['Barrio'] := QuotedStr(trim(grilla2.Cells[6,gf]));
        ReporteRst.Variables['Calle'] := QuotedStr(trim(grilla2.Cells[7,gf]));
        ReporteRst.Variables['Altura'] := QuotedStr(trim(grilla2.Cells[8,gf]));
        ReporteRst.Variables['Dpto'] := QuotedStr(trim(grilla2.Cells[9,gf]));
        ReporteRst.Variables['Mza'] := QuotedStr(trim(grilla2.Cells[10,gf]));
        ReporteRst.Variables['Casa'] := QuotedStr(trim(grilla2.Cells[11,gf]));
        ReporteRst.Variables['Torre'] := QuotedStr(trim(grilla2.Cells[12,gf]));
        ReporteRst.Variables['DomTitular'] := QuotedStr(trim(grilla2.Cells[13,gf]));
        ReporteRst.Variables['FechaActual'] := QuotedStr(trim(fechalote));
        //ReporteRst.Variables['LugarFecha'] := QuotedStr('FORMOSA, ' + FechaToStr(FechaAct,'DDMMAAAA'));
        ReporteRst.Variables['NroUsuario'] := QuotedStr(Modulo2.Usuario.UsuNro);
        ReporteRst.PrepareReport;
        ReporteRst.PrintOptions.ShowDialog:=false;
        if CheckBox1.Checked then ReporteRst.PrintOptions.Copies:=2
         else ReporteRst.PrintOptions.Copies:=1;
        //ReporteRst.PrintOptions.Copies:=2;
        ReporteRst.Print;
      except
        on E: Exception do EnviarLog(Self.Caption, 'Error en Reporte ' + E.Message);
      end;
      FreeAndNil(frxDB1);
      FreeAndNil(ReporteRst);
      PC1.ActivePage:=PC1.Pages[0];
    end;
   end;
 end;
end;
end;

///// aca solo habilito la columna 1
procedure TIntima_ImpNew.grilla2Click(Sender: TObject);
begin
 if grilla2.Cells[0,grilla2.Row] <> '' then begin
   if trim(grilla2.Cells[1,grilla2.Row])='' then grilla2.Cells[1,grilla2.Row]:='X'
    else grilla2.Cells[1,grilla2.Row]:='';
   Dato:=grilla2.Cells[17,grilla2.Row];
   Coloca1(3,Dato);
   verificagrilladeuda('grilla2');
 end;
end;

procedure TIntima_ImpNew.grilla2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  With Sender as TStringGrid do begin
   if trim(grilla2.Cells[16,Arow]) = 'SI' then begin
     Canvas.Brush.Color := clLime;
     Canvas.TextRect( Rect, Rect.Left+2, Rect.Top+2, Cells[acol, arow]);
   end;
  end;
end;

procedure TIntima_ImpNew.Coloca1(nro:byte;valor:string);
var t,b,y:integer;
    tx:string;
    Cnx2:TADOConnection;
begin
sumad:=0;
try
 Cnx2:=TADOConnection.Create(nil);
 Cnx2.LoginPrompt:=false;
 Cnx2.ConnectionString:=modulo2.Sistema.ConectInti;
 if nro = 0 then begin
  DataSet3.Close;
  DataSet3.Connection:=Cnx2;
  DataSet3.CommandText:='select NroLote,FechaLote,NombreUsuario,Usuario from Fn_LotesBoletoDeudaContribuyentes (1)';
  DataSet3.Open;
  DataSet3.Connection:=nil;
 end;
 if nro = 2 then begin
  CONTRIBUYENTE.Close;
  CONTRIBUYENTE.Connection:=Cnx2;
  //CONTRIBUYENTE.CommandText:='SELECT Id as NroIntimacion' +
  CONTRIBUYENTE.CommandText:='SELECT NroControl,NroLote,Contribuyente,NroDni,Barrio,Calle,Altura,Dpto,Mza,'
  + 'Casa,Torre,Domicilio,ImporteDeuda,IdContribuyente,case when impreso= 1 then ''SI'' else ''NO'' end as Impreso,id '
  + ' FROM IntimacionContribuyente where (NroLote=' + valor+ ') and (esboletodeuda= 1)'; // and impreso = 0 ';
  CONTRIBUYENTE.Open;
  if CONTRIBUYENTE.IsEmpty then begin
    messagedlg('Nro de Lote sin Registros para Imprimir...' + chr(13) + 'Por favor realice otra Busqueda..',mtWarning,[mbok,mbCancel],0);
  end
  else begin
   for t:=1 to CONTRIBUYENTE.RecordCount do begin
    CONTRIBUYENTE.RecNo:=t;
     grilla2.RowCount:=t + 1;
     grilla2.Cells[0,t]:=StrFill(IntToStr(t),2,'0','');
     grilla2.Cells[1,t]:='';
     grilla2.Cells[2,t]:=CONTRIBUYENTE.FieldByName('NroControl').AsString;
     grilla2.Cells[3,t]:=CONTRIBUYENTE.FieldByName('NroLote').AsString;
     grilla2.Cells[4,t]:=CONTRIBUYENTE.FieldByName('Contribuyente').AsString;
     grilla2.Cells[5,t]:=CONTRIBUYENTE.FieldByName('NroDni').AsString;
     grilla2.Cells[6,t]:=CONTRIBUYENTE.FieldByName('Barrio').AsString;
     grilla2.Cells[7,t]:=CONTRIBUYENTE.FieldByName('Calle').AsString;
     grilla2.Cells[8,t]:=CONTRIBUYENTE.FieldByName('Altura').AsString;
     grilla2.Cells[9,t]:=CONTRIBUYENTE.FieldByName('Dpto').AsString;
     grilla2.Cells[10,t]:=CONTRIBUYENTE.FieldByName('Mza').AsString;
     grilla2.Cells[11,t]:=CONTRIBUYENTE.FieldByName('Casa').AsString;
     grilla2.Cells[12,t]:=CONTRIBUYENTE.FieldByName('Torre').AsString;
     grilla2.Cells[13,t]:=CONTRIBUYENTE.FieldByName('Domicilio').AsString;
     grilla2.Cells[14,t]:=CONTRIBUYENTE.FieldByName('ImporteDeuda').AsString;
     grilla2.Cells[15,t]:=CONTRIBUYENTE.FieldByName('IdContribuyente').AsString;
     grilla2.Cells[16,t]:=CONTRIBUYENTE.FieldByName('Impreso').AsString;
     grilla2.Cells[17,t]:=CONTRIBUYENTE.FieldByName('ID').AsString;
   end;
   Barra1.Panels[1].Text:='Cant. Registros: ' + inttostr(CONTRIBUYENTE.RecordCount);
  end;
  CONTRIBUYENTE.Connection:=nil;
 end;
 if nro = 3 then begin
  LOSOBJETOS.Close;
  LOSOBJETOS.Connection:=Cnx2;
  LOSOBJETOS.CommandText:='SELECT Rubro,Capital,Interes,ImporteDeuda,PeriodoDeuda '
  + ' from Fn_ContribuyentesDeudaObjetosBoletoDeuda (' + valor+ ')';
  LOSOBJETOS.Open;
  if LOSOBJETOS.IsEmpty then begin
    messagedlg('Contribuyente Inexistente...' + chr(13) + 'Por favor realice otra Busqueda..',mtWarning,[mbok,mbCancel],0);
  end
  else begin
    for t:=1 to LOSOBJETOS.RecordCount do begin
      LOSOBJETOS.RecNo:=t;
      grilla5.RowCount:=t + 1;
      grilla5.Cells[0,t]:=LOSOBJETOS.FieldByName('Rubro').AsString;
      grilla5.Cells[1,t]:=LOSOBJETOS.FieldByName('Capital').AsString;
      grilla5.Cells[2,t]:=LOSOBJETOS.FieldByName('Interes').AsString;
      grilla5.Cells[3,t]:=LOSOBJETOS.FieldByName('ImporteDeuda').AsString;
      grilla5.Cells[4,t]:=LOSOBJETOS.FieldByName('PeriodoDeuda').AsString;
    end;
  //   try
  //    JvDBGrid1.datasource.dataset.disablecontrols;
  //    JvDBGrid1.datasource.dataset.first;
  //    while not JvDBGrid1.datasource.dataset.eof do begin
  //      if  (trim(JvDBGrid1.Fields[3].Value)='') then begin
  //         //sumad := sumad + JvDBGrid1.datasource.dataset.fieldbyname('ImporteDeuda').asfloat;
  //         sumad := sumad + strtofloat(JvDBGrid1.datasource.dataset.fieldbyname('ImporteDeuda').AsString);
  //      end;
  //      JvDBGrid1.datasource.dataset.next;
  //    end;
  //   finally
  //    JvDBGrid1.datasource.dataset.enablecontrols;
  //   end;
  // JvDBGrid1.Columns[0].Width:=250;          JvDBGrid1.Columns[1].Width:=80;
  // JvDBGrid1.Columns[2].Width:=80;           JvDBGrid1.Columns[3].Width:=900;
  end;
  LOSOBJETOS.Connection:=nil;
 end;
 Cnx2.Close;
 FreeAndNil(Cnx2);
except
  on E: Exception do begin
    EnviarLog(Self.Caption, E.Message);
  end
end;
end;

procedure TIntima_ImpNew.JvDBGrid3CellClick(Column: TColumn);
begin
 coloca1(2,DataSet3.Fields[0].AsString);
 fechalote:=trim(DataSet3.Fields[1].AsString);
 PC1.ActivePage:=PC1.Pages[1];
 verificagrilladeuda('grilla2');
end;

procedure TIntima_ImpNew.SALEClick(Sender: TObject);
begin
Close;
end;

procedure TIntima_ImpNew.SeleccionarTodos1Click(Sender: TObject);
var b,t:integer;
begin
for b:=0 to grilla2.ColCount-1 do
   for t:=1 to grilla2.RowCount-1 do  grilla2.Cells[1,t]:='X';
   verificagrilladeuda('grilla2');
end;

end.
