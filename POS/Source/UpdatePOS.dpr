program UpdatePOS;

uses
  Vcl.Forms,
  UntMain in 'UntMain.pas' {FrmMain},
  UntDMModifyDatabase in 'UntDMModifyDatabase.pas' {DMModifyDatabase: TDataModule},
  UntDMePrescribe in 'UntDMePrescribe.pas' {DMePrescribe: TDataModule},
  UntFrmPickDate in 'UntFrmPickDate.pas' {FrmPickDate};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TDMModifyDatabase, DMModifyDatabase);
  Application.CreateForm(TDMePrescribe, DMePrescribe);
  Application.Run;
end.
