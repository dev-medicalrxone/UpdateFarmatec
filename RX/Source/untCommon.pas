unit untCommon;

interface

Uses
  Windows, Messages, Classes, Graphics, Controls, Dialogs,
  StdCtrls, Forms, DBCtrls, DB, Grids, DBGrids, Mask, ExtCtrls,
  Buttons, WinTypes, ComCtrls, Printers, Registry, wininet, ToolWin, Shellapi,
  SysUtils, XSBuiltIns, DateUtils,
  IdAttachmentFile, IdAttachment,
  IdSMTP, IdMessage, IdMessageParts, IdEMailAddress,
  IdMessageClient, IdSMTPBase, FireDAC.Phys.MSSQL,
  System.StrUtils,FireDAC.Comp.Client,
  FireDAC.Stan.Param;


type

  TCommonRoutines = class(TObject)


    function AddConstraintIfNotExistsSafe(
      const ATableName, AConstraintName, AAddConstraintSQL: string;
      out AError: string
    ): Boolean;
    function DropConstraintIfExistsSafe(const ATableName,
      AConstraintName: string; out AError: string): Boolean;
    procedure DropColumnIfExists(const ATableName, AColumnName: string);

    function ExtractAfterDbo(const S: string): string;

    function DropTableIfExists(const ATableName: string; const ASchema: string = 'dbo'): Boolean;

    function CreatePrimaryKeyIfNotExists(
      const ATableName: string;
      const AKeyName: string;
      const AColumns: string;  // e.g. 'ID' or 'ID, LINE_NO'
      const ASchema: string = 'dbo'): Boolean;

    function DropConstraint(const TableName: string): string;

    procedure AlterColumnIfNeeded(const TableName, ColumnName,
      NewDefinition: string);

    function ColumnNeedsAlter(const TableName, ColumnName, DataType: string;
      Length: Integer; AllowNull: Boolean): Boolean;
  end;

Var
  CommonRoutine: TCommonRoutines;


implementation

uses UntDMModifyDatabase, UntMain;



function TCommonRoutines.AddConstraintIfNotExistsSafe(
  const ATableName, AConstraintName, AAddConstraintSQL: string;
  out AError: string
): Boolean;
var
  Cmd: string;
begin
  Result := False;
  AError := '';

  if Trim(ATableName) = '' then
  begin
    AError := 'Table name is required.';
    Exit;
  end;

  if Trim(AConstraintName) = '' then
  begin
    AError := 'Constraint name is required.';
    Exit;
  end;

  if Trim(AAddConstraintSQL) = '' then
  begin
    AError := 'Constraint SQL is required.';
    Exit;
  end;

  Cmd :=
    'IF OBJECT_ID(' + QuotedStr(ATableName) + ') IS NULL ' +
    'BEGIN ' +
    '  RAISERROR(''Table %s does not exist.'', 16, 1, ' + QuotedStr(ATableName) + '); ' +
    '  RETURN; ' +
    'END; ' +

    'IF NOT EXISTS (' +
    '  SELECT 1 ' +
    '  FROM sys.objects o ' +
    '  WHERE o.object_id = OBJECT_ID(' + QuotedStr(ATableName + '.' + AConstraintName) + ') ' +
    '    AND o.parent_object_id = OBJECT_ID(' + QuotedStr(ATableName) + ')' +
    ') ' +
    'BEGIN ' +
    '  EXEC(' +
         QuotedStr('ALTER TABLE ' + ATableName + ' ' + AAddConstraintSQL) +
    '  ); ' +
    'END;';

  try
    with DMModifyDatabase.FDQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text := Cmd;
      ExecSQL;
    end;

    Result := True;
  except
    on E: Exception do
    begin
      AError := E.Message;
      Result := False;
    end;
  end;
end;

