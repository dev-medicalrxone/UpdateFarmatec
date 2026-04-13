program UpdateFarmatec;

uses
  Vcl.Forms,
  UntMain in 'UntMain.pas' {FrmMain},
  UntDMModifyDatabase in 'UntDMModifyDatabase.pas' {DMModifyDatabase: TDataModule},
  UntDMePrescribe in 'UntDMePrescribe.pas' {DMePrescribe: TDataModule},
  UntFrmPickDate in 'UntFrmPickDate.pas' {FrmPickDate},
  untCommon in 'untCommon.pas',
  UntDMIDC10 in 'UntDMIDC10.pas' {dmICD10: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TDMModifyDatabase, DMModifyDatabase);
  Application.CreateForm(TDMePrescribe, DMePrescribe);
  Application.CreateForm(TdmICD10, dmICD10);
  Application.Run;
end.
