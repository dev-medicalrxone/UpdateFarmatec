unit UntMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Registry,
  Vcl.ExtCtrls;

type
  TFrmMain = class(TForm)
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    btnUpdate: TButton;
    Button2: TButton;
    btnConvertPassword: TButton;
    EditNPI: TEdit;
    Button4: TButton;
    Button5: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Button6: TButton;
    Button7: TButton;
    TimerCreateNewFields: TTimer;
    Button8: TButton;
    PageControlInfo: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Memo2: TMemo;
    Panel3: TPanel;
    Label1: TLabel;
    MemoErrors: TMemo;
    procedure btnUpdateClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnConvertPasswordClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerCreateNewFieldsTimer(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    procedure UpdateOTC_PlanMedicoNo;
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses UntDMModifyDatabase, UntDMePrescribe, UntFrmPickDate;

procedure TFrmMain.btnUpdateClick(Sender: TObject);
begin
  DMModifyDatabase.CreateNewFields;
  //DMModifyDatabase.DropAll;
  DMModifyDatabase.UpdateFarmatec ;
  UpdateOTC_PlanMedicoNo;
  ShowMessage('Finish updating!');
end;

procedure TFrmMain.Button2Click(Sender: TObject);
begin
  DMModifyDatabase.ExecQry(DMModifyDatabase.qryUpdatePatPlanIndex.SQL.Text);
  //UpdateOTC_PlanMedicoNo;
end;


function getCodes(Code, claim: String): String;
Var
 loc1, loc2: Integer;
begin
  loc1 := Pos(code, claim);
  if loc1 > 0 then
  begin
    result := copy(claim, loc1+3,25);
    loc2 := Pos(chr(28), result);
    result := copy(result,1, loc2-1);
  end
  else
  begin
    result := '';
  end;
end;

procedure TFrmMain.btnConvertPasswordClick(Sender: TObject);
var
  loc1, loc2: integer;
  chid, groupno, qty: string;

begin
  With DMModifyDatabase do
  begin
    FDQuery1.Close;
    FDQuery1.SQL.Text := 'select otcnumber, RX_STATUS, NUMERORECETA,QTY,CLAIM_STATUS,PAGO_PLAN,DEDUCIBLE,TIME_RX,PLAN_MEDICO, PRICE_TABLE_ID, NUMEROPLAN, PLANESMEDICOSNO, WF_BILLED, LOTE, MEDICAMENTO from otc where qty = 0' +
     ' and CLAIM_STATUS = 5 and (PAGO_PLAN > 0 or DEDUCIBLE > 0)  order by OTCNUMBER ';
    //FDQuery1.SQL.Text := 'select otcnumber, RX_STATUS, NUMERORECETA,QTY,CLAIM_STATUS,PAGO_PLAN,DEDUCIBLE,TIME_RX,PLAN_MEDICO, PRICE_TABLE_ID, NUMEROPLAN, PLANESMEDICOSNO, WF_BILLED, LOTE, MEDICAMENTO from otc where otcnumber = 216722';
    FDQuery1.open;
    While not FDQuery1.Eof do
    begin
      FDQuery2.Close;
      FDQuery2.SQL.Text := 'select max(CLAIM_NO) as ID from CLAIM where otcnumber = ' + intToStr(FDQuery1.FieldByName('otcnumber').value);
      FDQuery2.Open;
      if FDQuery2.FieldByName('id').Value > 0 then
      begin
        FDQuery3.Close;
        FDQuery3.SQL.Text := 'select CLAIM from claim where claim_no = ' + FDQuery2.FieldByName('id').asString;
        FDQuery3.Open;
        if Trim(FDQuery3.FieldByName('CLAIM').Value) > '' then
        begin
          chid := getCodes(#28+'C2', FDQuery3.FieldByName('CLAIM').Value);
          groupno := getCodes(#28+'C1', FDQuery3.FieldByName('CLAIM').Value);
          qty := getCodes(#28+'E7', FDQuery3.FieldByName('CLAIM').Value);
          if (chid > '') then
          begin
            FDQuery4.Close;
            FDQuery4.SQL.Text := 'select * from PATPLAN where CARDHOLDERID = ' + chr(39) + chid + chr(39) +
                                 ' and NOGRUPO = ' + chr(39) + groupno + chr(39);
            FDQuery4.open;
            if FDQuery4.RecordCount > 0 then
            begin
              FDQuery5.SQL.Text := 'update otc set CLAIM_STATUS = 1, NUMEROPLAN = ' + IntToStr(FDQuery4.FieldByName('NUMEROPLAN').value) + ',' +
                                   'PLANESMEDICOSNO = ' + IntToStr(FDQuery4.FieldByName('PLANESMEDICOSNO').value) + ',' +
                                   'PLAN_MEDICO = ' + chr(39) + FDQuery4.FieldByName('PLANMEDICO').value + chr(39) + ',' +
                                   'QTY = ' + FloatToStr(StrToFloat(qty) / 1000) +
                                   ' where otcnumber = ' + FDQuery1.FieldByName('otcnumber').AsString;
              FDQuery5.ExecSQL;
            end;
            //Showmessage(IntToStr(FDQuery4.RecordCount));
          end;
        end;
      end;
      FDQuery1.Next;
    end;

  end;
end;
{Var
  I: Integer;
begin
 FrmMain.PageControlInfo.ActivePageIndex := 0;
 DMModifyDatabase.UpdateNullColumns('Passwords');
 DMModifyDatabase.AlterColumns('Passwords');
 btnConvertPassword.Enabled := False;
 { With DMModifyDatabase do
  begin
    //===================Constrains====================================
    //for I := 0 to 3-1 do
    begin
      cdsConstrains.Close;
      cdsConstrains.CommandText := 'SELECT TableName = t.Name, ColumnName = c.Name, dc.Name, dc.definition FROM sys.tables t ' +
      'INNER JOIN sys.default_constraints dc ON t.object_id = dc.parent_object_id ' +
      'INNER JOIN sys.columns c ON dc.parent_object_id = c.object_id AND c.column_id = dc.parent_column_id ' +
      ' ORDER BY t.Name';
      //'where t.Name = ' + chr(39) + 'inventarioPiso' + chr(39) + ' ORDER BY t.Name';
      cdsConstrains.Open;
      cdsConstrains.First;
      while not cdsConstrains.Eof do
      begin
        if (Trim(cdsConstrainsTableName.Value) = 'OTC') or
        (Trim(cdsConstrainsTableName.Value) = 'INVENTARIOPISO') or
        (Trim(cdsConstrainsTableName.Value) = 'PACIENTES') or
        (Trim(cdsConstrainsTableName.Value) = 'DAILYTOTALS') then
        begin
          ExecSql('Alter Table ' + Trim(cdsConstrainsTableName.Value) + ' DROP Constraint ' + Trim(cdsConstrainsName.Value));
        end;
        cdsConstrains.Next;
      end;
    end;
  end;
end;}

procedure TFrmMain.Button4Click(Sender: TObject);
Var
  Counter: integer;
begin

  with DMModifyDatabase do
  begin
    CDSPrescriptions.close;
    CDSPrescriptions.CommandText := 'select * from PRESCRIPTIONS order by NUMERORECETA';
    cdsPrescriptions.Open;
    while not cdsPrescriptions.Eof do
    begin
      Try
        QUpdateOTC.SQL.Text := 'Update otc set ' +
        ' FECHAEXPIRACION = ' + chr(39) + cdsPrescriptionsFECHAEXPIRACION.AsString + chr(39) +
        ',BASISOFCOST = ' + chr(39) + cdsPrescriptionsBASISOFCOST.Value + chr(39) +
        ',CLINICIDNUMBER = '  + chr(39) + cdsPrescriptionsCLINICIDNUMBER.asString  + chr(39) +
        ',DIAGNOSISCODE = ' + chr(39) + cdsPrescriptionsDIAGNOSISCODE.value + chr(39) +
        ',DURCONFLICTCODE = ' + chr(39) + cdsPrescriptionsDURCONFLICTCODE.Value + chr(39) +
        ',DURINTERVENTIONCODE = ' +  Chr(39) + cdsPrescriptionsDURINTERVENTIONCODE.Value + chr(39) +
        ',DUROUTCOMECODE = ' + chr(39) + cdsPrescriptionsDUROUTCOMECODE.asString + CHR(39) +
        ',LEVELOFSERVICE = '  + chr(39) + cdsPrescriptionsLEVELOFSERVICE.AsString  + chr(39) +
        ',PRIMARYPRESCRIBER = ' + CHR(39) + cdsPrescriptionsPRIMARYPRESCRIBER.Value + CHR(39) +
        ',RXDENIALCLARIF = ' + Chr(39) + cdsPrescriptionsRXDENIALCLARIF.Value + CHR(39) +
        ',RXDENIALOVERRIDE = '  + chr(39) + cdsPrescriptionsRXDENIALOVERRIDE.AsString  + chr(39) +
        ',DISPENSINGFEE = '  + chr(39) + cdsPrescriptionsDISPENSINGFEE.AsString  + chr(39) +
        ',GROSSAMOUNTDUE = '  + chr(39) + cdsPrescriptionsGROSSAMOUNTDUE.AsString  + chr(39) +
        ',PATIENTPAIDAMOUNT = '  + chr(39) + cdsPrescriptionsPATIENTPAIDAMOUNT.AsString  + chr(39) +
        ',SALESTAX = '  + chr(39) + cdsPrescriptionsSALESTAX.AsString  + chr(39) +
        ',GANANCIA = '  + chr(39) + cdsPrescriptionsGANANCIA.AsString  + chr(39) +
        ',OTAMCLDSUBCOUNTQUAL = ' + chr(39) + cdsPrescriptionsOTAMCLDSUBCOUNTQUAL.Value + chr(39) +
        ',PRODUCTSERVIDQUAL = ' + chr(39) + cdsPrescriptionsPRODUCTSERVIDQUAL.Value + chr(39) +
        ',PROVIDERID = ' + chr(39) + cdsPrescriptionsPROVIDERID.Value + chr(39) +
        ',UNIT_DOSE_INDICATOR = ' + chr(39) + cdsPrescriptionsUNIT_DOSE_INDICATOR.Value + chr(39) +
        ',UNIT_OF_MEASURE = ' + chr(39) + cdsPrescriptionsUNIT_OF_MEASURE.Value + chr(39) +
        ',SUB_CLARIF_CODE = ' + chr(39) + cdsPrescriptionsSUB_CLARIF_CODE.Value + chr(39) +
        ',OTHERCOVERAGECODE = ' + chr(39) + cdsPrescriptionsOTHERCOVERAGECODE.Value + chr(39) +
        ',SERVICEPROVIDQUALIFIER = ' + chr(39) + cdsPrescriptionsSERVICEPROVIDQUALIFIER.Value + chr(39) +
        ',OP_AMOUNTPAIDCOUNT = '  + chr(39) + cdsPrescriptionsOP_AMOUNTPAIDCOUNT.AsString + chr(39) +
        ',OP_REJECTCOUNT = '  + chr(39) + cdsPrescriptionsOP_REJECTCOUNT.AsString + chr(39) +
        ',COB_OTHERPAYMENTCOUNT = ' + CHR(39) + cdsPrescriptionsCOB_OTHERPAYMENTCOUNT.AsString  + chr(39) +
        ',COMPDOSAGE_FORM_DESC_CODE = '  + chr(39) + cdsPrescriptionsCOMPDOSAGE_FORM_DESC_CODE.Value  + chr(39) +
        ',COMPDISP_UNIT_FORM_INDI = '  + chr(39) + cdsPrescriptionsCOMPDISP_UNIT_FORM_INDI.Value + chr(39)+
        ',COMPROUTE_OF_ADMINISTRATION = '  + chr(39) + cdsPrescriptionsCOMPROUTE_OF_ADMINISTRATION.Value + chr(39) +
        ',COMPING_COMP_COUNT = '  + chr(39) + cdsPrescriptionsCOMPING_COMP_COUNT.AsString  + chr(39) +
        ',DISPENSING_STATUS = '  + chr(39) + cdsPrescriptionsDISPENSING_STATUS.Value  + chr(39) +
        ',QTY_INTENDED_DISP = '  + chr(39) + cdsPrescriptionsQTY_INTENDED_DISP.AsString  + chr(39) +
        ',DAYS_SUPPLY_INTEND_DISP = '  + chr(39) + cdsPrescriptionsDAYS_SUPPLY_INTEND_DISP.AsString  + chr(39) +
        ',FLAT_SALES_TAXSUB = '  + chr(39) + cdsPrescriptionsFLAT_SALES_TAXSUB.asString  + chr(39) +
        ',ASSOC_RX_SERVICE_DATE = '  + chr(39) + cdsPrescriptionsASSOC_RX_SERVICE_DATE.AsString  + chr(39) +
        ',ASSOC_RX_SERVICE_REF_NO = '  + chr(39) + cdsPrescriptionsASSOC_RX_SERVICE_REF_NO.Value  + chr(39) +
        ',CUPONTYPE = '  + chr(39) + cdsPrescriptionsCUPONTYPE.Value  + chr(39) +
        ',CUPON_NUMBER = '  + chr(39) + cdsPrescriptionsCUPON_NUMBER.Value  + chr(39) +
        ',CUPON_VALUE_AMT = '  + chr(39) + cdsPrescriptionsCUPON_VALUE_AMT.AsString  + chr(39) +
        ',PRIMARYCAREPROVIDQUALIFIER = '  + chr(39) + cdsPrescriptionsPRIMARYCAREPROVIDQUALIFIER.Value  + chr(39) +
        ',PRIMARYCAREPROVID = '  + chr(39) + cdsPrescriptionsPRIMARYCAREPROVID.Value  + chr(39) +
        ',PRIMARYCAREPROVLASTNAME = '  + chr(39) + cdsPrescriptionsPRIMARYCAREPROVLASTNAME.Value  + chr(39) +
        ',MEDICAID_PAID_AMOUNT = '  + chr(39) + cdsPrescriptionsMEDICAID_PAID_AMOUNT.AsString  + chr(39) +
        ',PMC_459_ER = '  + chr(39) + cdsPrescriptionsPMC_459_ER.Value  + chr(39) +
        ',PMCC_458_SE = '  + chr(39) +  cdsPrescriptionsPMCC_458_SE.AsString  + chr(39) +
        ',SPIDN_454_EK = '  + chr(39) + cdsPrescriptionsSPIDN_454_EK.Value  + chr(39) +
        ',IATID_463_EW = '  + chr(39) + cdsPrescriptionsIATID_463_EW.Value  + chr(39) +
        ',IAID_464_EX = '  + chr(39) + cdsPrescriptionsIAID_464_EX.Value  + chr(39) +
        ',DRC_357_NV = '  + chr(39) + cdsPrescriptionsDRC_357_NV.Value  + chr(39) +
        ',PAI_391_MT = '  + chr(39) + cdsPrescriptionsPAI_391_MT.Value  + chr(39) +
        ',COMPOUND_TYPE_996_G1 = '  + chr(39) + cdsPrescriptionsCOMPOUND_TYPE_996_G1.Value  + chr(39) +
        ',PST_147_U7 = '  + chr(39) + cdsPrescriptionsPST_147_U7.Value + chr(39) +
        ',SCCD_354_NX = '  + chr(39) + cdsPrescriptionsSCCD_354_NX.asString  + chr(39) +
        ',PRAC_353_NR = '  + chr(39) + cdsPrescriptionsPRAC_353_NR.AsString  + chr(39) +
        ',BSC_392_MU = '  + chr(39) + cdsPrescriptionsBSC_392_MU.AsString  + chr(39) +
        ',SPECIAL_PACK_INDI_429_DT = '  + chr(39) + cdsPrescriptionsSPECIAL_PACK_INDI_429_DT.asString  + chr(39) +
        ',ROUTEOFADMIN_995_E2 = '  + chr(39) + cdsPrescriptionsROUTEOFADMIN_995_E2.Value + chr(39) +
        ',WC_117_TR = '  + chr(39) + cdsPrescriptionsWC_117_TR.AsString   + chr(39) +
        ',WC_118_TS = '  + chr(39) + cdsPrescriptionsWC_118_TS.asString  + chr(39) +
        ',WC_119_TT  = ' + chr(39) + cdsPrescriptionsWC_119_TT.Value  + chr(39) +
        ',WC_120_TU = '   + chr(39) + cdsPrescriptionsWC_120_TU.Value + chr(39) +
        ',WC_121_TV = '  + chr(39) + cdsPrescriptionsWC_121_TV.Value  + chr(39) +
        ',WC_122_TW = '  + chr(39) + cdsPrescriptionsWC_122_TW.Value  + chr(39) +
        ',WC_123_TX = '  + chr(39) + cdsPrescriptionsWC_123_TX.Value  + chr(39) +
        ',WC_124_TY = '  + chr(39) + cdsPrescriptionsWC_124_TY.Value + chr(39) +
        ',WC_125_TZ = '  + chr(39) + cdsPrescriptionsWC_125_TZ.Value  + chr(39) +
        ',WC_126_UA = '  + chr(39) + cdsPrescriptionsWC_126_UA.Value  + chr(39) +
        ',PRIMARYCAREPROVLOCATIONCODE = '  + chr(39) + cdsPrescriptionsPRIMARYCAREPROVLOCATIONCODE.Value  + chr(39) +
        ',PATIENTLOCATION = '  + chr(39) + cdsPrescriptionsPATIENTLOCATION.AsString  + chr(39) +
        ',PRESC_SRNM = '  + chr(39) +cdsPrescriptionsPRESC_SRN.Value  + chr(39) +
        ',PS_558_AW = '  + chr(39) + cdsPrescriptionsPS_558_AW.AsString  + chr(39) +
        ',PS_559_AX = '  + chr(39) + cdsPrescriptionsPS_559_AX.AsString  + chr(39) +
        ',REVENUE_CODE = '  + chr(39) + cdsPrescriptionsREVENUE_CODE.Value  + chr(39) +
        ',DAW = '  + chr(39) + cdsPrescriptionsDAW.AsString + chr(39) +
        ',CONTROLADO = ' + chr(39) + cdsPrescriptionsCONTROLADO.AsString + chr(39) +
        ' where NumeroReceta = ' + cdsPrescriptionsNUMERORECETA.AsString;
        QUpdateOTC.ExecSQL;
      Except
        //
      End;
      Counter := Counter + 1;
      StatusBar1.Panels[0].Text := IntToStr(Counter);
      StatusBar1.Refresh;
      cdsPrescriptions.Next;
    end;
  end;
end;

procedure TFrmMain.Button5Click(Sender: TObject);
begin
  DMModifyDatabase.ExecQry(DMModifyDatabase.qryUpdatePatPlanIndex.SQL.Text);
  ShowMessage('Done!');
end;

procedure TFrmMain.Button6Click(Sender: TObject);
begin
  FrmPickDate := TFrmPickDate.Create(Nil);
  With FrmPickDate do
  begin
    ShowModal;
    if ModalResult = mrOk then
    begin
      With DMModifyDatabase do
      begin
        cdsClaims.Close;
        cdsClaims.CommandText := 'Select * from Claim where Convert(Varchar, servicedate,101) between' + chr(39) + DateToStr(dtpFrom.Date) + chr(39) + ' and ' + chr(39) + DateToStr(dtpTo.Date) + chr(39);
        cdsClaims.Open;
        while not cdsClaims.eof do
        begin
          if cdsClaimsOTCNUMBER.Value > 0 then
          begin
            FDQuery1.SQL.Text := 'Update OTC set NumeroReceta = ' + cdsClaimsRX_NUMBER.AsString + ' where OTCNumber = ' + cdsClaimsOTCNUMBER.AsString;
            FDQuery1.ExecSQL;
          end;
          cdsClaims.Next;
        end;
      end;
    end;
    FrmPickDate := Nil;
    Free;
  end;
end;

procedure TFrmMain.Button7Click(Sender: TObject);
begin
  DMModifyDatabase.ErasePrescriptionsFields;
end;

procedure TFrmMain.Button8Click(Sender: TObject);
begin

  Memo1.Clear;
  Memo1.Lines.Add('Reindexing Database...');
  DMModifyDatabase.Reindex.ExecSQL;
  Memo1.Lines.Add('Done...');
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMModifyDatabase.ExecSql('DROP PROCEDURE FIX_CONTROLADO');
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  if DMModifyDatabase.DatabaseName = 'esco' then btnUpdate.Enabled := false;

end;

procedure TFrmMain.SpeedButton1Click(Sender: TObject);
begin
  with DMModifyDatabase do
  begin
    SQLQuery1.SQL.Text := 'update planesmedicos set SERVICE_PROVIDER_ID_QUAL = ' + chr(39) + '01' + chr(39) +', NUMEROFARMACIA = ' + chr(39) + Trim(FrmMain.EditNPI.Text) + chr(39) +', BINNUMBER = ' + chr(39) + '018182' + chr(39) +', MANUAL_PLAN = ' + chr(39) + 'T'+ chr(39) + ', PROCESSORCONTROL = ' + chr(39) + 'CASH' + chr(39) +', SOFTWARE_VENDOR_ID = '+ chr(39) +'WESCOM' + chr(39) + ' where ABREVIATURA = ' + chr(39) + 'CAS'+ chr(39);
    SQLQuery1.ExecSQL;
  end;
end;

procedure TFrmMain.TimerCreateNewFieldsTimer(Sender: TObject);
begin
  TimerCreateNewFields.Enabled := False;
  DMModifyDatabase.CreateNewFields;
  btnUpdate.Enabled := true;
  //DMModifyDatabase.DropAll;
end;

procedure TFrmMain.UpdateOTC_PlanMedicoNo;
begin
  With DMModifyDatabase do
  begin
    FDQuery1.SQL.Text := 'Select OTCNumber, PLAN_MEDICO from otc where FECHAOTC > ' + chr(39) + '01/01/2023' + chr(39) +' and NUMERORECETA > 0 and PLANESMEDICOSNO = 0';
    FDQuery1.Open;
    While not FDQuery1.Eof do
    begin
      try
      FDQuery2.Close;
      FDQuery2.SQL.Text := 'Select planesmedicosno from PlanesMedicos where Abreviatura = ' + chr(39) + FDQuery1.FieldByName('PLAN_MEDICO').value + chr(39) ;
      FDQuery2.Open;
      if (FDQuery2.RecordCount > 0) and (FDQuery1.FieldByName('otcnumber').isNull = false) and
      (FDQuery2.FieldByName('planesmedicosno').isNull = false) then
      begin
        FDQuery3.SQL.Text := 'Update otc set PLANESMEDICOSNO = ' + FDQuery2.FieldByName('planesmedicosno').AsString + ' where otcnumber = ' + FDQuery1.FieldByName('otcnumber').AsString;
        FDQuery3.ExecSQL;
      end;
      Except
        Memo1.Lines.Add(FDQuery3.SQL.Text);
      end;
      FDQuery1.Next;
    end;
    FDQuery1.SQL.Text := 'select PLANMEDICO, NUMEROPLAN, PLANESMEDICOSNO from PATPLAN where PLANESMEDICOSNO = 0 or PLANESMEDICOSNO IS NULL';
    FDQuery1.Open;
    While not FDQuery1.Eof do
    begin
      try
      FDQuery2.Close;
      FDQuery2.SQL.Text := 'Select planesmedicosno from PlanesMedicos where Abreviatura = ' + chr(39) + FDQuery1.FieldByName('PLANMEDICO').value + chr(39);
      FDQuery2.Open;
      if (FDQuery2.RecordCount > 0) and (FDQuery1.FieldByName('NUMEROPLAN').isNull = false) and
      (FDQuery2.FieldByName('planesmedicosno').isNull = false)  then
      begin
        FDQuery3.SQL.Text := 'Update PATPLAN set PLANESMEDICOSNO = ' + FDQuery2.FieldByName('planesmedicosno').AsString + ' where NUMEROPLAN = ' + FDQuery1.FieldByName('NUMEROPLAN').AsString;
        FDQuery3.ExecSQL;
      end;
      Except
        Memo1.Lines.Add(FDQuery3.SQL.Text);
      end;
      FDQuery1.Next;
    end;
  end;
end;

end.