{function TCommonRoutines.AddConstraintIfNotExistsSafe(
  const ATableName, AConstraintName, AAddConstraintSQL: string;
  out AError: string
): Boolean;
begin
  Result := False;
  AError := '';
  with DMModifyDatabase do
  begin
    with FDConnection1 do
    begin
      try
        StartTransaction;
        try
          with DMModifyDatabase.FDQuery1 do
          begin
            Close;
            SQL.Text :=
              'DECLARE @TableName SYSNAME = :TableName; ' +
              'DECLARE @ConstraintName SYSNAME = :ConstraintName; ' +
              'DECLARE @AddSQL NVARCHAR(MAX) = :AddSQL; ' +
              'DECLARE @SQL NVARCHAR(MAX); ' +

              'IF NOT EXISTS ( ' +
              '    SELECT 1 ' +
              '    FROM sys.objects so ' +
              '    WHERE so.name = @ConstraintName ' +
              '      AND so.parent_object_id = OBJECT_ID(@TableName) ' +
              ') ' +
              'BEGIN ' +
              '    SET @SQL = N''ALTER TABLE '' ' +
              '             + QUOTENAME(PARSENAME(@TableName, 2)) + ''.'' + QUOTENAME(PARSENAME(@TableName, 1)) ' +
              '             + N'' '' + @AddSQL; ' +
              '    EXEC sp_executesql @SQL; ' +
              'END;';

            ParamByName('TableName').AsString := ATableName;
            ParamByName('ConstraintName').AsString := AConstraintName;
            ParamByName('AddSQL').AsString := AAddConstraintSQL;

            ExecSQL;
          end;

          Commit;
          Result := True;
        except
          on E: Exception do
          begin
            Rollback;
            AError := E.Message;
            FrmMain.MemoErrors.Lines.Add(AError);
            Result := False;
          end;
        end;
      except
        on E: Exception do
        begin
          AError := 'Transaction error: ' + E.Message;
          Result := False;
        end;
      end;
    end;
  end;
end;
}


function TCommonRoutines.DropConstraintIfExistsSafe(
  const ATableName, AConstraintName: string;
  out AError: string
): Boolean;
begin
  Result := False;
  AError := '';
  With DMModifyDatabase do
  begin
    with FDConnection1 do
    begin
      try
        StartTransaction;

        try
          with FDQuery1 do
          begin
            Close;
            SQL.Text :=
              'DECLARE @TableName SYSNAME = :TableName; ' +
              'DECLARE @ConstraintName SYSNAME = :ConstraintName; ' +
              'DECLARE @SQL NVARCHAR(MAX); ' +

              'IF EXISTS ( ' +
              '    SELECT 1 ' +
              '    FROM sys.objects so ' +
              '    WHERE so.name = @ConstraintName ' +
              '      AND so.parent_object_id = OBJECT_ID(@TableName) ' +
              ') ' +
              'BEGIN ' +
              '    SET @SQL = N''ALTER TABLE '' ' +
              '             + QUOTENAME(PARSENAME(@TableName, 2)) + ''.'' + QUOTENAME(PARSENAME(@TableName, 1)) ' +
              '             + N'' DROP CONSTRAINT '' + QUOTENAME(@ConstraintName); ' +
              '    EXEC sp_executesql @SQL; ' +
              'END;';

            ParamByName('TableName').AsString := ATableName;
            ParamByName('ConstraintName').AsString := AConstraintName;

            ExecSQL;
          end;

          Commit;
          Result := True;

        except
          on E: Exception do
          begin
            Rollback;
            AError := E.Message;
            Result := False;
          end;
        end;

      except
        on E: Exception do
        begin
          AError := 'Transaction error: ' + E.Message;
          Result := False;
        end;
      end;
    end;
  end;
end;

procedure TCommonRoutines.DropColumnIfExists(const ATableName, AColumnName: string);
var
  SQLText: string;
