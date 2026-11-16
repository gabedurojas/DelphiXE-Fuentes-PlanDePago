unit Anular_PagarePPagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ADODB, StdCtrls, Buttons, JvExButtons, JvBitBtn, Grids, DBGrids,
  Mask, ExtCtrls, DB, ComCtrls,StrUtils,  Vcl.ToolWin,
  JvComponentBase, JvEmbeddedForms;

type
  TAnulNroPagare = class(TForm)
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    Bevel1: TBevel;
    Label1: TLabel;
    ODNI: TMaskEdit;
    DBGrid2: TDBGrid;
    Buscar: TJvBitBtn;
    barra: TStatusBar;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    DataSource2: TDataSource;
    Label3: TLabel;
    motivo: TEdit;
    Image2: TImage;
    Label11: TLabel;
    GUARDA: TJvBitBtn;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    sale: TJvBitBtn;
    FormularioEmb: TJvEmbeddedFormLink;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ODNIKeyPress(Sender: TObject; var Key: Char);
    procedure BuscarClick(Sender: TObject);
    procedure ODNIExit(Sender: TObject);
    procedure Grillas(nro:byte);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure motivoKeyPress(Sender: TObject; var Key: Char);
    procedure GUARDAClick(Sender: TObject);
    procedure saleClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  CERTIF,ELCERTIF,SOLIC:TADODataSet;
  Com1:TADOCommand;
  nro:integer;
    { Private declarations }
  public
      gh:boolean;
    { Public declarations }
  end;

var
  AnulNroPagare: TAnulNroPagare;

implementation
{$R *.dfm}

uses modulo, Unidad;

procedure TAnulNroPagare.FormClose(Sender: TObject; var Action: TCloseAction);
begin
FreeAndNil(CERTIF);
FreeAndNil(ELCERTIF);
FreeAndNil(Self);
end;

procedure TAnulNroPagare.FormCreate(Sender: TObject);
begin
gh:=false;
//DataSet1:=TADODataSet.Create(nil);
//DataSet1.ConnectionString:=modulo2.ConectDbMuni;
end;

procedure TAnulNroPagare.FormActivate(Sender: TObject);
begin
if not(gh) then begin
  gh:=true;
  CERTIF:=TADODataSet.Create(nil);
  CERTIF.ConnectionString:=modulo2.Sistema.ConectDb;
  DataSource1.DataSet:=CERTIF;
  ELCERTIF:=TADODataSet.Create(nil);
  ELCERTIF.ConnectionString:=modulo2.Sistema.ConectDb;
  DataSource2.DataSet:=ELCERTIF;
  ODNI.SetFocus;
end;
end;

procedure TAnulNroPagare.Grillas(nro:byte);
begin
if nro=1 then begin
  CERTIF.Close;
  CERTIF.CommandText:='SELECT Id,NroPagare,Fecha,Cuim,Contribuyente,Importe,OtroImporte,Observaciones, '
  + 'Anulado,FechaAnulado,MotivoAnulado, UsuAnulado FROM PlanPagoPagare '
  + '  WHERE (NroPagare  = ' + trim(ODNI.Text) + ') and (Anulado = 0) ORDER BY 1;';
  CERTIF.Open;
end;
if nro=2 then begin
  ELCERTIF.Close;
  ELCERTIF.CommandText:='SELECT * FROM Fn_VLosPlanesdePagosPagare (' + certif.Fields[0].AsString + ') ORDER BY 1;';
  ELCERTIF.Open;
end;
end;

procedure TAnulNroPagare.ODNIKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then Buscar.SetFocus
else begin
  if ( StrScan('0123456789',Key) <> nil ) or
      ( Key = Char(VK_BACK) ) then
   else Key := #0;
end;
end;

procedure TAnulNroPagare.BuscarClick(Sender: TObject);
begin
grillas(1);
 if CERTIF.IsEmpty then begin
   IF application.MessageBox('Nro de PAGARE NO encontrado, !Debe Realizar otra Busqueda!?','Advertencia'
      ,mb_OKcancel+mb_IconHAnd) = IdOk
      then begin
          guarda.Enabled:=false;
          odni.SetFocus;
          elcertif.Close;
      end
      else begin
       //
      end;
 end;
