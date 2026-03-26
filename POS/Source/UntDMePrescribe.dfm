object DMePrescribe: TDMePrescribe
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 511
  Width = 972
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 64
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 144
    Top = 8
  end
  object FDConnectionRDS: TFDConnection
    Params.Strings = (
      'User_Name=dbo'
      'Server=192.168.3.204,1433\SQLEXPRESS'
      'OSAuthent=No'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'Workstation=AXELOFFICE'
      'MARS=yes'
      'Password=agabriel'
      'Database=EasyRx'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 232
    Top = 16
  end
  object REFREQ: TFDQuery
    Connection = FDConnectionRDS
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[REFREQ] '
      #9'@MessageID char(40) ,'
      #9'@RelatesToMessageID char(40) ,'
      #9'@MailboxMessageID char(40) ,'
      #9'@From1 char(10) ,'
      #9'@SentTime char(15) ,'
      #9'@STS000 char(3) ,'
      #9'@STS010 char(3) ,'
      #9'@STS020 char(3) ,'
      #9'@STS030 char(70) ,'
      #9'@RES000 char(3) ,'
      #9'@RES010 char(3) ,'
      #9'@RES020 char(3) ,'
      #9'@RES030 char(1) ,'
      #9'@RES040 char(70) ,'
      #9'@UIB000 char(3) ,'
      #9'@UIB010 char(6) ,'
      #9'@UIB020 char(1) ,'
      #9'@UIB030 char(71) ,'
      #9'@UIB040 char(1) ,'
      #9'@UIB050 char(1) ,'
      #9'@UIB060 char(40) ,'
      #9'@UIB070 char(40) ,'
      #9'@UIB080 char(24) ,'
      #9'@UIH000 char(3) ,'
      #9'@UIH010 char(21) ,'
      #9'@UIH020 char(35) ,'
      #9'@UIH030 char(70) ,'
      #9'@PC000 char(3) ,'
      #9'@PC010 char(3) ,'
      #9'@PC020 char(100) ,'
      #9'@PC030 char(1) ,'
      #9'@PC040 char(18) ,'
      #9'@PC050 char(110) ,'
      #9'@PC060 char(1) ,'
      #9'@PC070 char(35) ,'
      #9'@PC080 char(100) ,'
      #9'@PC090 char(230) ,'
      #9'@PC0100 char(130) ,'
      #9'@SU000 char(3) ,'
      #9'@SU010 char(3) ,'
      #9'@SU020 char(100) ,'
      #9'@SU030 char(1) ,'
      #9'@SU040 char(18) ,'
      #9'@SU050 char(130) ,'
      #9'@SU060 char(1) ,'
      #9'@SU070 char(40) ,'
      #9'@SU080 char(130) ,'
      #9'@SU090 char(245) ,'
      #9'@SU0100 char(129) ,'
      #9'@P2000 char(3) ,'
      #9'@P2010 char(3) ,'
      #9'@P2020 char(90) ,'
      #9'@P2030 char(1) ,'
      #9'@P2040 char(20) ,'
      #9'@P2050 char(130) ,'
      #9'@P2060 char(1) ,'
      #9'@P2070 char(35) ,'
      #9'@P2080 char(124) ,'
      #9'@P2090 char(230) ,'
      #9'@P20100 char(130) ,'
      #9'@PTT000 char(3) ,'
      #9'@PTT010 char(3) ,'
      #9'@PTT020 char(8) ,'
      #9'@PTT030 char(130) ,'
      #9'@PTT040 char(3) ,'
      #9'@PTT050 char(90) ,'
      #9'@PTT060 char(130) ,'
      #9'@PTT070 char(250) ,'
      #9'@DRU000 char(3) ,'
      #9'@DRU010 char(350) ,'
      #9'@DRU020 char(150) ,'
      #9'@DRU030 char(310) ,'
      #9'@DRU040 char(150) ,'
      #9'@DRU050 char(3) ,'
      #9'@DRU060 char(12) ,'
      #9'@DRU070 char(150) ,'
      #9'@DRU080 char(100) ,'
      #9'@DRU090 char(230) ,'
      #9'@DRU0110 char(15),'
      #9'@STATUS int '
      'AS'
      'SET NOCOUNT ON'
      'begin'
      '  begin transaction'
      '  INSERT INTO "EasyRx".."SureScript" '
      
        '  ("MessageID", "RelatesToMessageID", "From1","UIB000","UIB010",' +
        '"UIB030","UIB060","UIB070","UIH000","UIH010","UIH020","UIH030","' +
        'PC000","PC010","PC020","PC050","PC070","PC080","PC090","P2000","' +
        'P2010","P2020","P2050","P2070","P2080","P2090","PTT000","PTT020"' +
        ',"PTT030","PTT040","PTT050", "PTT060","PTT070","DRU000","DRU010"' +
        ',"DRU020","DRU030","DRU040","DRU050","DRU060","DRU090","Status",' +
        ' "rx_status", "DRU0110", "DateReceived") '
      
        '  VALUES (@MessageID, @RelatesToMessageID, @From1,@UIB000,@UIB01' +
        '0,@UIB030,@UIB060,@UIB070,@UIH000,@UIH010,@UIH020,@UIH030,@PC000' +
        ',@PC010,@PC020,@PC050,@PC070,@PC080,@PC090,@P2000,@P2010,@P2020,' +
        '@P2050,@P2070,@P2080,@P2090,@PTT000,@PTT020,@PTT030,@PTT040,@PTT' +
        '050,@PTT060,@PTT070,@DRU000,@DRU010,@DRU020,@DRU030,@DRU040,@DRU' +
        '050,@DRU060,@DRU090,4,3,@DRU0110, GETDATE())'
      '  commit'
      'end;')
    Left = 225
    Top = 168
  end
  object NEXT_REFREQ_TRAN_NO: TFDQuery
    Connection = FDConnectionRDS
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[NEXT_REFREQ_TRAN_NO] @TRAN_NO BIGINT OUT' +
        'PUT'
      'AS'
      'set nocount on'
      'begin'
      '  begin transaction'
      '  Update NEXT_RXNUMBER SET REFREQ_TRAN_NO = REFREQ_TRAN_NO + 1;'
      '  Select @TRAN_NO = (REFREQ_TRAN_NO) FROM NEXT_RXNUMBER;'
      '  commit'
      'end')
    Left = 225
    Top = 231
  end
  object UPDATE_REFREQ: TFDQuery
    Connection = FDConnectionRDS
    SQL.Strings = (
      'CREATE TRIGGER [dbo].[UPDATE_REFREQ] ON [dbo].[SureScript]'
      'FOR INSERT, UPDATE, DELETE'
      'AS'
      '  SET NOCOUNT ON'
      '  DECLARE @MESSAGE_FUNCTION CHAR(10)'
      '  DECLARE @STS010 CHAR(3)'
      '  DECLARE @STS020 CHAR(3)'
      '  DECLARE @STS030 CHAR(70)'
      '  DECLARE @RelatesToMessageID char(40)'
      '  DECLARE @RES010 CHAR(3)'
      '  DECLARE @RES020 CHAR(30)'
      '  DECLARE @RES030 CHAR(1)'
      '  DECLARE @RES040 CHAR(70)'
      '  DECLARE @DateReceived DateTime '
      'begin'
      '  begin transaction '
      
        '--SELECT @MESSAGE_FUNCTION = LTRIM(RTRIM(SUBSTRING (UIH010, 16, ' +
        '10))), @STS010 = STS010, @STS020 = STS020, @STS030 = STS030 from' +
        ' INSERTED;'
      
        ' SELECT @MESSAGE_FUNCTION = SUBSTRING (UIH010, 16, 6) from INSER' +
        'TED;'
      ' SELECT  @STS010 = STS010 from INSERTED;'
      ' SELECT @STS020 = STS020 from INSERTED;'
      ' SELECT @STS030 = STS030 from INSERTED;'
      ' SELECT @RelatesToMessageID = RelatesToMessageID from INSERTED;'
      ' SELECT @RES010 = RES010 from INSERTED; '
      ' SELECT @RES020 = RES020 from INSERTED;'
      ' SELECT @RES030 = RES030 from INSERTED; '
      ' SELECT @RES040 = RES040 from INSERTED; '
      ' SELECT @DateReceived = DateReceived from INSERTED;'
      ''
      '  IF @MESSAGE_FUNCTION = '#39'VERIFY'#39' '
      '  begin'
      
        '    Update SureScript set STS010 = @STS010, STS020 = @STS020, ST' +
        'S030 = @STS030, DateReceived = @DateReceived, rx_status = 1 WHER' +
        'E MessageID = @RelatesToMessageID;'
      '  end '
      ''
      '  IF @MESSAGE_FUNCTION = '#39'REFRES'#39' '
      '  begin'
      
        '    Update SureScript set  RES010 = @RES010, RES020 = @RES020, R' +
        'ES030 = @RES030,  RES040 = @RES040, rx_status = 4, DateReceived ' +
        '= @DateReceived WHERE MessageID = @RelatesToMessageID;'
      '  end '
      ''
      '  IF @MESSAGE_FUNCTION = '#39'ERROR'#39' '
      '  begin'
      
        '    Update SureScript set  STS010 = @STS010, STS020 = @STS020, S' +
        'TS030 = @STS030, rx_status = 4, DateReceived = @DateReceived WHE' +
        'RE MessageID = @RelatesToMessageID;'
      
        '    --INSERT INTO RES_TEMP (RES010, RES020, RES030, RES040) VALU' +
        'ES (@RES010, @RES020, @RES030, @RES040);'
      '  end '
      '  commit'
      ''
      'end;')
    Left = 217
    Top = 295
  end
  object UPDATE_Last_Transaction: TFDQuery
    Connection = FDConnectionRDS
    SQL.Strings = (
      
        'CREATE TRIGGER[dbo].[UPDATE_Last_Transaction] ON [dbo].[SureScri' +
        'pt]  '
      'FOR INSERT '
      'as '
      'set NOCOUNT ON'
      'begin'
      '  begin transaction'
      
        '   Update LastTransaction set LastePrescribe_Date_Time = GETDATE' +
        '(); '
      '  commit'
      'end;')
    Left = 217
    Top = 367
  end
  object QBorrarNonMatchedNDC: TFDQuery
    Connection = FDConnectionRDS
    Left = 56
    Top = 168
  end
  object BACKUPDATABASE: TFDQuery
    Connection = FDConnectionRDS
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[BACKUPDATABASE]'
      '@database varchar(100),'
      '@backupDir varchar(500),'
      '@backupDate char(6)'
      'AS'
      'IF RIGHT(@backupDir, 1) = '#39'\'#39
      'SET @backupDir = @backupDir + @database + '#39'.bak'#39
      'ELSE'
      'SET @backupDir = @backupDir + '#39'\'#39' + @database + '#39'.bak'#39
      'BACKUP DATABASE @database'
      'TO DISK = @backupDir'
      'WITH STATS = 10')
    Left = 224
    Top = 96
  end
  object UpdateSurescript: TFDQuery
    Connection = FDConnectionRDS
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[UpdateSurescript] @NoCliente Integer, @P' +
        'TT050 char(90), '
      
        '@PTT020 char(8), @PTT040 char(3), @SPI nchar(13), @NoDoctor Inte' +
        'ger,'
      '@ProductNo integer, @IDMess integer, @Rx_status Integer'
      'AS'
      'SET NOCOUNT ON '
      'BEGIN'
      '  begin transaction'
      #9'if @NoCliente > 0 '
      #9'begin'
      
        #9' Update SureScript set ptt_no = @NoCliente where (PTT050 = @PTT' +
        '050 and  PTT020 = @PTT020 and PTT040 = @PTT040) and (rx_status <' +
        '> 1);'
      #9'end'
      #9'if @SPI > '#39#39
      #9'begin'
      
        #9'  Update SureScript set presc_no = @NoDoctor where (substring(U' +
        'IB060, 1, 13) = @SPI) and (rx_status <> 1);'
      #9'end'
      #9'if @ProductNo > 0'
      #9'begin'
      
        #9'  Update SureScript set drug = @ProductNo where IDMess = @IDMes' +
        's;'
      #9'end'
      
        #9'--Change ePrescribe status 0 = waitting,  1 = Processed,  2 = p' +
        'rocessing, 3 = Pending, 4 = Answered, 5 = deleted '
      #9'if @Rx_status >= 0 '
      #9'begin'
      
        #9'  Update SureScript set Rx_status = @Rx_status, PTT_NO = 0, DRU' +
        'G = 0, PRESC_NO = 0 where IDMess = @IDMess;'
      #9'end'
      '  COMMIT'
      'END')
    Left = 216
    Top = 440
  end
  object QUpdateePrescribe: TFDQuery
    Connection = FDConnectionRDS
    Left = 417
    Top = 40
  end
  object SQLQuery1: TFDQuery
    Connection = FDConnectionRDS
    Left = 408
    Top = 144
  end
  object UpdateSurescriptRX_STATUS: TFDQuery
    Connection = FDConnectionRDS
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[UpdateSurescriptRX_STATUS] @IDMess integ' +
        'er, @Rx_status Integer'
      'AS'
      'SET NOCOUNT ON '
      'BEGIN'
      '  begin transaction'
      
        '    Update SureScript set Rx_status = @Rx_status where IDMess = ' +
        '@IDMess;'
      '    if @Rx_status = 1 '
      '    begin'
      '      Delete from RX_LABEL where IDMess = @IDMess; '
      '    end;'
      '  COMMIT'
      'END')
    Left = 408
    Top = 240
  end
  object BACKUPDATABASE_EASY_RX: TFDQuery
    Connection = FDConnectionRDS
    SQL.Strings = (
      'ALTER PROCEDURE [dbo].[BACKUPDATABASE]'
      '@NewDatabaseName varchar(100),'
      '@database varchar(100),'
      '@backupDir varchar(500),'
      '@backupDate char(6)'
      'AS'
      'IF RIGHT(@backupDir, 1) = '#39'\'#39
      'SET @backupDir = @backupDir + @NewDatabaseName + '#39'.bak'#39
      'ELSE'
      'SET @backupDir = @backupDir + '#39'\'#39' + @NewDatabaseName + '#39'.bak'#39
      'BACKUP DATABASE @database'
      'TO DISK = @backupDir'
      'WITH STATS = 10')
    Left = 432
    Top = 336
  end
end