begin
  SQLText :=
    'DECLARE @ConstraintName NVARCHAR(200); ' +
    'DECLARE @SQL NVARCHAR(MAX); ' +

    'SELECT @ConstraintName = dc.name ' +
    'FROM sys.default_constraints dc ' +
    'INNER JOIN sys.columns c ' +
    '  ON c.default_object_id = dc.object_id ' +
    'WHERE c.object_id = OBJECT_ID(:TableName) ' +
    '  AND c.name = :ColumnName; ' +

    'IF @ConstraintName IS NOT NULL ' +
    'BEGIN ' +
    '  SET @SQL = ''ALTER TABLE ' + ATableName + ' DROP CONSTRAINT ['' + @ConstraintName + '']''; ' +
    '  EXEC(@SQL); ' +
    'END; ' +

    'IF EXISTS ( ' +
    '    SELECT 1 ' +
    '    FROM sys.columns ' +
    '    WHERE name = :ColumnName2 ' +
    '      AND object_id = OBJECT_ID(:TableName2) ' +
    ') ' +
    'BEGIN ' +
    '  SET @SQL = ''ALTER TABLE ' + ATableName + ' DROP COLUMN [' + AColumnName + ']''; ' +
    '  EXEC(@SQL); ' +
    'END;';
  Try
  with DMModifyDatabase.FDQuery1 do
  begin
    Close;
    SQL.Text := SQLText;
    ParamByName('TableName').AsString  := ATableName;   // example: dbo.MYTABLE
    ParamByName('ColumnName').AsString := AColumnName;  // example: MyField
    ParamByName('TableName2').AsString := ATableName;
    ParamByName('ColumnName2').AsString := AColumnName;
    ExecSQL;
  end;
  Except
    on E: EMSSQLNativeException do
    begin
      FrmMain.MemoErrors.Lines.Add(ATableName + ' ' + AColumnName +' Execute error: '+#13#10+ E.Message);
    end;
  End;
end;

function TCommonRoutines.ExtractAfterDbo(const S: string): string;
var
  L: string;
  pStart, pEnd: Integer;
begin
  Result := '';
  L := LowerCase(S);

  // --- Case 1: [dbo].[Table]
  pStart := Pos('[dbo].[', L);
  if pStart > 0 then
  begin
    pStart := pStart + Length('[dbo].[');
    pEnd := PosEx(']', S, pStart);
    if pEnd > 0 then
      Exit(Copy(S, pStart, pEnd - pStart));
  end;

  // --- Case 2: dbo.[Table]
  pStart := Pos('dbo.[', L);
  if pStart > 0 then
  begin
    pStart := pStart + Length('dbo.[');
    pEnd := PosEx(']', S, pStart);
    if pEnd > 0 then
      Exit(Copy(S, pStart, pEnd - pStart));
  end;

  // --- Case 3: [dbo].Table
  pStart := Pos('[dbo].', L);
  if pStart > 0 then
  begin
    pStart := pStart + Length('[dbo].');
  end
  else
  begin
    // --- Case 4: dbo.Table
    pStart := Pos('dbo.', L);
    if pStart = 0 then Exit;
    pStart := pStart + Length('dbo.');
  end;

  // Read until delimiter
  pEnd := pStart;
  while (pEnd <= Length(S)) and not (S[pEnd] in [' ', #13, #10, '(', ';', ']']) do
    Inc(pEnd);

  Result := Copy(S, pStart, pEnd - pStart);
end;


function TCommonRoutines.DropTableIfExists(const ATableName: string; const ASchema: string = 'dbo'): Boolean;
var
  SQL: string;
begin
  Result := False;

  SQL := Format('DROP TABLE IF EXISTS [%s].[%s]', [ASchema, ATableName]);

  try
    DMModifyDatabase.FDConnection1.ExecSQL(SQL);
    Result := True;
  except
    on E: Exception do
    begin
      FrmMain.MemoErrors.Lines.Add(E.ToString);
      // log if needed
      Result := False;
    end;
  end;
end;

function TCommonRoutines.CreatePrimaryKeyIfNotExists(
  const ATableName: string;
  const AKeyName: string;
  const AColumns: string;  // e.g. 'ID' or 'ID, LINE_NO'
  const ASchema: string = 'dbo'): Boolean;
var
  ExistsPK: Integer;
  SQL: string;
begin
  Result := False;

  // Check if PK constraint already exists
  ExistsPK :=
    DMModifyDatabase.FDConnection1.ExecSQLScalar(
      'SELECT COUNT(*) ' +
      'FROM sys.key_constraints kc ' +
      'JOIN sys.tables t ON kc.parent_object_id = t.object_id ' +
      'JOIN sys.schemas s ON t.schema_id = s.schema_id ' +
      'WHERE kc.name = :KeyName ' +
      '  AND kc.type = ''PK'' ' +
      '  AND t.name = :TableName ' +
      '  AND s.name = :SchemaName',
      [AKeyName, ATableName, ASchema]
    );

  if ExistsPK = 0 then
  begin
    SQL := Format(
      'ALTER TABLE [%s].[%s] ADD CONSTRAINT [%s] PRIMARY KEY (%s)',
      [ASchema, ATableName, AKeyName, AColumns]
    );

    try
      DMModifyDatabase.FDConnection1.ExecSQL(SQL);
      Result := True; // PK created
    except
      on E: Exception do
      begin
        // log if needed
        FrmMain.MemoErrors.Lines.Add(E.ToString);
        Result := False;
      end;
    end;
  end
  else
    Result := True; // already exists
end;


function TCommonRoutines.DropConstraint(const TableName: string): string;
var
  SchemaName: string;
  PureTableName: string;
  ConstraintName: string;
  P: Integer;
begin
  Result := '';

  SchemaName := 'dbo';
  PureTableName := Trim(TableName);

  P := Pos('.', PureTableName);
  if P > 0 then
  begin
    SchemaName := Copy(PureTableName, 1, P - 1);
    PureTableName := Copy(PureTableName, P + 1, MaxInt);
  end;

  With DMModifyDatabase do
  begin
    cdsObjects.Close;
    cdsObjects.CommandText :=
      'SELECT d.name ' +
      'FROM sys.default_constraints d ' +
      'INNER JOIN sys.tables t ON d.parent_object_id = t.object_id ' +
      'INNER JOIN sys.schemas s ON t.schema_id = s.schema_id ' +
      'WHERE t.name = :P_TABLE ' +
      '  AND s.name = :P_SCHEMA ' +
      'ORDER BY d.name';

    cdsObjects.Params.Clear;
    cdsObjects.Params.CreateParam(ftString, 'P_TABLE', ptInput);
    cdsObjects.Params.CreateParam(ftString, 'P_SCHEMA', ptInput);

    cdsObjects.Params.ParamByName('P_TABLE').AsString := PureTableName;
    cdsObjects.Params.ParamByName('P_SCHEMA').AsString := SchemaName;

    cdsObjects.Open;
    cdsObjects.First;

    while not cdsObjects.Eof do
    begin
      ConstraintName := Trim(cdsObjects.Fields[0].AsString);

      if ConstraintName <> '' then
        ExecSql(
          'ALTER TABLE [' + SchemaName + '].[' + PureTableName + '] DROP CONSTRAINT [' + ConstraintName + ']'
        );

      cdsObjects.Next;
    end;
  end;
end;


procedure TCommonRoutines.AlterColumnIfNeeded(
  const TableName: string;
  const ColumnName: string;
  const NewDefinition: string);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DMModifyDatabase.FDConnection1;

    Q.SQL.Text :=
      'SELECT 1 ' +
      'FROM INFORMATION_SCHEMA.COLUMNS ' +
      'WHERE TABLE_NAME = :TableName ' +
      '  AND COLUMN_NAME = :ColumnName';

    Q.ParamByName('TableName').AsString := TableName;
    Q.ParamByName('ColumnName').AsString := ColumnName;
    Q.Open;

    if not Q.IsEmpty then
    begin
      Q.Close;
      Q.SQL.Text :=
        Format(
          'ALTER TABLE dbo.%s ALTER COLUMN %s %s',
          [TableName, ColumnName, NewDefinition]
        );

      Q.ExecSQL;
    end;
  finally
    Q.Free;
  end;
end;

function TCommonRoutines.ColumnNeedsAlter(
  const TableName,
        ColumnName,
        DataType: string;
  Length: Integer;
  AllowNull: Boolean): Boolean;
var
  Q: TFDQuery;
begin
  Result := False;

  Q := TFDQuery.Create(nil);
  try
    Q.Connection := DMModifyDatabase.FDConnection1;

    Q.SQL.Text :=
      'SELECT DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE ' +
      'FROM INFORMATION_SCHEMA.COLUMNS ' +
      'WHERE TABLE_NAME = :TableName ' +
      '  AND COLUMN_NAME = :ColumnName';

    Q.ParamByName('TableName').AsString := TableName;
    Q.ParamByName('ColumnName').AsString := ColumnName;
    Q.Open;

    if Q.IsEmpty then
      Exit(True);

    Result :=
      (UpperCase(Q.FieldByName('DATA_TYPE').AsString) <>
       UpperCase(DataType))
      or
      (Q.FieldByName('CHARACTER_MAXIMUM_LENGTH').AsInteger <> Length)
      or
      ((Q.FieldByName('IS_NULLABLE').AsString = 'YES') <> AllowNull);

  finally
    Q.Free;
  end;
end;



end.