end;

procedure TAnulNroPagare.ODNIExit(Sender: TObject);
begin
   if (trim(ODNI.Text) = '') then begin
     messagedlgpos('Error!! No hay un Nro. de Pagare Ingresado.',mterror,[mbok],0,screen.Width div 3,screen.Height div 3);
     ODNI.SetFocus;
   end;
end;

procedure TAnulNroPagare.DBGrid2CellClick(Column: TColumn);
begin
if not(CERTIF.IsEmpty) then begin
   IF (TRIM(CERTIF.Fields[8].AsString)='False') or (TRIM(CERTIF.Fields[8].AsString)='') then begin
      grillas(2);
      guarda.Enabled:=true;
      MOTIVO.SetFocus;
   end
   else begin
      messagedlgpos('ATENCION!! Imposible Anular el Pagare Nro.: ' + trim(odni.Text) +' ,por encontrarse ya Anulado.',mterror,[mbok],0,screen.Width div 3,screen.Height div 3);
      guarda.Enabled:=false;
      elcertif.Close;
   end;
end;
end;

procedure TAnulNroPagare.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
  var h:byte;
begin
  h:=0;
 if not(CERTIF.IsEmpty) then begin
  if (trim(CERTIF.Fields[8].Text) = 'False') or (trim(CERTIF.Fields[8].Text) = '')  then h:=1;
  case h of
    0:begin
      DBGrid2.Canvas.Brush.Color:=clLime;
      DBGrid2.Canvas.FillRect(Rect);
      DBGrid2.Canvas.Font.Color:= clBlack;
      end;
    1:begin
      DBGrid2.Canvas.Brush.Color:=clWindow;
      DBGrid2.Canvas.FillRect(Rect);
      DBGrid2.Canvas.Font.Color:= clBlack;
      end;
  end;
  DBGrid2.DefaultDrawColumnCell(Rect,Datacol,Column,State);
 end;
end;

procedure TAnulNroPagare.motivoKeyPress(Sender: TObject; var Key: Char);
begin
if key = chr(13) then GUARDA.SetFocus;
end;

procedure TAnulNroPagare.GUARDAClick(Sender: TObject);
var gf:integer;
begin
gf:=messagedlgpos('Desea ANULAR el Pagare Nro: ' + trim(odni.Text) + 'Seleccionado?',mtWarning,[mbok,mbCancel],0,screen.Width div 3,screen.Height div 3);
   if gf = 1 then begin
        try
          Com1:=TADOCommand.Create(nil);
          Com1.ConnectionString:=modulo2.Sistema.ConectDb;

         // Com1.CommandText:='BEGIN TRANSACTION;';
         // Com1.Execute;

          Com1.CommandText:='update PlanPagoPagare set Anulado=1 ,FechaAnula=getdate(),'
          + 'MotivoAnula=' + CHR(39) + TRIM(MOTIVO.Text) + CHR(39) + ' where (NroPagare =' + trim(odni.Text) +');';
          Com1.Execute;

         // Com1.CommandText:='COMMIT TRANSACTION';
         // Com1.Execute;
          label11.Caption:='Se ha Anulado el PAGARE con Exito';
          Image2.Picture.LoadFromFile(modulo2.Sistema.path_todo + '\Imagenes\button_ok.ico');
          guarda.Enabled:=false;
          buscar.Click;
          sale.SetFocus;
        except
          //Com1.CommandText:='ROLLBACK TRANSACTION';
          //Com1.Execute;
          label11.Caption:='Error al Anular el PAGARE ...';
          Image2.Picture.LoadFromFile(modulo2.Sistema.path_todo + '\Imagenes\button_cancel.ico');
        end;
        Com1.Free;
   end;
end;

procedure TAnulNroPagare.saleClick(Sender: TObject);
begin
close;
end;

end.
