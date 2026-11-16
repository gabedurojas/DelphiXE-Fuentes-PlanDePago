unit Intimaciones_Imp1;

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
    EliminarSeleccin1: TMenuItem;
    JvDBGrid1: TJvDBGrid;
    JvDBGrid2: TJvDBGrid;
    DataSource1: TDataSource;
    DataSource3: TDataSource;
    ADOTable1: TADOTable;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SALEClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imprimeClick(Sender: TObject);
    procedure Coloca1(nro:byte;valor:string);
    procedure grilla1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure grilla1Click(Sender: TObject);
    procedure JvDBGrid3CellClick(Column: TColumn);
    procedure SeleccionarTodos1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    function VerificaGrillaDeuda(grilla:string):boolean;
    //procedure Button1Click(Sender: TObject);
  private
    LOTE:TADODataSet;{ Private declarations }
    CONTRIBUYENTE,LOSOBJETOS:TADOTable;
    fecha,respuesta,laidcuenta,dato,FechaAct,elcontrib,
    eldni,tipocta,lacuenta,lasucur,elbank,elidcontrib,elcuit,Filtro,NroImp:string;
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

procedure TIntima_Imp.FormCreate(Sender: TObject);
begin
LOTE:=TADODataSet.Create(nil);
DataSource1.DataSet:=LOTE;
CONTRIBUYENTE:=TADOTable.Create(nil);
DataSource2.DataSet:=CONTRIBUYENTE;
LOSOBJETOS:=TADOTable.Create(nil);
DataSource3.DataSet:=LOSOBJETOS;
end;

procedure TIntima_Imp.FormActivate(Sender: TObject);
begin
if not (gh) then begin
  gh:=true;
  FechaAct:=LeftStr(Fec_System(),10);
  PC1.ActivePage:=PC1.Pages[0];
  Coloca1(0,'');
  grilla1.Cells[0,0]:='Orden';            grilla1.Cells[1,0]:='Imprime';
  grilla1.Cells[2,0]:='NroIntimacion';    grilla1.Cells[3,0]:='NroLote';
  grilla1.Cells[4,0]:='Contribuyente';
  grilla1.Cells[5,0]:='NroDni';           grilla1.Cells[6,0]:='Barrio';
  grilla1.Cells[7,0]:='Calle';            grilla1.Cells[8,0]:='Altura';
  grilla1.Cells[9,0]:='Depto.';
  grilla1.Cells[10,0]:='Manzana';         grilla1.Cells[11,0]:='Casa';
  grilla1.Cells[12,0]:='Torre';           grilla1.Cells[13,0]:='Domicilio';
  grilla1.Cells[14,0]:='ImporteDeuda';    grilla1.Cells[15,0]:='Id';

  grilla5.Cells[0,0]:='Rubro';            grilla5.Cells[1,0]:='Capital';
  grilla5.Cells[2,0]:='Interes';    grilla5.Cells[3,0]:='ImporteDeuda';
  grilla5.Cells[4,0]:='PeriodoDeuda';

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
 if nro = 0 then begin
    LOTE.Close;
    LOTE.Connection:=modulo2.ObjConexion;
    LOTE.CommandText:='SELECT DISTINCT IntimacionContribuyente.NroLote,convert(char(10),IntimacionContribuyente.FechaLote,103) as FechaLote,'
    + ' usu.nombre AS NombreUsuario, IntimacionContribuyente.NroLoteUsuario AS Usuario FROM IntimacionContribuyente '
    + ' INNER JOIN municipio.dbo.Usuarios2 AS usu ON usu.codusu = IntimacionContribuyente.NroLoteUsuario';
    LOTE.Open;
 end;
