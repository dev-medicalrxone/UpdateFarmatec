unit UntFrmPickDate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFrmPickDate = class(TForm)
    Panel1: TPanel;
    dtpFrom: TDateTimePicker;
    dtpTo: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPickDate: TFrmPickDate;

implementation

{$R *.dfm}

procedure TFrmPickDate.FormCreate(Sender: TObject);
begin
  dtpFrom.Date := Date;
  dtpTo.Date := Date;
end;

end.
