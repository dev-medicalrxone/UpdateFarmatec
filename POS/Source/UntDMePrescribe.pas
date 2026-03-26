unit UntDMePrescribe;

interface

uses
  System.SysUtils, System.Classes,  FireDAC.Phys.MSSQLDef,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.ODBCBase;

type
  TDMePrescribe = class(TDataModule)
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDConnectionRDS: TFDConnection;
    REFREQ: TFDQuery;
    NEXT_REFREQ_TRAN_NO: TFDQuery;
    UPDATE_REFREQ: TFDQuery;
    UPDATE_Last_Transaction: TFDQuery;
    QBorrarNonMatchedNDC: TFDQuery;
    BACKUPDATABASE: TFDQuery;
    UpdateSurescript: TFDQuery;
    QUpdateePrescribe: TFDQuery;
    SQLQuery1: TFDQuery;
    UpdateSurescriptRX_STATUS: TFDQuery;
    BACKUPDATABASE_EASY_RX: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure UpdateEasyRx;
    Procedure ExecSql(Token: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMePrescribe: TDMePrescribe;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UntMain, UntDMModifyDatabase;

{$R *.dfm}

procedure TDMePrescribe.DataModuleCreate(Sender: TObject);
Var
  SQLStr: String;
begin

  Try
      With FDConnectionRDS.Params do
      begin
        Values['Server'] := Trim(DMModifyDatabase.ServerName);
        Values['Database'] := 'easyrx';
        Values['User_Name'] := 'dbo';
        Values['password'] := 'agabriel';
        FDConnectionRDS.Connected := True;
      end;

  Except
  END;
  ;
  {
  begin
   SQLStr := 'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = ' + chr(39) + 'RX_LABEL' + chr(39) + ')' +
   ' BEGIN ' +
   'CREATE TABLE [dbo].[RX_LABEL]('+
	 '[IDMESS] [int] NOT NULL,'+
	 '[ETIQUETA] [nchar](296) NULL,'+
	 '[SIG] [nchar](296) NULL,'+
	 '[LABELCODESNO] [int] NULL,'+
   'CONSTRAINT [PK_RX_LABEL] PRIMARY KEY CLUSTERED '+
   '(' +
	 '[IDMESS] ASC ' +
   ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY] '+
   ') ON [PRIMARY] END';
   QBorrarNonMatchedNDC.SQL.Text := SQLStr;
   QBorrarNonMatchedNDC.ExecSQL;


    //====================================Create Table LastTransaction==========================================
      SQLStr := 'IF  NOT EXISTS (SELECT * FROM sys.objects' +
                ' WHERE object_id = OBJECT_ID(N' + chr(39)+ '[dbo].[LastTransaction]'+ chr(39) + ') AND type in (N' + chr(39) + 'U' +chr(39) +'))' +
                ' BEGIN ' +
                'CREATE TABLE [dbo].[LastTransaction](' +
                ' [LastePrescribe_Date_Time] [datetime] NULL ' +
                ' ) ON [PRIMARY]' +
                'END';
      QBorrarNonMatchedNDC.SQL.Text := SQLStr;
      QBorrarNonMatchedNDC.ExecSQL(True);

      SQLQuery1.SQL.Text := 'select * from sys.triggers where name = ' + chr(39) + 'UPDATE_Last_Transaction' + chr(39);
      SQLQuery1.Open;
      if Trim(SQLQuery1.FieldByName('name').asString) = '' then
      begin
        SQLQuery1.SQL.Text := 'CREATE TRIGGER[dbo].[UPDATE_Last_Transaction] ON [dbo].[SureScript]  ' +
        'FOR INSERT ' +
        'as ' +
        'begin ' +
        '  Update LastTransaction set LastePrescribe_Date_Time = GETDATE(); ' +
        'end;';
        SQLQuery1.ExecSQL(False);
      end;

      Try
      //===== add NumeroRecetaq to Sruescript table================================================
      SQLStr := 'IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = ' + CHR(39) +'SureScript' + Chr(39) + ' AND [COLUMN_NAME] = ' + Chr(39) + 'NUMERORECETA' + Chr(39) + ') BEGIN ALTER TABLE [SureScript] ADD [NUMERORECETA] BIGINT NULL END';
      QBorrarNonMatchedNDC.SQL.Text := SQLStr;
      QBorrarNonMatchedNDC.ExecSQL(True);
      Except
        //
      End;

      SQLStr := 'SELECT * FROM sys.indexes WHERE name= ' + chr(39) + 'IDMess' + chr(39) + ' AND object_id = OBJECT_ID('  + chr(39) + 'SureScript' + chr(39) + ')';
      QUpdateePrescribe.SQL.Text := SQLStr;
      QUpdateePrescribe.Open;
      if QUpdateePrescribe.FieldByName('name').asString = '' then
      begin
        SQLStr := 'CREATE UNIQUE NONCLUSTERED INDEX [IDMess] ON [dbo].[SureScript] ( 	[IDMess] ASC ) WITH (PAD_INDEX = OFF, ' +
        'STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ' +
        'ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]';
        QBorrarNonMatchedNDC.SQL.Text := SQLStr;
        QBorrarNonMatchedNDC.ExecSQL(True);
      end;
  end;
  End; }
end;

Procedure TDMePrescribe.ExecSql(Token: String);
begin
  Try
  QBorrarNonMatchedNDC.SQL.Text := Token;
  QBorrarNonMatchedNDC.ExecSQL;
  frmMain.Memo1.Lines.Add(Token + ' successfully!');
  Except
    frmMain.Memo1.Lines.Add('Error creating ' + Token);
  End;
end;

procedure TDMePrescribe.UpdateEasyRx;
Var
  SQLStr: String;
begin
  ExecSql('DROP PROCEDURE UpdateSurescriptRX_STATUS');
  UpdateSurescriptRX_STATUS.ExecSQL;
  ExecSql('DROP PROCEDURE BACKUPDATABASE');
  BACKUPDATABASE.ExecSQL;
  ExecSql('DROP PROCEDURE NEXT_REFREQ_TRAN_NO');
  NEXT_REFREQ_TRAN_NO.ExecSQL;
  ExecSql('DROP PROCEDURE REFREQ');
  REFREQ.ExecSQL;
  ExecSql('DROP PROCEDURE UpdateSurescript');
  UpdateSurescript.ExecSQL;
//==============TRIGGER===============================
  ExecSql('DROP TRIGGER UPDATE_REFREQ');
  UPDATE_REFREQ.ExecSQL;
  ExecSql('DROP TRIGGER UPDATE_Last_Transaction');
  UPDATE_Last_Transaction.ExecSQL;



end;

end.