if nro = 2 then begin
  CONTRIBUYENTE.Close;
  CONTRIBUYENTE.Connection:=modulo2.ObjConexion;
  CONTRIBUYENTE.DataSource:=DataSource1;
  CONTRIBUYENTE.MasterFields:='NroLote';
  CONTRIBUYENTE.TableName:='IntimacionContribuyente';
  CONTRIBUYENTE.
  CONTRIBUYENTE.CommandText:='SELECT Id as NroIntimacion,NroLote,Contribuyente,NroDni,Barrio,Calle,Altura,Dpto,Mza,'
  + 'Casa,Torre,Domicilio,ImporteDeuda,IdContribuyente FROM IntimacionContribuyente '
  + ' where (NroLote=' + valor+ ') and impreso = 0 ';
  CONTRIBUYENTE.Open;
  if CONTRIBUYENTE.IsEmpty then begin
    messagedlg('Nro de Lote sin Registros para Imprimir...' + chr(13) + 'Por favor realice otra Busqueda..',mtWarning,[mbok,mbCancel],0);
  end
  else begin
    for t:=1 to CONTRIBUYENTE.RecordCount do begin
      CONTRIBUYENTE.RecNo:=t;
      grilla1.RowCount:=t + 1;
      grilla1.Cells[0,t]:=StrFill(IntToStr(t),2,'0','');
      grilla1.Cells[1,t]:='';
      grilla1.Cells[2,t]:=CONTRIBUYENTE.FieldByName('NroIntimacion').AsString;
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
      grilla1.Cells[15,t]:=CONTRIBUYENTE.FieldByName('IdContribuyente').AsString;
    end;
    Barra1.Panels[1].Text:='Cant. Registros: ' + inttostr(CONTRIBUYENTE.RecordCount);
  end;
  CONTRIBUYENTE.Connection:=nil;
end;
if nro = 3 then begin
  LOSOBJETOS.Close;
  LOSOBJETOS.Connection:=modulo2.ObjConexion;
  LOSOBJETOS.CommandText:='SELECT Rubro,Capital,Interes,ImporteDeuda,PeriodoDeuda from Fn_ContribuyentesDeudaObjetos (' + valor+ ')';
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
if nro=4 then  begin
//  try
//    DataSet4:=TADODataSet.Create(nil);
//    DataSet4.Connection:=modulo2.ObjConexion;
//    DataSet4.CommandText:='EXEC darmaximonro NroLoteIntimacion ';
//    DataSet4.Open;
//    NroImp:=trim(DataSet4.Fields[0].AsString);
//    DataSet4.Close;
//  except
//    on E: Exception do EnviarLog(Self.Caption, E.Message);
//  end;
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

procedure TIntima_Imp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FreeAndNil(CONTRIBUYENTE);
FreeAndNil(LOSOBJETOS);
FreeAndNil(DataSet3);
FreeAndNil(DataSet4);
FreeAndNil(Self);
end;



function TIntima_Imp.VerificaGrillaDeuda(grilla:string):boolean;
var j,a:integer;
begin
Result:=true;
for j:=1 to grilla1.RowCount-1 do begin
    if trim(grilla1.Cells[1,j])='' then begin
      Result:=false;
      break;
    end;
end;
end;

procedure TIntima_Imp.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TIntima_Imp.imprimeClick(Sender: TObject);
var ReporteRst: TfrxReport;
    frxDB1,frxDB2: TfrxDBDataset;
    t,y,gf:integer;
    Com1:TADOCommand;
