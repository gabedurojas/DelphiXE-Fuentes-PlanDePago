unit frm_filtro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExControls, JvxCheckListBox, JvgGroupBox, StrUtils;

type
  TFrm_Filtros = class(TForm)
    JvgGroupBox2: TJvgGroupBox;
    Label1: TLabel;
    COLUMNA: TComboBox;
    Label2: TLabel;
    VALOR: TEdit;
    BUSCAR: TButton;
    TIPO: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    OPERA: TComboBox;
    AGREGAR: TButton;
    FILTRO: TEdit;
    Label5: TLabel;
    procedure BUSCARClick(Sender: TObject);
    procedure COLUMNAExit(Sender: TObject);
    procedure COLUMNAKeyPress(Sender: TObject; var Key: Char);
    procedure VALORKeyPress(Sender: TObject; var Key: Char);
    procedure VALORExit(Sender: TObject);
    procedure TIPOKeyPress(Sender: TObject; var Key: Char);
    procedure TIPOExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OPERAKeyPress(Sender: TObject; var Key: Char);
    procedure OPERAExit(Sender: TObject);
    procedure AGREGARClick(Sender: TObject);
    procedure FILTROChange(Sender: TObject);
  private
    { Private declarations }
  public
    Cancelado:boolean;{ Public declarations }
  end;

var
  Frm_Filtros: TFrm_Filtros;

implementation

{$R *.dfm}

uses Objetos, Modulo;

procedure TFrm_Filtros.AGREGARClick(Sender: TObject);
begin
if (RightStr(FILTRO.Text,1) = ')') and (OPERA.ItemIndex > 0) then FILTRO.Text:=FILTRO.Text + ' ' + OPERA.Text + ' '
 else FILTRO.Text:='';

FILTRO.Text:=FILTRO.Text + '(' + COLUMNA.Text + ' ';

if TIPO.Text = 'LIKE' then
  FILTRO.Text:=FILTRO.Text + TIPO.Text + ' ' + chr(39) + '%'  + VALOR.Text + '%' + chr(39) + ' )'
else begin
  if Modulo2.Filtro.Tipo.Strings[COLUMNA.ItemIndex] = 'C' then
    FILTRO.Text:=FILTRO.Text + TIPO.Text + ' ' + chr(39) + VALOR.Text + chr(39) + ')'
  else
    FILTRO.Text:=FILTRO.Text + TIPO.Text + ' ' + VALOR.Text + ')';
end;
if OPERA.ItemIndex > 0 then FILTRO.Text:=FILTRO.Text + ' ' + OPERA.Text + ' ';
OPERA.ItemIndex:=0;
COLUMNA.SetFocus;
end;

procedure TFrm_Filtros.BUSCARClick(Sender: TObject);
var t:integer;
begin
t:=0;
if (RightStr(FILTRO.Text,2) = 'D') then t:=5;
if (RightStr(FILTRO.Text,2) = 'R') then t:=4;
FILTRO.Text:=LeftStr(FILTRO.Text,Length(FILTRO.Text)-t);
Cancelado:=false;
Close;
end;

procedure TFrm_Filtros.COLUMNAExit(Sender: TObject);
begin
if COLUMNA.ItemIndex < 0 then begin
  messagedlg('Debe seleccionar una columna de la Lista',mtError,[mbok,mbCancel],0);
  COLUMNA.SetFocus
end
else begin
  TIPO.Items.Clear;
  if (Modulo2.Filtro.Tipo.Strings[COLUMNA.ItemIndex] = 'F') or
  (Modulo2.Filtro.Tipo.Strings[COLUMNA.ItemIndex] = 'N') then begin
    TIPO.Items.Append('=');
    TIPO.Items.Append('>');
    TIPO.Items.Append('<');
    TIPO.Items.Append('<>');
    TIPO.Items.Append('>=');
    TIPO.Items.Append('<=');
  end;
  if (Modulo2.Filtro.Tipo.Strings[COLUMNA.ItemIndex] = 'C') then begin
    TIPO.Items.Append('=');
    TIPO.Items.Append('<>');
    TIPO.Items.Append('LIKE');
  end;
  TIPO.ItemIndex:=0;
end;
end;

procedure TFrm_Filtros.COLUMNAKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then FILTRO.SetFocus;
end;

procedure TFrm_Filtros.FILTROChange(Sender: TObject);
begin
if trim(FILTRO.Text) = '' then BUSCAR.Enabled:=false
else BUSCAR.Enabled:=true;
end;

procedure TFrm_Filtros.FormActivate(Sender: TObject);
begin
COLUMNA.ItemIndex:=0;
COLUMNA.SetFocus;
end;

procedure TFrm_Filtros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_ESCAPE then begin
  Cancelado:=true;
  Close;
end;
end;

procedure TFrm_Filtros.OPERAExit(Sender: TObject);
begin
if OPERA.ItemIndex < 0 then begin
  messagedlg('Debe seleccionar un OPERADOR de la Lista',mtError,[mbok,mbCancel],0);
  OPERA.SetFocus
end;
end;

procedure TFrm_Filtros.OPERAKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then AGREGAR.SetFocus;
end;

procedure TFrm_Filtros.TIPOExit(Sender: TObject);
begin
if TIPO.ItemIndex < 0 then begin
  messagedlg('Debe seleccionar un Tipo de la Lista',mtError,[mbok,mbCancel],0);
  TIPO.SetFocus
end;
end;

procedure TFrm_Filtros.TIPOKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then OPERA.SetFocus;
end;

procedure TFrm_Filtros.VALORKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) then begin
  Key := #0;
  OPERA.SetFocus;
end
else begin
  if Modulo2.Filtro.Tipo.Strings[COLUMNA.ItemIndex] = 'C' then begin
    if ( StrScan('abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789.-/@$% ',Key) <> nil ) or
      ( Key = Char(VK_BACK) ) then Key:=UpCase(Key)
       else Key := #0;
  end;
  if Modulo2.Filtro.Tipo.Strings[COLUMNA.ItemIndex] = 'F' then begin
    if ( StrScan('0123456789/',Key) <> nil ) or
      ( Key = Char(VK_BACK) ) then Key:=UpCase(Key)
       else Key := #0;
  end;
  if Modulo2.Filtro.Tipo.Strings[COLUMNA.ItemIndex] = 'N' then begin
    if ( StrScan('0123456789.-',Key) <> nil ) or
      ( Key = Char(VK_BACK) ) then Key:=UpCase(Key)
       else Key := #0;
  end;
end;
end;

procedure TFrm_Filtros.VALORExit(Sender: TObject);
var fec:Tdatetime;
    r:real;
begin
if COLUMNA.Focused then
else begin
  if trim(VALOR.Text) = '' then begin
    messagedlg('Debe INGRESAR un valor para realizar el filtro',mtError,[mbok,mbCancel],0);
    VALOR.SetFocus
  end;
  if Modulo2.Filtro.Tipo.Strings[COLUMNA.ItemIndex] = 'F' then begin
    try
      fec:=strtodate(VALOR.Text);
    except
      messagedlg('El campo solicita una FECHA correcta!!',mterror,[mbok],0);
      VALOR.SetFocus;
    end;
  end;
  if Modulo2.Filtro.Tipo.Strings[COLUMNA.ItemIndex] = 'N' then begin
    try
      r:=strtoFloat(VALOR.Text);
    except
      messagedlg('El campo solicita un VALOR NUMERICO correcto!!',mterror,[mbok],0);
      VALOR.SetFocus;
    end;
  end;
end;
end;

end.