begin
t:=messagedlg('Confirma la Impresión de la Intimación seleccionada?',mtWarning,[mbok,mbCancel],0);
if t = 1 then begin
 if not verificagrilladeuda('grilla1') then begin
   messagedlg('            I M P O S I B L E   I M P R I M I R ' + chr(13)
   + 'porque no existe ninguna Intimación Seleccionada ',mtError,[mbok],0);
   grilla1.SetFocus;
 end
 else begin
   for gf:=1 to grilla1.RowCount-1 do begin
    if (grilla1.Cells[1,gf] = 'X') then begin
      Com1:=TADOCommand.Create(nil);
      Com1.ConnectionString:=Modulo2.Sistema.ConectInti;
      try
          Com1.CommandText :='UPDATE IntimacionContribuyente SET Impreso=1, '
          + ' FechaImpresion=' + chr(39) + FechaAct + chr(39)
          + ' where (id='+ trim(grilla1.Cells[2,gf]) + ')';
          Com1.Execute;
      except
        on E: Exception do begin
          EnviarLog(Self.Caption, E.Message);
          EnviarLog(Self.Caption, Com1.CommandText);
        end;
      end;

      FreeAndNil(Com1);
      Coloca1(3,trim(grilla1.Cells[2,gf]));
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
            //frxDB1.DataSet:=LOSOBJETOS;
            frxDB1.DataSet:=DtsCuotas;
            frxDB1.UserName:='frxDBDataset1';
            ReporteRst.DataSets.Add(frxDB1);
            ReporteRst.LoadFromFile(Modulo2.Sistema.Path_todo + '\Reportes\Imp_Intimacion.fr3');
            TfrxPictureView(ReporteRst.FindObject('Logo1')).Picture.LoadFromFile(Modulo2.Sistema.Path_todo + '\Imagenes\LogoM2.jpg');
            TfrxPictureView(ReporteRst.FindObject('Logo2')).Picture.LoadFromFile(Modulo2.Sistema.Path_todo + '\Imagenes\FirmaSebastianRojas.bmp');
            ReporteRst.Variables['NroImp'] := QuotedStr(trim(grilla1.Cells[2,gf]));
            ReporteRst.Variables['NroLote'] :=  QuotedStr(trim(grilla1.Cells[3,gf]));
            ReporteRst.Variables['ElqueSuscribe'] := QuotedStr(trim(grilla1.Cells[4,gf]));
            ReporteRst.Variables['NroDni'] := QuotedStr(trim(grilla1.Cells[5,gf]));
            ReporteRst.Variables['Barrio'] := QuotedStr(trim(grilla1.Cells[6,gf]));
            ReporteRst.Variables['Calle'] := QuotedStr(trim(grilla1.Cells[7,gf]));
            ReporteRst.Variables['Altura'] := QuotedStr(trim(grilla1.Cells[8,gf]));
            ReporteRst.Variables['Dpto'] := QuotedStr(trim(grilla1.Cells[9,gf]));
            ReporteRst.Variables['Mza'] := QuotedStr(trim(grilla1.Cells[10,gf]));
            ReporteRst.Variables['Casa'] := QuotedStr(trim(grilla1.Cells[11,gf]));
            ReporteRst.Variables['Torre'] := QuotedStr(trim(grilla1.Cells[12,gf]));
            ReporteRst.Variables['DomTitular'] := QuotedStr(trim(grilla1.Cells[13,gf]));
            //ReporteRst.Variables['Total'] := QuotedStr(floattostr(sumad));
            //ReporteRst.Variables['LugarFecha'] := QuotedStr('FORMOSA, ' + FechaToStr(FechaAct,'DDMMAAAA'));
            ReporteRst.Variables['NroUsuario'] := QuotedStr(Modulo2.Usuario.UsuNro);
            ReporteRst.ShowReport;
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

procedure TIntima_Imp.grilla1Click(Sender: TObject);
begin
if grilla1.Cells[0,grilla1.Row] <> '' then begin
    if trim(grilla1.Cells[1,grilla1.Row])='' then grilla1.Cells[1,grilla1.Row]:='X'
    else grilla1.Cells[1,grilla1.Row]:='';
    Dato:=grilla1.Cells[2,grilla1.Row];
    Coloca1(3,Dato);
end;
end;

///// aca solo habilito la columna 1
procedure TIntima_Imp.grilla1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  if (ACol=2) then
    grilla1.Options := grilla1.Options + [goEditing]
  else
    grilla1.Options := grilla1.Options - [goEditing];
end;

//procedure TIntima_Imp.Button1Click(Sender: TObject);
//var desde,hasta,gf,t:integer;
//begin
//desde:=strtoint(edit2.Text);
//hasta:= desde + CONTRIBUYENTE.RecordCount;
//
//for t:=desde to hasta do begin
//  for gf:=1 to grilla1.RowCount-1 do begin
//     if (grilla1.Cells[2,gf] = '') then begin
//        grilla1.Cells[2,gf]:=inttostr(desde);
//        desde:=desde + 1;
//     end;
//  end;
//end;
//end;



procedure TIntima_Imp.JvDBGrid3CellClick(Column: TColumn);
begin
 coloca1(2,DataSet3.Fields[0].AsString);
 PC1.ActivePage:=PC1.Pages[1];
end;

procedure TIntima_Imp.SALEClick(Sender: TObject);
begin
Close;
end;

procedure TIntima_Imp.SeleccionarTodos1Click(Sender: TObject);
var b,t:integer;
begin
for b:=0 to grilla1.ColCount-1 do
   for t:=1 to grilla1.RowCount-1 do  grilla1.Cells[1,t]:='X';
end;

end.
