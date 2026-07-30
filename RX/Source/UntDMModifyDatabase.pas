unit UntDMModifyDatabase;

interface

uses
  System.Win.Registry, SysUtils, Classes, FMTBcd, DB, SqlExpr, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Script,
  Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, Datasnap.DBClient,
  Datasnap.DSConnect, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Comp.UI, FireDAC.Phys.ODBCBase, Datasnap.Provider, vcl.dialogs, midas, Midaslib,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient, IdSNTP, Winapi.Windows, IdCoderMIME,
  Soap.EncdDecd, System.IniFiles, System.StrUtils;

type
  TDMModifyDatabase = class(TDataModule)
    QAlterViewRxControladas: TFDQuery;
    INSERT_RX: TFDQuery;
    SQLQuery1: TFDQuery;
    PRESCRIPTION_FULL: TFDQuery;
    Directory_PrescriberCreate: TFDQuery;
    CAMBIARACASH: TFDQuery;
    DELETE_OTC: TFDQuery;
    Insert_Prescriber_directory: TFDQuery;
    Index_PatPlanNC_NOCLIENTE: TFDQuery;
    cdsPriceTable: TClientDataSet;
    cdsPriceTableCODE_RANGE: TWideStringField;
    cdsPriceTableDESCRIPTION: TWideStringField;
    cdsPriceTableRANGEFROM: TFloatField;
    cdsPriceTableRANGETO: TFloatField;
    cdsPriceTableDISPFEEADDON: TFloatField;
    cdsPriceTableDISPFEEMULTIPLIER: TFloatField;
    cdsPriceTableCOSTADDON: TFloatField;
    cdsPriceTableCOSTMULTIPLIER: TFloatField;
    cdsPriceTablePRICE_TABLE_ID: TIntegerField;
    cdsPriceTableCOST_BASES: TWideStringField;
    cdsPriceTableDEFAULT_PRICE: TBooleanField;
    cdsPriceTableDEFAULT_CASH_PRICE: TBooleanField;
    dspPriceTable: TDataSetProvider;
    dsPriceTable: TDataSource;
    sqlPriceTable_FD: TFDQuery;
    BACKUPDATABASE: TFDQuery;
    CALCRXDISPONIBLE: TFDQuery;
    CALCULARAUSPICIO: TFDQuery;
    DELETE_PRINT_QUERIES: TFDQuery;
    DELETE_RXTEMP1NORX: TFDQuery;
    DELETE_RXTEMP1TERMINADA: TFDQuery;
    DELETE_SCANED_Q: TFDQuery;
    DEUDA: TFDQuery;
    EM_UPDATEINV: TFDQuery;
    FIXGROUP: TFDQuery;
    INSERT_ESIGNATURE: TFDQuery;
    INSERT_OTC: TFDQuery;
    INSERT_PRINT_Q: TFDQuery;
    INSERT_RESPONSE: TFDQuery;
    INSERT_TRANS: TFDQuery;
    INSERT_TRANS_TEMP: TFDQuery;
    INSERT_TRANSACTION_CREDITO: TFDQuery;
    INSERTDIRECTORY: TFDQuery;
    INSERTDOCTOR: TFDQuery;
    INSERTINVENTORY: TFDQuery;
    INSERTPACIENTE: TFDQuery;
    INSERTPATPLAN: TFDQuery;
    INSERTPRODUCT: TFDQuery;
    LAST_IDENTITY: TFDQuery;
    NEXT_BATCH_NUMBER: TFDQuery;
    NEXTBARCODE: TFDQuery;
    NEXTINSTANCIA: TFDQuery;
    NEXTINSTANCIA_SIGNATURE: TFDQuery;
    NEXTOTC: TFDQuery;
    NEXTRX_MEZCLA_TRAN_NO: TFDQuery;
    NEXTRX_PARATA_NO: TFDQuery;
    NEXTRX_TRAN_NO: TFDQuery;
    R_DOCTOR: TFDQuery;
    RECONCILIATION_ALL: TFDQuery;
    REFILL_VALUES: TFDQuery;
    REFILL_VALUESD0: TFDQuery;
    SCANED_RX_LINK: TFDQuery;
    SENDTOHISTORY: TFDQuery;
    TRANSACTIONDETAIL_CANCELTRANS: TFDQuery;
    TRANSACTIONDETAIL_DELETE: TFDQuery;
    TRANSACTIONDETAIL_DELETE_PRODUCT: TFDQuery;
    TRANSACTIONDETAIL_UPDATEPRICE: TFDQuery;
    UPDATE_DEBT: TFDQuery;
    UPDATE_INVENTORY: TFDQuery;
    UPDATE_OTC_SIGNATURELINK: TFDQuery;
    UPDATE_PRESCRIPTIONS_NOCLIENTE: TFDQuery;
    UPDATE_PRESCRIPTIONS_NORX: TFDQuery;
    UPDATE_RX_REJECTED: TFDQuery;
    UPDATE_RX_REVERSAL: TFDQuery;
    UPDATE_RXTEMP1_MEZCLA: TFDQuery;
    UPDATE_WC_STATUS: TFDQuery;
    WILLCALL_DELETE: TFDQuery;
    WILLCALL_History_DELETE: TFDQuery;
    WILLCALL_TOTAL_AMOUNT_DUE: TFDQuery;
    CALC_RXDISPONIBLE: TFDQuery;
    CALC_RXDISPONIBLE_DEL: TFDQuery;
    INSERT_OTC_LOG: TFDQuery;
    FDQuery2: TFDQuery;
    INSERT_PARATA_QUERIE: TFDQuery;
    CALC_TOTAL_RXDISPONIBLE_RXTEMP1_UPDATE: TFDQuery;
    EXPORTTOWILLCALLHISTORY: TFDQuery;
    CREATEWILLCAL_STATUS_LHISTORY: TFDQuery;
    EXPORTTOWILLCAL_STATUS_LHISTORY: TFDQuery;
    DELETETRANS: TFDQuery;
    CALC_TRANSFER_TOTAL: TFDQuery;
    UPDATE_OTC_WFPRINTED: TFDQuery;
    PRESC_DEL_DEPENDENCIES: TFDQuery;
    CALC_RXDISPONIBLE_PRESCRIPTION: TFDQuery;
    ORDER_TOTAL: TFDQuery;
    INSERTGPID: TFDQuery;
    AUSPICIO: TFDQuery;
    AUSPICIOTOTAL: TFDQuery;
    BESTRX: TFDQuery;
    BRAND_RX: TFDQuery;
    OTCCONTROLADOS: TFDQuery;
    OTCHISTORY: TFDQuery;
    PACIENTES_PLANES: TFDQuery;
    PRODUCTSALES: TFDQuery;
    RX_PROCESADAS: TFDQuery;
    RX_VIEW: TFDQuery;
    RXCONTROLADAS: TFDQuery;
    RX_VIEW_COMPOUNDS: TFDQuery;
    RXDEPT: TFDQuery;
    TEMP: TFDQuery;
    TOTAL_POS_TRANS: TFDQuery;
    VERTRANSACCIONES: TFDQuery;
    DSPacientes: TDataSource;
    DSPPacientes: TDataSetProvider;
    CDSPacientes: TClientDataSet;
    SQDSPacientesFD1: TFDQuery;
    DSPPatPlan: TDataSetProvider;
    DSPatPlan: TDataSource;
    CDSPatPlan: TClientDataSet;
    qPatPlan: TFDQuery;
    CDSPacientesNOMBRE: TStringField;
    CDSPacientesFECHANACIMIENTO: TSQLTimeStampField;
    CDSPacientesSEXO: TIntegerField;
    CDSPacientesDIRECCION1: TStringField;
    CDSPacientesULTTRANS: TSQLTimeStampField;
    CDSPacientesDEUDA: TSingleField;
    CDSPacientesLIMITECREDITO: TSingleField;
    CDSPacientesNUMEROCLIENTE: TAutoIncField;
    CDSPacientesINTERES: TStringField;
    CDSPacientesDIRECCIONFISICA: TStringField;
    CDSPacientesAPELLIDOPATERNO: TStringField;
    CDSPacientesAPELLIDOMATERNO: TStringField;
    CDSPatPlanNUMEROCLIENTE: TIntegerField;
    CDSPatPlanNUMEROPLAN: TAutoIncField;
    CDSPatPlanPLANMEDICO: TStringField;
    CDSPatPlanRELACION: TSmallintField;
    CDSPatPlanPERSONCODE: TStringField;
    CDSPatPlanINACTIVE_DATE: TSQLTimeStampField;
    CDSPatPlanCARDHOLDERID: TStringField;
    CDSPatPlanNOGRUPO: TStringField;
    CDSPatPlanHOME_PLAN: TStringField;
    CDSPatPlanPLAN_ID: TStringField;
    CDSPatPlanELIGIBILITY_CLARIF_CODE: TStringField;
    CDSPatPlanFACILITY_ID: TStringField;
    CDSPatPlanCH_FIRSTNAME: TStringField;
    CDSPatPlanCH_LASTNAME: TStringField;
    CDSPatPlanMEDIGAP_ID: TStringField;
    CDSPatPlanMEDICAID_INDICATOR: TStringField;
    CDSPatPlanPAAI: TStringField;
    CDSPatPlanPP997_G2: TStringField;
    CDSPatPlanMEDICAID_ID_NUMBER: TStringField;
    CDSPatPlanMEDICAID_AGENCY_NUMBER: TStringField;
    CDSPatPlanACTIVO: TBooleanField;
    CDSPatPlanPLAN_PRIMARIO: TBooleanField;
    CDSPatPlanCARD_IMAGE: TIntegerField;
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDTransaction1: TFDTransaction;
    WC_PICKUP_TF: TFDQuery;
    CDSPacientesIDENTIFICACION: TStringField;
    UPDATE_OTC_REFILL_NOTIFIED: TFDQuery;
    Index_NCPATNAME: TFDQuery;
    INDEX_INVENTORY: TFDQuery;
    Index_NCPrescName: TFDQuery;
    Index_PAT_NUMBER: TFDQuery;
    Index_RX_ID: TFDQuery;
    Index_OTC_NoReceta: TFDQuery;
    Index_Prescription_NumeroReceta: TFDQuery;
    VERIFYRXTEMP1: TFDQuery;
    TRANSACTIONDETAIL_UPDATEPRICE_MOBILE: TFDQuery;
    INSERT_ESIGNATURE_PICTURE: TFDQuery;
    RXTEMP1: TFDQuery;
    INSERT_CLAIM: TFDQuery;
    UPDATE_OTC: TFDQuery;
    UPDATE_OTC_RXPAID: TFDQuery;
    ADDUPDATEOTC: TFDQuery;
    UPDATE_PRESCRIPTION: TFDQuery;
    CAMBIAR_MEDICAMENTO: TFDQuery;
    UPDATE_RX_SCANED_RXLINK: TFDQuery;
    FDQuery1: TFDQuery;
    UPDATE_OTC_WFCASHIER: TFDQuery;
    UPDATE_OTC_HEALTHPLAN: TFDQuery;
    INSERT_LOG: TFDQuery;
    INSERT_PRESCRIPTIONS1: TFDQuery;
    CANCEL_NEW_RX: TFDQuery;
    UPDATE_OTC_BATCH: TFDQuery;
    QPrescriptions: TFDQuery;
    dspPrescriptioons: TDataSetProvider;
    dsPrescriptions: TDataSource;
    cdsPrescriptions: TClientDataSet;
    QUpdateOTC: TFDQuery;
    cdsPrescriptionsFECHAEXPIRACION: TSQLTimeStampField;
    cdsPrescriptionsNUMEROREFILLSDISPENSADOS: TSmallintField;
    cdsPrescriptionsASEGURADOPRINCIPAL: TStringField;
    cdsPrescriptionsDIASSUPLIDOS: TSmallintField;
    cdsPrescriptionsNUMERODOCTOR: TIntegerField;
    cdsPrescriptionsNUMEROAUTORIZACION: TStringField;
    cdsPrescriptionsDAW: TStringField;
    cdsPrescriptionsMEZCLA: TStringField;
    cdsPrescriptionsNUMEROCLIENTE: TIntegerField;
    cdsPrescriptionsNUMEROREFILLSAUTORIZADOS: TSmallintField;
    cdsPrescriptionsCODIGOMEZCLA: TStringField;
    cdsPrescriptionsCANTIDAD: TIntegerField;
    cdsPrescriptionsCODIGOREFILLNUEVO: TSmallintField;
    cdsPrescriptionsHORA: TStringField;
    cdsPrescriptionsBASISOFCOST: TStringField;
    cdsPrescriptionsCARDHOLDER_ID: TStringField;
    cdsPrescriptionsCLINICIDNUMBER: TIntegerField;
    cdsPrescriptionsDIAGNOSISCODE: TStringField;
    cdsPrescriptionsDURCONFLICTCODE: TStringField;
    cdsPrescriptionsDURINTERVENTIONCODE: TStringField;
    cdsPrescriptionsDUROUTCOMECODE: TStringField;
    cdsPrescriptionsLEVELOFSERVICE: TIntegerField;
    cdsPrescriptionsMEDICAMENTO: TStringField;
    cdsPrescriptionsMETRICDECIMALQUANTITY: TIntegerField;
    cdsPrescriptionsNUMEROPLAN: TIntegerField;
    cdsPrescriptionsPAGADA: TStringField;
    cdsPrescriptionsPLANMEDICO: TStringField;
    cdsPrescriptionsPRIMARYPRESCRIBER: TStringField;
    cdsPrescriptionsPRIORAUTHORIZATION: TStringField;
    cdsPrescriptionsRELACION: TSmallintField;
    cdsPrescriptionsRXDENIALCLARIF: TStringField;
    cdsPrescriptionsRXORIGINCODE: TStringField;
    cdsPrescriptionsMEDICAMENTOORIGINAL: TStringField;
    cdsPrescriptionsCOMPOUNDCODE: TIntegerField;
    cdsPrescriptionsFECHAULTIMOREFILL: TSQLTimeStampField;
    cdsPrescriptionsDIAHORA: TSQLTimeStampField;
    cdsPrescriptionsCONTROLADO: TStringField;
    cdsPrescriptionsLOTE: TStringField;
    cdsPrescriptionsNOREFDISP: TIntegerField;
    cdsPrescriptionsPAGO: TStringField;
    cdsPrescriptionsNDCDESPACHADO: TStringField;
    cdsPrescriptionsRXDENIALOVERRIDE: TIntegerField;
    cdsPrescriptionsFECHAVENTA: TSQLTimeStampField;
    cdsPrescriptionsCASHPLAN: TStringField;
    cdsPrescriptionsFECHARECETA: TSQLTimeStampField;
    cdsPrescriptionsATENDIDAPOR: TStringField;
    cdsPrescriptionsNO_HORA: TIntegerField;
    cdsPrescriptionsDEDUCIBLE: TSingleField;
    cdsPrescriptionsPAGOPLAN: TSingleField;
    cdsPrescriptionsPRECIOVENTA: TSingleField;
    cdsPrescriptionsPRECIOFACTURACION: TSingleField;
    cdsPrescriptionsCOSTOVENTA: TSingleField;
    cdsPrescriptionsDISPENSINGFEE: TSingleField;
    cdsPrescriptionsGROSSAMOUNTDUE: TSingleField;
    cdsPrescriptionsPATIENTPAIDAMOUNT: TSingleField;
    cdsPrescriptionsPERSONCODE: TStringField;
    cdsPrescriptionsSALESTAX: TSingleField;
    cdsPrescriptionsGANANCIA: TSingleField;
    cdsPrescriptionsLICENCIA: TStringField;
    cdsPrescriptionsNDC: TStringField;
    cdsPrescriptionsPRIOR_AUTH_TYPE_CODE: TStringField;
    cdsPrescriptionsOTAMCLDSUBCOUNTQUAL: TStringField;
    cdsPrescriptionsPATIENTPHONENUMBER: TStringField;
    cdsPrescriptionsPATIENTLOCATION: TIntegerField;
    cdsPrescriptionsPRESC_SRN: TStringField;
    cdsPrescriptionsPRODUCTSERVIDQUAL: TStringField;
    cdsPrescriptionsPROVIDERID: TStringField;
    cdsPrescriptionsUNIT_DOSE_INDICATOR: TStringField;
    cdsPrescriptionsUNIT_OF_MEASURE: TStringField;
    cdsPrescriptionsSUB_CLARIF_CODE: TStringField;
    cdsPrescriptionsOTHERCOVERAGECODE: TStringField;
    cdsPrescriptionsTRANSACTION_CODE: TStringField;
    cdsPrescriptionsSERVICEPROVIDQUALIFIER: TStringField;
    cdsPrescriptionsOP_AMOUNTPAIDCOUNT: TIntegerField;
    cdsPrescriptionsOP_REJECTCOUNT: TIntegerField;
    cdsPrescriptionsCOB_OTHERPAYMENTCOUNT: TIntegerField;
    cdsPrescriptionsCOMPDOSAGE_FORM_DESC_CODE: TStringField;
    cdsPrescriptionsCOMPDISP_UNIT_FORM_INDI: TStringField;
    cdsPrescriptionsCOMPROUTE_OF_ADMINISTRATION: TStringField;
    cdsPrescriptionsCOMPING_COMP_COUNT: TIntegerField;
    cdsPrescriptionsDISPENSING_STATUS: TStringField;
    cdsPrescriptionsQTY_INTENDED_DISP: TIntegerField;
    cdsPrescriptionsDAYS_SUPPLY_INTEND_DISP: TIntegerField;
    cdsPrescriptionsFLAT_SALES_TAXSUB: TSingleField;
    cdsPrescriptionsASSOC_RX_SERVICE_DATE: TSQLTimeStampField;
    cdsPrescriptionsASSOC_RX_SERVICE_REF_NO: TStringField;
    cdsPrescriptionsCUPONTYPE: TStringField;
    cdsPrescriptionsCUPON_NUMBER: TStringField;
    cdsPrescriptionsCUPON_VALUE_AMT: TSingleField;
    cdsPrescriptionsPRIMARYCAREPROVIDQUALIFIER: TStringField;
    cdsPrescriptionsPRIMARYCAREPROVID: TStringField;
    cdsPrescriptionsPRIMARYCAREPROVLOCATIONCODE: TStringField;
    cdsPrescriptionsPRIMARYCAREPROVLASTNAME: TStringField;
    cdsPrescriptionsOTHERAMOUNTCLAIMEDSUB: TSingleField;
    cdsPrescriptionsOTHERAMOUNTCLAIMEDSUBCOUNT: TStringField;
    cdsPrescriptionsWC_DATE_OF_INJURY: TSQLTimeStampField;
    cdsPrescriptionsWC_EMPLOYER_NAME: TStringField;
    cdsPrescriptionsWC_EMPLOYER_STREET: TStringField;
    cdsPrescriptionsWC_EMPLOYER_CITY: TStringField;
    cdsPrescriptionsWC_EMPLOYER_STATE: TStringField;
    cdsPrescriptionsWC_EMLPOYER_ZIP: TStringField;
    cdsPrescriptionsWC_EMPLOYER_CONTACT: TStringField;
    cdsPrescriptionsWC_CARRIER_ID: TStringField;
    cdsPrescriptionsWC_CLAIMREF_ID: TStringField;
    cdsPrescriptionsWC_EMPLOYER_PHONE: TStringField;
    cdsPrescriptionsEXPORT_TORXTEMP1: TStringField;
    cdsPrescriptionsPERCENTAGE_SALES_TAX_RATE: TSingleField;
    cdsPrescriptionsPERCENTAGE_SALES_TAX_SUB: TSingleField;
    cdsPrescriptionsDIAGNOSIS_CODE_COUNT: TIntegerField;
    cdsPrescriptionsORG_PRES_PROD_SIDQ: TStringField;
    cdsPrescriptionsORG_PROS_PROD_SERVID: TStringField;
    cdsPrescriptionsORG_PRESC_QTY: TIntegerField;
    cdsPrescriptionsPROF_SERV_FEE_SUB: TSingleField;
    cdsPrescriptionsINCENTIVE_AMOUNT_SUB: TSingleField;
    cdsPrescriptionsSERVICEPROVID: TStringField;
    cdsPrescriptionsINGREDIENT_COST_PAID: TSingleField;
    cdsPrescriptionsINCENTIVE_FEE_PAID: TSingleField;
    cdsPrescriptionsDISPENSING_FEE_PAID: TSingleField;
    cdsPrescriptionsOTHER_AMOUNT_PAID: TSingleField;
    cdsPrescriptionsAMOUNT_COPAY_COINS: TSingleField;
    cdsPrescriptionsPRODUCT_ID: TIntegerField;
    cdsPrescriptionsCOBRADO_POS: TStringField;
    cdsPrescriptionsPHARMACIST: TStringField;
    cdsPrescriptionsREFILL_AUTOMATICO: TStringField;
    cdsPrescriptionsPRESCRIBERIDQUALIFIER: TStringField;
    cdsPrescriptionsSCANED_RX_LINK: TIntegerField;
    cdsPrescriptionsULTIMO_REFILL: TSQLTimeStampField;
    cdsPrescriptionsINFORMACION_EXT: TMemoField;
    cdsPrescriptionsEP_TRANSACTION_NUMBER: TIntegerField;
    cdsPrescriptionsPMC_459_ER: TWideStringField;
    cdsPrescriptionsPMCC_458_SE: TIntegerField;
    cdsPrescriptionsSPIDN_454_EK: TWideStringField;
    cdsPrescriptionsIATID_463_EW: TWideStringField;
    cdsPrescriptionsIAID_464_EX: TWideStringField;
    cdsPrescriptionsDRC_357_NV: TWideStringField;
    cdsPrescriptionsPAI_391_MT: TWideStringField;
    cdsPrescriptionsCOMPOUND_TYPE_996_G1: TWideStringField;
    cdsPrescriptionsPST_147_U7: TWideStringField;
    cdsPrescriptionsSCCD_354_NX: TSmallintField;
    cdsPrescriptionsPS_558_AW: TFloatField;
    cdsPrescriptionsPS_559_AX: TFloatField;
    cdsPrescriptionsPRAC_353_NR: TSmallintField;
    cdsPrescriptionsBSC_392_MU: TSmallintField;
    cdsPrescriptionsSUB_CLAR_CODE: TWideStringField;
    cdsPrescriptionsMEDICAID_PAID_AMOUNT: TFloatField;
    cdsPrescriptionsSUB_CLAR_CODE_COUNT: TWideStringField;
    cdsPrescriptionsUSUARIO_NO: TSmallintField;
    cdsPrescriptionsSPECIAL_PACK_INDI_429_DT: TSmallintField;
    cdsPrescriptionsROUTEOFADMIN_995_E2: TWideStringField;
    cdsPrescriptionsWC_117_TR: TSmallintField;
    cdsPrescriptionsWC_118_TS: TWideStringField;
    cdsPrescriptionsWC_119_TT: TWideStringField;
    cdsPrescriptionsWC_120_TU: TWideStringField;
    cdsPrescriptionsWC_121_TV: TWideStringField;
    cdsPrescriptionsWC_122_TW: TWideStringField;
    cdsPrescriptionsWC_123_TX: TWideStringField;
    cdsPrescriptionsWC_124_TY: TWideStringField;
    cdsPrescriptionsWC_125_TZ: TWideStringField;
    cdsPrescriptionsWC_126_UA: TWideStringField;
    cdsPrescriptionsPS_521_FL: TFloatField;
    cdsPrescriptionsPS_523_FN: TFloatField;
    cdsPrescriptionsPS_512_FC: TFloatField;
    cdsPrescriptionsPS_513_FD: TFloatField;
    cdsPrescriptionsPS_517_FH: TFloatField;
    cdsPrescriptionsPS_518_FI: TFloatField;
    cdsPrescriptionsPS_520_FK: TFloatField;
    cdsPrescriptionsPS_514_FE: TFloatField;
    cdsPrescriptionsPS_346_HH: TFloatField;
    cdsPrescriptionsPS_347_HJ: TFloatField;
    cdsPrescriptionsPS_348_HK: TFloatField;
    cdsPrescriptionsPS_571_NZ: TFloatField;
    cdsPrescriptionsPS_575_EQ: TFloatField;
    cdsPrescriptionsPS_574_2Y: TFloatField;
    cdsPrescriptionsPS_572_4U: TFloatField;
    cdsPrescriptionsPS_577_G3: TFloatField;
    cdsPrescriptionsPS_133_UJ: TFloatField;
    cdsPrescriptionsPS_134_UK: TFloatField;
    cdsPrescriptionsPS_135_UM: TFloatField;
    cdsPrescriptionsPS_136_UN: TFloatField;
    cdsPrescriptionsPS_137_UP: TFloatField;
    cdsPrescriptionsPER_SALESTAX_BASIS_SUB: TStringField;
    cdsPrescriptionsSTATUS_RX: TIntegerField;
    cdsPrescriptionsNUMERORECETA: TLargeintField;
    cdsPrescriptionsMETRICQUANTITY: TFloatField;
    cdsPrescriptionsePRESCRIBE_IDMess: TLargeintField;
    cdsPrescriptionsLABELCODESNO: TIntegerField;
    cdsPrescriptionsSPI: TWideStringField;
    cdsPrescriptionsMessageID: TWideStringField;
    cdsPrescriptionsANNOTATIONS: TMemoField;
    cdsPrescriptionsCANTIDADRECETADA: TFloatField;
    cdsPrescriptionsCANTIDADDESPACHADA: TFloatField;
    cdsPrescriptionsETIQUETA: TWideStringField;
    cdsPrescriptionsACTIVE: TBooleanField;
    cdsPrescriptionsREVENUE_CODE: TWideStringField;
    cdsPrescriptionsHCPCS: TWideStringField;
    cdsPrescriptionsSIG: TWideStringField;
    cdsPrescriptionsADHERENCE: TBooleanField;
    cdsPrescriptionsCANTIDAD_DISPONIBLE: TBCDField;
    cdsPrescriptionsNOGRUPO: TWideStringField;
    UPDATE_PRESCRIPTION_ALL: TFDQuery;
    EDIT_INVENTORY: TFDQuery;
    INVENTORY_CONTROL: TFDQuery;
    UPDATE_OTC_QTY: TFDQuery;
    PATIENT_SEARCH: TFDQuery;
    QCreateBackupDB: TFDQuery;
    FDConnectionBackup: TFDConnection;
    UPDATE_CLAIM_SEGMENT: TFDQuery;
    UPDATE_PRICING_SEGMENT: TFDQuery;
    INDEX_OTC_GUID: TFDQuery;
    NC_NOCLIENTE_NORX: TFDQuery;
    INSERT_OVER_TC: TFDQuery;
    CLONE_PRODUCT: TFDQuery;
    INSERT_MEZLCA: TFDQuery;
    RXDATA: TFDQuery;
    INSERT_RXDATA: TFDQuery;
    RX: TFDQuery;
    INSERT_CASH_PLAN: TFDQuery;
    CLEAN_OTC: TFDQuery;
    LOGEADOPOS: TFDQuery;
    PURCHASE_SALES: TFDQuery;
    qInventarioPiso: TFDQuery;
    dspInventarioPiso: TDataSetProvider;
    cdsInventarioPiso: TClientDataSet;
    dsInventarioPiso: TDataSource;
    dsOTC: TDataSource;
    DELETE_SIGNATURE: TFDQuery;
    PRESCRIPTIONS_HISTORY: TFDQuery;
    OTC_HISTORY: TFDQuery;
    RECALL_RX: TFDQuery;
    cdsOTC: TClientDataSet;
    qOTC2: TFDQuery;
    dspOTC: TDataSetProvider;
    DropPrimaryKeyPrescriptioon: TFDQuery;
    CHANGE_PATIENT: TFDQuery;
    CHANGE_PRESCRIBER: TFDQuery;
    UPDATE_PATPLAN_PLANNUMBER: TFDQuery;
    cdsOTCOTCNUMBER: TAutoIncField;
    cdsOTCTOTAL: TSingleField;
    cdsOTCCOBRADO: TStringField;
    cdsOTCFECHAOTC: TSQLTimeStampField;
    cdsOTCRX: TStringField;
    cdsOTCCOSTOVENTA: TSingleField;
    cdsOTCNUMEROCLIENTE: TIntegerField;
    cdsOTCMEDICAMENTOMIX: TStringField;
    cdsOTCNUMEROTRANSACCION: TIntegerField;
    cdsOTCPAGO_PLAN: TFloatField;
    cdsOTCDEDUCIBLE: TFloatField;
    cdsOTCPARTIAL_COMPLETION: TStringField;
    cdsOTCRX_STATUS: TStringField;
    cdsOTCNO_REF_DISPENSADO: TIntegerField;
    cdsOTCINGREDIENT_COST_PAID: TFloatField;
    cdsOTCINCENTIVE_FEE_PAID: TFloatField;
    cdsOTCDISPENSING_FEE_PAID: TFloatField;
    cdsOTCOTHER_AMOUNT_PAID: TFloatField;
    cdsOTCAMOUNT_COPAY_COINS: TFloatField;
    cdsOTCGANANCIA: TFloatField;
    cdsOTCPHARMACIST: TStringField;
    cdsOTCDAYS_SUPPLY: TIntegerField;
    cdsOTCPAGADA: TStringField;
    cdsOTCPRECIOFACTURACION: TFloatField;
    cdsOTCPRODUCT_ID: TIntegerField;
    cdsOTCTIME_RX: TSQLTimeStampField;
    cdsOTCNO_HORA: TIntegerField;
    cdsOTCNUMEROPLAN: TIntegerField;
    cdsOTCOTC_BARCODE: TStringField;
    cdsOTCPLAN_MEDICO: TStringField;
    cdsOTCNUMERO_AUTORIZACION: TStringField;
    cdsOTCMEDICAMENTO: TStringField;
    cdsOTCNDC: TStringField;
    cdsOTCATENDIDOPOR: TStringField;
    cdsOTCLOTE: TStringField;
    cdsOTCMETRICDECIMALQUANTITY: TIntegerField;
    cdsOTCSIGNATURE_LINK: TIntegerField;
    cdsOTCPICKEDUPBY_RELETION: TSmallintField;
    cdsOTCPICKEDUP_ID: TStringField;
    cdsOTCCHECKED: TIntegerField;
    cdsOTCPICKEDUPBY_RELATION: TIntegerField;
    cdsOTCTXR: TStringField;
    cdsOTCPS_521_FL: TFloatField;
    cdsOTCPS_523_FN: TFloatField;
    cdsOTCPS_512_FC: TFloatField;
    cdsOTCPS_513_FD: TFloatField;
    cdsOTCPS_517_FH: TFloatField;
    cdsOTCPS_518_FI: TFloatField;
    cdsOTCPS_520_FK: TFloatField;
    cdsOTCPS_514_FE: TFloatField;
    cdsOTCPS_346_HH: TFloatField;
    cdsOTCPS_347_HJ: TFloatField;
    cdsOTCPS_348_HK: TFloatField;
    cdsOTCPS_571_NZ: TFloatField;
    cdsOTCPS_575_EQ: TFloatField;
    cdsOTCPS_574_2Y: TFloatField;
    cdsOTCPS_572_4U: TFloatField;
    cdsOTCPS_577_G3: TFloatField;
    cdsOTCPS_133_UJ: TFloatField;
    cdsOTCPS_134_UK: TFloatField;
    cdsOTCPS_135_UM: TFloatField;
    cdsOTCPS_136_UN: TFloatField;
    cdsOTCPS_137_UP: TFloatField;
    cdsOTCUSUARIO_NO: TIntegerField;
    cdsOTCMEZCLA_TRAN_NO: TIntegerField;
    cdsOTCNUMERORECETA: TLargeintField;
    cdsOTCREFILL_REMINDED: TIntegerField;
    cdsOTCBATCH_NUMBER: TIntegerField;
    cdsOTCAUDITED: TIntegerField;
    cdsOTCPRICE_TABLE_ID: TIntegerField;
    cdsOTCWC_PICKUP: TBooleanField;
    cdsOTCEP_TRANSACTION_NUMBER: TIntegerField;
    cdsOTCREFILL_NOTIFIED: TBooleanField;
    cdsOTCUNIT_PRICE: TFloatField;
    cdsOTCWF_TYPED: TWideStringField;
    cdsOTCWF_BILLED: TWideStringField;
    cdsOTCWF_PRINTED: TWideStringField;
    cdsOTCWF_CHECKED: TWideStringField;
    cdsOTCWF_DELIVERED: TWideStringField;
    cdsOTCWF_FILLED: TWideStringField;
    cdsOTCMED_CHART: TBooleanField;
    cdsOTCWF_STORAGE: TWideStringField;
    cdsOTCPRINT_Q: TWideStringField;
    cdsOTCWFSTORAGE: TWideStringField;
    cdsOTCADHERENCE: TBooleanField;
    cdsOTCFACILITY_ID: TIntegerField;
    cdsOTCCLAIM_STATUS: TIntegerField;
    cdsOTCBILL_LATTER: TBooleanField;
    cdsOTCWF_CASHIER: TWideStringField;
    cdsOTCWF_SIGNATURE: TWideStringField;
    cdsOTCALCHEMY_PRODUCTID: TIntegerField;
    cdsOTCMARKETEDPRODUCTID: TIntegerField;
    cdsOTCWF_REVERSE: TBooleanField;
    cdsOTCPA: TBooleanField;
    cdsOTCPDN_SENT: TBooleanField;
    cdsOTCREFILL_REQ_TRANSNO: TIntegerField;
    cdsOTCBATCH_REFILLREQ_DATE: TDateField;
    cdsOTCPRIORAUTHORIZATION: TStringField;
    cdsOTCQTY: TBCDField;
    cdsOTCBASISOFCOST: TStringField;
    cdsOTCCLINICIDNUMBER: TIntegerField;
    cdsOTCDIAGNOSISCODE: TWideStringField;
    cdsOTCDURCONFLICTCODE: TWideStringField;
    cdsOTCDURINTERVENTIONCODE: TWideStringField;
    cdsOTCDUROUTCOMECODE: TWideStringField;
    cdsOTCLEVELOFSERVICE: TIntegerField;
    cdsOTCPRIMARYPRESCRIBER: TWideStringField;
    cdsOTCRXDENIALCLARIF: TWideStringField;
    cdsOTCRXDENIALOVERRIDE: TIntegerField;
    cdsOTCDISPENSINGFEE: TFloatField;
    cdsOTCGROSSAMOUNTDUE: TFloatField;
    cdsOTCPATIENTPAIDAMOUNT: TFloatField;
    cdsOTCSALESTAX: TFloatField;
    cdsOTCOTAMCLDSUBCOUNTQUAL: TWideStringField;
    cdsOTCOTCOTHERAMOUNTCLAIMEDSUB: TFloatField;
    cdsOTCCOTHERAMOUNTCLAIMEDSUB: TFloatField;
    cdsOTCPRODUCTSERVIDQUAL: TWideStringField;
    cdsOTCPROVIDERID: TWideStringField;
    cdsOTCUNIT_DOSE_INDICATOR: TWideStringField;
    cdsOTCUNIT_OF_MEASURE: TWideStringField;
    cdsOTCSUB_CLARIF_CODE: TWideStringField;
    cdsOTCOTHERCOVERAGECODE: TWideStringField;
    cdsOTCSERVICEPROVIDQUALIFIER: TWideStringField;
    cdsOTCOP_AMOUNTPAIDCOUNT: TIntegerField;
    cdsOTCOP_REJECTCOUNT: TIntegerField;
    cdsOTCCOB_OTHERPAYMENTCOUNT: TIntegerField;
    cdsOTCCOMPDOSAGE_FORM_DESC_CODE: TWideStringField;
    cdsOTCCOMPDISP_UNIT_FORM_INDI: TWideStringField;
    cdsOTCCOMPROUTE_OF_ADMINISTRATION: TWideStringField;
    cdsOTCCOMPING_COMP_COUNT: TIntegerField;
    cdsOTCDISPENSING_STATUS: TWideStringField;
    cdsOTCQTY_INTENDED_DISP: TIntegerField;
    cdsOTCDAYS_SUPPLY_INTEND_DISP: TIntegerField;
    cdsOTCFLAT_SALES_TAXSUB: TFloatField;
    cdsOTCASSOC_RX_SERVICE_DATE: TSQLTimeStampField;
    cdsOTCASSOC_RX_SERVICE_REF_NO: TWideStringField;
    cdsOTCCUPONTYPE: TWideStringField;
    cdsOTCCUPON_NUMBER: TWideStringField;
    cdsOTCCUPON_VALUE_AMT: TFloatField;
    cdsOTCPRIMARYCAREPROVIDQUALIFIER: TWideStringField;
    cdsOTCPRIMARYCAREPROVID: TWideStringField;
    cdsOTCPRIMARYCAREPROVLASTNAME: TWideStringField;
    cdsOTCIAID_464_EX: TWideStringField;
    cdsOTCDRC_357_NV: TWideStringField;
    cdsOTCPAI_391_MT: TWideStringField;
    cdsOTCCOMPOUND_TYPE_996_G1: TWideStringField;
    cdsOTCPST_147_U7: TWideStringField;
    cdsOTCSCCD_354_NX: TSmallintField;
    cdsOTCPRAC_353_NR: TSmallintField;
    cdsOTCBSC_392_MU: TSmallintField;
    cdsOTCSPECIAL_PACK_INDI_429_DT: TWideStringField;
    cdsOTCROUTEOFADMIN_995_E2: TWideStringField;
    cdsOTCWC_117_TR: TSmallintField;
    cdsOTCWC_118_TS: TWideStringField;
    cdsOTCWC_119_TT: TWideStringField;
    cdsOTCWC_120_TU: TWideStringField;
    cdsOTCWC_121_TV: TWideStringField;
    cdsOTCWC_122_TW: TWideStringField;
    cdsOTCWC_123_TX: TWideStringField;
    cdsOTCWC_124_TY: TWideStringField;
    cdsOTCWC_125_TZ: TWideStringField;
    cdsOTCWC_126_UA: TWideStringField;
    cdsOTCPRIMARYCAREPROVLOCATIONCODE: TWideStringField;
    cdsOTCPATIENTLOCATION: TIntegerField;
    cdsOTCPRESC_SRNM: TWideStringField;
    cdsOTCPS_558_AW: TFloatField;
    cdsOTCPS_559_AX: TFloatField;
    cdsOTCREVENUE_CODE: TWideStringField;
    cdsOTCDAW: TSmallintField;
    cdsOTCBATCH_NUMBER_BILLING: TLargeintField;
    cdsOTCTERMINADA: TBooleanField;
    cdsOTCMEDICAID_PAID_AMOUNT: TFloatField;
    cdsOTCPMC_459_ER: TWideStringField;
    cdsOTCPMCC_458_SE: TIntegerField;
    cdsOTCSPIDN_454_EK: TWideStringField;
    cdsOTCIATID_463_EW: TWideStringField;
    cdsOTCCONTROLADO: TWideStringField;
    cdsOTCDAYS_SUPLY: TIntegerField;
    cdsOTCCODIGOREFILLNUEVO: TSmallintField;
    cdsOTCRXNUMBERSRNQ: TWideStringField;
    cdsOTCTRANSACTION_CODE: TWideStringField;
    cdsOTCMEDICAMENTOORIGINAL: TWideStringField;
    cdsOTCROBOT: TIntegerField;
    cdsOTCLABEL_NAME: TWideStringField;
    cdsOTCFECHAEXPIRACION: TDateField;
    cdsOTCIMPRIMIR: TBooleanField;
    cdsOTCINSTANCIA: TIntegerField;
    cdsOTCORG_PROS_PROD_SERVID: TStringField;
    cdsOTCORG_PRESC_QTY: TIntegerField;
    cdsOTCORG_PRES_PROD_SIDQ: TStringField;
    cdsOTCPRIOR_AUTH_TYPE_CODE: TStringField;
    cdsOTCINCENTIVE_AMOUNT_SUB: TFloatField;
    cdsOTCPROF_SERV_FEE_SUB: TFloatField;
    cdsOTCPERCENTAGE_SALES_TAX_SUB: TFloatField;
    cdsOTCPERCENTAGE_SALES_TAX_RATE: TFloatField;
    cdsOTCOTHERAMOUNTCLAIMEDSUB: TFloatField;
    cdsOTCQTY_TEMP: TBCDField;
    cdsOTCOTHERAMOUNTCLAIMEDSUBCOUNT: TIntegerField;
    cdsOTCPER_SALESTAX_BASIS_SUB: TStringField;
    cdsOTCWC_DATE_OF_INJURY: TSQLTimeStampField;
    cdsOTCWC_EMPLOYER_NAME: TStringField;
    cdsOTCWC_EMPLOYER_STREET: TStringField;
    cdsOTCWC_EMPLOYER_CITY: TStringField;
    cdsOTCWC_EMPLOYER_STATE: TStringField;
    cdsOTCWC_EMPLOYER_CONTACT: TStringField;
    cdsOTCWC_EMLPOYER_ZIP: TStringField;
    cdsOTCWC_CARRIER_ID: TStringField;
    cdsOTCWC_CLAIMREF_ID: TStringField;
    cdsOTCWC_EMPLOYER_PHONE: TStringField;
    cdsOTCPLANESMEDICOSNO: TIntegerField;
    cdsInventarioPisoTIPO: TStringField;
    cdsInventarioPisoFECHA_EXPIRACION: TSQLTimeStampField;
    cdsInventarioPisoCODIGO: TStringField;
    cdsInventarioPisoCOSTO: TSingleField;
    cdsInventarioPisoRBP: TSingleField;
    cdsInventarioPisoESPECIAL: TSingleField;
    cdsInventarioPisoDEPARTAMENTO: TSmallintField;
    cdsInventarioPisoLOTE: TStringField;
    cdsInventarioPisoPRECIO: TSingleField;
    cdsInventarioPisoCOMESPECIAL: TSQLTimeStampField;
    cdsInventarioPisoTERMINAESPECIAL: TSQLTimeStampField;
    cdsInventarioPisoPORCIENTODESCUENTO: TStringField;
    cdsInventarioPisoULTIMOCAMBIO: TStringField;
    cdsInventarioPisoULTIMAVENTA: TSQLTimeStampField;
    cdsInventarioPisoCMAXINVENTARIO: TSingleField;
    cdsInventarioPisoCMININVENTARIO: TSingleField;
    cdsInventarioPisoCODIGOBARRA: TStringField;
    cdsInventarioPisoFOODITEM: TSmallintField;
    cdsInventarioPisoNONEBC: TSmallintField;
    cdsInventarioPisoNUMEROSUPLIDOR: TIntegerField;
    cdsInventarioPisoEDITAR_PRECIO: TBooleanField;
    cdsInventarioPisoPRODUCTNO: TAutoIncField;
    cdsInventarioPisoSUB_DEPARTAMENTO: TSmallintField;
    cdsInventarioPisoDESCRIPCION: TStringField;
    cdsInventarioPisoROUTEOFADMINISTRATION: TStringField;
    cdsInventarioPisoCONTROLADO: TStringField;
    cdsInventarioPisoSTRENGTH: TStringField;
    cdsInventarioPisoINFOADICIONAL: TStringField;
    cdsInventarioPisoMETRICSIZE: TSingleField;
    cdsInventarioPisoCAUTION1: TSmallintField;
    cdsInventarioPisoCAUTION2: TSmallintField;
    cdsInventarioPisoCAUTION3: TSmallintField;
    cdsInventarioPisoGENERICNAME: TStringField;
    cdsInventarioPisoTXR: TStringField;
    cdsInventarioPisoBRAND: TStringField;
    cdsInventarioPisoGROUP_PRODUCTNO: TIntegerField;
    cdsInventarioPisoRECETARIO: TStringField;
    cdsInventarioPisoGROUP_QTY: TIntegerField;
    cdsInventarioPisoPRECIO_CAJA: TSingleField;
    cdsInventarioPisoQTY_CAJA: TSingleField;
    cdsInventarioPisoDESCUENTO: TStringField;
    cdsInventarioPisoIMAGE_CODE: TStringField;
    cdsInventarioPisoPACKAGESIZE: TIntegerField;
    cdsInventarioPisoTXR_EXTENSION: TStringField;
    cdsInventarioPisoSTATUS: TStringField;
    cdsInventarioPisoTAXABLE: TStringField;
    cdsInventarioPisoPO: TStringField;
    cdsInventarioPisoTAXABLE_ESTATAL: TStringField;
    cdsInventarioPisoISBN: TStringField;
    cdsInventarioPisoSHOWINDIVIDUAL: TStringField;
    cdsInventarioPisoPRECIO_DACO: TFloatField;
    cdsInventarioPisoPRECIO2: TCurrencyField;
    cdsInventarioPisoNDC: TWideStringField;
    cdsInventarioPisoPATROCINIO: TIntegerField;
    cdsInventarioPisoMETRIC_UNIT: TWideStringField;
    cdsInventarioPisoROBOT: TIntegerField;
    cdsInventarioPisoROBOT_NDC: TWideStringField;
    cdsInventarioPisoALCHEMY_PRODUCTID: TIntegerField;
    cdsInventarioPisoMARKET_STATUS: TWideStringField;
    cdsInventarioPisoOUTERPACKAGEUNIT: TWideStringField;
    cdsInventarioPisoPAKAGE_ID: TIntegerField;
    cdsInventarioPisoCOBRAR_TAX: TIntegerField;
    cdsInventarioPisoREVENUE_CODE: TWideStringField;
    cdsInventarioPisoHCPCS: TWideStringField;
    cdsInventarioPisoPRECIOVENTA2: TFloatField;
    cdsInventarioPisoPRICE_TABLE_ID: TIntegerField;
    cdsInventarioPisoCASA_FARMACEUTICA: TStringField;
    cdsInventarioPisoVERSION_DESCRIPTION: TWideStringField;
    cdsInventarioPisoPAKAGE_DESCRIPTION: TWideStringField;
    cdsInventarioPisoAllowControledRefills: TBooleanField;
    cdsInventarioPisoESCANEAR_BARCODEALTERNO: TSmallintField;
    cdsInventarioPisoOVERRIDE_SYSTEM_DEFAULT_PRICE: TBooleanField;
    cdsInventarioPisoWAC_PRICE: TFloatField;
    cdsInventarioPisoMAC_PRICE: TFloatField;
    cdsInventarioPisoDIRECT_PRICE: TFloatField;
    cdsInventarioPisoUC_PRICE: TFloatField;
    cdsInventarioPisoPRICE_UPDATE: TBooleanField;
    cdsInventarioPisoENTER_LAB_RESULTS: TBooleanField;
    cdsInventarioPisoEXPIRE_OPTION: TWideStringField;
    cdsInventarioPisoEXPIRE_DAYS: TIntegerField;
    cdsInventarioPisoEXPIRE_OTHER: TWideStringField;
    cdsInventarioPisoMARKETEDPRODUCTID: TIntegerField;
    cdsInventarioPisoMAIN_NDC: TBooleanField;
    cdsInventarioPisoPSEUDOEPHEDRINE: TBooleanField;
    cdsInventarioPisoINITIAL_QTY: TBCDField;
    cdsInventarioPisoQTYINVENTARIO: TBCDField;
    cdsInventarioPisoSALES_PROMOTION_ID: TIntegerField;
    CREATE_FIX_CONTROLADO: TFDQuery;
    FIX_CONTROLADO: TFDStoredProc;
    CANCEL_NEW_RX_NORX: TFDQuery;
    UPDATE_PATIENT_NOTIFICATIONS: TFDQuery;
    RECALL_RX_FROM_BACKUP: TFDQuery;
    qClaims: TFDQuery;
    dspClaims: TDataSetProvider;
    cdsClaims: TClientDataSet;
    dsClaims: TDataSource;
    cdsClaimsSERVICEDATE: TSQLTimeStampField;
    cdsClaimsCLAIM: TWideStringField;
    cdsClaimsCLAIM_NO: TAutoIncField;
    cdsClaimsRX_NUMBER: TLargeintField;
    cdsClaimsTYPIST: TWideStringField;
    cdsClaimsOTCNUMBER: TIntegerField;
    DOCTOR_CREATE_UPDATE: TFDQuery;
    INSERT_APPRISS: TFDQuery;
    RX_VIEW_NOT_COMPOUNDS: TFDQuery;
    APPRISS_VIEW: TFDQuery;
    APPRISS_VIEW_COMPOUNDS: TFDQuery;
    AddOTCFields: TFDQuery;
    INSERT_CASH_PLAN_EMPTY: TFDQuery;
    INSERT_DISPPILL: TFDQuery;
    NEXT_APPRISS_TN: TFDQuery;
    PICKUP_TF: TFDQuery;
    CLOSE_BALANCE: TFDQuery;
    INSERT_PASSWORD_LOG: TFDQuery;
    UPDATE_TH_BALANCE: TFDQuery;
    UPDATE_TH_BALANCE_DEL: TFDQuery;
    OPEN_TABS: TFDQuery;
    CALC_TAB_BALANCE: TFDQuery;
    PRICE_UPDATE: TFDQuery;
    PATIENT_HIPPA_ORIENTED: TFDQuery;
    FarmatecImages: TFDQuery;
    INSERT_SCANNED_RX: TFDQuery;
    IMAGES: TFDQuery;
    FDConnectionFarmatecImages: TFDConnection;
    ADD_EDIT_PRESCRIBER: TFDQuery;
    FDQueryImages: TFDQuery;
    ADD_EDIT_PACIENTES: TFDQuery;
    ADD_EDIT_PATINSURANCE: TFDQuery;
    BACKUPDATABASE_IMAGES: TFDQuery;
    FDQueryBackup: TFDQuery;
    POS_HOLD_TRANS: TFDQuery;
    POS_ROUND_TOTAL: TFDQuery;
    Directory61: TFDQuery;
    DOCTOR_CREATE_UPDATE61: TFDQuery;
    Prescribers_Specialty: TFDQuery;
    INSERT_DIRECTORY: TFDQuery;
    UPDATE_WORKERS_COMP_SEGMENT: TFDQuery;
    WORKERS_COMPENSATION_SEGMENT: TFDQuery;
    Surescripts: TFDQuery;
    SURESCRIPT_INSERT: TFDQuery;
    SURESCRIPTS_UPDATE_SURESCRIPTS: TFDQuery;
    Reindex: TFDQuery;
    UpdateFromResponse: TFDQuery;
    SURESCRIPTS_RX_RENEW: TFDQuery;
    FDQuery3: TFDQuery;
    SURESCRIPTS_INSERT_IP_CLIENTLIST: TFDQuery;
    SURESCRIPTS_NEXT_MessageID: TFDQuery;
    NEXT_ID: TFDQuery;
    SURESCRIPTS_UPDATE_RXSTATUS: TFDQuery;
    RX_TERMINAR_RECETA: TFDQuery;
    RX_UPDATE_REFILL_QUERY: TFDQuery;
    SURESCRIPTS_TRANS_TYPE: TFDQuery;
    SURESCRIPTS_UPDATE_RESPONSE: TFDQuery;
    SurescriptsRX_LABEL_INSERT_EDIT: TFDQuery;
    EXPORT_TO_RXTEMP1: TFDQuery;
    RX_COMPOUND_VALUES: TFDQuery;
    RX_CALCULATE_PRICE: TFDQuery;
    GET_PRICE_TABLE_VALUE: TFDQuery;
    WF_UPDATE: TFDQuery;
    SURESCRIPTS_IP_CLIENTLIST: TFDQuery;
    NCI: TFDQuery;
    SurescriptsRX_LABEL: TFDQuery;
    EDIT_DAILYTOTALS: TFDQuery;
    ADD_EDIT_USERS_POS: TFDQuery;
    RX_RECALL_EPRESCRIBE_FROMHISTORY: TFDQuery;
    INSERT_SCANNED_DOC: TFDQuery;
    OTC_INVENTORY_CONTROL: TFDQuery;
    ICD10_DELETE: TFDQuery;
    ICD10_CREATE: TFDQuery;
    INSERT_OTC_MEZCAS: TFDQuery;
    FDQuery4: TFDQuery;
    INSERT_NCI: TFDQuery;
    TRANSFER_PROD: TFDQuery;
    LOCK_UNLOCK: TFDQuery;
    LOCK_UNLOCK_DEL: TFDQuery;
    INSERT_PRINT_QUERIES: TFDQuery;
    qObjects: TFDQuery;
    dspObjects: TDataSetProvider;
    dsObjects: TDataSource;
    cdsObjects: TClientDataSet;
    cdsObjectsNAME: TWideStringField;
    qProcedures: TFDQuery;
    dspProcedures: TDataSetProvider;
    cdsProcedures: TClientDataSet;
    cdsProceduresname: TWideStringField;
    cdsProceduresobject_id: TIntegerField;
    cdsProceduresprincipal_id: TIntegerField;
    cdsProceduresschema_id: TIntegerField;
    cdsProceduresparent_object_id: TIntegerField;
    cdsProcedurestype: TStringField;
    cdsProcedurestype_desc: TWideStringField;
    cdsProcedurescreate_date: TSQLTimeStampField;
    cdsProceduresmodify_date: TSQLTimeStampField;
    cdsProceduresis_ms_shipped: TBooleanField;
    cdsProceduresis_published: TBooleanField;
    cdsProceduresis_schema_published: TBooleanField;
    cdsProceduresis_auto_executed: TBooleanField;
    cdsProceduresis_execution_replicated: TBooleanField;
    cdsProceduresis_repl_serializable_only: TBooleanField;
    cdsProceduresskips_repl_constraints: TBooleanField;
    dsProcedures: TDataSource;
    qTriggers: TFDQuery;
    dspTriggers: TDataSetProvider;
    cdsTriggers: TClientDataSet;
    dsTriggers: TDataSource;
    cdsTriggersname: TWideStringField;
    cdsTriggersis_instead_of_trigger: TBooleanField;
    qViews: TFDQuery;
    dspViews: TDataSetProvider;
    dsViews: TDataSource;
    cdsViews: TClientDataSet;
    cdsViewsNAME: TWideStringField;
    qFunctions: TFDQuery;
    dspFunctions: TDataSetProvider;
    cdsFunctions: TClientDataSet;
    dsFunctions: TDataSource;
    cdsFunctionsname: TWideStringField;
    cdsFunctionsdefinition: TWideMemoField;
    cdsFunctionstype_desc: TWideStringField;
    LOINC: TFDQuery;
    qConstrain: TFDQuery;
    dspConstrain: TDataSetProvider;
    dsConstrain: TDataSource;
    cdsConstrains: TClientDataSet;
    cdsConstrainsTableName: TWideStringField;
    cdsConstrainsColumnName: TWideStringField;
    cdsConstrainsName: TWideStringField;
    cdsConstrainsdefinition: TWideMemoField;
    INVENTORY_CART: TFDQuery;
    INVENTORY_IMAGE: TFDQuery;
    ADD_EDIT_REFIL_QUERY: TFDQuery;
    CONTROLED_LOG: TFDQuery;
    ADD_EDIT_CONTROLED_LOG: TFDQuery;
    INSERT_EDIT_PRODUCT_IMAGE: TFDQuery;
    FDQuery5: TFDQuery;
    SURESCRIPTS_ADD_NEWRX: TFDQuery;
    Surescripts_History: TFDQuery;
    SurescriptsExportToHistory: TFDQuery;
    INDEX_PRESCRIPTIONS_GUID: TFDQuery;
    NC_MESSAGE_ID: TFDQuery;
    NC_NDC: TFDQuery;
    NC_Product_ID: TFDQuery;
    IdSNTP1: TIdSNTP;
    Index_Directories: TFDQuery;
    INSERT_FROMCART_TOTRANSACTION: TFDQuery;
    SURESCRIPTS_INSERT_LOG: TFDQuery;
    LOG_SURESCRIPTS: TFDQuery;
    INSERT_Surescripts_LOG: TFDQuery;
    Index_Claim: TFDQuery;
    SURESCRIPTS_EXSIST: TFDQuery;
    NC_NUMEROPLAN: TFDQuery;
    Index_Surescripts: TFDQuery;
    INDEX_LOG: TFDQuery;
    INDEX_PASSWORDS: TFDQuery;
    SURESCRIPTS_DELETE_IP_CLIENTLIST: TFDQuery;
    INDEX_DOCTORS: TFDQuery;
    ADD_EDIT_USERS_RX: TFDQuery;
    INDEX_MEZCLAS: TFDQuery;
    INDEX_RESPUESTAS: TFDQuery;
    INDEX_IMAGES: TFDQuery;
    FDQuery6: TFDQuery;
    POS_UPDATE_TAX_TFAM: TFDQuery;
    FDQBackup: TFDQuery;
    UPDATE_OTC_RXPAID2: TFDQuery;
    SysColumns: TFDQuery;
    ISAUTHORIZED: TFDQuery;
    FDQuery7: TFDQuery;
    PWRD_ISAUTHORIZED: TFDQuery;
    CALC_TRIPLES_TAX: TFDQuery;
    CALC_PRODUCT_TAX: TFDQuery;
    POS_INSERT_TRIPLES_PAYMENT: TFDQuery;
    WC_BAGPICKUP_UPDATE: TFDQuery;
    TRIPLE_S: TFDQuery;
    BOTONES_MIDIFIERS: TFDQuery;
    SIGNATURE_LINK: TFDQuery;
    FDQuery8: TFDQuery;
    INSERT_ESIGNATURE_AI: TFDQuery;
    INSERT_ESIGNATURE_PICTURE_AI: TFDQuery;
    INSERT_PICKUP: TFDQuery;
    INSERT_ESIGNATURE_STAMP: TFDQuery;
    INI_VALUES: TFDQuery;
    WC_INSERT_NEWPRODUCT_BAG: TFDQuery;
    RX_CHANGE_PATIENT_PLAN: TFDQuery;
    QUICK_RX_INSERT: TFDQuery;
    QUICK_RX: TFDQuery;
    QUICK_RX_VIEW: TFDQuery;
    CUSTOMER_CLASSIFICATION: TFDQuery;
    QUICK_RX_ADD_NEWRX: TFDQuery;
    FN_RX_NEXTREFILL: TFDQuery;
    INVENTORY_INOUT_REPORT: TFDQuery;
    INV_INOUT_RPT: TFDQuery;
    inout_report: TFDQuery;
    UPDATE_MEZCLAS_OTCNUMBER: TFDQuery;
    ProcUPDATE_MEZCLAS_OTCNUMBER: TFDStoredProc;
    MERGE_PATIENT_DATA: TFDQuery;
    NOTIFICATION_LOG: TFDQuery;
    INSERT_NOTIFICATION_LOG: TFDQuery;
    DRUG_EXPI_BATCH: TFDQuery;
    rx_post_newrx: TFDQuery;
    INSERT_PRESCRIPTIONS: TFDQuery;
    qCreateTables: TFDQuery;
    UPDATE_BILLING_REJECTED_RX: TFDQuery;
    PAT_HEALTH_PLAN: TFDQuery;
    CODES: TFDQuery;
    WC_CREATE_NEWBAG: TFDQuery;
    HCPCS_CODES: TFDQuery;
    RX_AMOUNT_DUE: TFDQuery;
    RX_AMOUNTDUE: TFDQuery;
    REFILL_REMINDER_SCHEDULE: TFDQuery;
    RX_INSERT_REFILL_QUERY: TFDQuery;
    RX_REFILL_NOTIFIED: TFDQuery;
    QBorrarNonMatchedNDC: TFDQuery;
    RX_VALIDATE_NEWRX_DATA: TFDQuery;
    WC_UPDATE_NOTIFICATION_MODE: TFDQuery;
    PRINTERS: TFDQuery;
    WC_PATIENTS: TFDQuery;
    OTC_NON_RX: TFDQuery;
    D0_BuidTransFile: TFDQuery;
    D0_GetFloatCharacter: TFDQuery;
    D0_COB_segment: TFDQuery;
    D0_DUR_Segment: TFDQuery;
    D0_Workers_compensation: TFDQuery;
    D0_Compound_segment: TFDQuery;
    D0_Clinical_Segment: TFDQuery;
    SOFTWARE_VERSION: TFDQuery;
    WC_PATIENTS_HISTORY: TFDQuery;
    RELATIONFACILITY_PAT: TFDQuery;
    RELATIONFACILITY_PRESC: TFDQuery;
    Drug_Facilities: TFDQuery;
    RX_ADD_EDIT_RX_BYPHONE: TFDQuery;
    Prescriptions_ByPhone: TFDQuery;
    qryCreate: TFDQuery;
    INVENTARIO_ITEM: TFDQuery;
    INVENTORY_ERX: TFDQuery;
    PRODUCT_SIGNATURE: TFDQuery;
    INSERT_PRODUCT_SIGNATURE: TFDQuery;
    PSEUDO_SALES_LOG: TFDQuery;
    WF_UPDATE_PICKUP: TFDQuery;
    HCPCSCodes: TFDQuery;
    D0_BuildTransFile_schema: TFDQuery;
    D0_COB_segment_schema: TFDQuery;
    D0_DUR_Segment_schema: TFDQuery;
    D0_Workers_compensation_schema: TFDQuery;
    NCPDP: TFDQuery;
    INSSCHEMA: TFDQuery;
    INSURANCE_SCHEMAS: TFDQuery;
    qryUpdatePatPlanIndex: TFDQuery;
    DELETE_COB_DEPENDENTS: TFDQuery;
    COB_A: TFDQuery;
    COB_B: TFDQuery;
    COB_C: TFDQuery;
    COB_D: TFDQuery;
    COB_E: TFDQuery;
    HCPCSCodes_import: TFDQuery;
    GetNextSequenceNumber: TFDQuery;
    RX_INSERT_RX_QUEUE: TFDQuery;
    RX_QUEUE: TFDQuery;
    RX_QUEUE_ADD_NEWRX: TFDQuery;
    MedRestrictions: TFDQuery;
    MedRestrict_Patient: TFDQuery;
    MedRestrict_Prescriber: TFDQuery;
    ElectrReconc: TFDQuery;
    ElectrReconcDup: TFDQuery;
    PhysiciansDATA: TFDQuery;
    Physicians: TFDQuery;
    OTC_DeleteCleanup: TFDQuery;
    NDC9_INGREDIENT_MAP: TFDQuery;
    UpsertNdc9Ingredient: TFDQuery;
    WC_CHECK_ACTIVE_DUPLICATE_INGREDIENTS: TFDQuery;
    WC_GET_MISSING_ACTIVE_NDC9_MAP: TFDQuery;
    PRESCRIPTION_FULL_CREATEINDEX: TFDQuery;
    GET_ACTIVE_PATIENT_NDCS: TFDQuery;
    fn_GetBatchClinicalSignatureHash: TFDQuery;
    RX_CLINICAL_ALERT: TFDQuery;
    RX_CLINICAL_APPROVAL: TFDQuery;
    VW_RX_CLINICAL_ALERT_APPROVAL: TFDQuery;
    PETS: TFDQuery;
    NC_PETID: TFDQuery;
    SEARCH_PACIENTES: TFDQuery;
    fn_SplitString: TFDQuery;
    WORKSTATION_PRINTER_MAP: TFDQuery;
    VALIDATE_OTC_BATCH_INTEGRITY: TFDQuery;
    GET_PACIENTE_BY_ID: TFDQuery;
    SEARCH_GLOBAL: TFDQuery;
    fn_D0_GetFloatCharacter: TFDQuery;
    D0_SEG01_Patient_schema: TFDQuery;
    D0_SEG07_Claim_schema: TFDQuery;
    D0_SEG03_Prescriber_schema: TFDQuery;
    D0_SEG04_Insurance_schema: TFDQuery;
    D0_SEG11_Pricing_schema: TFDQuery;
    D0_SEG05_COB_schema: TFDQuery;
    D0_SEG08_DUR_schema: TFDQuery;
    D0_SEG10_Compound_schema: TFDQuery;
    D0_SEG06_WorkersComp_schema: TFDQuery;
    PATIENT_LOOKUP: TFDQuery;
    GET_INVENTORIYINFO: TFDQuery;
    qryNewSP: TFDQuery;
    INSERT_REFILL_QUERY_FROM_MSGHUB: TFDQuery;
    VW_REFILL_REMINDER_CANDIDATES: TFDQuery;
    RX_UPDATE_PRODUCT_CHANGED: TFDQuery;
    PROCESS_PATIENT_PRESCRIPTION_STATUS: TFDQuery;
    PR_OTC: TFDQuery;
    PR_OTC_INVENTORY_CONTROL: TFDQuery;
    qryDeleteOrphanR: TFDQuery;
    FK: TFDQuery;
    Prescriptons_index: TFDQuery;
    OTC_Index: TFDQuery;
    Surescripts_index: TFDQuery;
    RX_CHANGE_PRESCRIBER: TFDQuery;
    Patient_Index: TFDQuery;
    PatPlan_Index: TFDQuery;
    Doctor_Index: TFDQuery;
    RX_CHANGE_DRUG: TFDQuery;
    FK_PRESCRIPTION_PRESCRIBER: TFDQuery;
    FK_PATPLAN_PLANESMEDICOS: TFDQuery;
    UpdatePlanesMedicoNo: TFDQuery;
    DropFK: TFDQuery;
    SIG_APPLY_METHOD: TFDQuery;
    D0_GetSchemaValue: TFDQuery;
    usp_UpdateOrAppendPatPlanFromEligibility: TFDQuery;
    RX_CHANGE_RX_INFORMATION: TFDQuery;
    RECALL_DELETED_PRESCRIPTION_EXACT: TFDQuery;
    RX_CHANGE_RX_DETAIL: TFDQuery;
    Insurance_Master: TFDQuery;
    PLANESMEDICOS_SWITCH_SAVE: TFDQuery;
    PLANESMEDICOS_SWITCH: TFDQuery;
    BILLING_SWITCH: TFDQuery;
    qryAddSwitches: TFDQuery;
    Processor_Master: TFDQuery;
    PLANESMEDICOSupdatefromInsurance_Master: TFDQuery;
    UPDATE_INVENTORIYINFO: TFDQuery;
    UpdatePlanesMedicosSwitch: TFDQuery;
    GET_CONTROLLED_RX_AUDIT_TRAIL: TFDQuery;
    Insurance_Master_data: TFDQuery;
    procedure UpdateFarmatec;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsPriceTableAfterPost(DataSet: TDataSet);
    Procedure ExecSql(Token: String);
    procedure CDSPatPlanAfterPost(DataSet: TDataSet);
    procedure AddPatientCashPlan(NPI: String);
    procedure FDConnection1AfterConnect(Sender: TObject);
    function CreateFields(TableName, COLUMN_NAME, FieldType: String): Boolean;
    function CreateFieldsImages(TableName, COLUMN_NAME, FieldType: String): Boolean;
    function ExecQry(SQLstr: String): Boolean;
    function ExecQryImages(SQLstr: String): Boolean;
    procedure DropAll;
    procedure ErasePrescriptionsFields;
    procedure CreateNewFields;
    procedure CHANGE_PRESCRIBERAfterExecute(DataSet: TFDDataSet);
    procedure SuccessfullyCreated(Token: String);
    procedure CALC_RXDISPONIBLEAfterExecute(DataSet: TFDDataSet);
    procedure CALC_RXDISPONIBLE_DELAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_OTC_LOGAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_PARATA_QUERIEAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_RXAfterExecute(DataSet: TFDDataSet);
    procedure PRESCRIPTION_FULLAfterExecute(DataSet: TFDDataSet);
    procedure STARTBANKAfterExecute(DataSet: TFDDataSet);
    procedure GETNEWHEADERAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_ESIGNATURE_PICTUREAfterExecute(DataSet: TFDDataSet);
    procedure BACKUPDATABASEAfterExecute(DataSet: TFDDataSet);
    procedure CALC_HEAD_TOTALSAfterExecute(DataSet: TFDDataSet);
    procedure CALC_ORDER_TOTALAfterExecute(DataSet: TFDDataSet);
    procedure CALC_TOTAL_RXDISPONIBLEAfterExecute(DataSet: TFDDataSet);
    procedure CALCRXDISPONIBLEAfterExecute(DataSet: TFDDataSet);
    procedure CALCULARAUSPICIOAfterExecute(DataSet: TFDDataSet);
    procedure CAMBIARACASHAfterExecute(DataSet: TFDDataSet);
    procedure DELETE_OTCAfterExecute(DataSet: TFDDataSet);
    procedure DELETE_PRINT_QUERIESAfterExecute(DataSet: TFDDataSet);
    procedure RXAfterExecute(DataSet: TFDDataSet);
    procedure DELETE_RXTEMP1NORXAfterExecute(DataSet: TFDDataSet);
    procedure DELETE_RXTEMP1TERMINADAAfterExecute(DataSet: TFDDataSet);
    procedure DELETE_SCANED_QAfterExecute(DataSet: TFDDataSet);
    procedure EM_UPDATEINVAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_ESIGNATUREAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_OTCAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_PRINT_QAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_RESPONSEAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_TRANSAfterExecute(DataSet: TFDDataSet);
    procedure INSERTDOCTORAfterExecute(DataSet: TFDDataSet);
    procedure INSERTINVENTORYAfterExecute(DataSet: TFDDataSet);
    procedure INSERTPACIENTEAfterExecute(DataSet: TFDDataSet);
    procedure INSERTPATPLANAfterExecute(DataSet: TFDDataSet);
    procedure INSERTPRODUCTAfterExecute(DataSet: TFDDataSet);
    procedure NEXT_BATCH_NUMBERAfterExecute(DataSet: TFDDataSet);
    procedure SCANED_RX_LINKAfterExecute(DataSet: TFDDataSet);
    procedure SENDTOHISTORYAfterExecute(DataSet: TFDDataSet);
    procedure TRANSACTIONDETAIL_CANCELTRANSAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_RX_REVERSALAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_RX_REJECTEDAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_WC_STATUSAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_RXTEMP1_MEZCLAAfterExecute(DataSet: TFDDataSet);
    procedure WILLCALL_DELETEAfterExecute(DataSet: TFDDataSet);
    procedure CHANGE_PATIENTAfterExecute(DataSet: TFDDataSet);
    procedure CALC_DAILYTOTALS_READAfterExecute(DataSet: TFDDataSet);
    procedure CANCEL_NEW_RXAfterExecute(DataSet: TFDDataSet);
    procedure CANCEL_NEW_RX_NORXAfterExecute(DataSet: TFDDataSet);
    procedure RECALL_RX_FROM_BACKUPAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_APPRISSAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_PATPLAN_PLANNUMBERAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_DISPPILLAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_OTC_BATCHAfterExecute(DataSet: TFDDataSet);
    procedure INVENTORY_CONTROLAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_PRESCRIPTIONS1AfterExecute(DataSet: TFDDataSet);
    procedure INSERT_LOGAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_OTC_HEALTHPLANAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_OTC_WFCASHIERAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_RX_SCANED_RXLINKAfterExecute(DataSet: TFDDataSet);
    procedure CAMBIAR_MEDICAMENTOAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_PRESCRIPTIONAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_OTC_RXPAIDAfterExecute(DataSet: TFDDataSet);
    procedure TIME_STAMPAfterExecute(DataSet: TFDDataSet);
    procedure CANCEL_TABSAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_TRANSACTION_HEADERAfterExecute(DataSet: TFDDataSet);
    procedure POS_UPDATE_PAYMENTTYPEAfterExecute(DataSet: TFDDataSet);
    procedure ADD_EDIT_PATINSURANCEAfterExecute(DataSet: TFDDataSet);
    procedure ADD_EDIT_PACIENTESAfterExecute(DataSet: TFDDataSet);
    procedure ADD_EDIT_PRESCRIBERAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_SCANNED_RXAfterExecute(DataSet: TFDDataSet);
    procedure IMAGESAfterExecute(DataSet: TFDDataSet);
    procedure FarmatecImagesAfterExecute(DataSet: TFDDataSet);
    procedure POS_UPDATE_PRINTEDAfterExecute(DataSet: TFDDataSet);
    procedure PRICE_UPDATEAfterExecute(DataSet: TFDDataSet);
    procedure POS_INSERT_EDIT_INVENTORYAfterExecute(DataSet: TFDDataSet);
    procedure CAL_BALANCE_TEMPAfterExecute(DataSet: TFDDataSet);
    procedure CALC_BALANCE_DELETEAfterExecute(DataSet: TFDDataSet);
    procedure CALC_BALANCEAfterExecute(DataSet: TFDDataSet);
    procedure POS_CANCEL_TRANSAfterExecute(DataSet: TFDDataSet);
    procedure PATIENT_HIPPA_ORIENTEDAfterExecute(DataSet: TFDDataSet);
    procedure POS_RECALL_TRANSACTIONAfterExecute(DataSet: TFDDataSet);
    procedure POS_SPLIT_TABAfterExecute(DataSet: TFDDataSet);
    procedure CALC_CHANGEAfterExecute(DataSet: TFDDataSet);
    procedure POS_INSERT_BUTTON_IMAGEAfterExecute(DataSet: TFDDataSet);
    procedure POS_DELETE_OPEN_TRANSACTIONSAfterExecute(DataSet: TFDDataSet);
    procedure HOLD_SAVE_TRANSACTIONAfterExecute(DataSet: TFDDataSet);
    procedure TIMECARD_TOTALHOURSWORKEDAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_NEWTABAfterExecute(DataSet: TFDDataSet);
    procedure CALC_HEAD_TOTALS_TRIGAfterExecute(DataSet: TFDDataSet);
    procedure CALC_HEAD_TOTALS_DEL_TRIGAfterExecute(DataSet: TFDDataSet);
    procedure CALC_DAILYTOTALS_READ_RESTAfterExecute(DataSet: TFDDataSet);
    procedure POS_INVENTORY_CONTROLAfterExecute(DataSet: TFDDataSet);
    procedure NEXT_MAIN_COURSE_IDAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_CASH_PLAN_EMPTYAfterExecute(DataSet: TFDDataSet);
    procedure NEXT_APPRISS_TNAfterExecute(DataSet: TFDDataSet);
    procedure PICKUP_TFAfterExecute(DataSet: TFDDataSet);
    procedure CLOSE_BALANCEAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_PASSWORD_LOGAfterExecute(DataSet: TFDDataSet);
    procedure ICD10_DELETEAfterExecute(DataSet: TFDDataSet);
    procedure ICD10_CREATEAfterExecute(DataSet: TFDDataSet);
    procedure CALC_COMMISSIONAfterExecute(DataSet: TFDDataSet);
    procedure RX_RECALL_EPRESCRIBE_FROMHISTORYAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_SCANNED_DOCAfterExecute(DataSet: TFDDataSet);
    procedure OTC_INVENTORY_CONTROLAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_OTC_MEZCASAfterExecute(DataSet: TFDDataSet);
    procedure EDIT_DAILYTOTALSAfterExecute(DataSet: TFDDataSet);
    procedure ADD_EDIT_USERS_POSAfterExecute(DataSet: TFDDataSet);
    procedure ReindexAfterExecute(DataSet: TFDDataSet);
    procedure POS_TFAM_CALCAfterExecute(DataSet: TFDDataSet);
    procedure SURESCRIPTS_IP_CLIENTLISTAfterExecute(DataSet: TFDDataSet);
    procedure SURESCRIPTS_INSERT_IP_CLIENTLISTAfterExecute(DataSet: TFDDataSet);
    procedure SURESCRIPTS_UPDATE_SURESCRIPTSAfterExecute(DataSet: TFDDataSet);
    procedure SURESCRIPTS_UPDATE_RXSTATUSAfterExecute(DataSet: TFDDataSet);
    procedure RX_TERMINAR_RECETAAfterExecute(DataSet: TFDDataSet);
    procedure RX_UPDATE_REFILL_QUERYAfterExecute(DataSet: TFDDataSet);
    procedure SURESCRIPTS_NEXT_MessageIDAfterExecute(DataSet: TFDDataSet);
    procedure SURESCRIPTS_UPDATE_RESPONSEAfterExecute(DataSet: TFDDataSet);
    procedure RX_COMPOUND_VALUESAfterExecute(DataSet: TFDDataSet);
    procedure GET_PRICE_TABLE_VALUEAfterExecute(DataSet: TFDDataSet);
    procedure WF_UPDATEAfterExecute(DataSet: TFDDataSet);
    procedure RX_CALCULATE_PRICEAfterExecute(DataSet: TFDDataSet);
    procedure EXPORT_TO_RXTEMP1AfterExecute(DataSet: TFDDataSet);
    procedure SurescriptsRX_LABELAfterExecute(DataSet: TFDDataSet);
    procedure SurescriptsRX_LABEL_INSERT_EDITAfterExecute(DataSet: TFDDataSet);
    procedure NEXT_IDAfterExecute(DataSet: TFDDataSet);
    procedure UpdateFromResponseAfterExecute(DataSet: TFDDataSet);
    procedure SURESCRIPTS_TRANS_TYPEAfterExecute(DataSet: TFDDataSet);
    procedure SURESCRIPTS_RX_RENEWAfterExecute(DataSet: TFDDataSet);
    procedure SURESCRIPT_INSERTAfterExecute(DataSet: TFDDataSet);
    procedure SurescriptsAfterExecute(DataSet: TFDDataSet);
    procedure WORKERS_COMPENSATION_SEGMENTAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_WORKERS_COMP_SEGMENTAfterExecute(DataSet: TFDDataSet);
    procedure BACKUPDATABASE_IMAGESAfterExecute(DataSet: TFDDataSet);
    procedure FDQueryImagesAfterExecute(DataSet: TFDDataSet);
    procedure POS_HOLD_TRANSAfterExecute(DataSet: TFDDataSet);
    procedure POS_ROUND_TOTALAfterExecute(DataSet: TFDDataSet);
    procedure Directory61AfterExecute(DataSet: TFDDataSet);
    procedure DOCTOR_CREATE_UPDATE61AfterExecute(DataSet: TFDDataSet);
    procedure Prescribers_SpecialtyAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_DIRECTORYAfterExecute(DataSet: TFDDataSet);
    procedure POS_INSERT_DAILYTOTALSAfterExecute(DataSet: TFDDataSet);
    procedure POST_SHOPPER_DAILYAfterExecute(DataSet: TFDDataSet);
    procedure POST_SHOPPERAfterExecute(DataSet: TFDDataSet);
    procedure VIPAfterExecute(DataSet: TFDDataSet);
    procedure NCIAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_TIME_STAMPAfterExecute(DataSet: TFDDataSet);
    procedure APPRISS_VIEW_COMPOUNDSAfterExecute(DataSet: TFDDataSet);
    procedure APPRISS_VIEWAfterExecute(DataSet: TFDDataSet);
    procedure CALC_TAB_BALANCEAfterExecute(DataSet: TFDDataSet);
    procedure OPEN_TABSAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_TH_BALANCE_DELAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_TH_BALANCEAfterExecute(DataSet: TFDDataSet);
    procedure CREATE_FIX_CONTROLADOAfterExecute(DataSet: TFDDataSet);
    procedure FIX_CONTROLADOAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_PATIENT_NOTIFICATIONSAfterExecute(DataSet: TFDDataSet);
    procedure DOCTOR_CREATE_UPDATEAfterExecute(DataSet: TFDDataSet);
    procedure RX_VIEW_NOT_COMPOUNDSAfterExecute(DataSet: TFDDataSet);
    procedure RECALL_RXAfterExecute(DataSet: TFDDataSet);
    procedure OTC_HISTORYAfterExecute(DataSet: TFDDataSet);
    procedure PRESCRIPTIONS_HISTORYAfterExecute(DataSet: TFDDataSet);
    procedure DELETE_SIGNATUREAfterExecute(DataSet: TFDDataSet);
    procedure PURCHASE_SALESAfterExecute(DataSet: TFDDataSet);
    procedure CLEAN_OTCAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_CASH_PLANAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_MEZLCAAfterExecute(DataSet: TFDDataSet);
    procedure CLONE_PRODUCTAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_OVER_TCAfterExecute(DataSet: TFDDataSet);
    procedure NC_NOCLIENTE_NORXAfterExecute(DataSet: TFDDataSet);
    procedure INDEX_OTC_GUIDAfterExecute(DataSet: TFDDataSet);
    procedure QUpdateOTCAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_PRESCRIPTION_ALLAfterExecute(DataSet: TFDDataSet);
    procedure EDIT_INVENTORYAfterExecute(DataSet: TFDDataSet);
    procedure PATIENT_SEARCHAfterExecute(DataSet: TFDDataSet);
    procedure QCreateBackupDBAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_CLAIM_SEGMENTAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_PRICING_SEGMENTAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_OTC_QTYAfterExecute(DataSet: TFDDataSet);
    procedure AddOTCFieldsAfterExecute(DataSet: TFDDataSet);
    procedure RX_VIEWAfterExecute(DataSet: TFDDataSet);
    procedure RX_VIEW_COMPOUNDSAfterExecute(DataSet: TFDDataSet);
    procedure RXCONTROLADASAfterExecute(DataSet: TFDDataSet);
    procedure RXDEPTAfterExecute(DataSet: TFDDataSet);
    procedure TEMPAfterExecute(DataSet: TFDDataSet);
    procedure TOTAL_POS_TRANSAfterExecute(DataSet: TFDDataSet);
    procedure VERTRANSACCIONESAfterExecute(DataSet: TFDDataSet);
    procedure WC_PICKUP_TFAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_OTC_REFILL_NOTIFIEDAfterExecute(DataSet: TFDDataSet);
    procedure VERIFYRXTEMP1AfterExecute(DataSet: TFDDataSet);
    procedure RX_PROCESADASAfterExecute(DataSet: TFDDataSet);
    procedure PRODUCTSALESAfterExecute(DataSet: TFDDataSet);
    procedure PACIENTES_PLANESAfterExecute(DataSet: TFDDataSet);
    procedure OTCHISTORYAfterExecute(DataSet: TFDDataSet);
    procedure TRANSFER_PRODAfterExecute(DataSet: TFDDataSet);
    procedure POS_ADD_EDIT_CLIENTESAfterExecute(DataSet: TFDDataSet);
    procedure QBorrarNonMatchedNDCExecuteError(ASender: TObject; ATimes,
      AOffset: Integer; AError: EFDDBEngineException;
      var AAction: TFDErrorAction);
    procedure LOCK_UNLOCKAfterExecute(DataSet: TFDDataSet);
    procedure LOCK_UNLOCK_DELAfterExecute(DataSet: TFDDataSet);

    procedure LOINCAfterExecute(DataSet: TFDDataSet);
    procedure INVENTORY_IMAGEAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_EDIT_SHOPPINGCART_DETAILAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_EDIT_SHOPPINGCART_HEADERAfterExecute(DataSet: TFDDataSet);
    procedure INVENTORY_CARTAfterExecute(DataSet: TFDDataSet);
    procedure ADD_EDIT_REFIL_QUERYAfterExecute(DataSet: TFDDataSet);
    procedure CART_DETAILAfterExecute(DataSet: TFDDataSet);
    procedure SURESCRIPTS_EXSISTAfterExecute(DataSet: TFDDataSet);
    procedure INSERT_PRINT_QUERIESAfterExecute(DataSet: TFDDataSet);
    procedure Insert_Prescriber_directoryAfterExecute(DataSet: TFDDataSet);
    procedure QAlterViewRxControladasAfterExecute(DataSet: TFDDataSet);
    procedure UPDATE_OTCAfterExecute(DataSet: TFDDataSet);
    procedure TRANSACTIONDETAIL_UPDATEPRICE_MOBILEAfterExecute(
      DataSet: TFDDataSet);
    procedure Index_NCPATNAMEAfterExecute(DataSet: TFDDataSet);
    procedure Index_OTC_NoRecetaAfterExecute(DataSet: TFDDataSet);
    procedure Index_PAT_NUMBERAfterExecute(DataSet: TFDDataSet);
    procedure Index_Prescription_NumeroRecetaAfterExecute(DataSet: TFDDataSet);
    procedure ADD_EDIT_USERS_RXAfterExecute(DataSet: TFDDataSet);
    function CreateFieldsBackup(TableName, COLUMN_NAME, FieldType: String): Boolean;
    procedure ExecSqlBackup(Token: String);
    procedure UPDATE_OTC_RXPAID2AfterExecute(DataSet: TFDDataSet);
    procedure UpdateNullColumns(TableName: String);
    procedure AlterColumns(TableName: String);
    procedure QBorrarNonMatchedNDCAfterExecute(DataSet: TFDDataSet);
    function base64encode(const Text: ansiString): ansiString;
    procedure RX_CHANGE_PATIENT_PLANAfterExecute(DataSet: TFDDataSet);
    function CreateFieldsImages2(TableName, COLUMN_NAME,
      FieldType: String): Boolean;
    procedure UpdateMezclas;
    procedure UPDATE_BILLING_REJECTED_RXAfterExecute(DataSet: TFDDataSet);
    procedure qryCreateError(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure QBorrarNonMatchedNDCError(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure FDQuery1Error(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure FDQuery2Error(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure FDQuery3Error(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure FDQuery4Error(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure FDQuery5Error(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure FDQuery6Error(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure updatePateientPets;
    procedure qryNewSPError(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure CreatePK;
    procedure ExecQryCreate(SQLTxt: String);
   private
    procedure CreateTable(TableName, NewTableName: String);
    procedure ExecSql2(Token1, SQL_Text: String);

    procedure Identity(TableName, OnOff: String);
    procedure DropAllNonConstraintIndexes;
    procedure DropProgrammableObjectsAndIndexes;
    function Field_exist(ColumnStr, TableStr: String): Boolean;
    function ColumnExists(const ATableName, AColumnName: string): Boolean;






    { Private declarations }
  public
    { Public declarations }
    DatabaseName: String;
    ServerName: String;
  end;

var
  DMModifyDatabase: TDMModifyDatabase;

implementation


{$R *.dfm}

uses UntMain, UntDMePrescribe, untCommon, UntDMIDC10;

procedure TDMModifyDatabase.AddOTCFieldsAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('AddOTCFields');
end;

procedure TDMModifyDatabase.AddPatientCashPlan(NPI: String);
Var
  HasCashPlan: Boolean;
begin
  with DMModifyDatabase do
  begin
    CDSPacientes.Close;
    CDSPacientes.CommandText := 'Select * from Pacientes order by NumeroCliente';
    //CDSPacientes.CommandText := 'Select * from Pacientes where numerocliente = 54881';
    CDSPacientes.Open;
    CDSPacientes.First;
    while not CDSPacientes.Eof do
    begin
      CDSPatPlan.Close;
      CDSPatPlan.CommandText := 'Select * from patplan where Numerocliente = ' + CDSPacientesNUMEROCLIENTE.AsString;
      CDSPatPlan.Open;
      CDSPatPlan.First;
      HasCashPlan := False;
      while not CDSPatPlan.Eof do
      begin
        if CDSPatPlanPLANMEDICO.asString.Trim =  'CAS' then HasCashPlan := True;
        CDSPatPlan.Next;
      end;
      if HasCashPlan = False then
      begin
        CDSPatPlan.Insert;
        CDSPatPlanNUMEROCLIENTE.Value := CDSPacientesNUMEROCLIENTE.Value;
        CDSPatPlanPLANMEDICO.Value := 'CAS';
        CDSPatPlanRELACION.Value := 1;
        CDSPatPlanINACTIVE_DATE.AsString := '01/01/2099';
        CDSPatPlanCARDHOLDERID.Value := CDSPacientesIDENTIFICACION.Value;
        CDSPatPlanCH_FIRSTNAME.Value := CDSPacientesNOMBRE.asString.Trim;
        CDSPatPlanCH_LASTNAME.Value := CDSPacientesAPELLIDOPATERNO.asString.Trim;
        CDSPatPlanNOGRUPO.Value := '';
        CDSPatPlanACTIVO.Value := True;
        CDSPatPlanPLAN_PRIMARIO.Value := False;
        CDSPatPlan.Post;
        //FrmMain.StatusBar1.Panels.Items[0].Text := IntToStr(Counter);
        //FrmMain.StatusBar1.Refresh;
      end;
      CDSPacientes.Next;
    end;
    SQLQuery1.SQL.Text := 'update planesmedicos set SERVICE_PROVIDER_ID_QUAL = ' + chr(39) + '01' + chr(39) +', NUMEROFARMACIA = ' + chr(39) + Trim(NPI) + chr(39) +', BINNUMBER = ' + chr(39) + '018182' + chr(39) +', MANUAL_PLAN = ' + chr(39) + 'T'+ chr(39) + ', PROCESSORCONTROL = ' + chr(39) + 'CASH' + chr(39) +', SOFTWARE_VENDOR_ID = '+ chr(39) +'WESCOM' + chr(39) + ' where ABREVIATURA = ' + chr(39) + 'CAS'+ chr(39);
    SQLQuery1.ExecSQL;
  end;
end;
procedure TDMModifyDatabase.ADD_EDIT_PACIENTESAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('ADD_EDIT_PACIENTES');
end;

procedure TDMModifyDatabase.ADD_EDIT_PRESCRIBERAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('ADD_EDIT_PRESCRIBER');
end;

procedure TDMModifyDatabase.ADD_EDIT_REFIL_QUERYAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('ADD_EDIT_REFIL_QUERY');
end;

procedure TDMModifyDatabase.ADD_EDIT_USERS_POSAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('ADD_EDIT_USERS_POS');
end;

procedure TDMModifyDatabase.ADD_EDIT_USERS_RXAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('ADD_EDIT_USERS_RX');
end;

procedure TDMModifyDatabase.APPRISS_VIEWAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('APPRISS_VIEW');
end;

procedure TDMModifyDatabase.APPRISS_VIEW_COMPOUNDSAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('APPRISS_VIEW_COMPOUNDS');
end;

procedure TDMModifyDatabase.BACKUPDATABASEAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('BACKUPDATABASE');
end;

procedure TDMModifyDatabase.BACKUPDATABASE_IMAGESAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('BACKUPDATABASE_IMAGES');
end;

procedure TDMModifyDatabase.INDEX_OTC_GUIDAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('BATCH_NUMBER_BILLING');
end;

procedure TDMModifyDatabase.CALCRXDISPONIBLEAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CALCRXDISPONIBLE');
end;

procedure TDMModifyDatabase.CALCULARAUSPICIOAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CALCULARAUSPICIO');
end;

procedure TDMModifyDatabase.CALC_BALANCEAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CALC_BALANCE');
end;

procedure TDMModifyDatabase.CALC_BALANCE_DELETEAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CALC_BALANCE_DELETE');
end;

procedure TDMModifyDatabase.CALC_CHANGEAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CALC_CHANGE');
end;

procedure TDMModifyDatabase.CALC_COMMISSIONAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CALC_COMMISSION');
end;

procedure TDMModifyDatabase.CALC_DAILYTOTALS_READAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CALC_DAILYTOTALS_READ');
end;

procedure TDMModifyDatabase.CALC_DAILYTOTALS_READ_RESTAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('.CALC_DAILYTOTALS_READ_REST');
end;

procedure TDMModifyDatabase.CALC_HEAD_TOTALSAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CALC_HEAD_TOTALS');
end;

procedure TDMModifyDatabase.CALC_HEAD_TOTALS_DEL_TRIGAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CALC_HEAD_TOTALS_DEL_TRIG');
end;

procedure TDMModifyDatabase.CALC_HEAD_TOTALS_TRIGAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CALC_HEAD_TOTALS_TRIG');
end;

procedure TDMModifyDatabase.CALC_ORDER_TOTALAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CALC_ORDER_TOTAL');
end;

procedure TDMModifyDatabase.CALC_RXDISPONIBLEAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CALC_RXDISPONIBLE');
end;

procedure TDMModifyDatabase.CALC_RXDISPONIBLE_DELAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CALC_RXDISPONIBLE_DEL');
end;

procedure TDMModifyDatabase.CALC_TAB_BALANCEAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CALC_TAB_BALANCE');
end;

procedure TDMModifyDatabase.CALC_TOTAL_RXDISPONIBLEAfterExecute(
  DataSet: TFDDataSet);
begin
    SuccessfullyCreated('CALC_TOTAL_RXDISPONIBLE');
end;

procedure TDMModifyDatabase.CAL_BALANCE_TEMPAfterExecute(DataSet: TFDDataSet);
begin
 SuccessfullyCreated('CAL_BALANCE_TEMP');
end;

procedure TDMModifyDatabase.CAMBIARACASHAfterExecute(DataSet: TFDDataSet);
begin
   SuccessfullyCreated('CAMBIARACASH');
end;

procedure TDMModifyDatabase.CAMBIAR_MEDICAMENTOAfterExecute(
  DataSet: TFDDataSet);
begin
 SuccessfullyCreated('CAMBIAR_MEDICAMENTO');
end;

procedure TDMModifyDatabase.CANCEL_NEW_RXAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CANCEL_NEW_RX');
end;

procedure TDMModifyDatabase.CANCEL_NEW_RX_NORXAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CANCEL_NEW_RX_NORX');
end;

procedure TDMModifyDatabase.CANCEL_TABSAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CANCEL_TABS');
end;

procedure TDMModifyDatabase.CART_DETAILAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CART_DETAIL');
end;

procedure TDMModifyDatabase.CDSPatPlanAfterPost(DataSet: TDataSet);
begin
  if (CDSPatPlan.ChangeCount > 0) then CDSPatPlan.ApplyUpdates(-1);
end;

procedure TDMModifyDatabase.cdsPriceTableAfterPost(DataSet: TDataSet);
begin
  if (cdsPriceTable.ChangeCount > 0) then cdsPriceTable.ApplyUpdates(-1);
end;


procedure TDMModifyDatabase.UpdateMezclas;
begin
  ExecSql2('UPDATE_MEZCLAS_OTCNUMBER','drop procedure dbo.UPDATE_MEZCLAS_OTCNUMBER');
  UPDATE_MEZCLAS_OTCNUMBER.ExecSQL;
  ProcUPDATE_MEZCLAS_OTCNUMBER.ExecProc;
end;

procedure TDMModifyDatabase.Identity(TableName, OnOff: String);
begin
  With DMModifyDatabase do
  begin
    try
    FDQuery1.SQL.Text := 'set identity_insert dbo.'+TableName+' '+OnOff;
    FDQuery1.ExecSQL;
    frmMain.Memo1.Lines.Add('Succesfull executing ' + FDQuery1.SQL.Text);
    Except
      frmMain.Memo1.Lines.Add('Error executing ' + FDQuery1.SQL.Text);
      {on E: EMSSQLNativeException do
      begin
        FrmMain.MemoErrors.Lines.Add(Token +' Execute error: '+#13#10+ E.Message);
      end;}
    End;
  end;
end;

procedure TDMModifyDatabase.CreateNewFields;
Var
  SQLStr: String;
  Len: Integer;
  Err: string;
begin
  FrmMain.Memo1.Clear;
  DropAll;
  //======= recreate COB tables ===========================
  FDQuery1.SQL.Text := 'SELECT COUNT(*) AS ColumnExists ' +
     ' FROM INFORMATION_SCHEMA.COLUMNS ' +
     ' WHERE TABLE_NAME = ' + chr(39) + 'COB_B' + chr(39) +
     ' AND COLUMN_NAME = ' + chr(39) + 'ID' + chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('ColumnExists').Value = 0 then
  begin
    ExecSql('drop table dbo.cob_a');
    ExecSql('drop table dbo.cob_b');
    ExecSql('drop table dbo.cob_c');
    ExecSql('drop table dbo.cob_d');
    ExecSql('drop table dbo.cob_e');
    ExecQryCreate(COB_A.SQL.Text);
    ExecQryCreate(COB_B.SQL.Text);
    ExecQryCreate(COB_C.SQL.Text);
    ExecQryCreate(COB_D.SQL.Text);
    ExecQryCreate(COB_E.SQL.Text);
  end;

  //===== Create Sequence for Scanned_rx_link =============
  FDQuery1.sql.Text := 'select SCANED_RX_LINK from NEXT_RXNUMBER';
  FDQuery1.Open;
  GetNextSequenceNumber.SQL.Text := 'IF not EXISTS ('+
    'SELECT 1 ' +
    'FROM sys.sequences ' +
    'WHERE name = ' + chr(39) + 'GetNextSequenceNumber' + chr(39) +
    ' AND schema_id = SCHEMA_ID('+ chr(39) + 'dbo' + chr(39) +')' +')' +
    'BEGIN ' +
    'CREATE SEQUENCE GetNextSequenceNumber ' +
    ' START WITH ' + IntToStr(FDQuery1.FieldByName('SCANED_RX_LINK').value) +
    ' INCREMENT BY 1 ' +
    'END';
  GetNextSequenceNumber.ExecSQL;

  //GetNextSequenceNumber.ParamByName('ID').AsInteger := FDQuery1.FieldByName('SCANED_RX_LINK').value;
  //================= PETS ================================
  ExecQryCreate(PETS.SQL.Text);
  CreateFields('PRESCRIPTIONS', 'PetID', 'INT default(0) null');
  updatePateientPets;
  //================= CLINICAL ALERTS =====================
  ExecQryCreate(RX_CLINICAL_ALERT.SQL.TEXT);
  ExecQryCreate(RX_CLINICAL_APPROVAL.SQL.Text);

  //=======================================================
  ExecQryCreate(Physicians.SQL.Text);
  FDQuery1.SQL.Text := 'Select count(*) trows from Physicians';
  FDQuery1.Open;
  if FDQuery1.FieldByName('trows').Value = 0 then
  begin
    PhysiciansDATA.ExecSQL;
  end;
  //=============== CREATE PR_OTC =========================
  ExecQryCreate(PR_OTC.SQL.Text);
  //=======================================================
  //============ BILLING_SWITCH table =====================
  ExecSql('ALTER TABLE BILLING_SWITCH ADD HOST_SUBMITTER_ID VARCHAR(100) NULL');
  //============= CREATE INSURANCE MASTER =================
  if CommonRoutine.TableExists(FDConnection1, 'Insurance_Master') = false then
  begin
    ExecQryCreate(Insurance_Master.SQL.Text);
    ExecQryCreate(Processor_Master.SQL.Text);
    ExecQry(PLANESMEDICOSupdatefromInsurance_Master.SQL.Text);
    Insurance_Master_data.ExecSQL;
  end;

  //=======================================================
  ExecQryCreate(SIG_APPLY_METHOD.SQL.Text);
  FrmMain.PageControlInfo.ActivePageIndex := 0;
  ExecSql(qryDeleteOrphanR.SQL.Text);
  ExecSql('delete from otc where medicamento = ' + chr(39) + chr(39));
  ExecSql('delete from SurescriptsRX_LABEL');
  ExecSql('delete from Prescriptions where medicamento = ' + chr(39) + chr(39));
  ExecSql('update otc set GUID = ' + chr(39) + chr(39) + ' where GUID > ' + chr(39) + chr(39));
  ExecSql('update otc set RECORD_LOCKED = 0 where RECORD_LOCKED = 1');
  ExecSql('update otc set CLAIM_STATUS = 0 where CLAIM_STATUS = 1 and DEDUCIBLE = 0 and PAGO_PLAN = 0 and NUMERO_AUTORIZACION = ' + chr(39) + chr(39));
  ExecQryCreate(MedRestrictions.SQL.Text);
  ExecQryCreate(MedRestrict_Prescriber.SQL.Text);
  ExecQryCreate(MedRestrict_Patient.SQL.Text);

  ExecQryCreate(RX_QUEUE.SQL.Text);
  ExecQryCreate(INSURANCE_SCHEMAS.SQL.Text);
  ExecQryCreate(INSSCHEMA.SQL.Text);
  ExecSql('UPDATE [INSSCHEMA] SET DESCRIPTION = ' + CHR(39) + 'PRIMARY' + CHR(39) + ' WHERE RTRIM(DESCRIPTION) = ' + CHR(39) + 'DEFAULT' + CHR(39));
  ExecSql('UPDATE [INSSCHEMA] SET DESCRIPTION = ' + CHR(39) + 'SECONDARY' + CHR(39) + ' WHERE RTRIM(DESCRIPTION) = ' + CHR(39) + 'bin610020' + CHR(39));
  ExecQryCreate(NCPDP.SQL.Text);
  FDQuery1.SQL.Text := 'Select * from PLANESMEDICOS';
  FDQuery1.OPEN;
  FDQuery1.First;
  While not FDQuery1.Eof do
  begin
    FDQuery2.SQL.Text := 'Select COUNT(*) as TCount from INSURANCE_SCHEMAS where INS_NO = ' + IntToStr(FDQuery1.FieldByName('PLANESMEDICOSNO').Value);
    FDQuery2.Open;
    if FDQuery2.FieldByName('TCount').Value = 0 then
    begin
      FDQuery3.SQL.Text := 'INSERT INTO [dbo].[INSURANCE_SCHEMAS] ([INS_SCHEMA] ,[INS_INDEX] ,[INS_NO])'+
             'VALUES ('+
             chr(39) + '9' + chr(39) + ',' +
             chr(39) + '1' + chr(39) + ',' +
             chr(39) + IntToStr(FDQuery1.FieldByName('PLANESMEDICOSNO').Value) + chr(39) + ')';
      FDQuery3.ExecSQL;
      FDQuery3.SQL.Text := 'INSERT INTO [dbo].[INSURANCE_SCHEMAS] ([INS_SCHEMA] ,[INS_INDEX] ,[INS_NO])'+
             'VALUES ('+
             chr(39) + '13' + chr(39) + ',' +
             chr(39) + '2' + chr(39) + ',' +
             chr(39) + IntToStr(FDQuery1.FieldByName('PLANESMEDICOSNO').Value) + chr(39) + ')';
      FDQuery3.ExecSQL;
    end;
    FDQuery1.Next;
  end;
  ExecQryCreate(PRODUCT_SIGNATURE.SQL.Text);
  ExecQryCreate(HCPCSCodes.SQL.Text);
  FDQuery2.SQL.Text := 'Select count(*) as TCodes from HCPCSCodes';
  FDQuery2.Open;
  if FDQuery2.FieldByName('TCodes').Value = 0 then
  begin
    HCPCSCodes_import.ExecSQL;
  end;
  ExecQryCreate(NDC9_INGREDIENT_MAP.SQL.Text);
  ExecQryCreate(INVENTARIO_ITEM.SQL.Text);
  ExecQryCreate(Prescriptions_ByPhone.SQL.Text);
  ExecQryCreate(RX_ADD_EDIT_RX_BYPHONE.SQL.Text);
  ExecQryCreate(Drug_Facilities.SQL.Text);
  ExecQryCreate(RELATIONFACILITY_PRESC.SQL.Text);
  ExecQryCreate(RELATIONFACILITY_PAT.SQL.Text);
  ExecQryCreate(SOFTWARE_VERSION.SQL.Text);
  ExecQryCreate(HCPCS_CODES.SQL.Text);
  ExecQryCreate(PRINTERS.SQL.Text);
  ExecQryCreate(PAT_HEALTH_PLAN.SQL.Text);
  ExecQryCreate(DRUG_EXPI_BATCH.SQL.Text);
  ExecQryCreate(NOTIFICATION_LOG.SQL.Text);;
  ExecQryCreate(REFILL_REMINDER_SCHEDULE.SQL.Text);


  //========== ElectrRecon =======================
  ExecQryCreate(ElectrReconcDup.SQL.Text);
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.ElectrReconcDup',
     'DF_ElectrReconcDup_REASON',
     'ADD  CONSTRAINT [DF_ElectrReconcDup_REASON]  DEFAULT ('+chr(39) + chr(39) +') FOR [REASON]', Err);

  ExecQryCreate(ElectrReconc.SQL.Text);
  //ExecSql('ALTER TABLE [dbo].[ElectrReconc] ADD  CONSTRAINT [DF_ElectrReconc_ID_INSUR]  DEFAULT ((0)) FOR [ID_INSUR]');
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.ElectrReconc',
     'DF_ElectrReconc_ID_INSUR',
     'ADD  CONSTRAINT [DF_ElectrReconc_ID_INSUR]  DEFAULT (0) FOR [ID_INSUR]', Err);

  //ExecSql('ALTER TABLE [dbo].[ElectrReconc] ADD  CONSTRAINT [DF_ElectrReconc_STATUS]  DEFAULT ((0)) FOR [STATUS]');
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.ElectrReconc',
     'DF_ElectrReconc_STATUS',
     'ADD  CONSTRAINT [DF_ElectrReconc_STATUS]  DEFAULT (0) FOR [STATUS]', Err);


  //ExecSql('ALTER TABLE [dbo].[ElectrReconc] ADD  CONSTRAINT [DF_ElectrReconc_DIFFERENCE]  DEFAULT ((0)) FOR [DIFFERENCE]');
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.ElectrReconc',
     'DF_ElectrReconc_DIFFERENCE',
     'ADD  CONSTRAINT [DF_ElectrReconc_DIFFERENCE]  DEFAULT (0) FOR [DIFFERENCE]', Err);


  //ExecSql('ALTER TABLE [dbo].[ElectrReconc] ADD  CONSTRAINT [DF_ElectrReconc_CYCLE]  DEFAULT (' +chr(39) + chr(39) + ') FOR [CYCLE]');
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.ElectrReconc',
     'DF_ElectrReconc_CYCLE',
     'ADD  CONSTRAINT [DF_ElectrReconc_CYCLE]  DEFAULT ('+chr(39) + chr(39) +') FOR [CYCLE]', Err);

  //ExecSql('ALTER TABLE [dbo].[ElectrReconc] ADD  CONSTRAINT [DF_ElectrReconc_TCN]  DEFAULT (' +chr(39) + chr(39) + ') FOR [TCN]');
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.ElectrReconc',
     'DF_ElectrReconc_TCN',
     'ADD  CONSTRAINT [DF_ElectrReconc_TCN]  DEFAULT ('+chr(39) + chr(39) +') FOR [TCN]', Err);

  //==============================================

  ExecSql('delete from WILLCALL_STATUS where BAG_NUMBER is null');
  CommonRoutine.DropTableIfExists('ep_comunication_numberptt');
  CommonRoutine.DropTableIfExists('ep_coo');
  CommonRoutine.DropTableIfExists('ep_date_dayssupply');
  CommonRoutine.DropTableIfExists('ep_dru');
  CommonRoutine.DropTableIfExists('ep_dru_free_text');
  CommonRoutine.DropTableIfExists('ep_ptt');
  CommonRoutine.DropTableIfExists('ep_pvd_prescriber');
  CommonRoutine.DropTableIfExists('ep_reference_numberpvd');
  CommonRoutine.DropTableIfExists('ep_req');
  CommonRoutine.DropTableIfExists('ep_res');
  CommonRoutine.DropTableIfExists('ep_res');
  CommonRoutine.DropTableIfExists('ep_sts');
  CommonRoutine.DropTableIfExists('ep_sts');
  CommonRoutine.DropTableIfExists('ep_uib');
  CommonRoutine.DropTableIfExists('ep_uih');
  CommonRoutine.DropTableIfExists('ep_uit');
  CommonRoutine.DropTableIfExists('ep_uiz');
  CommonRoutine.DropTableIfExists('ep_una');


  CreateFields('WILLCALL', 'FILL_NUMBER', 'smallint null');
  CreateFields('WILLCALLHistory', 'FILL_NUMBER', 'smallint null');

  with CommonRoutine do
  begin
    DropColumnIfExists('INVENTARIOPISO', 'GROUP_QTY');
    DropColumnIfExists('INVENTARIOPISO', 'PRECIO_DACO');
    DropColumnIfExists('INVENTARIOPISO', 'GROUP_QTY');
    DropColumnIfExists('INVENTARIOPISO', 'PRECIO2');
    DropColumnIfExists('INVENTARIOPISO', 'PRECIOVENTA2');
    DropColumnIfExists('INVENTARIOPISO', 'ESCANEAR_BARCODEALTERNO');
    DropColumnIfExists('INVENTARIOPISO', 'EDITAR_PRECIO_NEW');
    DropColumnIfExists('INVENTARIOPISO', 'SALES_PROMOTION_ID');
    DropColumnIfExists('INVENTARIOPISO', 'RECIPE_PRICE');
    DropColumnIfExists('INVENTARIOPISO', 'RECIPE');
    DropColumnIfExists('INVENTARIOPISO', 'MODIFIER_QTY');
    DropColumnIfExists('INVENTARIOPISO', 'KITCHEN');
    DropColumnIfExists('INVENTARIOPISO', 'HAS_MODIFIER');
    DropColumnIfExists('INVENTARIOPISO', 'DAILY_SALES_START_TIME');
    DropColumnIfExists('INVENTARIOPISO', 'DAILY_SALES_END_TIME');
    DropColumnIfExists('INVENTARIOPISO', 'OTCCARD');
    DropColumnIfExists('INVENTARIOPISO', 'HAS_MODIFIER');
    DropColumnIfExists('INVENTARIOPISO', 'MODIFIER_QTY');
    DropColumnIfExists('INVENTARIOPISO', 'MEASUREMENT_TIME');
    DropColumnIfExists('INVENTARIOPISO', 'MEASUREMENT_DATE');
    DropColumnIfExists('INVENTARIOPISO', 'MEASUREMENT_UNIT');
    DropColumnIfExists('INVENTARIOPISO', 'MEASUREMENT_DIMENSION');
    DropColumnIfExists('INVENTARIOPISO', 'MEASUREMENT_VALUE');
  end;

  //========================== PRESCRIPTIONS ==================================

  CreateFields('PRESCRIPTIONS', 'PetID', 'INT default(0) NULL');
  with CommonRoutine do
  begin
    DropColumnIfExists('PRESCRIPTIONS', 'refill_automatico');
    DropColumnIfExists('PRESCRIPTIONS', 'PRESC_SRN');
    DropColumnIfExists('PRESCRIPTIONS', 'METRICDECIMALQUANTITY');
    DropColumnIfExists('PRESCRIPTIONS', 'NOREFDISP');
    DropColumnIfExists('PRESCRIPTIONS', 'ANNOTATIONS');
    DropColumnIfExists('PRESCRIPTIONS', 'STATUS_RX');
    DropColumnIfExists('PRESCRIPTIONS', 'HORA');
    DropColumnIfExists('PRESCRIPTIONS', 'CONTROLADO');
    DropColumnIfExists('PRESCRIPTIONS', 'FECHAVENTA');
    DropColumnIfExists('PRESCRIPTIONS', 'DAW');
    DropColumnIfExists('PRESCRIPTIONS', 'DIASSUPLIDOS');
    DropColumnIfExists('PRESCRIPTIONS', 'COBRADO_POS');
    DropColumnIfExists('PRESCRIPTIONS', 'DELIVERY');
  end;
  CreateFields('PRESCRIPTIONS', 'DEACTIVATED_REASON', 'VARCHAR(50) null');
  CreateFields('PRESCRIPTIONS', 'DEACTIVATED_BY', 'CHAR(3) null');
  CreateFields('PRESCRIPTIONS', 'DEACTIVATED_DATE', 'DATETIME null');
  CreateFields('PRESCRIPTIONS', 'GUID', 'VARCHAR(36) null');
  CreateFields('PRESCRIPTIONS', 'VETERINARY', 'bit NULL');
  ExecSql('UPDATE PRESCRIPTIONS SET BATCH_NUMBER = 0');
  CreateFields('PRESCRIPTIONS', 'SCHEDULE_RX_ID_NO', 'NCHAR(12) null');
  CreateFields('PRESCRIPTIONS', 'RECORD_LOCKED', 'bit default(0) null');
  CreateFields('PRESCRIPTIONS', 'CANCELED_BY_PRESCRIBER', 'bit null');
  CreateFields('PRESCRIPTIONS', 'DAYS_SUPPLY', 'INT NULL ');
  CreateFields('PRESCRIPTIONS', 'INSTANCIA', 'INT NULL');
  CreateFields('PRESCRIPTIONS', 'generic_drug_exchange', 'bit default(0) null');
  CreateFields('PRESCRIPTIONS', 'AUTOMATIC_REFILL', 'bit default(0) null');
  CreateFields('PRESCRIPTIONS', 'DEFAULT_LANGUAGE_SIG', 'nchar(296)');
  CreateFields('PRESCRIPTIONS', 'F340B', 'bit null');
  CreateFields('PRESCRIPTIONS', 'LTC', 'bit null');
  //=============== Facilities ============================================
  CreateFields('FACILITY', 'PlaceofService', 'int null');
  CreateFields('FACILITY', 'BILLING', 'BIT null');
  //=============== TABLE OTC ==============================================
  //CreateFields('OTC', 'SP', 'NCHAR(20) null');
  CreateFields('OTC', 'CLINICAL_ALERT_LEVEL',  'INT NULL');
  CreateFields('OTC', 'CLINICAL_HAS_INTERACTION', 'BIT NULL');
  CreateFields('OTC', 'CLINICAL_HAS_ALLERGY', 'BIT NULL');
  CreateFields('OTC', 'CLINICAL_HAS_DUPTHERAPY', 'BIT NULL');
  CreateFields('OTC', 'CLINICAL_SIGNATURE', 'VARCHAR(MAX) NULL');
  CreateFields('OTC', 'CLINICAL_WARNING_TEXT', 'VARCHAR(500) NULL');
  CreateFields('OTC', 'CLINICAL_REVIEW_REQUIRED', 'BIT NULL');
  CreateFields('OTC', 'CLINICAL_APPROVED', 'BIT NULL');
  CreateFields('OTC', 'CLINICAL_APPROVED_BY', 'VARCHAR(20) NULL');
  CreateFields('OTC', 'CLINICAL_APPROVED_DATE',  'DATETIME NULL');
  CreateFields('OTC', 'CLINICAL_SOURCE', 'VARCHAR(20) NULL');
  CreateFields('OTC', 'REBATE', 'DECIMAL(18,2) default(0) null');
  CreateFields('OTC', 'PRINTCOPIES', 'INT default(1) null');
  CreateFields('OTC', 'MedRestrict_ID', 'INT default(0) null');
  CreateFields('OTC', 'PLANESMEDICOSNO_PRIMARY', 'INT null');
  //CreateFields('OTC', 'CRN', 'VARCHAR(15) default ' + chr(39) +' '+ chr(39) + ' not null');

  CommonRoutine.DropColumnIfExists('OTC', 'IsCashSale');
  CommonRoutine.DropColumnIfExists('OTC', 'PAIDDATE_REC');
  CommonRoutine.AddConstraintIfNotExistsSafe(
    'dbo.OTC',
    'df_CRN',
    'ADD CONSTRAINT [df_CRN] DEFAULT ('+ chr(39)+chr(39) +') FOR [CRN]',
    Err);
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.otc',
     'df_APPRISS_SENT',
     'ADD  CONSTRAINT [df_APPRISS_SENT]  DEFAULT (0) FOR [APPRISS_SENT]', Err);
  with CommonRoutine do
  begin
    DropColumnIfExists('OTC', 'SCHEDULE_RX_ID_NO');
    DropColumnIfExists('OTC', 'POST_DATE');
    DropColumnIfExists('OTC', 'PICKEDUPBY_RELETION');
    DropColumnIfExists('OTC', 'OTC_BARCODE');
    DropColumnIfExists('OTC', 'DAYS_SUPLY');
  end;

  //ExecSql('ALTER TABLE [OTC] ADD CONSTRAINT DF_IOU DEFAULT 0 FOR IOU');
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.otc',
     'DF_IOU',
     'ADD  CONSTRAINT [DF_IOU]  DEFAULT (0) FOR [IOU]', Err);

  CreateFields('OTC', 'INV_QTY_TODATE', 'DECIMAL(18,2) default(0) null');
  CreateFields('OTC', 'RELATED_OTC_NUMBER', 'INT default(0) null');
  CreateFields('OTC', 'IOU', 'DECIMAL(18,2) default(0) null');
  CreateFields('OTC', 'ALT_QTY', 'DECIMAL(18,2) default(0) null');
  CreateFields('OTC', 'ALT_NDC', 'nchar(11)');
  //=============== TABLE REFILL_REMINDER_SCHEDULE =============================
  CreateFields('REFILL_REMINDER_SCHEDULE', 'APPRISS_SCHEDULE_DATE', 'date null');
  ExecSql('UPDATE REFILL_REMINDER_SCHEDULE SET APPRISS_SCHEDULE_DATE = getdate() - 1 WHERE APPRISS_SCHEDULE_DATE IS NULL');

  //=============== TABLE NEXT_RXNUMBER ========================================
  CreateFields('NEXT_RXNUMBER', 'SIGNATURE_LINK', 'INT null');
  CreateFields('NEXT_RXNUMBER', 'REFERENCE_NO', 'INT null');
  ExecSql('UPDATE NEXT_RXNUMBER SET REFERENCE_NO = 0 WHERE REFERENCE_NO IS NULL');


  //================= printers ===================================================
   CreateFields('PRINTERS', 'PRINTER_ID', 'int null');
   CreateFields('PRINTERS', 'PAT_EDUCATION_ONLY', 'bit null');
   CreateFields('PRINTERS', 'REPRINT_ONLY', 'bit null');
   CreateFields('PRINTERS', 'DEFAULT_HISTORY_LABEL', 'bit null');
   CreateFields('PRINTERS', 'DEFAULT_NEWRX_LABEL', 'bit null');
   CreateFields('PRINTERS', 'DEFAULT_OTC_LABEL', 'bit null');
   SQLStr := 'select column_name from INFORMATION_SCHEMA.columns where table_name = '
              + chr(39) + 'PRINTERS' + chr(39)
              + ' and column_name = ' + chr(39) + 'DEFAULT_RX_PRINTER' + chr(39);
   QBorrarNonMatchedNDC.SQL.Text := SQLStr;
   QBorrarNonMatchedNDC.Open;
   if QBorrarNonMatchedNDC.RecordCount > 0 then
   begin
     ExecSql('UPDATE PRINTERS SET DEFAULT_NEWRX_LABEL = DEFAULT_RX_PRINTER');
     ExecSql('UPDATE PRINTERS SET DEFAULT_OTC_LABEL = DEFAULT_OTC_PRINTER');
     ExecSql('ALTER TABLE PRINTERS DROP COLUMN DEFAULT_RX_PRINTER');
     ExecSql('ALTER TABLE PRINTERS DROP COLUMN DEFAULT_OTC_PRINTER');
     ExecSql('UPDATE PRINTERS SET PAT_EDUCATION_ONLY = 0 WHERE PAT_EDUCATION_ONLY IS NULL');
     ExecSql('UPDATE PRINTERS SET DEFAULT_HISTORY_LABEL = 0');
     ExecSql('UPDATE PRINTERS SET DEFAULT_HISTORY_LABEL = 1 WHERE DEFAULT_NEWRX_LABEL = 0 AND DEFAULT_OTC_LABEL = 0 AND PAT_EDUCATION_ONLY = 0');
   end;
   //================== Health Plans =============================================
  FDQuery1.SQL.Text := 'SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'PLANESMEDICOS' + chr(39) + ' AND ' +
       ' COLUMN_NAME = ' + chr(39) + 'NOMBRE' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('CHARACTER_MAXIMUM_LENGTH').Value <> 50 then
  begin
    ExecSql('ALTER TABLE PLANESMEDICOS ALTER COLUMN NOMBRE NCHAR(50)');
  end;
  //=============== change lABEL DataType to nchar(150) ==========================
  FDQuery1.SQL.Text := 'SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'LABELCODES' + chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'ENGLISH' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('CHARACTER_MAXIMUM_LENGTH').Value <> 296 then
  begin
    ExecSql('ALTER TABLE LABELCODES ALTER COLUMN SPANISH NCHAR(296)');
    ExecSql('ALTER TABLE LABELCODES ALTER COLUMN ENGLISH NCHAR(296)');
    ExecSql('ALTER TABLE LABELCODES ALTER COLUMN PORTUGUESE NCHAR(296)');
    ExecSql('ALTER TABLE LABELCODES ALTER COLUMN VIETNAMESE NCHAR(296)');
    ExecSql('ALTER TABLE LABELCODES ALTER COLUMN CHINESE NCHAR(296)');
  end;
  CommonRoutine.DropColumnIfExists('LABELCODES', 'INDICATIONS_VIET');
  //ExecSql('ALTER TABLE LABELCODES DROP COLUMN INDICATIONS_VIET');



  //=======================REFILL QUERY=========================================
    CreateFields('RX_QUEUE', 'OTCNUMBER', 'INT null');
    CreateFields('RX_QUEUE', 'REFILL_QUERY_ID', 'INT null');
    CreateFields('REFILL_QUERY', 'SCAN_RX_LINK', 'INT NULL');
    CreateFields('REFILL_QUERY', 'PATIENT_ID', 'INT NULL');
    CreateFields('REFILL_QUERY', 'PRIORITY', 'INT NULL');

    CreateFields('REFILL_QUERY', 'MSGHUB_ACTION_ID', 'BIGINT NULL');
    CreateFields('REFILL_QUERY', 'MSGHUB_INBOUND_ID', 'BIGINT NULL');
    CreateFields('REFILL_QUERY', 'MSGHUB_OUTBOUND_ID', 'BIGINT NULL');
    CreateFields('REFILL_QUERY', 'MSGHUB_ENTERPRISE_PATIENT_ID', 'uniqueidentifier NULL');
    CreateFields('REFILL_QUERY', 'MSGHUB_SOURCE', 'Varchar(30) NULL');
    CreateFields('REFILL_QUERY', 'MSGHUB_PAYLOAD_JSON', 'varchar(max) null');
    CreateFields('REFILL_QUERY', 'MSGHUB_CREATED_AT', 'datetime2(0) NULL');
    CreateFields('REFILL_QUERY', 'MSGHUB_STATUS', 'Varchar(30) NULL');
  //============================================================================


  //============  Planes medicos=============================================
  ExecSql(PLANESMEDICOS_SWITCH.SQL.Text);
  CreateFields('BILLING_SWITCH', 'PDN_ROUTING_CODE', 'varchar(10) null');
  ExecSql(BILLING_SWITCH.SQL.Text);
  ExecSql(qryAddSwitches.SQL.Text);
  ExecSql(UpdatePlanesMedicosSwitch.SQL.Text);

  CreateFields('PLANESMEDICOS', 'Processor', 'varchar(150) null');
  CreateFields('PLANESMEDICOS', 'ProcessorCode', 'varchar(100) null');
  CreateFields('PLANESMEDICOS', '[Group]', 'varchar(100) null');
  CreateFields('PLANESMEDICOS', 'Network', 'varchar(100) null');

  if  CommonRoutine.ColumnNeedsAlter(
     'PLANESMEDICOS',
     'SOFTWARE_VENDOR_ID',
     'VARCHAR',
     50,
     True) then
    begin
      ExecSql(' ALTER TABLE dbo.PLANESMEDICOS ALTER COLUMN SOFTWARE_VENDOR_ID VARCHAR(50) NULL');
    end;
   if  CommonRoutine.ColumnNeedsAlter(
     'PLANESMEDICOS',
     'Processor',
     'VARCHAR',
     150,
     True) then
    begin
      ExecSql(' ALTER TABLE dbo.PLANESMEDICOS ALTER COLUMN SOFTWARE_VENDOR_ID VARCHAR(50) NULL');
    end;




  CommonRoutine.DropConstraintIfExistsSafe('PLANESMEDICOS', 'PK_PLANESMEDICOS', Err);
  //ExecSql('ALTER TABLE dbo.PLANESMEDICOS ADD CONSTRAINT PK_PLANESMEDICOS PRIMARY KEY (PLANESMEDICOSNO)');
  CommonRoutine.CreatePrimaryKeyIfNotExists('PLANESMEDICOS', 'PK_PLANESMEDICOS', 'PLANESMEDICOSNO', 'dbo');
  CreateFields('PLANESMEDICOS', 'PAYMENT_TYPE', 'char(2) default('+ chr(39) + '04' + chr(39)+') null');
  ExecSql('Update PlanesMedicos set PAYMENT_TYPE = '+ chr(39) + '04' + chr(39)+' where PAYMENT_TYPE IS NULL');
  ExecSql('Update PlanesMedicos set PAYMENT_TYPE = '+ chr(39) + '01' + chr(39)+' where ABREVIATURA = ' + chr(39)+ 'CAS' + CHR(39));
  CreateFields('PLANESMEDICOS', 'RESTRICTED', 'bit default(0) null');
  ExecSql('Update PlanesMedicos set RESTRICTED = 0 where RESTRICTED IS NULL');
  CreateFields('PLANESMEDICOS', 'RELAY_HEALTH', 'INT default(1) null');
  ExecSql('Update PlanesMedicos set RELAY_HEALTH = 1 where RELAY_HEALTH IS NULL');
  CreateFields('PLANESMEDICOS', 'CHANGE_HEALTHCARE', 'INT default(2) null');
  ExecSql('Update PlanesMedicos set CHANGE_HEALTHCARE = 2 where CHANGE_HEALTHCARE IS NULL');
  CreateFields('PLANESMEDICOS', 'RSI', 'INT default(1) null');
  ExecSql('Update PlanesMedicos set RSI = 3 where RSI IS NULL');
  CommonRoutine.DropColumnIfExists('PlanesMedicos', 'SWITCH');

  CreateFields('PLANESMEDICOS', 'PROFIT_SHARING_PERC', 'decimal(18,2) null');
  ExecSql('Update PlanesMedicos set PROFIT_SHARING_PERC = 0 where PROFIT_SHARING_PERC IS NULL');

  FDQuery1.SQL.Text := 'SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'PLANESMEDICOS' + chr(39) + ' AND ' +
       ' COLUMN_NAME = ' + chr(39) + 'MANUAL_PLAN' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('CHARACTER_MAXIMUM_LENGTH').Value = 1 then
  begin
    CreateFields('PLANESMEDICOS', 'MULTIPLE_RX_CLAIMS', 'BIT default(1) null');
    CreateFields('PLANESMEDICOS', 'PAPER_CLAIM', 'BIT default(1) null');
    ExecSql('Update PlanesMedicos set MULTIPLE_RX_CLAIMS = 1 where MULTI_RECETA = ' + chr(39) + 'T' + chr(39));
    ExecSql('Update PlanesMedicos set MULTIPLE_RX_CLAIMS = 0 where MULTI_RECETA <> ' + chr(39) + 'T' + chr(39));
    ExecSql('Update PlanesMedicos set PAPER_CLAIM = 1 where MANUAL_PLAN = ' + chr(39) + 'T' + chr(39));
    ExecSql('Update PlanesMedicos set PAPER_CLAIM = 0 where MANUAL_PLAN = ' + chr(39) + 'F' + chr(39));
  end;
  ExecSql('Update PlanesMedicos set PAPER_CLAIM = 0 where PAPER_CLAIM IS NULL');
  CommonRoutine.DropColumnIfExists('PlanesMedicos', 'MULTI_RECETA');
  CommonRoutine.DropColumnIfExists('PlanesMedicos', 'COMPOUND_SEGMENT');
  CommonRoutine.DropColumnIfExists('PlanesMedicos', 'MANUAL_PLAN');
  ExecSql('Update PlanesMedicos set LTC_SERVICE_PROVIDER_ID = '+chr(39)+chr(39)+' where LTC_SERVICE_PROVIDER_ID IS NULL');
  ExecSql('Update PlanesMedicos set LTC_SERVICE_PROVIDER_QUAL = '+chr(39)+chr(39)+' where LTC_SERVICE_PROVIDER_QUAL IS NULL');
  CreateFields('PLANESMEDICOS', 'LTC_SERVICE_PROVIDER_ID', 'nchar(15) null');
  CreateFields('PLANESMEDICOS', 'LTC_SERVICE_PROVIDER_QUAL', 'char(2) null');
  CreateFields('PLANESMEDICOS', 'SCC_420_DK', 'char(2) null');
  CreateFields('PLANESMEDICOS', 'LTC', 'bit null');
  ExecSql('Update PlanesMedicos set LTC = 0 where LTC IS NULL');
  CommonRoutine.DropColumnIfExists('PLANESMEDICOS', 'SCHEMA1');
  CreateFields('PLANESMEDICOS', 'F340B', 'bit null');
  ExecSql('Update PlanesMedicos set F340B = 0 where F340B IS NULL');
  CreateFields('PLANESMEDICOS', 'OTHER_COVERAGE_CODE_DEFAULT', 'char(1) NULL');
  ExecSql('UPDATE PLANESMEDICOS SET OVERRIDE_SYSTEM_DEFAULT_PRICE = 1 WHERE PRICE_TABLE_ID > 0');
  CommonRoutine.DropColumnIfExists('PLANESMEDICOS', 'MEDIGAP_ID');
  CommonRoutine.DropColumnIfExists('PLANESMEDICOS', 'MEDICAID_INDI');
  CommonRoutine.DropColumnIfExists('PLANESMEDICOS', 'PAAI');
  CommonRoutine.DropColumnIfExists('PLANESMEDICOS', 'PP997_G2');
  CommonRoutine.DropColumnIfExists('PLANESMEDICOS', 'MEDICAID_ID_NUMBER');
  CommonRoutine.DropColumnIfExists('PLANESMEDICOS', 'MEDICAID_AGENCY_NUMBER');
  CommonRoutine.DropColumnIfExists('PLANESMEDICOS', 'CARDHOLDERID');


  //=========================================================================


  //====================INVENTROY REPORT=======================

  CreateFields('INVENTORY_INOUT_REPORT', 'INV_QTY_TODATE', 'DECIMAL(18,2) default(0) null');
  CreateFields('INVENTORY_INOUT_REPORT', 'expiration_date', 'date NULL');
  CreateFields('INVENTORY_INOUT_REPORT', 'inventory', 'DECIMAL(18,2) null');
  CreateFields('INVENTORY_INOUT_REPORT', 'qty_max', 'DECIMAL(18,2) null');
  CreateFields('INVENTORY_INOUT_REPORT', 'qty_min', 'DECIMAL(18,2) null');
  CreateFields('INVENTORY_INOUT_REPORT', 'retail_price', 'DECIMAL(18,2) null');
  CreateFields('INVENTORY_INOUT_REPORT', 'ndc', 'NCHAR(11) null');
  CreateFields('INVENTORY_INOUT_REPORT', 'po', 'nchar(15) null');
  CreateFields('INVENTORY_INOUT_REPORT', 'customer_supplier', 'nchar(45) null');
  CreateFieldsImages2('IMAGES', 'UPLOADED_CLOUD', 'bit default(0) NOT NULL');
  //==============WILLCALL_STATUS===============================================
  ExecQry(
    'IF EXISTS (' +
    '   SELECT 1 ' +
    '   FROM INFORMATION_SCHEMA.COLUMNS ' +
    '   WHERE TABLE_NAME = ''WILLCALL'' ' +
    '     AND COLUMN_NAME = ''BAG_NUMBER'' ' +
    '     AND DATA_TYPE IN (''nchar'', ''nvarchar'', ''char'', ''varchar'') ' +
    ') ' +
    'AND NOT EXISTS (' +
    '   SELECT 1 ' +
    '   FROM dbo.WILLCALL ' +
    '   WHERE TRY_CAST(BAG_NUMBER AS INT) IS NULL ' +
    '     AND LTRIM(RTRIM(BAG_NUMBER)) <> '''' ' +
    ') ' +
    'BEGIN ' +
    '   ALTER TABLE dbo.WILLCALL ' +
    '   ALTER COLUMN BAG_NUMBER INT ' +
    'END'
  );

  CreateFields('WILLCALL_STATUS', 'DONE', 'bit default(0) null');
  ExecSql('UPDATE WILLCALL_STATUS SET DONE = 1 WHERE DONE IS NULL');
  CreateFields('WILLCALL_STATUS_HISTORY', 'DONE', 'bit null');
  CreateFields('WILLCALL_STATUS', 'GUID', 'NCHAR(36) null');
  CreateFields('WILLCALL_STATUS_HISTORY', 'GUID', 'NCHAR(36) null');

  CommonRoutine.DropColumnIfExists('', 'ADDRESS1');
  CommonRoutine.DropColumnIfExists('WILLCALL_STATUS', 'ADDRESS2');
  CommonRoutine.DropColumnIfExists('WILLCALL_STATUS', 'CITY');
  CommonRoutine.DropColumnIfExists('WILLCALL_STATUS', 'ZIPCODE');
  CommonRoutine.DropColumnIfExists('WILLCALL_STATUS', 'NAME');
  CommonRoutine.DropColumnIfExists('WILLCALL_STATUS', 'LASTNAME');
  CommonRoutine.DropColumnIfExists('WILLCALL_STATUS', 'MAIDENNAME');
  CommonRoutine.DropColumnIfExists('WILLCALL_STATUS_HISTORY', 'ADDRESS1');
  CommonRoutine.DropColumnIfExists('WILLCALL_STATUS_HISTORY', 'ADDRESS2');
  CommonRoutine.DropColumnIfExists('WILLCALL_STATUS_HISTORY', 'CITY');
  CommonRoutine.DropColumnIfExists('WILLCALL_STATUS_HISTORY', 'ZIPCODE');
  CommonRoutine.DropColumnIfExists('WILLCALL_STATUS_HISTORY', 'NAME');
  CommonRoutine.DropColumnIfExists('WILLCALL_STATUS_HISTORY', 'LASTNAME');
  CommonRoutine.DropColumnIfExists('WILLCALL_STATUS_HISTORY', 'MAIDENNAME');

  //============================================================================

  CreateFields('PRINT_QUERIES', 'PRINT_PATIENT_EDUCATION', 'bit DEFAULT(1) null');
  CreateFields('PRINT_QUERIES', 'PRINTER_IP', 'NCHAR(15) null');

  //============================================================================

  //======================== Passwords =========================================
  CreateFields('PASSWORDS', 'PROCESS_HANDHELD', 'bit default(0) null');
  CreateFields('PASSWORDS', 'LTC', 'bit null');
  CreateFields('PASSWORDS', 'INV_CHANGE_FACILITY', 'bit null');
  CreateFields('PASSWORDS', 'PHARMACIST_LICENCE', 'VARCHAR(15) null');
  CreateFields('PASSWORDS', 'RX_CHANGE_PRICETABLE', 'bit null');
  ExecSql('update PASSWORDS set RX_CHANGE_PRICETABLE = 0 where RX_CHANGE_PRICETABLE is Null');
  CreateFields('PASSWORDS', 'RX_CHANGE_ORIGINCODE', 'bit null');
  ExecSql('update PASSWORDS set RX_CHANGE_ORIGINCODE = 0 where RX_CHANGE_ORIGINCODE is Null');
  ExecSql('update passwords set PHARMACIST_LICENCE = ' + chr(39) + 'na' + chr(39) + ' where PHARMACIST_LICENCE  is Null');
  CreateFields('PASSWORDS', 'WC_DELETE_RX', 'bit default(0) null');
  ExecSql('UPDATE PASSWORDS SET WC_DELETE_RX = 1 WHERE WC_DELETE_RX IS NULL');
  CreateFields('PASSWORDS', 'POS_MODIFY_PAYOUT', 'bit default(0) null');
  ExecSql('UPDATE PASSWORDS SET POS_MODIFY_PAYOUT = 0 WHERE POS_MODIFY_PAYOUT IS NULL');
  ExecSql('UPDATE PASSWORDS SET CAMBIARCOSTOYPRECIOVENTA = 0 WHERE CAMBIARCOSTOYPRECIOVENTA IS NULL');
  CommonRoutine.DropConstraintIfExistsSafe('passwords', 'PK_PASSWORDS', Err);
  CommonRoutine.CreatePrimaryKeyIfNotExists('passwords', 'PK__PASSWORD__7B9E268E02AAFB66', 'USERNO', 'dbo');
  //ExecSql('ALTER TABLE passwords ADD PRIMARY KEY (USERNO)');
  ExecSql('UPDATE PASSWORDS SET PASSWORD_COL = 123456 WHERE PASSWORD_COL IS NULL');
  //ExecSql('UPDATE PASSWORDS SET PASSWORDCOL = 123456 WHERE PASSWORDCOL IS NULL');
  CreateFields('PASSWORDS', 'RX_PRESCRIPTION_NOTE', 'bit  default(0) null');
  ExecSql('UPDATE PASSWORDS SET RX_PRESCRIPTION_NOTE = 1 WHERE RX_PRESCRIPTION_NOTE IS NULL');
  CreateFields('PASSWORDS', 'RX_UPDATE_INV_BROWSE', 'bit  default(0) null');
  CreateFields('PASSWORDS', 'RX_CONTROLLED_ANOTATE', 'bit  default(0) null');
  ExecSql('UPDATE PASSWORDS SET RX_CONTROLLED_ANOTATE = 1 WHERE RX_CONTROLLED_ANOTATE IS NULL');
  CreateFields('PASSWORDS', 'RX_CONTROLLED_MODIFY', 'bit  default(0) null');
  ExecSql('UPDATE PASSWORDS SET RX_CONTROLLED_MODIFY = 1 WHERE RX_CONTROLLED_MODIFY IS NULL');
  CreateFields('PASSWORDS', 'RX_CONTROLLED_DELETE', 'bit  default(0) null');
  ExecSql('UPDATE PASSWORDS SET RX_CONTROLLED_DELETE = 1 WHERE RX_CONTROLLED_DELETE IS NULL');
  CreateFields('PASSWORDS', 'RX_RECALL_EPRESRIBE_HIST', 'bit  default(0) null');
  CreateFields('PASSWORDS', 'RX_SEC_LEVEL', 'smallint default(1) null');
  CreateFields('PASSWORDS', 'CONTROLLED_SUBSTANCE', 'bit  default(0) null');
  CreateFields('PASSWORDS', 'RX_COTROLLED_LOG', 'bit  default(0) null');
  CreateFields('PASSWORDS', 'RECALL_LOCKED_RX', 'bit  default(0) null');
  ExecSql('UPDATE PASSWORDS SET RECALL_LOCKED_RX = 0 WHERE RECALL_LOCKED_RX IS NULL');
  CreateFields('PASSWORDS', 'POS_CERRAR_CUADRE_ALIMPIRIMIR', 'bit null');
  ExecSql('UPDATE PASSWORDS SET POS_CERRAR_CUADRE_ALIMPIRIMIR = 0 WHERE POS_CERRAR_CUADRE_ALIMPIRIMIR IS NULL');
  CreateFields('PASSWORDS', 'POS_CAMBIAR_PRECIO_INV', 'bit null');
  CreateFields('PASSWORDS', 'POS_LIMITE_CAMBIO_PRECIO', 'bit null');
  CreateFields('PASSWORDS', 'DAILY_EMAIL_REPORTS', 'bit null');
  CreateFields('PASSWORDS', 'EMAIL', 'varchar(80) null');
  CreateFields('PASSWORDS', 'POS_VER_TOTAL_CASH', 'BIT NULL');
  CreateFields('PASSWORDS', 'POS_CUADRE_ADMINISTRADOR', 'BIT NULL');
  CreateFields('PASSWORDS', 'RX_CHANGE_REFILL', 'BIT NULL');
  CreateFields('PASSWORDS', 'RX_CHANGE_QTY', 'BIT NULL');
  CreateFields('PASSWORDS', 'APPRISS', 'BIT NULL');
  CreateFields('PASSWORDS', 'POS_POST_SHOPPER', 'BIT NULL');
  CreateFields('PASSWORDS', 'PHARMACIST_NPI', 'varchar(15) NULL');
  CreateFields('PASSWORDS', 'POS_TAB_CANCEL', 'BIT NULL');
  CreateFields('PASSWORDS', 'POS_ADD_BUTTONS', 'BIT NULL');

  //=============== PACIENTES ===========================================
  CreateFields('PACIENTES', 'NOTIFICATION_MODE_WhatsApp', 'bit default(0) null');
  CommonRoutine.DropColumnIfExists('PACIENTES', 'PATROCINIO');
  CommonRoutine.DropColumnIfExists('PACIENTES', 'CLASIFICATION');
  CommonRoutine.DropColumnIfExists('PACIENTES', 'RETAILPRICE_SELECTED');
  CreateFields('PACIENTES', 'WEIGHT', 'DECIMAL(5,2) null');
  CreateFields('PACIENTES', 'HEIGHT', 'DECIMAL(5,2) null');
  CreateFields('PACIENTES', 'HEIGHT', 'DECIMAL(5,2) null');
  CreateFields('PACIENTES', 'DELIVERY_NOTE', 'VARCHAR(1000) NULL');
  CreateFields('PACIENTES', 'MdRestrict', 'int default(0) null');
  CreateFields('PACIENTES', 'ACTIVE', 'bit default(1) null');
  ExecSql('UPDATE PACIENTES SET ACTIVE = 1');
  CreateFields('PACIENTES', 'REASON_FOR_INACTIVATION', 'NCHAR(15) null');
  ExecSql('UPDATE PACIENTES SET ACTIVE = 0 WHERE DECEASED = 1');
  CreateFields('PACIENTES', 'LTC', 'bit default(0) null');
  CreateFields('PACIENTES', 'LANGUAGE_CODE', 'NCHAR(5) null');
  CreateFields('PACIENTES', 'FAMILY_LINK', 'nchar(36) null');
  CreateFields('PACIENTES', 'AUTOMATIC_REFILL', 'bit default(0) null');
  CreateFields('PACIENTES', 'CLASIFICATION', 'NCHAR(20) null');
  FDQuery1.SQL.Text := 'SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'PACIENTES' + chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'LANGUAGE' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('CHARACTER_MAXIMUM_LENGTH').Value <> 12 then
  begin
    ExecSql('ALTER TABLE PACIENTES ALTER COLUMN LANGUAGE NCHAR(12)');
  end;
  CreateFields('PACIENTES', 'DELIVERY', 'bit null');
  ExecSql('UPDATE PACIENTES SET DELIVERY = 0 WHERE DELIVERY IS NULL');

  ExecSql('ALTER TABLE pacientes ALTER COLUMN FACILITY_ID int NULL');
  ExecSql('ALTER TABLE pacientes ALTER COLUMN DECEASED bit NULL');
  ExecSql('ALTER TABLE pacientes ALTER COLUMN ALLERGY bit NULL');
  ExecSql('ALTER TABLE pacientes ALTER COLUMN OVERRIDE_SYSTEM_DEFAULT_PRICE bit NULL');

  CommonRoutine.DropConstraint('PACIENTES');
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.PACIENTES',
     'DF_PACIENTES_DEUDA',
     'ADD  CONSTRAINT [DF_PACIENTES_DEUDA]  DEFAULT (0) FOR [DEUDA]', Err);
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.PACIENTES',
     'DF_PACIENTES_LIMITECREDITO',
     'ADD  CONSTRAINT [DF_PACIENTES_LIMITECREDITO]  DEFAULT (0) FOR [LIMITECREDITO]', Err);
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.PACIENTES',
     'DF_PACIENTES_LIMITECREDITO',
     'ADD  CONSTRAINT [DF_PACIENTES_LIMITECREDITO]  DEFAULT (0) FOR [LIMITECREDITO]', Err);
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.PACIENTES',
     'DF_PACIENTES_LAWAY',
     'ADD  CONSTRAINT [DF_PACIENTES_LAWAY]  DEFAULT (0) FOR [LAWAY]', Err);
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.PACIENTES',
     'DF_PACIENTES_AUSPICIO',
     'ADD  CONSTRAINT [DF_PACIENTES_AUSPICIO]  DEFAULT (0) FOR [AUSPICIO]', Err);
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.PACIENTES',
     'DF_PACIENTES_VETERANO',
     'ADD  CONSTRAINT [DF_PACIENTES_VETERANO]  DEFAULT (0) FOR [VETERANO]', Err);
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.PACIENTES',
     'DF_PACIENTES_FACILITY_ID',
     'ADD  CONSTRAINT [DF_PACIENTES_FACILITY_ID]  DEFAULT (0) FOR [FACILITY_ID]', Err);
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.PACIENTES',
     'DF_PACIENTES_OVERRIDE_SYSTEM_DEFAULT_PRICE',
     'ADD  CONSTRAINT [DF_PACIENTES_OVERRIDE_SYSTEM_DEFAULT_PRICE]  DEFAULT (0) FOR [OVERRIDE_SYSTEM_DEFAULT_PRICE]', Err);
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.PACIENTES',
     'DF_PACIENTES_ALLERGY',
     'ADD  CONSTRAINT [DF_PACIENTES_ALLERGY]  DEFAULT (0) FOR [ALLERGY]', Err);
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.PACIENTES',
     'DF_PACIENTES_DECEASED',
     'ADD  CONSTRAINT [DF_PACIENTES_DECEASED]  DEFAULT (0) FOR [DECEASED]', Err);
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.PACIENTES',
     'DF_PACIENTES_RECORD_LOCKED',
     'ADD  CONSTRAINT [DF_PACIENTES_RECORD_LOCKED]  DEFAULT (0) FOR [RECORD_LOCKED]', Err);
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.PACIENTES',
     'DF_PACIENTES_INSTANCIA',
     'ADD  CONSTRAINT [DF_PACIENTES_INSTANCIA]  DEFAULT (0) FOR [INSTANCIA]', Err);
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.PACIENTES',
     'DF_PACIENTES_ACTIVE',
     'ADD  CONSTRAINT [DF_PACIENTES_ACTIVE]  DEFAULT (1) FOR [ACTIVE]', Err);


  //ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_AUSPICIO DEFAULT 0 FOR AUSPICIO');
  //ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_DEUDA_WEB DEFAULT 0 FOR DEUDA_WEB');
  //ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_ACCIONES DEFAULT 0 FOR ACCIONES');
  //ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_PATROCINIO DEFAULT 0 FOR PATROCINIO');
  //ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_VETERANO DEFAULT 0 FOR VETERANO');
  //ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_FACILITY_ID DEFAULT 0 FOR FACILITY_ID');
  //ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_OVERRIDE_SYSTEM_DEFAULT_PRICE DEFAULT 0 FOR OVERRIDE_SYSTEM_DEFAULT_PRICE');
  //ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_ALLERGY DEFAULT 0 FOR ALLERGY');
  //ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_DECEASED DEFAULT 0 FOR DECEASED');
  //ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_RECORD_LOCKED DEFAULT 0 FOR RECORD_LOCKED');
  //ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_INSTANCIA DEFAULT 0 FOR INSTANCIA');
  //=============== Inventory==================================================
  //CreateFields('INVENTARIOPISO', 'ALT_NDC', 'NCHAR(11) null');
  CreateFields('INVENTARIOPISO', 'HCPCS_CODE', 'NCHAR(11) null');
  //ExecSql('UPDATE InventarioPiso SET HCPCS_CODE = 03 WHERE HCPCS_CODE IS NULL');
  CreateFields('INVENTARIOPISO', 'PRODUCTSERVIDQUAL', 'CHAR(2) default ((03)) null ');
  ExecSql('UPDATE InventarioPiso SET PRODUCTSERVIDQUAL = ' +chr(39) + '03' + chr(39)+ ' WHERE PRODUCTSERVIDQUAL IS NULL');
  CreateFields('InventarioPiso', 'LTC', 'bit default(0)  null');
  ExecSql('UPDATE InventarioPiso SET LTC = 0 WHERE LTC IS NULL');
  CreateFields('INVENTARIOPISO', 'AP_FRM_SIG', 'VARCHAR(20) null');
  CreateFields('INVENTARIOPISO', 'AP_MTH_SIG', 'VARCHAR(20) null');
  CreateFields('INVENTARIOPISO', 'DOSE_FORM', 'NCHAR(50) null');
  CreateFields('INVENTARIOPISO', 'Unit_of_Measure', 'CHAR(2) null');
  CreateFields('INVENTARIOPISO', 'PRODUCT_CLASSIFICATION', 'NCHAR(20) null');
  CreateFields('INVENTARIOPISO', 'TYPIST', 'NCHAR(3) null');
  CreateFields('INVENTARIOPISO', 'PRODUCT_IMAGE', 'IMAGE null');
  CreateFields('INVENTARIOPISO', 'AAC_PRICE', 'DECIMAL(18,2) null');
  CreateFields('INVENTARIOPISO', 'CUSTOMER_ID_REQUIRED', 'bit null');
  CreateFields('INVENTARIOPISO', 'GENERIC_LNK', 'INT null');
  CreateFields('INVENTARIOPISO', 'SPI', 'VARCHAR(10) null');
  CreateFields('InventarioPiso', 'INV340B_QT', 'decimal(18,2) null');
  CreateFields('InventarioPiso', 'INVLTC_QT', 'decimal(18,2) null');
  CreateFields('InventarioPiso', 'Drug340B', 'bit null');
  ExecSql('UPDATE InventarioPiso SET Drug340B = 0 WHERE Drug340B IS NULL');
  CreateFields('InventarioPiso', 'FactorSig', 'NUMERIC(18,2) null');
  CreateFields('InventarioPiso', 'DF_QTY', 'NUMERIC(18,2) null');
  CreateFields('InventarioPiso', 'DF_SIG', 'CHAR(4) null');
  //CreateFields('INVENTARIOPISO', 'TRIPLES_PRODUCT', 'bit  default(0) null');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'OTCNUMBER');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'QTYINVENTARIO10');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'Gm1');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'Gm2');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'ALWDISC');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'ROUND');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'DepL');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'DepS');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'NLINE');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'EBT');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'Sigis');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'INVENTARIOPISOCard');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'Pseudo');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'pseudoMgD');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'PseudoMgP');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'NonRefund');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'PepSpray');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'MaxPerTx');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'SkipPriceUpd');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'DtSkipPriceUpd');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'SkipPriceUpdInit');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'Gm3');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'line_loc');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'shelf_loc');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'stock_loc');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'ITEM_NUM');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'SIZE_IT');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'LST_MODIF_PR');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'AskID');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'kipPriceDistUpd');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'pseudo');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'pep_spray');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'SHOW_ON_ECOMM');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'BARCODE2');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'DAILY_SALE_ACTIVE');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'DAILY_SPECIAL_PRICE');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'SHOWINDIVIDUAL');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'PRECIOVENTA3');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'PROCESSED_FOOD');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'TRIPLES_PRODUCT');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'CUSTOMER_ID_REQUIRED');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'PRODUCT_CLASSIFICATION');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'TYPIST');
  CommonRoutine.DropColumnIfExists('INVENTARIOPISO', 'PRODUCT_IMAGE');

  //============================================================================

  ExecSql('Update OTC set WC_PICKUP = 0 WHERE WC_PICKUP <> 0');
  CreateFields('OTC', 'GUID', 'VARCHAR(36) null');
  FDQuery1.SQL.Text := 'SELECT MAX(SIGNATURE_LINK) AS SIG_LINK FROM PRESCRIPTION_ESIGNATURE';
  FDQuery1.Open();
  ExecSql('UPDATE NEXT_RXNUMBER SET SIGNATURE_LINK = ' + FDQuery1.FieldByName('SIG_LINK').AsString);

  //==Surescripts===============================================================
  ExecQryCreate(Surescripts.SQL.Text);
  Try
    SQLStr := 'Select count(*) as TCount from Surescripts';
    QBorrarNonMatchedNDC.SQL.Text := SQLStr;
    QBorrarNonMatchedNDC.Open;
    if QBorrarNonMatchedNDC.FieldByName('TCount').Value = 0 then
    begin
      ExecSql('DROP TABLE dbo.Surescripts');
      ExecQryCreate(Surescripts.SQL.Text);
      ExecSql('DROP TABLE dbo.NCI');
      ExecQryCreate(NCI.SQL.Text);
    end;
    SQLStr := 'Select count(*) as TCount from ICD10';
    QBorrarNonMatchedNDC.SQL.Text := SQLStr;
    QBorrarNonMatchedNDC.Open;
    if QBorrarNonMatchedNDC.FieldByName('TCount').Value = 0 then
    begin
      //ExecSql('DROP TABLE dbo.ICD10');
      //ExecQryCreate(ICD10_CREATE.SQL.Text);
      dmICD10.INSERT_ICD10.ExecSQL;
    end;
  Finally
    //
  End;


  ExecQryCreate(QUICK_RX.SQL.Text);
  ExecQryCreate(SurescriptsRX_LABEL.SQL.Text);
  ExecQryCreate(SURESCRIPTS_IP_CLIENTLIST.SQL.Text);
  CreateFields('Surescripts', 'EffectiveDate', 'date default(getdate()) null');
  ExecSql('UPDATE Surescripts SET EffectiveDate = DateReceived WHERE EffectiveDate IS NULL');
  ExecQryCreate(LOG_SURESCRIPTS.SQL.Text);
  ExecQryCreate(INSERT_Surescripts_LOG.SQL.Text);
  CreateFields('Surescripts', 'GUID', 'VARCHAR(36) null');
  CreateFields('Surescripts', 'InsuranceID', 'int null');
  //=================== INSERT LOINC =======================
  Try
    ExecQryCreate(LOINC.SQL.Text);
    SQLStr := 'Select count(*) as TCount from LOINC';
    QBorrarNonMatchedNDC.SQL.Text := SQLStr;
    QBorrarNonMatchedNDC.Open;
    if QBorrarNonMatchedNDC.FieldByName('TCount').Value = 0 then
    begin
      //INSERT_ICD10.ExecSQL;
    end;
  Finally
    //
  End;

  //==========================================================



  ExecSql('update NEXT_RXNUMBER set BATCH_NUMBER_BILLING = 2');

  ExecQryCreate(CONTROLED_LOG.SQL.Text);
  ExecQryCreate(INVENTORY_IMAGE.SQL.Text);



  CreateFieldsBackup('DATABASES', 'RENAME', 'bit  default(0) null');
  ExecSqlBackup('UPDATE DATABASES SET RENAME = 0 WHERE RENAME IS NULL');
  CreateFieldsBackup('DATABASES', 'LAST_CLOUD_BACKUP', 'datetime null');
  CreateFieldsBackup('DATABASES', 'NOTE', 'varchar(max) null');


  CreateFields('OTC', 'DELIVERY', 'bit  default(0) null');
  //CreateFields('OTC_HISTORY', 'DELIVERY', 'bit  default(0) null');
  CreateFields('OTC', 'APPRISS_VOID', 'bit  default(0) null');
  CreateFields('APPRISS', 'VOID', 'bit  default(0) null');
  CreateFields('SCANED_QUEUE', 'TYPIST', 'nchar(3) null');
  CreateFields('SCANED_QUEUE', 'RX_NUMBER', 'bigint null');
  CreateFields('Surescripts', 'Extra_Info', 'varchar(max) null');
  CreateFields('SurescriptsRX_LABEL', 'DATE_CREATED', 'date default(getdate()) null');
  CreateFields('LOG', 'SUCCESSFUL', 'bit null');
  CreateFields('TABS_HEADER', 'TRANS_TYPE', 'nchar(1) null');
  CreateFields('CONTROLED_LOG', 'REFILL_DISPENSED', 'decimal(18,2) default(0) null');
  CreateFields('CONTROLED_LOG', 'QTY_PURCHASED', 'decimal(18,2) default(0) null');
  CreateFields('LOG', 'NOTE', 'VARCHAR(MAX) null');
  CreateFields('LOG', 'CONTROLLED', 'bit null');
  CreateFields('Surescripts', 'ValidDigitalSignature', 'bit  default(0) null');
  CreateFields('OTC', 'RECORD_LOCKED', 'bit  default(0) null');

  //CreateFields('OTC_HISTORY', 'RECORD_LOCKED', 'bit null');

  CreateFields('PACIENTES', 'RECORD_LOCKED', 'bit  default(0) null');

  CreateFields('PACIENTES', 'INSTANCIA', 'INT  default(0) null');
  CommonRoutine.DropColumnIfExists('OTC', 'COTHERAMOUNTCLAIMEDSUB');
  CommonRoutine.DropColumnIfExists('OTC', 'CDSOTCOTHERAMOUNTCLAIMEDSUB');
  CommonRoutine.DropColumnIfExists('OTC', 'OTCOTHERAMOUNTCLAIMEDSUB');


  //=============== change Inventario DataType to nchar(150) ==========================
  FDQuery1.SQL.Text := 'SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'INVENTARIOPISO' + chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'VERSION_DESCRIPTION' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('CHARACTER_MAXIMUM_LENGTH').Value <> 150 then
  begin
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN VERSION_DESCRIPTION NCHAR(150)');
  end;
  //=============================================================================
  FDQuery1.SQL.Text := 'SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'INVENTARIOPISO' + chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'PAKAGE_DESCRIPTION' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('CHARACTER_MAXIMUM_LENGTH').Value <> 150 then
  begin
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN PAKAGE_DESCRIPTION NCHAR(150)');
  end;
  //=============================================================================
  FDQuery1.SQL.Text := 'SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'INVENTARIOPISO' + chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'CASA_FARMACEUTICA' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('CHARACTER_MAXIMUM_LENGTH').Value <> 150 then
  begin
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN CASA_FARMACEUTICA NCHAR(150)');
  end;
  //============================================================================
  //=============== change Pacientes DataType to DECIMAL(18,2) ==========================
  FDQuery1.SQL.Text := 'SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'PRESCRIPTION_ESIGNATURE' + chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'PICKEDUP_ID' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('CHARACTER_MAXIMUM_LENGTH').Value = 10 then
  begin
    ExecSql('ALTER TABLE PRESCRIPTION_ESIGNATURE ALTER COLUMN PICKEDUP_ID NCHAR(20)');
  end;

  //============================================================================
  FDQuery1.SQL.Text := 'SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'PACIENTES' + chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'DIRECCION2' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('CHARACTER_MAXIMUM_LENGTH').Value = 20 then
  begin
    ExecSql('ALTER TABLE PACIENTES ALTER COLUMN DIRECCION2 NCHAR(40)');
  end;
  FDQuery1.SQL.Text := 'SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'WILLCALL_STATUS' + chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'ADDRESS2' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('CHARACTER_MAXIMUM_LENGTH').Value = 20 then
  begin
    ExecSql('ALTER TABLE WILLCALL_STATUS ALTER COLUMN ADDRESS2 NCHAR(40)');
  end;
  FDQuery1.SQL.Text := 'SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'WILLCALL_STATUS_HISTORY' + chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'ADDRESS2' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('CHARACTER_MAXIMUM_LENGTH').Value = 20 then
  begin
    ExecSql('ALTER TABLE WILLCALL_STATUS_HISTORY ALTER COLUMN ADDRESS2 NCHAR(40)');
  end;

  FDQuery1.SQL.Text := 'SELECT CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'REFILL_QUERY' + chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'NOTE' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('CHARACTER_MAXIMUM_LENGTH').Value = 30 then
  begin
    ExecSql('ALTER TABLE REFILL_QUERY ALTER COLUMN NOTE NCHAR(256)');
  end;
  //=============== change Pacientes DataType to DECIMAL(18,2) ==========================
  FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'PACIENTES'+ chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'DEUDA' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('DATA_TYPE').Value <> 'decimal' then
  begin
    ExecSql('ALTER TABLE PACIENTES ALTER COLUMN DEUDA DECIMAL(18,2)');
    ExecSql('ALTER TABLE PACIENTES ALTER COLUMN LIMITECREDITO DECIMAL(18,2)');
    ExecSql('ALTER TABLE PACIENTES ALTER COLUMN LAWAY DECIMAL(18,2)');
    ExecSql('ALTER TABLE PACIENTES ALTER COLUMN AUSPICIO DECIMAL(18,2)');
    ExecSql('ALTER TABLE PACIENTES ALTER COLUMN DEUDA_WEB DECIMAL(18,2)');
    ExecSql('ALTER TABLE PACIENTES ALTER COLUMN ACCIONES DECIMAL(18,2)');
    //ExecSql('ALTER TABLE PACIENTES ALTER COLUMN PATROCINIO DECIMAL(18,2)');
    ExecSql('ALTER TABLE PACIENTES ALTER COLUMN VETERANO DECIMAL(18,2)');
  end;
  //=============== change Respuestas DataType to VARCHAR(MAX) ==========================
  FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'RESPUESTAS'+ chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'RESPUESTA' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('DATA_TYPE').Value = 'char' then
  begin
    ExecSql('ALTER TABLE RESPUESTAS ALTER COLUMN RESPUESTA VARCHAR(MAX)');
  end;
  //=============== change Respuestas DataType to VARCHAR(MAX) ==========================
  FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'CLAIM'+ chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'CLAIM' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('DATA_TYPE').Value = 'varchar' then
  begin
    ExecSql('ALTER TABLE CLAIM ALTER COLUMN CLAIM NVARCHAR(MAX)');
  end;
  //=============== change Log colum Note DataType to VARCHAR(MAX) ==========================
  FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'LOG'+ chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'NOTE' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('DATA_TYPE').Value = 'varchar' then
  begin
    ExecSql('ALTER TABLE LOG ALTER COLUMN NOTE NVARCHAR(MAX)');
  end;
  //======================================================================================
    CommonRoutine.DropConstraint('WILLCALL_STATUS');
    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.WILLCALL_STATUS',
     'DF_TIME_CREATED',
     'ADD  CONSTRAINT [DF_TIME_CREATED]  DEFAULT (GETDATE()) FOR [TIME_CREATED]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.WILLCALL_STATUS',
     'DF_NOTIFICATION0',
     'ADD  CONSTRAINT [DF_NOTIFICATION0]  DEFAULT (0) FOR [NOTIFICATION0]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.WILLCALL_STATUS',
     'DF_RTS',
     'ADD  CONSTRAINT [DF_RTS]  DEFAULT (0) FOR [RTS]', Err);




  //=============== change INVENTARIOPISO DataType to DECIMAL(18,2) ==========================
  FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'INVENTARIOPISO'+ chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'COSTO' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('DATA_TYPE').Value <> 'decimal' then
  begin
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN COSTO DECIMAL(18,2)');
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN RBP DECIMAL(18,2)');
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN ESPECIAL DECIMAL(18,2)');
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN PRECIO DECIMAL(18,2)');
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN CMAXINVENTARIO DECIMAL(18,2)');
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN CMININVENTARIO DECIMAL(18,2)');
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN PRECIO_CAJA DECIMAL(18,2)');
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN QTY_CAJA DECIMAL(18,2)');
    //ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN PRECIO2 DECIMAL(18,2)');
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN PRECIO_DACO DECIMAL(18,2)');
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN PRECIOVENTA2 DECIMAL(18,2)');
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN PRECIOVENTA3 DECIMAL(18,2)');
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN INITIAL_QTY DECIMAL(18,2)');
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN QTYINVENTARIO DECIMAL(18,2)');
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN WAC_PRICE DECIMAL(18,2)');
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN UC_PRICE DECIMAL(18,2)');
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN DIRECT_PRICE DECIMAL(18,2)');
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN MAC_PRICE DECIMAL(18,2)');
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN AAC_PRICE DECIMAL(18,2)');
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN METRICSIZE DECIMAL(18,2)');
  end;
    CommonRoutine.DropConstraint('INVENTARIOPISO');
    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
     'DF_INVENTARIOPISO_FECHA_EXPIRACION',
     'ADD  CONSTRAINT [DF_INVENTARIOPISO_FECHA_EXPIRACION]  DEFAULT (getdate()) FOR [FECHA_EXPIRACION]', Err);
    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
     'DF_INVENTARIOPISO_CMAXINVENTARIO',
     'ADD  CONSTRAINT [DF_INVENTARIOPISO_CMAXINVENTARIO]  DEFAULT (0) FOR [CMAXINVENTARIO]', Err);
    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
     'DF_INVENTARIOPISO_CMAXINVENTARIO',
     'ADD  CONSTRAINT [DF_INVENTARIOPISO_CMAXINVENTARIO]  DEFAULT (0) FOR [CMAXINVENTARIO]', Err);


    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
    'DF_INVENTARIOPISO_CMININVENTARIO',
    'ADD CONSTRAINT [DF_INVENTARIOPISO_CMININVENTARIO] DEFAULT (0) FOR [CMININVENTARIO]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_STATUS',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_STATUS] DEFAULT (''A'') FOR [STATUS]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_PRICE_TABLE_ID',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_PRICE_TABLE_ID] DEFAULT (0) FOR [PRICE_TABLE_ID]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_OVERRIDE_SYSTEM_DEFAULT_PRICE',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_OVERRIDE_SYSTEM_DEFAULT_PRICE] DEFAULT (0) FOR [OVERRIDE_SYSTEM_DEFAULT_PRICE]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_PRICE_UPDATE',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_PRICE_UPDATE] DEFAULT (0) FOR [PRICE_UPDATE]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_PSEUDOEPHEDRINE',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_PSEUDOEPHEDRINE] DEFAULT (0) FOR [PSEUDOEPHEDRINE]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_EDITAR_PRECIO',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_EDITAR_PRECIO] DEFAULT (1) FOR [EDITAR_PRECIO]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_QTYINVENTARIO',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_QTYINVENTARIO] DEFAULT (0) FOR [QTYINVENTARIO]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_COSTO',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_COSTO] DEFAULT (0) FOR [COSTO]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_ESPECIAL',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_ESPECIAL] DEFAULT (0) FOR [ESPECIAL]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_PRECIO',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_PRECIO] DEFAULT (0) FOR [PRECIO]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_RBP',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_RBP] DEFAULT (0) FOR [RBP]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_METRICSIZE',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_METRICSIZE] DEFAULT (0) FOR [METRICSIZE]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_PACKAGESIZE',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_PACKAGESIZE] DEFAULT (0) FOR [PACKAGESIZE]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_ROBOT',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_ROBOT] DEFAULT (0) FOR [ROBOT]', Err);


    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_WAC_PRICE',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_WAC_PRICE] DEFAULT (0) FOR [WAC_PRICE]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_MAC_PRICE',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_MAC_PRICE] DEFAULT (0) FOR [MAC_PRICE]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_DIRECT_PRICE',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_DIRECT_PRICE] DEFAULT (0) FOR [DIRECT_PRICE]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_UC_PRICE',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_UC_PRICE] DEFAULT (0) FOR [UC_PRICE]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_FOODITEM',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_FOODITEM] DEFAULT (0) FOR [FOODITEM]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_INITIAL_QTY',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_INITIAL_QTY] DEFAULT (0) FOR [INITIAL_QTY]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_AAC_PRICE',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_AAC_PRICE] DEFAULT (0) FOR [AAC_PRICE]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.INVENTARIOPISO',
      'DF_INVENTARIOPISO_NONEBC',
      'ADD CONSTRAINT [DF_INVENTARIOPISO_NONEBC] DEFAULT (0) FOR [NONEBC]', Err);


  //=============== change OTC DataType to DECIMAL(18,2) ==========================
  FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'OTC'+ chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'PAGO_PLAN' +chr(39);
  FDQuery1.Open;
  FrmMain.Memo1.Clear;
  if FDQuery1.FieldByName('DATA_TYPE').Value <> 'decimal' then
  begin
    ExecSql('ALTER TABLE OTC ALTER COLUMN PAGO_PLAN DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN DEDUCIBLE DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN TOTAL DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN COSTOVENTA DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN INGREDIENT_COST_PAID DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN INCENTIVE_FEE_PAID DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN DISPENSING_FEE_PAID DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN OTHER_AMOUNT_PAID DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN AMOUNT_COPAY_COINS DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN GANANCIA DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PRECIOFACTURACION DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN UNIT_PRICE DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN DISPENSINGFEE DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PATIENTPAIDAMOUNT DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN SALESTAX DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN GROSSAMOUNTDUE DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN FLAT_SALES_TAXSUB DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN CUPON_VALUE_AMT DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_558_AW DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_559_AX DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN MEDICAID_PAID_AMOUNT DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN INCENTIVE_AMOUNT_SUB DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PROF_SERV_FEE_SUB DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PERCENTAGE_SALES_TAX_SUB DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PERCENTAGE_SALES_TAX_RATE DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN OTHERAMOUNTCLAIMEDSUB DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_521_FL DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_523_FN DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_512_FC DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_513_FD DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_517_FH DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_518_FI DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_520_FK DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_514_FE DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_346_HH DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_347_HJ DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_348_HK DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_571_NZ DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_575_EQ DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_574_2Y DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_572_4U DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_577_G3 DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_133_UJ DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_134_UK DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_135_UM DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_136_UN DECIMAL(18,2)');
    ExecSql('ALTER TABLE OTC ALTER COLUMN PS_137_UP DECIMAL(18,2)');
  end;
  CommonRoutine.DropConstraint('OTC');

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_PAGO_PLAN',
    'ADD CONSTRAINT [DF_OTC_PAGO_PLAN] DEFAULT (0) FOR [PAGO_PLAN]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_DEDUCIBLE',
    'ADD CONSTRAINT [DF_OTC_DEDUCIBLE] DEFAULT (0) FOR [DEDUCIBLE]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_COSTOVENTA',
    'ADD CONSTRAINT [DF_OTC_COSTOVENTA] DEFAULT (0) FOR [COSTOVENTA]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_INGREDIENT_COST_PAID',
    'ADD CONSTRAINT [DF_OTC_INGREDIENT_COST_PAID] DEFAULT (0) FOR [INGREDIENT_COST_PAID]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_INCENTIVE_FEE_PAID',
    'ADD CONSTRAINT [DF_OTC_INCENTIVE_FEE_PAID] DEFAULT (0) FOR [INCENTIVE_FEE_PAID]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_DISPENSING_FEE_PAID',
    'ADD CONSTRAINT [DF_OTC_DISPENSING_FEE_PAID] DEFAULT (0) FOR [DISPENSING_FEE_PAID]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_OTHER_AMOUNT_PAID',
    'ADD CONSTRAINT [DF_OTC_OTHER_AMOUNT_PAID] DEFAULT (0) FOR [OTHER_AMOUNT_PAID]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_AMOUNT_COPAY_COINS',
    'ADD CONSTRAINT [DF_OTC_AMOUNT_COPAY_COINS] DEFAULT (0) FOR [AMOUNT_COPAY_COINS]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_PRECIOFACTURACION',
    'ADD CONSTRAINT [DF_OTC_PRECIOFACTURACION] DEFAULT (0) FOR [PRECIOFACTURACION]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_UNIT_PRICE',
    'ADD CONSTRAINT [DF_OTC_UNIT_PRICE] DEFAULT (0) FOR [UNIT_PRICE]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_PATIENTPAIDAMOUNT',
    'ADD CONSTRAINT [DF_OTC_PATIENTPAIDAMOUNT] DEFAULT (0) FOR [PATIENTPAIDAMOUNT]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_SALESTAX',
    'ADD CONSTRAINT [DF_OTC_SALESTAX] DEFAULT (0) FOR [SALESTAX]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_OTHERAMOUNTCLAIMEDSUB',
    'ADD CONSTRAINT [DF_OTC_OTHERAMOUNTCLAIMEDSUB] DEFAULT (0) FOR [OTHERAMOUNTCLAIMEDSUB]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_DISPENSINGFEE',
    'ADD CONSTRAINT [DF_OTC_DISPENSINGFEE] DEFAULT (0) FOR [DISPENSINGFEE]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_GROSSAMOUNTDUE',
    'ADD CONSTRAINT [DF_OTC_GROSSAMOUNTDUE] DEFAULT (0) FOR [GROSSAMOUNTDUE]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_FLAT_SALES_TAXSUB',
    'ADD CONSTRAINT [DF_OTC_FLAT_SALES_TAXSUB] DEFAULT (0) FOR [FLAT_SALES_TAXSUB]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_MEDICAID_PAID_AMOUNT',
    'ADD CONSTRAINT [DF_OTC_MEDICAID_PAID_AMOUNT] DEFAULT (0) FOR [MEDICAID_PAID_AMOUNT]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_INCENTIVE_AMOUNT_SUB',
    'ADD CONSTRAINT [DF_OTC_INCENTIVE_AMOUNT_SUB] DEFAULT (0) FOR [INCENTIVE_AMOUNT_SUB]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_PERCENTAGE_SALES_TAX_SUB',
    'ADD CONSTRAINT [DF_OTC_PERCENTAGE_SALES_TAX_SUB] DEFAULT (0) FOR [PERCENTAGE_SALES_TAX_SUB]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_PERCENTAGE_SALES_TAX_RATE',
    'ADD CONSTRAINT [DF_OTC_PERCENTAGE_SALES_TAX_RATE] DEFAULT (0) FOR [PERCENTAGE_SALES_TAX_RATE]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_PROF_SERV_FEE_SUB',
    'ADD CONSTRAINT [DF_OTC_PROF_SERV_FEE_SUB] DEFAULT (0) FOR [PROF_SERV_FEE_SUB]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_GANANCIA',
    'ADD CONSTRAINT [DF_OTC_GANANCIA] DEFAULT (0) FOR [GANANCIA]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_FECHA_EXPIRACION',
    'ADD CONSTRAINT [DF_OTC_FECHA_EXPIRACION] DEFAULT (GETDATE()) FOR [FECHAEXPIRACION]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_COBRADO',
    'ADD CONSTRAINT [DF_OTC_COBRADO] DEFAULT (0) FOR [COBRADO]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_FECHAOTC',
    'ADD CONSTRAINT [DF_OTC_FECHAOTC] DEFAULT (GETDATE()) FOR [FECHAOTC]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_NUMEROCLIENTE',
    'ADD CONSTRAINT [DF_OTC_NUMEROCLIENTE] DEFAULT (0) FOR [NUMEROCLIENTE]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_RX_STATUS',
    'ADD CONSTRAINT [DF_OTC_RX_STATUS] DEFAULT (''N'') FOR [RX_STATUS]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_DAYS_SUPPLY',
    'ADD CONSTRAINT [DF_OTC_DAYS_SUPPLY] DEFAULT (0) FOR [DAYS_SUPPLY]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_PAGADA',
    'ADD CONSTRAINT [DF_OTC_PAGADA] DEFAULT (''F'') FOR [PAGADA]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_TIME_RX',
    'ADD CONSTRAINT [DF_OTC_TIME_RX] DEFAULT (GETDATE()) FOR [TIME_RX]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_NUMEROPLAN',
    'ADD CONSTRAINT [DF_OTC_NUMEROPLAN] DEFAULT (0) FOR [NUMEROPLAN]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_METRICDECIMALQUANTITY',
    'ADD CONSTRAINT [DF_OTC_METRICDECIMALQUANTITY] DEFAULT (0) FOR [METRICDECIMALQUANTITY]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_NUMERO_AUTORIZACION',
    'ADD CONSTRAINT [DF_OTC_NUMERO_AUTORIZACION] DEFAULT (''N/A'') FOR [NUMERO_AUTORIZACION]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_SIGNATURE_LINK',
    'ADD CONSTRAINT [DF_OTC_SIGNATURE_LINK] DEFAULT (1) FOR [SIGNATURE_LINK]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_REFILL_NOTIFIED',
    'ADD CONSTRAINT [DF_OTC_REFILL_NOTIFIED] DEFAULT (0) FOR [REFILL_NOTIFIED]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_CLAIM_STATUS',
    'ADD CONSTRAINT [DF_OTC_CLAIM_STATUS] DEFAULT (0) FOR [CLAIM_STATUS]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_ADHERENCE',
    'ADD CONSTRAINT [DF_OTC_ADHERENCE] DEFAULT (0) FOR [ADHERENCE]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_BILL_LATTER',
    'ADD CONSTRAINT [DF_OTC_BILL_LATTER] DEFAULT (0) FOR [BILL_LATTER]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_ALCHEMY_PRODUCTID',
    'ADD CONSTRAINT [DF_OTC_ALCHEMY_PRODUCTID] DEFAULT (0) FOR [ALCHEMY_PRODUCTID]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_MARKETEDPRODUCTID',
    'ADD CONSTRAINT [DF_OTC_MARKETEDPRODUCTID] DEFAULT (0) FOR [MARKETEDPRODUCTID]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_PDN_SENT',
    'ADD CONSTRAINT [DF_OTC_PDN_SENT] DEFAULT (0) FOR [PDN_SENT]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_REFILL_REQ_TRANSNO',
    'ADD CONSTRAINT [DF_OTC_REFILL_REQ_TRANSNO] DEFAULT (0) FOR [REFILL_REQ_TRANSNO]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_BASISOFCOST',
    'ADD CONSTRAINT [DF_OTC_BASISOFCOST] DEFAULT (''01'') FOR [BASISOFCOST]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_CLINICIDNUMBER',
    'ADD CONSTRAINT [DF_OTC_CLINICIDNUMBER] DEFAULT (0) FOR [CLINICIDNUMBER]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_LEVELOFSERVICE',
    'ADD CONSTRAINT [DF_OTC_LEVELOFSERVICE] DEFAULT (0) FOR [LEVELOFSERVICE]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_RXDENIALOVERRIDE',
    'ADD CONSTRAINT [DF_OTC_RXDENIALOVERRIDE] DEFAULT (0) FOR [RXDENIALOVERRIDE]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_PRODUCTSERVIDQUAL',
    'ADD CONSTRAINT [DF_OTC_PRODUCTSERVIDQUAL] DEFAULT (''03'') FOR [PRODUCTSERVIDQUAL]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_UNIT_DOSE_INDICATOR',
    'ADD CONSTRAINT [DF_OTC_UNIT_DOSE_INDICATOR] DEFAULT (1) FOR [UNIT_DOSE_INDICATOR]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_UNIT_OF_MEASURE',
    'ADD CONSTRAINT [DF_OTC_UNIT_OF_MEASURE] DEFAULT (''EA'') FOR [UNIT_OF_MEASURE]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_SUB_CLARIF_CODE',
    'ADD CONSTRAINT [DF_OTC_SUB_CLARIF_CODE] DEFAULT (0) FOR [SUB_CLARIF_CODE]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_OTHERCOVERAGECODE',
    'ADD CONSTRAINT [DF_OTC_OTHERCOVERAGECODE] DEFAULT (0) FOR [OTHERCOVERAGECODE]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_SERVICEPROVIDQUALIFIER',
    'ADD CONSTRAINT [DF_OTC_SERVICEPROVIDQUALIFIER] DEFAULT (''07'') FOR [SERVICEPROVIDQUALIFIER]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_PST_147_U7',
    'ADD CONSTRAINT [DF_OTC_PST_147_U7] DEFAULT (1) FOR [PST_147_U7]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_SPECIAL_PACK_INDI_429_DT',
    'ADD CONSTRAINT [DF_OTC_SPECIAL_PACK_INDI_429_DT] DEFAULT (0) FOR [SPECIAL_PACK_INDI_429_DT]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_DAW',
    'ADD CONSTRAINT [DF_OTC_DAW] DEFAULT (0) FOR [DAW]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_SPIDN_454_EK',
    'ADD CONSTRAINT [DF_OTC_SPIDN_454_EK] DEFAULT (0) FOR [SPIDN_454_EK]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_CODIGOREFILLNUEVO',
    'ADD CONSTRAINT [DF_OTC_CODIGOREFILLNUEVO] DEFAULT (0) FOR [CODIGOREFILLNUEVO]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_RXNUMBERSRNQ',
    'ADD CONSTRAINT [DF_OTC_RXNUMBERSRNQ] DEFAULT (1) FOR [RXNUMBERSRNQ]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_TRANSACTION_CODE',
    'ADD CONSTRAINT [DF_OTC_TRANSACTION_CODE] DEFAULT (''B1'') FOR [TRANSACTION_CODE]', Err);

  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.OTC',
    'DF_OTC_QTY',
    'ADD CONSTRAINT [DF_OTC_QTY] DEFAULT (0) FOR [QTY]', Err);

  CommonRoutine.DropColumnIfExists('OTC', 'QTY10');

    //============= WILLCALL_STATUS Constrains (Default values) =================================================
    CommonRoutine.DropConstraint('WILLCALL_STATUS');
    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.WILLCALL_STATUS',
      'DF_WC_DATE_CREATED',
      'ADD CONSTRAINT [DF_WC_DATE_CREATED] DEFAULT (GETDATE()) FOR [DATE_CREATED]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.WILLCALL_STATUS',
      'DF_WC_CUSTOMER_NUMBER',
      'ADD CONSTRAINT [DF_WC_CUSTOMER_NUMBER] DEFAULT (0) FOR [CUSTOMER_NUMBER]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.WILLCALL_STATUS',
      'DF_WC_REMINDER1',
      'ADD CONSTRAINT [DF_WC_REMINDER1] DEFAULT (0) FOR [REMINDER1]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.WILLCALL_STATUS',
      'DF_WC_REMINDER2',
      'ADD CONSTRAINT [DF_WC_REMINDER2] DEFAULT (0) FOR [REMINDER2]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.WILLCALL_STATUS',
      'DF_WC_REMINDER3',
      'ADD CONSTRAINT [DF_WC_REMINDER3] DEFAULT (0) FOR [REMINDER3]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.WILLCALL_STATUS',
      'DF_WC_STATUS',
      'ADD CONSTRAINT [DF_WC_STATUS] DEFAULT (0) FOR [STATUS]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.WILLCALL_STATUS',
      'DF_WC_NOTIFICATION_MODE1',
      'ADD CONSTRAINT [DF_WC_NOTIFICATION_MODE1] DEFAULT (0) FOR [NOTIFICATION_MODE1]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.WILLCALL_STATUS',
      'DF_WC_NOTIFICATION_MODE2',
      'ADD CONSTRAINT [DF_WC_NOTIFICATION_MODE2] DEFAULT (0) FOR [NOTIFICATION_MODE2]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.WILLCALL_STATUS',
      'DF_WC_NOTIFICATION_MODE1_EMAIL',
      'ADD CONSTRAINT [DF_WC_NOTIFICATION_MODE1_EMAIL] DEFAULT ('''') FOR [NOTIFICATION_MODE1_EMAIL]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.WILLCALL_STATUS',
      'DF_WC_NOTIFICATION_MODE2_TELEPHONE',
      'ADD CONSTRAINT [DF_WC_NOTIFICATION_MODE2_TELEPHONE] DEFAULT ('''') FOR [NOTIFICATION_MODE2_TELEPHONE]', Err);

    CommonRoutine.AddConstraintIfNotExistsSafe('dbo.WILLCALL_STATUS',
      'DF_WC_NOTIFICATION0',
      'ADD CONSTRAINT [DF_WC_NOTIFICATION0] DEFAULT (0) FOR [NOTIFICATION0]', Err);
    {ExecSql('ALTER TABLE [WILLCALL_STATUS] ADD CONSTRAINT DF_WC_DATE_CREATED DEFAULT getdate() FOR DATE_CREATED');
    ExecSql('ALTER TABLE [WILLCALL_STATUS] ADD CONSTRAINT DF_WC_CUSTOMER_NUMBER DEFAULT 0 FOR CUSTOMER_NUMBER');
    ExecSql('ALTER TABLE [WILLCALL_STATUS] ADD CONSTRAINT DF_WC_REMINDER1 DEFAULT 0 FOR REMINDER1');
    ExecSql('ALTER TABLE [WILLCALL_STATUS] ADD CONSTRAINT DF_WC_REMINDER2 DEFAULT 0 FOR REMINDER2');
    ExecSql('ALTER TABLE [WILLCALL_STATUS] ADD CONSTRAINT DF_WC_REMINDER3 DEFAULT 0 FOR REMINDER3');
    ExecSql('ALTER TABLE [WILLCALL_STATUS] ADD CONSTRAINT DF_WC_STATUS DEFAULT 0 FOR STATUS');
    ExecSql('ALTER TABLE [WILLCALL_STATUS] ADD CONSTRAINT DF_WC_NOTIFICATION_MODE1 DEFAULT 0 FOR NOTIFICATION_MODE1');
    ExecSql('ALTER TABLE [WILLCALL_STATUS] ADD CONSTRAINT DF_WC_NOTIFICATION_MODE2 DEFAULT 0 FOR NOTIFICATION_MODE2');
    ExecSql('ALTER TABLE [WILLCALL_STATUS] ADD CONSTRAINT DF_WC_NOTIFICATION_MODE1_EMAIL DEFAULT ' +chr(39) + chr(39)+ ' FOR NOTIFICATION_MODE1_EMAIL');
    ExecSql('ALTER TABLE [WILLCALL_STATUS] ADD CONSTRAINT DF_WC_NOTIFICATION_MODE2_TELEPHONE DEFAULT ' +chr(39) + chr(39)+ ' FOR NOTIFICATION_MODE2_TELEPHONE');
    ExecSql('ALTER TABLE [WILLCALL_STATUS] ADD CONSTRAINT DF_WC_NOTIFICATION0 DEFAULT 0 FOR NOTIFICATION0');}
    //======================================================================================================================



  //================  ICD10 ==========================
  ExecQryCreate(ICD10_DELETE.SQL.Text);
  ExecQryCreate(ICD10_CREATE.SQL.Text);
  //==================================================
  ExecQryCreate(WORKERS_COMPENSATION_SEGMENT.SQL.Text);
  ExecQryCreate(TRANSFER_PROD.SQL.Text);
 //================ Prescription Temp ==========================
  SQLStr := 'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = ' + chr(39) + 'PRESCRIPTIONS_TMP' + chr(39) + ')'
    + ' BEGIN ' +
   'CREATE TABLE [dbo].[PRESCRIPTIONS_TMP](' +
	'[NUMERORECETA] [bigint] NOT NULL,' +
	'[MEDICAMENTO] [nchar](30) NULL,' +
	'[RX_DATE] [datetime] NULL,' +
  'CONSTRAINT [PK_PRESCRIPTIONS_TMP] PRIMARY KEY CLUSTERED' +
  '('+
	'[NUMERORECETA] ASC ' +
  ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]' +
  ') ON [PRIMARY]  END;';
  QBorrarNonMatchedNDC.SQL.Text := SQLStr;
  QBorrarNonMatchedNDC.ExecSQL;
  //============================================================

 //================  TABS HEADER ===============================
   SQLStr := 'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = ' + chr(39) + 'TABS_HEADER' + chr(39) + ')'
    + ' BEGIN ' +
  'CREATE TABLE [dbo].[TABS_HEADER](' +
	'[ID] [int] IDENTITY(1,1) NOT NULL,' +
	'[BUTTON_NAME] [nchar](30) NULL,' +
	'[SERVER] [int] NULL,' +
	'[BUTTON_IMAGE] [image] NULL,' +
	'[GROUP_BALANCE] [decimal](18, 2) DEFAULT(0) NULL,' +
	'[BUTTON_CAPTION] [nchar](30) NULL,' +
  'CONSTRAINT [PK_TABS] PRIMARY KEY CLUSTERED' +
  '(' +
	'[ID] ASC' +
  ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]' +
  ') ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] END;';
  QBorrarNonMatchedNDC.SQL.Text := SQLStr;
  QBorrarNonMatchedNDC.ExecSQL;

  //================  TABS DETAIL ==========================
  SQLStr := 'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = ' + chr(39) + 'TABS_DETAIL' + chr(39) + ')'
    + ' BEGIN ' +
  'CREATE TABLE [dbo].[TABS_DETAIL]( ' +
	'[ID] [int] IDENTITY(1,1) NOT NULL, ' +
	'[TABS_ID] [int] NOT NULL, ' +
	'[CUSTOMER] [nchar](45) NULL, ' +
	'[TELEPHONE] [nchar](13) NULL, ' +
	'[CREDIT_CARD] [nchar](20) NULL, ' +
	'[BALANCE] [decimal](18, 2)  DEFAULT(0) NULL, ' +
	'[TRANSACTIONNUMBER] [int] NOT NULL, ' +
	'[DATE] [datetime] default(getdate()) NULL, ' +
  'CONSTRAINT [PK_TABS_DETAIL] PRIMARY KEY CLUSTERED ' +
  '( ' +
    '[ID] ASC ' +
  ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY] ' +
  ') ON [PRIMARY] end;';
  QBorrarNonMatchedNDC.SQL.Text := SQLStr;
  QBorrarNonMatchedNDC.ExecSQL;
   //=============================== TIME CARD =============================================
   SQLStr := 'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = ' + chr(39) + 'TIMECARD' + chr(39) + ')' +
    ' BEGIN ' +
    'CREATE TABLE [dbo].[TIMECARD](  '+
      '[ID] [int] IDENTITY(1,1) NOT NULL, '+
      '[PUNCH_IN_1] [datetime] NULL, '+
      '[PUNCH_OUT_1] [datetime] NULL, '+
      '[EMPLOYEE] [int] NULL, '+
      '[SHIFT] [varchar](8) NULL, '+
      '[DAILY] [varchar](16) NULL, '+
      '[COMULATIVE] [varchar](8) NULL, '+
      '[PUNCH_IN_2] [datetime] NULL, '+
      '[PUNCH_OUT_2] [datetime] NULL, '+
      '[APPROVED] [bit] DEFAULT(0) NOT NULL, '+
     'CONSTRAINT [PK_TIMECARD] PRIMARY KEY CLUSTERED '+
      '(  '+
        '[ID] ASC '+
     ' )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]  '+
      ') ON [PRIMARY] END';
     QBorrarNonMatchedNDC.SQL.Text := SQLStr;
     QBorrarNonMatchedNDC.ExecSQL;
  //=========================================================


   SQLStr := 'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = ' + chr(39) + 'RECIPE' + chr(39) + ')' +
   ' BEGIN ' +
   'CREATE TABLE [dbo].[RECIPE]( '+
	 '[ID] [int] IDENTITY(1,1) NOT NULL,'+
	 '[PRODUCT_ID] [int] NOT NULL,'+
	 '[DESCRIPCION] [nchar](30) NULL,'+
	 '[QTY] [decimal](18, 2) NULL,'+
	 '[MAIN_PRODUCT_ID] [int] NULL,'+
	 '[COST] [decimal](18, 2) NULL, '+
	 '[PRICE] [decimal](18, 2) NULL,'+
   'CONSTRAINT [PK_RECIPE] PRIMARY KEY CLUSTERED '+
   '(' +
	 '[ID] ASC'+
   ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY] '+
   ') ON [PRIMARY] END';
  //ShowMessage(SQLStr);
  QBorrarNonMatchedNDC.SQL.Text := SQLStr;
  QBorrarNonMatchedNDC.ExecSQL;




   SQLStr := 'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = ' + chr(39) + 'PASSWORD_LOG' + chr(39) + ')' +
    ' BEGIN ' +
    'CREATE TABLE [dbo].[PASSWORD_LOG]( '+
	  '[USERNAME] [varchar](35) NULL, '+
	  '[PASSWORD_COL] [nchar](30) NULL, '+
    '[DATE_TIME] [datetime] NULL, '+
    '[ID] [int] IDENTITY(1,1) NOT NULL, '+
     'CONSTRAINT [PK_PASSWORD_LOG] PRIMARY KEY CLUSTERED '+
    '('+
      '[ID] ASC '+
    ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY] '+
    ') ON [PRIMARY] END';
    QBorrarNonMatchedNDC.SQL.Text := SQLStr;
     QBorrarNonMatchedNDC.ExecSQL;

   //==============================create table Appriss ========================================
   SQLStr := 'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = ' + chr(39) + 'APPRISS' + chr(39) + ')' +
    ' BEGIN ' +
    'CREATE TABLE [dbo].[APPRISS]('+
    '[OTCNUMBER] [int] NULL,'+
    '[NUMERORECETA] [bigint] NULL,'+
    '[PICKED_UP] [date] NULL,'+
    '[DRUG] [varchar](30) NULL,'+
    '[QTY] [decimal](18, 2) NULL,'+
    '[CONTROLADO] [nchar](4) NULL,'+
    '[WF_SIGNATURE] [nchar](30) NULL,'+
    '[NDC] [nchar](11) NULL,'+
    '[SENT] [bit] NULL,'+
    '[COMPOUND] [bit] NULL'+
    ') ON [PRIMARY] END';
    QBorrarNonMatchedNDC.SQL.Text := SQLStr;
    QBorrarNonMatchedNDC.ExecSQL;
  //==========================Create Cars =============================
  SQLStr := 'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = ' + chr(39) + 'CAR' + chr(39) + ')'
    + ' BEGIN ' +
  'CREATE TABLE [dbo].[CAR]('+
	'[NUMEROCLIENTE] [int] NOT NULL,'+
	'[CAR_ID] [int] IDENTITY(1,1) NOT NULL,'+
	'[LICENCE_PLATE] [nchar](10) NULL,'+
	'[BIN_NUMBER] [nchar](20) NULL,'+
	'[YEAR] [date] NULL,'+
	'[COLOR] [nchar](10) NULL,'+
	'[NOTE] [text] NULL,'+
	'[BRAND] [nchar](20) NULL,'+
	'[MODEL] [nchar](20) NULL,'+
  'CONSTRAINT [PK_CAR] PRIMARY KEY CLUSTERED'+
  '('+
    '[CAR_ID] ASC'+
  ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]'+
  ') ON [PRIMARY] TEXTIMAGE_ON [PRIMARY] END';
  QBorrarNonMatchedNDC.SQL.Text := SQLStr;
  QBorrarNonMatchedNDC.ExecSQL;
  //==========================Create Appriss Log========================================================================
  SQLStr := 'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = ' + chr(39) + 'APPRISS_LOG' + chr(39) + ')'
    + ' BEGIN ' +
    'CREATE TABLE [dbo].[APPRISS_LOG]('+
    '[ID] [int] IDENTITY(1,1) NOT NULL, '+
    '[DATE] [date] NULL,'+
    '[DESCRIPTION] [varchar](50) NULL,'+
    '[USER_STR] [nchar](3) NULL,'+
    'CONSTRAINT [PK_APPRISS_LOG] PRIMARY KEY CLUSTERED '+
    '('+
	  '[ID] ASC '+
    ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY] ' +
    ') ON [PRIMARY] END';
  QBorrarNonMatchedNDC.SQL.Text := SQLStr;
  QBorrarNonMatchedNDC.ExecSQL;
  //=============== create table OTC_HISTROY ==========================
  ExecSql('drop table OTC_HISTORY');
  {ExecSql('SELECT * INTO OTC_HISTORY FROM OTC WHERE 1 = 0;');
  ExecSql('ALTER TABLE OTC_HISTORY ADD OTCNUMBER_TMP INT;');
  ExecSql('ALTER TABLE OTC_HISTORY DROP COLUMN OTCNUMBER;');
  ExecSql('EXEC sp_rename ' + chr(39) + 'OTC_HISTORY.OTCNUMBER_TMP' + chr(39) +','+ chr(39) + 'OTCNUMBER' + chr(39) + ',' + chr(39) +'COLUMN' +chr(39));}
  CreateTable('OTC','OTC_HISTORY');
 //============================ Create Prescription and OTC History Tables ===================
  ExecSql('drop table PRESCRIPTIONS_HISTORY');
  CreateTable('PRESCRIPTIONS','PRESCRIPTIONS_HISTORY');
  CreateFields('PRESCRIPTIONS_HISTORY', 'PROXIMOREFILL', 'VARCHAR(15) NULL');
  //==================================================================================================== \



  {//=============== change ORDER_HEADER DataType to datetime ==========================
  FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'ORDER_HEADER'+ chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'TOTAL' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('DATA_TYPE').Value <> 'decimal' then
  begin
    ExecSql('ALTER TABLE ORDER_HEADER ALTER COLUMN RECEIVED DECIMAL(18,2)');
    ExecSql('ALTER TABLE ORDER_HEADER ALTER COLUMN TOTAL DECIMAL(18,2)');
    ExecSql('ALTER TABLE ORDER_HEADER ALTER COLUMN MANEJO DECIMAL(18,2)');
    ExecSql('ALTER TABLE ORDER_HEADER ALTER COLUMN PORCIENTO_GANANCIA DECIMAL(18,2)');
    ExecSql('ALTER TABLE ORDER_HEADER ALTER COLUMN FLETE DECIMAL(18,2)');
  end;
  //=============== change ORDER_DETAIL DataType to datetime ==========================
  FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'ORDER_DETAIL'+ chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'COSTRECEIVED' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('DATA_TYPE').Value <> 'decimal' then
  begin
    ExecSql('ALTER TABLE ORDER_DETAIL ALTER COLUMN COSTRECEIVED DECIMAL(18,2)');
    ExecSql('ALTER TABLE ORDER_DETAIL ALTER COLUMN PRICE DECIMAL(18,2)');
    ExecSql('ALTER TABLE ORDER_HEADER ALTER COLUMN TAMANO DECIMAL(18,2)');
    ExecSql('ALTER TABLE ORDER_DETAIL ALTER COLUMN QTYRECEIVED DECIMAL(18,2)');
    ExecSql('ALTER TABLE ORDER_DETAIL ALTER COLUMN COSTORDERED DECIMAL(18,2)');
    ExecSql('ALTER TABLE ORDER_DETAIL ALTER COLUMN ESPECIAL DECIMAL(18,2)');
    ExecSql('ALTER TABLE ORDER_DETAIL ALTER COLUMN AWP DECIMAL(18,2)');
    ExecSql('ALTER TABLE ORDER_DETAIL ALTER COLUMN TOTAL_VALUE DECIMAL(18,2)');
    ExecSql('ALTER TABLE ORDER_DETAIL ALTER COLUMN QTYORDERED DECIMAL(18,2)');
    ExecSql('ALTER TABLE ORDER_DETAIL ALTER COLUMN PRECIOVENTA2 DECIMAL(18,2)');
    ExecSql('ALTER TABLE ORDER_DETAIL ALTER COLUMN PRECIO_WIC DECIMAL(18,2)');
  end;
  //=============== change TRANSFERED_PRODUCTS DataType to datetime ==========================
  FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'TRANSFERED_PRODUCTS'+ chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'COSTO' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('DATA_TYPE').Value <> 'decimal' then
  begin
    ExecSql('ALTER TABLE TRANSFERED_PRODUCTS ALTER COLUMN SHOWINDIVIDUAL bit');
    ExecSql('ALTER TABLE TRANSFERED_PRODUCTS ALTER COLUMN COSTO DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFERED_PRODUCTS ALTER COLUMN RBP DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFERED_PRODUCTS ALTER COLUMN ESPECIAL DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFERED_PRODUCTS ALTER COLUMN PRECIO DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFERED_PRODUCTS ALTER COLUMN QTYINVENTARIO DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFERED_PRODUCTS ALTER COLUMN CMAXINVENTARIO DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFERED_PRODUCTS ALTER COLUMN CMININVENTARIO DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFERED_PRODUCTS ALTER COLUMN METRICSIZE DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFERED_PRODUCTS ALTER COLUMN PRECIO_CAJA DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFERED_PRODUCTS ALTER COLUMN QTY_CAJA DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFERED_PRODUCTS ALTER COLUMN PRECIO2 DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFERED_PRODUCTS ALTER COLUMN PRECIO_DACO DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFERED_PRODUCTS ALTER COLUMN PRECIOVENTA2 DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFERED_PRODUCTS ALTER COLUMN METRICSIZE DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFERED_PRODUCTS ALTER COLUMN WAC_PRICE DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFERED_PRODUCTS ALTER COLUMN MAC_PRICE DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFERED_PRODUCTS ALTER COLUMN DIRECT_PRICE DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFERED_PRODUCTS ALTER COLUMN UC_PRICE DECIMAL(18,2)');
  end;
  //=============== change TRANSFER_HEADER DataType to datetime ==========================
  FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'TRANSFER_HEADER'+ chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'TOTAL' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('DATA_TYPE').Value <> 'decimal' then
  begin
    ExecSql('ALTER TABLE TRANSFER_HEADER ALTER COLUMN TOTAL DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFER_HEADER ALTER COLUMN SENT DECIMAL(18,2)');
  end;
  //=============== change TRANSFERED_PRODUCTS DataType to datetime ==========================
  FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'TRANSFER_DETAIL'+ chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'COSTORDERED' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('DATA_TYPE').Value <> 'decimal' then
  begin
    ExecSql('ALTER TABLE TRANSFER_DETAIL ALTER COLUMN COSTORDERED DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFER_DETAIL ALTER COLUMN PRICE DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFER_DETAIL ALTER COLUMN QTYORDERED DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFER_DETAIL ALTER COLUMN QTYRECEIVED DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFER_DETAIL ALTER COLUMN TAMANO DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFER_DETAIL ALTER COLUMN COSTSENT DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFER_DETAIL ALTER COLUMN ESPECIAL DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFER_DETAIL ALTER COLUMN AWP DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFER_DETAIL ALTER COLUMN TOTAL_VALUE DECIMAL(18,2)');
    ExecSql('ALTER TABLE TRANSFER_DETAIL ALTER COLUMN PRECIO_WIC DECIMAL(18,2)');
  end;
  }


  CreateFields('Surescripts', 'Qty', 'decimal(18,2) default(0) NULL');
  CreateFields('Surescripts', 'DaysSupply', 'integer default(0) NULL');
  CreateFields('Surescripts', 'Substitution', 'smallint default(0) NULL');
  CreateFields('Surescripts', 'NumberOfRefills', 'integer default(0) NULL');
  CreateFields('Surescripts', 'RxDate', 'Date NULL');

  CreateFields('TRANSACTIONHEADER', 'TAX_PROCESSED_FOOD', 'decimal(18,2) default(0) NULL');
  ExecSql('UPDATE INVENTARIOPISO SET PACKAGESIZE = 0 WHERE PACKAGESIZE IS NULL');
  ExecSql('UPDATE INVENTARIOPISO SET METRICSIZE = 0 WHERE METRICSIZE IS NULL');
  ExecSql('UPDATE INVENTARIOPISO SET COSTO = 0 WHERE COSTO IS NULL');
  ExecSql('UPDATE INVENTARIOPISO SET PRECIO = 0 WHERE PRECIO IS NULL');
  ExecSql('UPDATE INVENTARIOPISO SET RBP = 0 WHERE RBP IS NULL');
  CreateFields('DOCUMENT', 'CustomerNumber','integer null');
  CreateFields('LOG', 'POS_RX', 'CHAR(1) default(' + CHR(39) + 'R' + CHR(39)+ ') null');
  CreateFields('LOG', 'TRANSACTIONNUMBER', 'integer null');

  CreateFields('INVENTARIOPISO', 'QuantityUnitOfMeasure', 'nchar(50) null');
  CreateFields('INVENTARIOPISO', 'StrengthForm', 'nchar(50) null');
  CreateFields('INVENTARIOPISO', 'StrengthUnitOfMeasure', 'nchar(50) null');

  CreateFields('Surescripts', 'RxReferenceNumber', 'bigint default (0) null');
  CreateFields('NEXT_RXNUMBER', 'MessageID', 'integer null');
  ExecSql('update NEXT_RXNUMBER set MessageID = 1000 where MessageID is Null');
  CreateFields('OTC', 'MessageID', 'nchar(40) null');
  CreateFields('OTC_HISTORY', 'MessageID', 'nchar(40) null');
  CreateFields('DAILYTOTALS', 'TAX_PROCESSED_FOOD', 'FLOAT default(0) NULL');
  CreateFields('Surescripts', 'PatDOB', 'Date NULL');
  CreateFields('Surescripts', 'SPI', 'NCHAR(13) NULL');
  CreateFields('Surescripts', 'PrescriberOrderNumber', 'NCHAR(35) NULL');
  //======================= DOCTOR ======================================
  CreateFields('DOCTOR', 'TYPE', 'NVARCHAR(5) null');
  CreateFields('DOCTOR', 'MdRestrict', 'int default(0) null');
  CreateFields('DOCTOR', 'FACILITY_ID', 'INT null');
  CreateFields('DOCTOR', 'Specialty', 'NCHAR(10) null');
  CreateFields('DOCTOR', 'AlternatePhoneNumbers', 'Text null');
  CreateFields('DOCTOR', 'ActiveStartTime61', 'DateTime null');
  CreateFields('DOCTOR', 'ActiveEndTime61', 'DateTime null');
  CreateFields('DOCTOR', 'HOME_PHONE', 'NCHAR(13) null');
  CreateFields('PRESCRIPTION_ESIGNATURE', 'PICKEDUP_BY', 'nchar(45) null');
  CreateFields('PACIENTES', 'ID_IMAGE', 'Integer null');




  ExecSql('UPDATE INVENTARIOPISO SET STRENGTH = ' + chr(39) + chr(39) + ' WHERE NDC > ' + chr(39) + chr(39) + '  AND STRENGTH IS NULL');
  ExecQry('UPDATE OTC SET SPECIAL_PACK_INDI_429_DT = 0 WHERE SPECIAL_PACK_INDI_429_DT IS NULL OR SPECIAL_PACK_INDI_429_DT = ' + chr(39) + chr(39));
  ExecQry('UPDATE OTC SET PRODUCTSERVIDQUAL = ' + chr(39) + '03' + chr(39) + 'WHERE PRODUCTSERVIDQUAL IS NULL OR PRODUCTSERVIDQUAL = ' + chr(39) + chr(39));
  CreateFields('APPRISS', 'SENT', 'bit default(0) NULL');
  CreateFields('APPRISS_LOG', 'NUMBER_OF_RECORDS', 'integer null');
  CreateFields('OTC', 'APPRISS_SENT', 'bit default(0) NULL');

  CreateFields('NEXT_RXNUMBER', 'APPRISS_TRANSACTION_NUMBER', 'integer NULL');

  ExecSql('UPDATE COB_A SET OTCNUMBER = 0 WHERE OTCNUMBER IS NULL');
  ExecSql('DELETE FROM COB_B WHERE NOTRANS = 0');
  ExecSql('DELETE FROM COB_C WHERE NOTRANS = 0');
  ExecSql('DELETE FROM COB_D WHERE NOTRANS = 0');
  ExecSql('DELETE FROM COB_E WHERE NOTRANS = 0');

  ExecSql('UPDATE INVENTARIOPISO SET EDITAR_PRECIO = 1 WHERE EDITAR_PRECIO IS NULL');
  //ExecSql('ALTER TABLE TransactionHeader_TEMP DROP COLUMN AMOUNT_TENDERED');
  //ExecSql('ALTER TABLE TransactionHeader DROP COLUMN AMOUNT_TENDERED');
  //============== deltete transactionnumber from Prescriptions ============================
   Try
   SQLStr := 'IF EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = ' + chr(39) + 'Prescriptions' + chr(39) +
    ' AND [COLUMN_NAME] = ' + chr(39) + 'NUMEROTRANSACCION' + chr(39) + ')'+
           ' BEGIN ' +
              'ALTER TABLE Prescriptions DROP CONSTRAINT PK_Prescriptions ' +
           'END';
   QBorrarNonMatchedNDC.SQL.Text := SQLStr;
   QBorrarNonMatchedNDC.ExecSQL;
   Except
     //
   End;


   SQLStr := 'IF EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = ' + chr(39) + 'Prescriptions' + chr(39) +
    ' AND [COLUMN_NAME] = ' + chr(39) + 'NUMEROTRANSACCION' + chr(39) + ')'+
           ' BEGIN ' +
              'Alter Table Prescriptions drop column NUMEROTRANSACCION ' +
           'END';
   QBorrarNonMatchedNDC.SQL.Text := SQLStr;
   QBorrarNonMatchedNDC.ExecSQL;

   //ExecSql('DROP INDEX [Prescription_NumeroReceta] ON [dbo].[PRESCRIPTIONS]');
   //ExecSql('DROP INDEX [NumeroReceta] ON [dbo].[PRESCRIPTIONS]');


   SQLStr := 'ALTER TABLE Prescriptions ALTER COLUMN NUMERORECETA BIGINT NOT NULL';
   QBorrarNonMatchedNDC.SQL.Text := SQLStr;
   QBorrarNonMatchedNDC.ExecSQL;


   Try
   SQLStr := 'IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_TYPE = ' + chr(39) + 'PRIMARY KEY' + chr(39) + ' AND TABLE_NAME = ' + chr(39) + 'DOCTOR' + chr(39) +
    ' AND TABLE_SCHEMA =' + chr(39) + 'dbo' + chr(39) +')' +
    ' BEGIN ' +
       'ALTER TABLE DOCTOR ADD CONSTRAINT pk_NUMERODOCTOR PRIMARY KEY (NUMERODOCTOR) ' +
    ' END';
   QBorrarNonMatchedNDC.SQL.Text := SQLStr;
   QBorrarNonMatchedNDC.ExecSQL;
   Except
     FrmMain.Memo1.Lines.Add('Error creating Prescriber Table index!')
   End;


   //==============================Create table Dispill========================================
       SQLStr := 'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = ' + chr(39) + 'DISPILL' + chr(39) + ')' +
      ' BEGIN ' +
      'CREATE TABLE [dbo].[DISPILL]('+
      '[NUMERORECETA] [bigint] NOT NULL,'+
      '[FECHA] [date] NULL,'+
      '[PRINTED] [bit] NULL,'+
      '[CODES] [nchar](100) NULL,'+
      '[NUMEROCLIENTE] [int] NOT NULL,'+
      '[DRUG] [varchar](30) NULL,'+
      '[OTCNUMBER] [int] NOT NULL,'+
      '[LABELCODESNO] [int] NULL,'+
      'CONSTRAINT [PK_DISPILL] PRIMARY KEY CLUSTERED'+
      '('+
        '[NUMERORECETA] ASC'+
      ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]'+
      ') ON [PRIMARY] End';
   QBorrarNonMatchedNDC.SQL.Text := SQLStr;
   QBorrarNonMatchedNDC.ExecSQL;





    SQLStr := 'SELECT object_definition(default_object_id) AS definition FROM  sys.columns WHERE  name = ' + chr(39) + 'QTYINVENTARIO' + chr(39) +
    ' AND object_id = object_id(' + chr(39) + 'INVENTARIOPISO' + chr(39) + ')';
    QBorrarNonMatchedNDC.SQL.Text := SQLStr;
    QBorrarNonMatchedNDC.Open;
    if QBorrarNonMatchedNDC.FieldByName('definition').IsNull = True  then
    begin
      SQLStr := 'ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_QTYINVENTARIO DEFAULT 0 FOR QTYINVENTARIO';
      QBorrarNonMatchedNDC.SQL.Text := SQLStr;
      QBorrarNonMatchedNDC.ExecSQL;
    end;




  // ============== Create SALES_PROMOTION Table ===========================================
    SQLStr := 'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = ' + chr(39) + 'SALES_PROMOTION' + chr(39) + ')'
    + ' BEGIN ' +
    'CREATE TABLE [dbo].[SALES_PROMOTION]('+
    '[ID] [int] IDENTITY(1,1) NOT NULL,'+
    '[QTY] [int] NULL,'+
    '[QTY_DISCOUT] [int] NULL,'+
    '[DISCOUNT] [int] NULL,'+
    ' CONSTRAINT [PK_SALES_PROMOTION] PRIMARY KEY CLUSTERED'+
    '('+
    '  [ID] ASC'+
    ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]'+
    ') ON [PRIMARY] END';
    QBorrarNonMatchedNDC.SQL.Text := SQLStr;
    QBorrarNonMatchedNDC.ExecSQL;

    FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'SALES_PROMOTION'+ chr(39) + ' AND ' +
       ' COLUMN_NAME = ' + chr(39) + 'DISCOUNT' +chr(39);
    FDQuery1.Open;
    if FDQuery1.FieldByName('DATA_TYPE').Value <> 'float' then
    begin
      ExecSql('ALTER TABLE SALES_PROMOTION DROP COLUMN DISCOUNT');
      CreateFields('SALES_PROMOTION', 'DISCOUNT', 'FLOAT default(0) NULL');
    end;

    // ============== Create OTC_LABELS Table ===========================================
    SQLStr := 'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = ' + chr(39) + 'OTC_LABELS' + chr(39) + ')'
    + ' BEGIN ' +
    'CREATE TABLE [dbo].[OTC_LABELS]('+
    '[OTCNUMBER] [int] NOT NULL,'+
    '[LABEL] [nchar](296) NULL,'+
    'CONSTRAINT [PK_OTC_LABELS_1] PRIMARY KEY CLUSTERED'+
    '( '+
    '[OTCNUMBER] ASC'+
    ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]'+
    ') ON [PRIMARY] END';
    QBorrarNonMatchedNDC.SQL.Text := SQLStr;
    QBorrarNonMatchedNDC.ExecSQL;

    // ============== Create ICD-10 Table ===========================================
     SQLStr := 'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = ' + chr(39) + 'ICD10' + chr(39) + ')'
    + ' BEGIN ' +
    'CREATE TABLE [dbo].[ICD10]( '+
      '[col1] [int] NULL,'+
      '[col2] [varchar](1) NULL,'+
      '[col3] [varchar](1) NULL,'+
      '[col4] [varchar](2) NULL,'+
      '[col5] [varchar](3) NULL,'+
      '[col6] [varchar](6) NULL,'+
      '[col7] [varchar](5) NULL,'+
      '[col8] [varchar](4) NULL,'+
      '[col9] [varchar](185) NULL,'+
      '[col10] [varchar](5) NULL,'+
      '[col11] [varchar](5) NULL,'+
      '[col12] [varchar](5) NULL,'+
      '[col13] [varchar](5) NULL,'+
      '[col14] [varchar](5) NULL'+
    ') ON [PRIMARY] END';
    QBorrarNonMatchedNDC.SQL.Text := SQLStr;
    QBorrarNonMatchedNDC.ExecSQL;

    // ============== Create BARCODE_PRINTING_Q Table ===========================================
    SQLStr := 'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = ' + chr(39) + 'BARCODE_PRINTING_Q' + chr(39) + ')'
    + ' BEGIN ' +
    'CREATE TABLE [dbo].[BARCODE_PRINTING_Q]('+
    '[ID] [int] IDENTITY(1,1) NOT NULL,'+
    '[PRODUCT] [nchar](35) NULL,'+
    '[PRODUCT_ID] [int] NULL,'+
    '[COPIES] [int] NULL,'+
    '[LAST_SPECIAL] [float] NULL,'+
    '[SPECIAL] [float] NULL,'+
    '[SPECIAL_FROM] [date] NULL,'+
    '[SPECIAL_TO] [date] NULL,'+
    '[RETAIL_PRICE] [float] NULL,'+
    '[REGISTER_NO] [int] NULL,'+
    'CONSTRAINT [PK_BARCODE_PRINTING_Q] PRIMARY KEY CLUSTERED'+
    '('+
      '[ID] ASC'+
    ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]'+
    ') ON [PRIMARY] END';
  QBorrarNonMatchedNDC.SQL.Text := SQLStr;
  QBorrarNonMatchedNDC.ExecSQL;

    SQLStr := 'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = ' + chr(39) + 'SHOPPER_HEADER' + chr(39) + ')'
    + ' BEGIN ' +
    'CREATE TABLE [dbo].[SHOPPER_HEADER](' +
	'[ID] [int] IDENTITY(1,1) NOT NULL,' +
	'[START_DATE] [date] NULL,' +
	'[END_DATE] [date] NULL,' +
	'[DESCRIPTION] [nchar](40) NULL,' +
	'[ACTIVE] [bit] NULL,' +
   'CONSTRAINT [PK_SHPPER] PRIMARY KEY CLUSTERED' +
  '(' +
    '[ID] ASC' +
  ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]' +
  ') ON [PRIMARY] END';
  QBorrarNonMatchedNDC.SQL.Text := SQLStr;
  QBorrarNonMatchedNDC.ExecSQL;

  SQLStr := 'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = ' + chr(39) + 'SHOPPER_DETAIL' + chr(39) + ')'
    + ' BEGIN ' +
    'CREATE TABLE [dbo].[SHOPPER_DETAIL](' +
    '[ID] [int] NOT NULL,' +
    '[PRODUCT] [nchar](35) NULL, ' +
    '[PRODUCT_ID] [int] NULL,' +
    '[COPIES] [int] NULL,' +
    '[LAST_SPECIAL] [float] NULL,' +
    '[SPECIAL] [float] NULL,' +
    '[RETAIL_PRICE] [float] NULL' +
    ') ON [PRIMARY] END';
  QBorrarNonMatchedNDC.SQL.Text := SQLStr;
  QBorrarNonMatchedNDC.ExecSQL;




   CommonRoutine.DropConstraint('APPRISS_LOG');
   CommonRoutine.AddConstraintIfNotExistsSafe('dbo.APPRISS_LOG',
    'DF_APPRISS_LOG_DATE',
    'ADD CONSTRAINT [DF_APPRISS_LOG_DATE] DEFAULT (GETDATE()) FOR [DATE]', Err);





  CreateFields('PACIENTES', 'SIGNATURE_RX_LINK', 'INT NULL');
  CreateFields('INVENTARIOPISO', 'NOTE', 'TEXT NULL');
  CreateFields('BOTONES', 'BUTTON_NAME', 'VARCHAR(20) NULL');

  CreateFields('TRANSACTIONDETAIL_TEMP', 'TERMINO', 'NCHAR(15) NULL');
  CreateFields('TRANSACTIONDETAIL', 'TERMINO', 'NCHAR(15) NULL');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'MAIN_COURSE', 'BIT DEFAULT 0 NULL');
  CreateFields('TRANSACTIONDETAIL', 'MAIN_COURSE', 'BIT DEFAULT 0 NULL');
  CreateFields('INVENTARIOPISO', 'MODIFIER_QTY', 'INT NULL');
  CreateFields('INVENTARIOPISO', 'KITCHEN', 'BIT DEFAULT 0 NULL ');
  CreateFields('TRANSACTIONDETAIL', 'KITCHEN', 'BIT DEFAULT 0 NULL');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'KITCHEN', 'BIT NULL');
  CreateFields('PACIENTES', 'MIDDLE_NAME', 'varchar(12) NULL');
  CreateFields('OTC', 'BATCH_REFILLREQ_DATE', 'DATE NULL');
  CreateFields('OTC', 'REFILL_REQ_TRANSNO', 'INT NULL');
  CreateFields('OTC', 'PRIORAUTHORIZATION', 'VARCHAR(11) NULL');
  CreateFields('OTC', 'RX_SHOW_NOREFDISP_FLOAT', 'BIT NULL');
  CreateFields('CLINICAL_SEGMENT', 'CLINICAL_INFO_COUNTER', 'INT NULL');
  CreateFields('Log', 'PRESCRIBER_ID', 'INT NULL');
  CreateFields('Log', 'CUSTOMER_ID', 'INT NULL');
  CreateFields('Log', 'PASSWORD_ID', 'INT NULL');
  CreateFields('Log', 'HEALTH_PLAN_ID', 'INT NULL');
  CreateFields('Log', 'PATIENT_HEALTH_PLAN_ID', 'INT NULL');
  CreateFields('Log', 'DRUG_ID', 'INT NULL');
  CreateFields('CLAIM', 'OTCNUMBER', 'INT NULL');
  //=========== PATPLAN =======================================================
  if CreateFields('PATPLAN', 'INSURANCE_INDEX', 'INT NULL') = false then
  begin
    ExecQry(qryUpdatePatPlanIndex.SQL.Text);
  end;
  CreateFields('PATPLAN', 'PLANESMEDICOSNO', 'INT NULL');
  CreateFields('PATPLAN', 'COPAY', 'BIT NULL');
  CreateFields('PAT_HEALTH_PLAN', 'PAT_HEALTH_PLAN_ID', 'int IDENTITY(1,1) NOT NULL');
  ExecSql('ALTER TABLE dbo.PAT_HEALTH_PLAN ADD CONSTRAINT PK_PAT_HEALTH_PLAN PRIMARY KEY CLUSTERED (PAT_HEALTH_PLAN_ID);');
  CreateFields('PAT_HEALTH_PLAN', 'NUMEROCLIENTE', 'INT NULL');
  CommonRoutine.DropColumnIfExists('PATPLAN', 'SCHEMA1');
  //===========================================================================
  CreateFields('OTC', 'PLANESMEDICOSNO', 'INT NULL');
  CreateFields('PRIOR_AUTH', 'OTCNUMBER', 'INT NULL');
  CreateFields('FACILITY_ID', 'OTCNUMBER', 'INT NULL');
  CreateFields('PROCEDURE_MODIFIER_CODE', 'OTCNUMBER', 'INT NULL');
  CreateFields('DUR_PPS', 'OTCNUMBER', 'INT NULL');
  CreateFields('COB_A', 'OTCNUMBER', 'INT NULL');
  CreateFields('COB_OTHERPAYMENT', 'OTCNUMBER', 'INT NULL');
  CreateFields('SUB_CLARIFICATION_CODE', 'OTCNUMBER', 'INT NULL');
  CreateFields('CLINICAL_SEGMENT', 'OTCNUMBER', 'INT NULL');
  CreateFields('CLINICAL_SEGMENT_INFO', 'OTCNUMBER', 'INT NULL');
  CreateFields('CLINICAL_SEGMENT_INFO', 'CLINICAL_INFO_COUNTER', 'INT NULL');
  CreateFields('MEZCLAS', 'LOTE', 'NCHAR(12) NULL');
  CreateFields('MEZCLAS', 'FECHA_EXPIRACION', 'DATE NULL');
  CreateFields('MEZCLAS', 'OTCNUMBER', 'INT NULL');
  CreateFields('NEXT_RXNUMBER', 'BATCH_NUMBER_BILLING', 'BIGINT NULL');
  CreateFields('LOG', 'OTCNUMBER', 'INT NULL');
  CreateFields('PRICE_TABLE', 'USUAL_CUSTOMARY_MULT', 'FLOAT NULL DEFAULT 1.5');

  QCreateBackupDB.ExecSQL;
  With FDConnectionBackup.Params do
  begin
    Values['Server'] := ServerName;
    Values['Database'] := 'Backup';
    Values['User_Name'] := 'dbo';
    Values['password'] := 'agabriel';
    //FDConnection1.Connected := True;
  end;
  QCreateBackupDB.Connection := FDConnectionBackup;
  // ============== Create GPSLocation Table ===========================================
  SQLStr := 'IF  NOT EXISTS (SELECT * FROM sys.objects' +
    ' WHERE object_id = OBJECT_ID(N' + chr(39) + '[dbo].[DATABASES]' + chr(39)
    + ') AND type in (N' + chr(39) + 'U' + chr(39) + '))' + ' BEGIN ' +
    'CREATE TABLE [dbo].[DATABASES]( '+
    '[ID] [int] IDENTITY(1,1) NOT NULL, '+
	'[DATABASE_NAME] [char](15) NULL, '+
	'[FOLDER] [nchar](50) NULL, '+
	'[BACKUP_NAME] [nchar](20) NULL, '+
	'[LAST_BACKUP] [datetime] NULL, '+
	'[UPLOADED] [bit] NULL, '+
	'[SERVER_NAME] [nchar](30) NULL, '+
	'[NUMBER_OF_BACKUPS] [int] NULL, '+
  '[ACTIVE] [BIT] NOT NULL DEFAULT(1), '+
  'CONSTRAINT [PK_DATABASE] PRIMARY KEY CLUSTERED  '+
  '( '+
    '[ID] ASC '+
  ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY] '+
  ') ON [PRIMARY] END';
  QCreateBackupDB.SQL.Text := SQLStr;
  QCreateBackupDB.ExecSQL;

  CreateFields('TRANSACTIONDETAIL_TEMP', 'PRINTED', 'BIT NULL DEFAULT(0)');
  CreateFields('TRANSACTIONDETAIL', 'PRINTED', 'BIT NULL');

  CreateFields('INVENTARIOPISO', 'HAS_MODIFIER', 'bit NULL');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'MAIN_COURSE_ID', 'INT NULL');
  CreateFields('TRANSACTIONDETAIL', 'MAIN_COURSE_ID', 'INT NULL');
  CreateFields('NEXT_RXNUMBER', 'MAIN_COURSE_ID', 'INT NULL');
  ExecQry('update NEXT_RXNUMBER set MAIN_COURSE_ID = 0 where MAIN_COURSE_ID is null');
  CreateFields('BOTONES', 'ASSEMBLY_YN', 'bit NULL');
  //===========CreditDebitSetup=================================================
  With FDQuery1 do
  begin
    sql.Text := 'SELECT COLUMN_NAME, CHARACTER_MAXIMUM_LENGTH as MC FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = ' + chr(39) + 'CREDITDEBITSETUP' + chr(39) +' AND COLUMN_NAME = ' + chr(39) + 'WC_SMS_USER' + chr(39);
    open;
    if FieldByName('MC').Value = 30 then
    begin
      ExecSql('ALTER TABLE CREDITDEBITSETUP ALTER COLUMN WC_SMS_USER NCHAR(40)');
    end;
  end;
  CreateFields('CREDITDEBITSETUP', 'PAT_COMPLEX_SEARCH', 'bit null');
  ExecSql('Update CREDITDEBITSETUP set PAT_COMPLEX_SEARCH = 0 where PAT_COMPLEX_SEARCH IS NULL');

  CreateFields('CREDITDEBITSETUP', 'HISTORY_INTERACTIONS', 'bit null');
  ExecSql('Update CREDITDEBITSETUP set HISTORY_INTERACTIONS = 0 where HISTORY_INTERACTIONS IS NULL');
  CreateFields('CREDITDEBITSETUP', 'HISTORY_CHECK_ALLERGIES', 'bit null');
  ExecSql('Update CREDITDEBITSETUP set HISTORY_CHECK_ALLERGIES = 0 where HISTORY_CHECK_ALLERGIES IS NULL');


  CreateFields('CREDITDEBITSETUP', 'Surescripts_Directories', 'VARCHAR(500) NULL');
  ExecSql('Update CREDITDEBITSETUP set Surescripts_Directories = ' + chr(39) + chr(39) + ' where Surescripts_Directories IS NULL');
  CreateFields('CREDITDEBITSETUP', 'GSDD_RequirePharmacistIntervention', 'bit null');
  ExecSql('Update CREDITDEBITSETUP set GSDD_RequirePharmacistIntervention = 0 where GSDD_RequirePharmacistIntervention IS NULL');
  CreateFields('CREDITDEBITSETUP', 'TS_PRINT_COPIES', 'bit null');
  ExecSql('Update CREDITDEBITSETUP set TS_PRINT_COPIES = 0 where TS_PRINT_COPIES IS NULL');
  CreateFields('CREDITDEBITSETUP', 'DAYS_TO_REVERSAL', 'int null');
  ExecSql('Update CREDITDEBITSETUP set DAYS_TO_REVERSAL = 30 where DAYS_TO_REVERSAL IS NULL');
  CreateFields('CREDITDEBITSETUP', 'SHOW_RESPONSE_FORM', 'bit null');
  ExecSql('Update CREDITDEBITSETUP set SHOW_RESPONSE_FORM = 1 where SHOW_RESPONSE_FORM IS NULL');
  CreateFields('CREDITDEBITSETUP', 'GET_SCHEMA', 'bit null');
  ExecSql('Update CREDITDEBITSETUP set GET_SCHEMA = 0 where GET_SCHEMA IS NULL');
  CreateFields('CREDITDEBITSETUP', 'eClaimHOST', 'nchar(50) null');
  ExecSql('Update CREDITDEBITSETUP set eClaimHOST = '+chr(39) + 'rxeclaims.relayhealth.com:443' + chr(39) +' where eClaimHOST IS NULL');
  CreateFields('CREDITDEBITSETUP', 'ALLOW_REFILL_NEWRX', 'bit null');
  ExecSql('Update CREDITDEBITSETUP set ALLOW_REFILL_NEWRX = 0 where ALLOW_REFILL_NEWRX IS NULL');
  CreateFields('CREDITDEBITSETUP', 'ONLY_PRINT_PHARMACYADDRESS', 'bit null');
  ExecSql('Update CREDITDEBITSETUP set ONLY_PRINT_PHARMACYADDRESS = 0 where ONLY_PRINT_PHARMACYADDRESS IS NULL');
  CreateFields('CREDITDEBITSETUP', 'EasyrxUpdateInv', 'bit null');
  ExecSql('UPDATE CREDITDEBITSETUP SET EasyrxUpdateInv = 0 WHERE EasyrxUpdateInv IS NULL');
  CreateFields('CREDITDEBITSETUP', 'LTC_SERVICE_PROVIDER_ID', 'nchar(15) null');
  CreateFields('CREDITDEBITSETUP', 'PLACE_OF_SERVICE', 'char(2) null');
  ExecSql('UPDATE CREDITDEBITSETUP SET PLACE_OF_SERVICE = 1 WHERE PLACE_OF_SERVICE IS NULL');
  CreateFields('CREDITDEBITSETUP', 'LTC_PLACE_OF_SERVICE', 'char(2) null');
  ExecSql('UPDATE CREDITDEBITSETUP SET LTC_PLACE_OF_SERVICE = 5 WHERE LTC_PLACE_OF_SERVICE IS NULL');

  CreateFields('CREDITDEBITSETUP', 'VENDOR', 'NCHAR(15) null');
  FDQuery1.SQL.Text := 'Select Vendor, estado from CREDITDEBITSETUP';
  FDQuery1.Open;
  if FDQuery1.FieldByName('VENDOR').IsNull = true then
  begin
    if FDQuery1.FieldByName('estado').Value = 'PR' then
      FDQuery2.sql.Text := 'Update CREDITDEBITSETUP set vendor = ' + chr(39) + 'WesCom, Inc.' + chr(39)
    else
      FDQuery2.sql.Text := 'Update CREDITDEBITSETUP set vendor = ' + chr(39) + 'WestcoSoft' + chr(39);
    FDQuery2.ExecSQL;
  end;
  CreateFields('CREDITDEBITSETUP', 'SIG_METHOD', 'NCHAR(10) null');
  CreateFields('CREDITDEBITSETUP', 'DAW_BY_BRANDGENERIC', 'bit null');
  ExecSql('UPDATE CREDITDEBITSETUP SET DAW_BY_BRANDGENERIC = 0 WHERE DAW_BY_BRANDGENERIC IS NULL');
  CreateFields('CREDITDEBITSETUP', 'OVERIDE_ORIGIN_CODE', 'bit null');
  ExecSql('UPDATE CREDITDEBITSETUP SET OVERIDE_ORIGIN_CODE = 0 WHERE OVERIDE_ORIGIN_CODE IS NULL');
  CreateFields('CREDITDEBITSETUP', 'IT_EMAIL', 'nchar(80) null');
  CreateFields('CREDITDEBITSETUP', 'IT_COMPANY_NO', 'int null');
  CreateFields('CREDITDEBITSETUP', 'IT_PWRD', 'nchar(15) null');
  CreateFields('CREDITDEBITSETUP', 'CLOUD_IMAGES_DAYS', 'int null');
  CreateFields('CREDITDEBITSETUP', 'DONOTLOGOUT_NEWRX', 'bit null');
  ExecSql('UPDATE CREDITDEBITSETUP SET DONOTLOGOUT_NEWRX = 0 WHERE DONOTLOGOUT_NEWRX IS NULL');
  CreateFields('CREDITDEBITSETUP', 'SQL_D0', 'bit null');
  ExecSql('UPDATE CREDITDEBITSETUP SET SQL_D0 = 0 WHERE SQL_D0 IS NULL');
  CreateFields('CREDITDEBITSETUP', 'WF_ENFORCE_DEA', 'bit null');
  ExecSql('UPDATE CREDITDEBITSETUP SET WF_ENFORCE_DEA = 0 WHERE WF_ENFORCE_DEA IS NULL');
  CreateFields('CREDITDEBITSETUP', 'PATEDU_ONLYONNEWRX', 'bit null');
  ExecSql('UPDATE CREDITDEBITSETUP SET PATEDU_ONLYONNEWRX = 0 WHERE PATEDU_ONLYONNEWRX IS NULL');
  CreateFields('CREDITDEBITSETUP', 'PRINT_PAT_EDU', 'bit null');
  CreateFields('CREDITDEBITSETUP', 'PRINT_PAT_EDU_CONTROLED', 'bit null');
  CreateFields('CREDITDEBITSETUP', 'ENFORCE_ORIGIN_CODES', 'bit null');
  ExecSql('UPDATE CREDITDEBITSETUP SET RR_INCLUDE_CONTROLED_RX = 0 WHERE RR_INCLUDE_CONTROLED_RX IS NULL');
  ExecSql('UPDATE CREDITDEBITSETUP SET NON_WESCOM_STORE = 0 WHERE NON_WESCOM_STORE IS NULL');
  CreateFields('CREDITDEBITSETUP', 'RR_INCLUDE_CONTROLED_RX', 'bit null');
  ExecSql('UPDATE CREDITDEBITSETUP SET ENFORCE_ORIGIN_CODES = 0 WHERE ENFORCE_ORIGIN_CODES IS NULL');
  CreateFields('CREDITDEBITSETUP', 'WC_SMS_PORT', 'int null');
  CreateFields('CREDITDEBITSETUP', 'WC_SMS_LOCAL_HOST', 'nchar(15) null');
  CreateFields('CREDITDEBITSETUP', 'WC_SMS_REMOTE_HOST', 'nchar(80) null');
  CreateFields('CREDITDEBITSETUP', 'POS_UPCSEARCH_ONLY', 'bit default(0) null');
  ExecSql('UPDATE CREDITDEBITSETUP SET POS_UPCSEARCH_ONLY = 0 WHERE POS_UPCSEARCH_ONLY IS NULL');
  CreateFields('CREDITDEBITSETUP', 'WF_CONSIDER_GUID_SEARCH', 'bit default(0) null');
  ExecSql('UPDATE CREDITDEBITSETUP SET WF_CONSIDER_GUID_SEARCH = 0 WHERE WF_CONSIDER_GUID_SEARCH IS NULL');
  ExecSql('UPDATE CREDITDEBITSETUP SET DAW_DEFAULT_VALUE = '+chr(39)+'0'+chr(39)+' WHERE DAW_DEFAULT_VALUE IS NULL');
  CreateFields('CREDITDEBITSETUP', 'SAVE_IMAGES_AMAZON', 'bit default(0) null');
  CreateFields('CREDITDEBITSETUP', 'PERMIT_ZERO_ANYSALE', 'bit default(0) null');
  ExecSql('UPDATE CREDITDEBITSETUP SET PERMIT_ZERO_ANYSALE = 0 WHERE PERMIT_ZERO_ANYSALE IS NULL');
  CreateFields('CREDITDEBITSETUP', 'APPRIS_SFTP_HOST', 'NCHAR(60) null');
  ExecSql('UPDATE CREDITDEBITSETUP SET APPRIS_SFTP_HOST = ' + chr(39) + 'sftp.pmpclearinghouse.net' + chr(39) + ' WHERE APPRIS_SFTP_HOST IS NULL');
  CreateFields('CREDITDEBITSETUP', 'email_carbon_copy', 'bit default(0) null');
  CreateFields('CREDITDEBITSETUP', 'SAVE_IMAGES_AMAZON', 'bit default(0) null');
  CreateFields('CREDITDEBITSETUP', 'SURESCRIPTS_SERVER', 'NCHAR(30) null');
  ExecSql('UPDATE dbo.CREDITDEBITSETUP SET surescripts_server = ' +chr(39)+'https://www.wescomep.org/'+chr(39)+ ' where surescripts_server is null');
  CreateFields('Surescripts', 'GUID', 'varchar(36) null');
  CreateFields('CREDITDEBITSETUP', 'RxTrans', 'bit default(0) null');
  CreateFields('CREDITDEBITSETUP', 'OTC_SALE_ACTIVE', 'BIT null');
  ExecSql('UPDATE CREDITDEBITSETUP SET OTC_SALE_ACTIVE = 1 WHERE OTC_SALE_ACTIVE IS NULL');
  CreateFields('CREDITDEBITSETUP', 'SIGPLUS', 'NCHAR(10) null');
  CreateFields('CREDITDEBITSETUP', 'SURESCRIPTS_MATCH_ALL', 'BIT null');
  CreateFields('CREDITDEBITSETUP', 'SURESCRIPTS_MATCH_DRUG', 'BIT null');
  ExecSql('UPDATE CREDITDEBITSETUP SET SURESCRIPTS_MATCH_ALL = 0 WHERE SURESCRIPTS_MATCH_ALL IS NULL');
  ExecSql('UPDATE CREDITDEBITSETUP SET SURESCRIPTS_MATCH_DRUG = 0 WHERE SURESCRIPTS_MATCH_DRUG IS NULL');
  CreateFields('CREDITDEBITSETUP', 'PMP_USERNAME', 'NCHAR(40) null');
  CreateFields('CREDITDEBITSETUP', 'PMP_PASSWORD', 'NCHAR(40) null');
  CreateFields('CREDITDEBITSETUP', 'PRINT_BARCODE_PARTNUMBER', 'CHAR(1) null');
  CreateFields('CREDITDEBITSETUP', 'BTN_PRINT_RECEIPT', 'bit null');
  CreateFields('CREDITDEBITSETUP', 'QR_CODE', 'IMAGE null');
  CreateFields('CREDITDEBITSETUP', 'GSDD_OVERRIDE_AWP', 'bit null');
  ExecSql('update CREDITDEBITSETUP set GSDD_OVERRIDE_AWP = 0 where GSDD_OVERRIDE_AWP is Null');
  CreateFields('CREDITDEBITSETUP', 'GSDD_OVERRIDE_DRUG_NAME', 'bit null');
  ExecSql('update CREDITDEBITSETUP set GSDD_OVERRIDE_DRUG_NAME = 0 where GSDD_OVERRIDE_DRUG_NAME is Null');
  ExecSql('update CREDITDEBITSETUP set MYREFILL_UPDATE_SMARTPICKUP = 0 where MYREFILL_UPDATE_SMARTPICKUP is Null');
  CreateFields('CREDITDEBITSETUP', 'ENFORCE_LEVEL_OF_SERVICE', 'bit null');
  ExecSql('UPDATE CREDITDEBITSETUP SET ENFORCE_LEVEL_OF_SERVICE = 0 WHERE ENFORCE_LEVEL_OF_SERVICE IS NULL');
  CreateFields('CREDITDEBITSETUP', 'COMPLEX_SEARCH', 'bit null');
  CreateFields('CREDITDEBITSETUP', 'RX_ENFORCE_SIGNATURE_ONCHECKOUT', 'bit null');
  CreateFields('CREDITDEBITSETUP', 'RX_ENFORCERXCHECK_ONCHECKOUT', 'bit null');
  ExecSql('UPDATE CREDITDEBITSETUP SET RX_ENFORCERXCHECK_ONCHECKOUT = 0 WHERE RX_ENFORCERXCHECK_ONCHECKOUT IS NULL');
  CreateFields('CREDITDEBITSETUP', 'WF_CANCEL_CHECKED_ONREVERSAL', 'bit default(0) null');
  ExecSql('UPDATE CREDITDEBITSETUP SET WF_CANCEL_CHECKED_ONREVERSAL = 0 WHERE WF_CANCEL_CHECKED_ONREVERSAL IS NULL');
  CreateFields('CREDITDEBITSETUP', 'INVENTORY_QUERY', 'INT null');
  ExecSql('UPDATE CREDITDEBITSETUP SET INVENTORY_QUERY = 100 WHERE INVENTORY_QUERY IS NULL');
  ExecSql('UPDATE CREDITDEBITSETUP SET CLASSIC_LOGIN = 0');
  CreateFields('CREDITDEBITSETUP', 'CERTIFICATE', 'varbinary(MAX) null');
  CreateFields('CREDITDEBITSETUP', 'ENFORCE_RX_SCAN', 'bit null');
  ExecSql('UPDATE CREDITDEBITSETUP SET ENFORCE_RX_SCAN = 0 WHERE ENFORCE_RX_SCAN IS NULL');
  CreateFields('CREDITDEBITSETUP', 'OVERRIDE_CONTROLLED_RX', 'bit null');
  ExecSql('UPDATE CREDITDEBITSETUP SET OVERRIDE_CONTROLLED_RX = 1 WHERE OVERRIDE_CONTROLLED_RX IS NULL');
  CreateFields('CREDITDEBITSETUP', 'ENFORCE_MARKET_STAUS', 'bit null');
  //ExecSql('UPDATE CREDITDEBITSETUP SET SHOW_MARKET_STAUS = 0 WHERE SHOW_MARKET_STAUS IS NULL');
  CreateFields('CREDITDEBITSETUP', 'IMAGE_DATABASE_IP', 'nchar(30) null');
  CreateFields('CREDITDEBITSETUP', 'SURESCRIPTS_MAILBOX', 'bit NULL');
  ExecSql('UPDATE CREDITDEBITSETUP SET SURESCRIPTS_MAILBOX = 0 WHERE SURESCRIPTS_MAILBOX IS NULL');
  CreateFields('CREDITDEBITSETUP', 'SURESCRIPTS_HTTP_ADDRESS', 'NCHAR(40) NULL');
  CreateFields('CREDITDEBITSETUP', 'MYREFILL_UPDATE_SMARTPICKUP', 'bit null');
  CreateFields('CREDITDEBITSETUP', 'CLEAN_OTC', 'DATE NULL');
  ExecQry('Update CREDITDEBITSETUP set CLEAN_OTC = ' + CHR(39) + DateToStr(Date - 30)  + Chr(39));
  CreateFields('CREDITDEBITSETUP', 'SHOW_IMAGES_NEWRX', 'BIT NULL');
  CreateFields('CREDITDEBITSETUP', 'CHECK_ALLERGIES_NEWRX', 'BIT NULL');
  CreateFields('CREDITDEBITSETUP', 'H_LOGOUT_SECONDS', 'int default(0) NULL');
  CreateFields('CREDITDEBITSETUP', 'SAVEIMAGETODATABASE', 'BIT NULL');
  CreateFields('CREDITDEBITSETUP', 'AMAZON', 'BIT NULL');
  CreateFields('CREDITDEBITSETUP', 'AMAZON_ACCOUNT_KEY', 'NCHAR(50)');
  CreateFields('CREDITDEBITSETUP', 'AMAZON_ACCOUNT_NAME', 'NCHAR(50)');
  CreateFields('CREDITDEBITSETUP', 'AMAZON_BUCKET_NAME', 'NCHAR(20)');
  CreateFields('CREDITDEBITSETUP', 'BYPASS_FIRMA_ELECTRONICA', 'BIT NULL');
  CreateFields('CREDITDEBITSETUP', 'SURESCRIPT_VERSION', 'nchar(10) null');
  CreateFields('CREDITDEBITSETUP', 'SP_SELECTALL', 'bit NULL');
  ExecSql('UPDATE CREDITDEBITSETUP SET SP_SELECTALL = 1');
  CreateFields('CREDITDEBITSETUP', 'BYPASS_PAT_VERIFICATION', 'bit NULL');
  CreateFields('CREDITDEBITSETUP', 'BYPASS_PRESC_VERIFICATION', 'bit NULL');
  CreateFields('CREDITDEBITSETUP', 'PLUGIN_DISPILL', 'bit NULL');
  CreateFields('CREDITDEBITSETUP', 'PLUGIN_APPRISS', 'bit NULL');
  CreateFields('CREDITDEBITSETUP', 'PLUGIN_SMARTPICKUP', 'bit NULL');
  CreateFields('CREDITDEBITSETUP', 'POS_INCLUDE_BATCH', 'bit NULL');
  CreateFields('CREDITDEBITSETUP', 'RX_SHOW_NOREFDISP_FLOAT', 'bit NULL');
  CreateFields('CREDITDEBITSETUP', 'POS_ACTIVE_TIP', 'BIT NULL');
  CreateFields('CREDITDEBITSETUP', 'CD_MERCHANT_ID', 'CHAR(15) NULL');
  CreateFields('CREDITDEBITSETUP', 'CD_TERMINAL_ID', 'CHAR(10) NULL');
  CreateFields('CREDITDEBITSETUP', 'CD_COMUNICATION_PORT', 'CHAR(2) NULL');
  CreateFields('CREDITDEBITSETUP','CD_SERVER_IP','CHAR(30) NULL');;
  CreateFields('CREDITDEBITSETUP','CD_SECUREDEVICE_EMV','CHAR(30) NULL');
  CreateFields('CREDITDEBITSETUP','CD_SECURE_DEVICE','CHAR(30) NULL');
  CreateFields('CREDITDEBITSETUP ','CD_PINPAD_TYPE','CHAR(30) NULL');
  CreateFields('CREDITDEBITSETUP ','CD_LOG_ACTIVATION','BIT NULL');
  CreateFields('CREDITDEBITSETUP','CD_ACTIVE','BIT NULL');
  CreateFields('CREDITDEBITSETUP','SURESCRIPT_MATCH_PAT_LOCALDATA','BIT NULL');
  ExecQry('update CREDITDEBITSETUP set SURESCRIPT_MATCH_PAT_LOCALDATA = 1 where SURESCRIPT_MATCH_PAT_LOCALDATA is null');
  CreateFields('CREDITDEBITSETUP', 'RX_SHOW_NOREFDISP_FLOAT', 'BIT NULL');
  CreateFields('CREDITDEBITSETUP', 'ROBOT', 'NCHAR(12) NULL');
  CreateFields('CREDITDEBITSETUP', 'GSDD_DAYS_TO_COMPARE', 'INT NULL');
  CreateFields('CREDITDEBITSETUP', 'WF_ENFORCE_FILL', 'BIT NULL');
  CreateFields('CREDITDEBITSETUP', 'NEWRX_INTERACTIONS', 'BIT NULL');
  CreateFields('CREDITDEBITSETUP', 'DONOTBILLINACTIVE_PRODUCT', 'BIT NULL');
  CreateFields('CREDITDEBITSETUP', 'SAVE_CLAIM_TRANSACTIONS', 'BIT NULL');
  CreateFields('CREDITDEBITSETUP', 'SILENT_BILLING_NEWRX', 'BIT NULL');
  CreateFields('CREDITDEBITSETUP', 'STAR_PLUS_INTERFACE', 'BIT NULL');
  CreateFields('CREDITDEBITSETUP', 'APPRISS_USERNAME', 'NCHAR(40) NULL');
  CreateFields('CREDITDEBITSETUP', 'APPRISS_PASSWORD', 'NCHAR(20) NULL');
  CreateFields('CREDITDEBITSETUP', 'DEA', 'VARCHAR(15) NULL');
  CreateFields('CREDITDEBITSETUP', 'ID', 'INT IDENTITY(1,1) NOT NULL');
  FDQuery1.SQL.Text := 'select column_name, data_type, character_maximum_length from information_schema.columns ' +
                        ' where table_name = ' + CHR(39) + 'creditdebitsetup' + CHR(39) +
                        ' and column_name = ' + CHR(39) + 'WC_SMS_PASSWORD' + CHR(39);
  FDQuery1.Open;
  if (FDQuery1.FieldByName('character_maximum_length').Value <> 40) then
  begin
    CreateFields('creditdebitsetup', 'WC_SMS_PASSWORD2', 'NCHAR(40) NULL');
    ExecQry('update creditdebitsetup set WC_SMS_PASSWORD2 = WC_SMS_PASSWORD');
    ExecQry('ALTER TABLE [dbo].[creditdebitsetup] DROP COLUMN [WC_SMS_PASSWORD]');
    ExecQry('EXEC sp_rename ' + chr(39) + 'creditdebitsetup.WC_SMS_PASSWORD2' + chr(39) +',' + chr(39) + 'WC_SMS_PASSWORD' + chr(39) + ',' + chr(39) + 'COLUMN'+ chr(39));
  end;
  SQLStr := 'IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_TYPE = ' + chr(39) + 'PRIMARY KEY' + chr(39) + ' AND TABLE_NAME = ' + chr(39) + 'CREDITDEBITSETUP' + chr(39) +
    ' AND TABLE_SCHEMA =' + chr(39) + 'dbo' + chr(39) +')' +
    ' BEGIN ' +
       'ALTER TABLE CREDITDEBITSETUP ADD CONSTRAINT pk_ID PRIMARY KEY (ID) ' +
    'END';
  QBorrarNonMatchedNDC.SQL.Text := SQLStr;
  QBorrarNonMatchedNDC.ExecSQL;
  //=============== change OTC Qty DataType to Double ==========================
  FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'OTC'+ chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'QTY' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('DATA_TYPE').Value = 'float' then
  begin
    CreateFields('OTC', 'QTY10', 'DECIMAL (18,2)');
    ExecQry('Update OTC set QTY10 = QTY');
    ExecQry('ALTER TABLE [dbo].[OTC] DROP COLUMN [QTY]');
    ExecQry('EXEC sp_rename ' + chr(39) + 'OTC.QTY10' + chr(39) + ',' + chr(39) + 'QTY' + chr(39) + ',' + chr(39) + 'COLUMN' + CHR(39));
  end;

  //=================== Create PRIMARY KEY (NUMERORECETA  =======================
  SQLStr := 'IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_TYPE = ' + chr(39) + 'PRIMARY KEY' + chr(39) + ' AND TABLE_NAME = ' + chr(39) + 'PRESCRIPTIONS' + chr(39) +
  ' AND TABLE_SCHEMA =' + chr(39) + 'dbo' + chr(39) +')' +
  ' BEGIN ' +
   'ALTER TABLE PRESCRIPTIONS ADD CONSTRAINT pk_NumeroReceta PRIMARY KEY (NUMERORECETA) ' +
  ' END';
  QBorrarNonMatchedNDC.SQL.Text := SQLStr;
  QBorrarNonMatchedNDC.ExecSQL;
  //===============================================================================
  CommonRoutine.DropConstraint('PRESCRIPTIONS');
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.PRESCRIPTIONS',
    'DF_RX_ACTIVE',
    'ADD CONSTRAINT [DF_RX_ACTIVE] DEFAULT (1) FOR [ACTIVE]', Err);
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.PRESCRIPTIONS',
     'DF_RX_RXORIGINCODE',
     'ADD CONSTRAINT DF_RX_RXORIGINCODE DEFAULT 1 FOR RXORIGINCODE', Err);
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.PRESCRIPTIONS',
     'DF_RX_PRESCRIBERIDQUALIFIER',
     'ADD CONSTRAINT DF_RX_PRESCRIBERIDQUALIFIER DEFAULT ('+ '01' +') FOR PRESCRIBERIDQUALIFIER', Err);
  CommonRoutine.AddConstraintIfNotExistsSafe('dbo.PRESCRIPTIONS',
     'DF_RX_CANTIDADRECETADA',
     'ADD CONSTRAINT DF_RX_CANTIDADRECETADA DEFAULT 0 FOR CANTIDADRECETADA', Err);
  //===============================================================================

  FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'INVENTARIOPISO'+ chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'QTYINVENTARIO' +chr(39);
  FDQuery1.Open;
  if (FDQuery1.FieldByName('DATA_TYPE').Value = 'float') or (FDQuery1.FieldByName('DATA_TYPE').Value = 'real') then
  begin
    CreateFields('INVENTARIOPISO', 'QTYINVENTARIO10', 'DECIMAL (18,2)');
    ExecQry('Update INVENTARIOPISO set QTYINVENTARIO10 = cast (QTYINVENTARIO as decimal (18,2)) where QTYINVENTARIO BETWEEN 0 AND 100000');
    FDConnection1.Connected := False;
    ExecQry('ALTER TABLE [dbo].[INVENTARIOPISO] DROP COLUMN [QTYINVENTARIO]');
    FDConnection1.Connected := False;
    ExecQry('EXEC sp_rename ' + chr(39) + 'INVENTARIOPISO.QTYINVENTARIO10' + chr(39) +',' + chr(39) + 'QTYINVENTARIO' + chr(39) + ',' + chr(39) + 'COLUMN'+ chr(39));
    FDConnection1.Connected := False;
    ExecQry('update INVENTARIOPISO set QTYINVENTARIO = 0 where QTYINVENTARIO is null');
  end;

end;

procedure TDMModifyDatabase.CREATE_FIX_CONTROLADOAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CREATE_FIX_CONTROLADO');
end;

procedure TDMModifyDatabase.CHANGE_PATIENTAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CHANGE_PATIENT');
end;

procedure TDMModifyDatabase.CHANGE_PRESCRIBERAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CHANGE_PRESCRIBER');
end;

procedure TDMModifyDatabase.CLEAN_OTCAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CLEAN_OTC');
end;

procedure TDMModifyDatabase.CLONE_PRODUCTAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CLONE_PRODUCT');
end;

procedure TDMModifyDatabase.CLOSE_BALANCEAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('CLOSE_BALANCE');
end;


function TDMModifyDatabase.CreateFieldsBackup(TableName, COLUMN_NAME,
  FieldType: String): Boolean;
Var
  SQLStr: String;
begin
  SQLStr := 'IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = ' + chr(39) + TABLENAME + chr(39) + ' AND [COLUMN_NAME] = ' + chr(39) + COLUMN_NAME + chr(39) +') BEGIN ALTER TABLE ' + TABLENAME + ' ADD ' + COLUMN_NAME + ' ' + FieldType +  '  END';
  FDQBackup.SQL.Text := SQLStr;
  FDQBackup.ExecSQL;
end;


function TDMModifyDatabase.CreateFields(TableName, COLUMN_NAME,
  FieldType: String): Boolean;
Var
  SQLStr: String;
begin
  Try
  result := true;
  SQLStr := 'IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = ' +
  chr(39) + TABLENAME + chr(39) + ' AND [COLUMN_NAME] = ' + chr(39) + COLUMN_NAME + chr(39) +') ' +
  'BEGIN ALTER TABLE ' + TABLENAME + ' ADD ' + COLUMN_NAME + ' ' + FieldType +  '  END';
  QBorrarNonMatchedNDC.SQL.Text := SQLStr;
  QBorrarNonMatchedNDC.ExecSQL;
  Except
    on E: EMSSQLNativeException do
    begin
      FrmMain.MemoErrors.Lines.Add(SQLStr +' Execute error: '+#13#10+ E.Message);
      Result := false;
    end;
  End;
end;

function TDMModifyDatabase.CreateFieldsImages2(TableName, COLUMN_NAME,
  FieldType: String): Boolean;
Var
  SQLStr: String;
begin
  SQLStr := 'IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = ' + chr(39) + TABLENAME + chr(39) + ' AND [COLUMN_NAME] = ' + chr(39) + COLUMN_NAME + chr(39) +') BEGIN ALTER TABLE ' + TABLENAME + ' ADD ' + COLUMN_NAME + ' ' + FieldType +  '  END';
  FDQueryImages.SQL.Text := SQLStr;
  FDQueryImages.ExecSQL;
end;

function TDMModifyDatabase.CreateFieldsImages(TableName, COLUMN_NAME,
  FieldType: String): Boolean;
Var
  SQLStr: String;
begin
  SQLStr := 'IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = ' + chr(39) + TABLENAME + chr(39) + ' AND [COLUMN_NAME] = ' + chr(39) + COLUMN_NAME + chr(39) +') BEGIN ALTER TABLE ' + TABLENAME + ' ADD ' + COLUMN_NAME + ' ' + FieldType +  '  END';
  FDQueryBackup.SQL.Text := SQLStr;
  FDQueryBackup.ExecSQL;
end;

procedure TDMModifyDatabase.DataModuleCreate(Sender: TObject);
var
  Registro        : TRegistry;
  openResult, Pesc_Sig_isIdentity : Boolean;
  today      : TDateTime;
  Ini: TIniFile;
begin
  ServerName := '';
  Registro := TRegistry.Create;
  Registro.RootKey := HKEY_LOCAL_MACHINE;
  Registro.OpenKey('\SOFTWARE\WOW6432Node\FarmaTec2000', TRUE);
  Ini := TIniFile.Create('C:\Wescom_Decimal\IniFile\farmatec.ini');
  try
    ServerName := Ini.ReadString('Farmatec', 'Server', '<None>');
    DataBaseName := Ini.ReadString('Farmatec', 'databasename', '<None>');
  finally
    Ini.Free;
  end;
  if Trim(DataBaseName) = '<None>' then
  begin
    try
      ServerName := Registro.ReadString('ServerNameMSSQL');
      DataBaseName := Registro.ReadString('DataBaseName');
    except
    end;
  end;
  With FDConnection1.Params do
  begin
    Values['Server'] := ServerName;
    Values['Database'] := Trim(DataBaseName);
    Values['User_Name'] := 'dbo';
    Values['password'] := 'agabriel';
    FDConnection1.Connected := TRUE;
  end;
  FrmMain.StatusBar1.Panels[0].Text := Trim(DataBaseName) + ' ' + Trim(ServerName);
  Try
    With FDConnectionBackup.Params do
    begin
      Values['Server'] := ServerName;
      Values['Database'] := 'Backup';
      Values['User_Name'] := 'dbo';
      Values['password'] := 'agabriel';
      FDConnectionBackup.Connected := TRUE;
    end;
  Except
  //
  End;
  Try
    With FDConnectionFarmatecImages.Params do
    begin
      Values['Server'] := ServerName;
      Values['Database'] := 'FarmatecImages';
      Values['User_Name'] := 'dbo';
      Values['password'] := 'agabriel';
      FDConnectionFarmatecImages.Connected := TRUE;
    end;
  Except
      try
        FarmatecImages.ExecSQL;
      Except
        //
      End;
  End;
  Registro.CloseKey;
end;

procedure TDMModifyDatabase.DELETE_OTCAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('DELETE_OTC');
end;

procedure TDMModifyDatabase.DELETE_PRINT_QUERIESAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('DELETE_PRINT_QUERIES');
end;

procedure TDMModifyDatabase.DELETE_RXTEMP1NORXAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('DELETE_RXTEMP1NORX');
end;

procedure TDMModifyDatabase.DELETE_RXTEMP1TERMINADAAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('DELETE_RXTEMP1TERMINADA');
end;

procedure TDMModifyDatabase.DELETE_SCANED_QAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('DELETE_SCANED_Q');
end;

procedure TDMModifyDatabase.DELETE_SIGNATUREAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('DELETE_SIGNATURE');
end;

procedure TDMModifyDatabase.Directory61AfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('Directory61');
end;

procedure TDMModifyDatabase.DOCTOR_CREATE_UPDATE61AfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('DOCTOR_CREATE_UPDATE');
end;

procedure TDMModifyDatabase.DOCTOR_CREATE_UPDATEAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('DOCTOR_CREATE_UPDATE');
end;

procedure TDMModifyDatabase.DropAll;
begin
  FrmMain.PageControlInfo.ActivePageIndex := 1;
  FrmMain.Memo2.Lines.Add('Dropping all!');
  //ExecSql('alter table PRESCRIPTIONS DROP COLUMN PROXIMOREFILL');
  CommonRoutine.DropColumnIfExists('PRESCRIPTIONS', 'PROXIMOREFILL');
  DropProgrammableObjectsAndIndexes;
  ExecQryImages('DROP PROCEDURE INSERT_SCANNED_RX');
  ExecQryImages('DROP PROCEDURE BACKUPDATABASE');
  {
  ExecQry('DROP TABLE RX_LABEL');
  Directory61.ExecSQL;
  Prescribers_Specialty.ExecSQL;
  //===================Procedures====================================
  cdsProcedures.Close;
  cdsProcedures.CommandText := 'SELECT * FROM sys.procedures where is_ms_shipped = 0';
  cdsProcedures.Open;
  cdsProcedures.First;
  while not cdsProcedures.Eof do
  begin
    ExecQry('DROP PROCEDURE ' + Trim(cdsProceduresname.Value));
    cdsProcedures.Next;
  end;
  //===================Triggers====================================
  cdsTriggers.Close;
  cdsTriggers.CommandText := 'SELECT name, is_instead_of_trigger FROM sys.triggers WHERE type = ' + chr(39) + 'TR' + chr(39);
  cdsTriggers.Open;
  cdsTriggers.First;
  while not cdsTriggers.Eof do
  begin
    ExecQry('DROP Trigger ' + Trim(cdsTriggersname.Value));
    cdsTriggers.Next;
  end;
  //===================VIEWS====================================
  cdsViews.Close;
  cdsViews.CommandText := 'SELECT NAME FROM sys.views WHERE is_ms_shipped = 0';
  cdsViews.Open;
  cdsViews.First;
  while not cdsViews.Eof do
  begin
    ExecQry('DROP View ' + Trim(cdsViewsname.Value));
    cdsViews.Next;
  end;
  //===================functions====================================
  ExecSql('alter table PRESCRIPTIONS DROP COLUMN PROXIMOREFILL');
  cdsFunctions.Close;
  //cdsFunctions.CommandText := 'SELECT NAME FROM sys.views WHERE is_ms_shipped = 0';
  cdsFunctions.Open;
  cdsFunctions.First;
  while not cdsFunctions.Eof do
  begin
    ExecQry('DROP function ' + Trim(cdsFunctionsname.Value));
    cdsFunctions.Next;
  end;
  //===================Constrains====================================
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
    (Trim(cdsConstrainsTableName.Value) = 'DAILYTOTALS') or
    (Trim(cdsConstrainsTableName.Value) = 'PASSWORDS') then
    begin
      ExecSql('Alter Table ' + Trim(cdsConstrainsTableName.Value) + ' DROP Constraint ' + Trim(cdsConstrainsName.Value));
    end;
    cdsConstrains.Next;
  end;
  //===================Index=========================================
  DropAllNonConstraintIndexes;
  {
  ExecSql('DROP INDEX [NC_PETID] ON [dbo].[PRESCRIPTIONS]');

  ExecSql('DROP INDEX [NC_USERNAME_PASSWORDS] ON [dbo].[PASSWORDS]');
  ExecSql('DROP INDEX [NC_INICIALES_PASSWORDS] ON [dbo].[PASSWORDS]');


  ExecSql('DROP INDEX [NC_LOG_USUARIOFECHA] ON [dbo].[lOG]');

  ExecSql('DROP INDEX [NC_SS_RXSTATUS_PATIENT] ON [dbo].[Surescripts]');
  ExecSql('DROP INDEX [NC_SS_RXSTATUS_DATERECEIVED] ON [dbo].[Surescripts]');
  ExecSql('DROP INDEX [NC_SS_DATERECEIVED] ON [dbo].[Surescripts]');

  ExecSql('DROP INDEX [NC_RX_NUMBER] ON [dbo].[CLAIM]');
  ExecSql('DROP INDEX [NC_OTCNUMBER] ON [dbo].[CLAIM]');

  ExecSql('DROP INDEX [NC_DEA] ON [dbo].[Directory61]');
  ExecSql('DROP INDEX [NC_SPI] ON [dbo].[Directory61]');
  ExecSql('DROP INDEX [NC_NPI] ON [dbo].[Directory61]');
  ExecSql('DROP INDEX [NC_LastName] ON [dbo].[Directory61]');
  ExecSql('DROP INDEX [NC_StateLicenseNumber] ON [dbo].[Directory61]');
  ExecSql('DROP INDEX [NC_PATNAME] ON [dbo].[PACIENTES]');
  //========= INVENTORY INDEX ==================
  ExecSql('DROP INDEX [Descripcion] ON [dbo].[INVENTARIOPISO]');
  ExecSql('DROP INDEX [NCDrugName] ON [dbo].[INVENTARIOPISO]');
  ExecSql('DROP INDEX [NC_NDC] ON [dbo].[INVENTARIOPISO]');
  ExecSql('DROP INDEX [NC_INVENTORY_BARCODE] ON [dbo].[INVENTARIOPISO]');
  ExecSql('DROP INDEX [Product_ID] ON [dbo].[INVENTARIOPISO]');
  ExecSql('DROP INDEX [NC_Product_ID] ON [dbo].[INVENTARIOPISO]');
  //===== DOCTOR INDEX ==============
  ExecSql('DROP INDEX [NCPrescName] ON [dbo].[DOCTOR]');
  ExecSql('DROP INDEX [NC_DOCTOR_DEA] ON [dbo].[DOCTOR]');
  ExecSql('DROP INDEX [NC_DOCTOR_LIC] ON [dbo].[DOCTOR]');
  ExecSql('DROP INDEX [NC_DOCTOR_NPI] ON [dbo].[DOCTOR]');
  ExecSql('DROP INDEX [NC_DOCTOR_SPI] ON [dbo].[DOCTOR]');
  //======= MEZCLAS INDEX ============
  ExecSql('DROP INDEX [NC_MEZCLAS_OTCNUMBER] ON [dbo].[MEZCLAS]');
  ExecSql('DROP INDEX [NC_MEZCLAS_NUMERORECETA] ON [dbo].[MEZCLAS]');
  ExecSql('DROP INDEX [NC_MEZCLAS_NO_TRANS] ON [dbo].[MEZCLAS]');
  //===================================
  ExecSql('DROP INDEX [OTC_NoReceta] ON [dbo].[OTC]');
  ExecSql('DROP INDEX [NC_NUMEROPLAN] ON [dbo].[OTC]');
  ExecSql('DROP INDEX [NC_OTC_GUID] ON [dbo].[OTC]');
  ExecSql('DROP INDEX [NC_NOCLIENTE] ON [dbo].[PATPLAN]');
  ExecSql('DROP INDEX [NC_NOCLIENTE_NORX] ON [dbo].[OTC]');
  ExecSql('DROP INDEX [NC_BATCH_NUMBER_BILLING] ON [dbo].[OTC]');
  ExecSql('DROP INDEX [NC_BATCH_NUMBER] ON [dbo].[PRESCRIPTIONS]');
  ExecSql('DROP INDEX [NC_MESSAGE_ID] ON [dbo].[PRESCRIPTIONS]');
  ExecSql('DROP INDEX [NC_RX_GUID] ON [dbo].[PRESCRIPTIONS]');
  //========Respuestas INDEX=================================
  ExecSql('DROP INDEX [NC_RESPUESTAS_NUMERORECETA] ON [dbo].[RESPUESTAS]');
  ExecSql('DROP INDEX [NC_RESPUESTAS_OTCNUMBER] ON [dbo].[RESPUESTAS]');

  //==========================================================
  //======= Image INDEX ==========================
  ExecQryImages('DROP INDEX [NC_IMAGES_SCANNED_RX_LINK] ON [dbo].[IMAGES]');
  //======= Prescription_full index ==================
  ExecQryImages('DROP INDEX [IX_OTC_NUMERORECETA] ON [dbo].[OTC]');
  ExecQryImages('DROP INDEX [IX_PRESCRIPTIONS_NUMERORECETA] ON [dbo].[PRESCRIPTIONS]');
  ExecQryImages('DROP INDEX [IX_PACIENTES_NUMEROCLIENTE] ON [dbo].[PACIENTES]');
  ExecQryImages('DROP INDEX [IX_DOCTOR_NUMERODOCTOR] ON [dbo].[DOCTOR]');
  ExecQryImages('DROP INDEX [IX_PLANESMEDICOS_PLANESMEDICOSNO] ON [dbo].[PLANESMEDICOS]');
  }

end;

procedure TDMModifyDatabase.EDIT_DAILYTOTALSAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('EDIT_DAILYTOTALS');
end;

procedure TDMModifyDatabase.EDIT_INVENTORYAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('EDIT_INVENTORY');
end;

procedure TDMModifyDatabase.EM_UPDATEINVAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('EM_UPDATEINV');
end;

procedure TDMModifyDatabase.ErasePrescriptionsFields;
var
  SQLStr: String;
begin
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  CODIREFILLNUEVO');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  CODIMEZCLA');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  MEZCLA');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  FECHAEXPIRACION');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  NUMEROAUTORIZACION');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  BASISOFCOST');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  CLINICIDNUMBER');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  DIAGNOSISCODE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  DURCONFLICTCODE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  DURINTERVENTIONCODE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  LEVELOFSERVICE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PRIMARYPRESCRIBER');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PRIORAUTHORIZATION');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  RXDENIALCLARIF');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  LOTE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  RXDENIALOVERRIDE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  DEDUCIBLE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PAPLAN');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PRECIOVENTA');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PRECIOFACTURACION');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  COSTOVENTA');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  DISPENSINGFEE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  GROSSAMOUNTDUE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PATIENTPAIDAMOUNT');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  SALESTAX');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  GANANCIA');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  OTAMCLDSUBCOUNTQUAL');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PRODUCTSERVIDQUAL');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PROVIDERID');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  UNIT_DOSE_INDICATOR');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  UNIT_OF_MEASURE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  SUB_CLARIF_CODE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  OTHERCOVERAGECODE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  TRANSACTION_CODE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  SERVICEPROVIDQUALIFIER');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  OP_AMOUNTPAIDCOUNT');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  OP_REJECTCOUNT');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  COB_OTHERPAYMENTCOUNT');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  COMPDOSAGE_FORM_DESC_CODE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  COMPDISP_UNIT_FORM_INDI');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  COMPROUTE_OF_ADMINISTRATION');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  COMPING_COMP_COUNT');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  DISPENSING_STATUS');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  QTY_INTENDED_DISP');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  DAYS_SUPPLY_INTEND_DISP');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  FLAT_SALES_TAXSUB');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  ASSOC_RX_SERVICE_DATE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  ASSOC_RX_SERVICE_REF_NO');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  CUPONTYPE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  CUPON_NUMBER');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  CUPON_VALUE_AMT');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PRIMARYCAREPROVIDQUALIFIER');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PRIMARYCAREPROVID');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PRIMARYCAREPROVLASTNAME');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  OTHERAMOUNTCLAIMEDSUB');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  OTHERAMOUNTCLAIMEDSUBCOUNT');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_DATE_OF_INJURY');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_EMPLOYER_NAME');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_EMPLOYER_STREET');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_EMPLOYER_CITY');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_EMPLOYER_STATE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_EMLPOYER_ZIP');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_EMPLOYER_CONTACT');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_CARRIER_ID');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_CLAIMREF_ID');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_EMPLOYER_PHONE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PRIOR_AUTH_TYPE_CODE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PERCENTAGE_SALES_TAX_RATE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PERCENTAGE_SALES_TAX_SUB');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  DIAGNOSIS_CODE_COUNT');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  ORG_PRES_PROD_SIDQ');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  ORG_PROS_PROD_SERVID');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  ORG_PRESC_QTY');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PROF_SERV_FEE_SUB');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  INCENTIVE_AMOUNT_SUB');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  INGREDIENT_COST_PAID');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  INCENTIVE_FEE_PAID');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  DISPENSING_FEE_PAID');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  OTHER_AMOUNT_PAID');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  AMOUNT_COPAY_COINS');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  EP_TRANSACTION_NUMBER');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  MEDICAID_PAID_AMOUNT');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PMC_459_ER');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PMCC_458_SE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  SPIDN_454_EK');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  IATID_463_EW');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  IAID_464_EX');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  DRC_357_NV');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PAI_391_MT');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PST_147_U7');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  SCCD_354_NX');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PRAC_353_NR');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  BSC_392_MU');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  SPECIAL_PACK_INDI_429_DT');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  ROUTEOFADMIN_995_E2');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  USUARIO_NO');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_117_TR');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_118_TS');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_119_TT');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_120_TU');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_121_TV');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_122_TW');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_123_TX');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_124_TY');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_125_TZ');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  WC_126_UA');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_521_FL');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_523_FN');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_512_FC');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_513_FD');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_514_FE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_517_FH');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_518_FI');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_520_FK');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_346_HH');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_347_HJ');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_348_HK');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_571_NZ');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_575_EQ');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_574_2Y');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_572_4U');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_577_G3');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_133_UJ');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_134_UK');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_136_UN');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_137_UP');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PER_SALESTAX_BASIS_SUB');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  RELACION');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  EXPORT_TORXTEMP1');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PRIMARYCAREPROVLOCATIONCODE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PATIENTPHONENUMBER');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PATIENTLOCATION');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_558_AW');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PS_559_AX');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  SUB_CLAR_CODE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  SUB_CLAR_CODE_COUNT');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  REVENUE_CODE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  NOGRUPO');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PERSONCODE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  NO_HORA');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PAGADA');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  ASEGURADOPRINCIPAL');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  DIAHORA');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  CASHPLAN');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  NUMEROPLAN');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  CARDHOLDER_ID');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  CANTIDAD');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  MEDICAMENTOORIGINAL');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PA');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  NDCDESPACHADO');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  ATENDIDAPOR');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PHARMACIST');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  ULTIMO_REFILL');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  METRICQUANTITY');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  CANTIDADDESPACHADA');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  PLANMEDICO');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  SERVICEPROVID');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN  ADHERENCE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN DUROUTCOMECODE');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN COMPOUND_TYPE_996_G1 ');
  ExecQry('ALTER TABLE PRESCRIPTIONS DROP COLUMN PS_135_UM');
  ExecQry('UPDATE NEXT_RXNUMBER SET BATCH_NUMBER_BILLING = 1');
  ExecQry('UPDATE PRESCRIPTIONS SET DAYS_SUPPLY = DIASSUPLIDOS');
  ExecQry('UPDATE INVENTARIOPISO SET PRICE_TABLE_ID = 2 WHERE RECETARIO =' +chr(39)+ 'R' + chr(39));
 //============================ Create Prescription and OTC History Tables ===================
  ShowMessage('Done erasing fields!');
end;

function TDMModifyDatabase.ExecQryImages(SQLstr: String): Boolean;
begin
  Try
  FDQueryImages.SQL.Text := SQLStr;
  FDQueryImages.ExecSQL;
  Except
    FrmMain.Memo1.Lines.Add('Error executing: ' + FDQueryImages.SQL.Text);
  End;
end;
function TDMModifyDatabase.ExecQry(SQLstr: String): Boolean;
var
  SP: string;
begin
  Try
    SP := CommonRoutine.ExtractAfterDbo(qryNewSP.SQL.Text);
    qryNewSP.SQL.Text := SQLStr;
    qryNewSP.ExecSQL;
  Except
    FrmMain.MemoErrors.Lines.Add('Error executing: ' + SP); // qryNewSP.SQL.Text);
  End;
end;

Procedure TDMModifyDatabase.ExecSqlBackup(Token: String);
begin
  FDConnectionBackup.Connected := False;
  Try
    FDQBackup.SQL.Text := Token;
    FDQBackup.ExecSQL;
    frmMain.Memo1.Lines.Add(Token + ' successfully!');
  Except
    frmMain.Memo1.Lines.Add('Error creating ' + Token);
  End;
end;

Procedure TDMModifyDatabase.ExecSql2(Token1, SQL_Text: String);
begin
  //FDConnection1.Connected := False;
  Try
    QBorrarNonMatchedNDC.SQL.Text := SQL_Text;
    QBorrarNonMatchedNDC.ExecSQL;
    frmMain.Memo1.Lines.Add(Token1 + ' successfully!');
  Except
    //frmMain.Memo1.Lines.Add('Error creating ' + Token);
    on E: EMSSQLNativeException do
    begin
      FrmMain.MemoErrors.Lines.Add(Token1 +' Execute error: '+#13#10+ E.Message);
    end;
  End;
end;
Procedure TDMModifyDatabase.ExecSql(Token: String);
begin
  //FDConnection1.Connected := False;
  Try
    QBorrarNonMatchedNDC.SQL.Text := Token;
    QBorrarNonMatchedNDC.ExecSQL;
    frmMain.Memo1.Lines.Add(Token + ' successfully!');
  Except
    //frmMain.MemoErrors.Lines.Add('Error creating ' + Token);
    on E: EMSSQLNativeException do
    begin
      FrmMain.MemoErrors.Lines.Add(Token +' Execute error: '+#13#10+ E.Message);
    end;
  End;
end;

procedure TDMModifyDatabase.EXPORT_TO_RXTEMP1AfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('EXPORT_TO_RXTEMP1');
end;

procedure TDMModifyDatabase.FarmatecImagesAfterExecute(DataSet: TFDDataSet);
begin
   SuccessfullyCreated('FarmatecImages');
end;

procedure TDMModifyDatabase.FDConnection1AfterConnect(Sender: TObject);
begin
   DatabaseName :=  FDConnection1.Params.Values['DataBase'];
end;

procedure TDMModifyDatabase.FDQuery1Error(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  //FrmMain.MemoErrors.Lines.Add(FDQuery1.SQL.Text);
end;

procedure TDMModifyDatabase.FDQuery2Error(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  FrmMain.MemoErrors.Lines.Add(FDQuery2.SQL.Text);
end;

procedure TDMModifyDatabase.FDQuery3Error(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  FrmMain.MemoErrors.Lines.Add(FDQuery3.SQL.Text);
end;

procedure TDMModifyDatabase.FDQuery4Error(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  FrmMain.MemoErrors.Lines.Add(FDQuery4.SQL.Text);
end;

procedure TDMModifyDatabase.FDQuery5Error(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  FrmMain.MemoErrors.Lines.Add(FDQuery5.SQL.Text);
end;

procedure TDMModifyDatabase.FDQuery6Error(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  FrmMain.MemoErrors.Lines.Add(FDQuery6.SQL.Text);
end;

procedure TDMModifyDatabase.FDQueryImagesAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('FDQueryImages');
end;

function TDMModifyDatabase.Field_exist(ColumnStr, TableStr: String): Boolean;
begin

end;

procedure TDMModifyDatabase.FIX_CONTROLADOAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('FIX_CONTROLADO');
end;


procedure TDMModifyDatabase.GETNEWHEADERAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('GETNEWHEADER');
end;

procedure TDMModifyDatabase.GET_PRICE_TABLE_VALUEAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('GET_PRICE_TABLE_VALUE');
end;

procedure TDMModifyDatabase.HOLD_SAVE_TRANSACTIONAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('HOLD_SAVE_TRANSACTION');
end;

procedure TDMModifyDatabase.ICD10_CREATEAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('ICD10_CREATE');
end;

procedure TDMModifyDatabase.ICD10_DELETEAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('ICD10_DELETE');
end;

procedure TDMModifyDatabase.IMAGESAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('IMAGESA');
end;

procedure TDMModifyDatabase.Index_NCPATNAMEAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('Index_NCPATNAME');
end;

procedure TDMModifyDatabase.Index_OTC_NoRecetaAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('Index_OTC_NoReceta');
end;

procedure TDMModifyDatabase.Index_PAT_NUMBERAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('Index_PAT_NUMBER');
end;

procedure TDMModifyDatabase.Index_Prescription_NumeroRecetaAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('Index_Prescription_NumeroReceta');
end;

procedure TDMModifyDatabase.INSERTDOCTORAfterExecute(DataSet: TFDDataSet);
begin
 SuccessfullyCreated('INSERTDOCTOR');
end;

procedure TDMModifyDatabase.INSERTINVENTORYAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERTINVENTORY');
end;

procedure TDMModifyDatabase.INSERTPACIENTEAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERTPACIENTE');
end;

procedure TDMModifyDatabase.INSERTPATPLANAfterExecute(DataSet: TFDDataSet);
begin
 SuccessfullyCreated('INSERTPATPLAN');
end;

procedure TDMModifyDatabase.INSERTPRODUCTAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERTPRODUCT');
end;

procedure TDMModifyDatabase.INSERT_APPRISSAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_APPRISSA');
end;

procedure TDMModifyDatabase.INSERT_CASH_PLANAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_CASH_PLAN');
end;

procedure TDMModifyDatabase.INSERT_CASH_PLAN_EMPTYAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_CASH_PLAN_EMPTY');
end;

procedure TDMModifyDatabase.INSERT_DIRECTORYAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_DIRECTORY');
end;

procedure TDMModifyDatabase.INSERT_DISPPILLAfterExecute(DataSet: TFDDataSet);
begin
 SuccessfullyCreated('INSERT_DISPPILL');
end;

procedure TDMModifyDatabase.INSERT_EDIT_SHOPPINGCART_DETAILAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_EDIT_SHOPPINGCART_DETAIL');
end;

procedure TDMModifyDatabase.INSERT_EDIT_SHOPPINGCART_HEADERAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_EDIT_SHOPPINGCART_HEADER');
end;

procedure TDMModifyDatabase.INSERT_ESIGNATUREAfterExecute(DataSet: TFDDataSet);
begin
 SuccessfullyCreated('INSERT_ESIGNATURE');
end;

procedure TDMModifyDatabase.INSERT_ESIGNATURE_PICTUREAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_ESIGNATURE_PICTURE');
end;

procedure TDMModifyDatabase.INSERT_LOGAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_LOG');
end;

procedure TDMModifyDatabase.INSERT_MEZLCAAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_MEZLCA');
end;

procedure TDMModifyDatabase.INSERT_NEWTABAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_NEWTAB');
end;

procedure TDMModifyDatabase.INSERT_OTCAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_OTC');
end;

procedure TDMModifyDatabase.INSERT_OTC_LOGAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_OTC_LOG');
end;

procedure TDMModifyDatabase.INSERT_OTC_MEZCASAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_OTC_MEZCAS');
end;

procedure TDMModifyDatabase.INSERT_OVER_TCAfterExecute(DataSet: TFDDataSet);
begin
 SuccessfullyCreated('INSERT_OVER_TC');
end;

procedure TDMModifyDatabase.INSERT_PARATA_QUERIEAfterExecute(
  DataSet: TFDDataSet);
begin
 SuccessfullyCreated('INSERT_PARATA_QUERIE');
end;

procedure TDMModifyDatabase.INSERT_PASSWORD_LOGAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_PASSWORD_LOG');
end;

procedure TDMModifyDatabase.Insert_Prescriber_directoryAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('Insert_Prescriber_directory');
end;

procedure TDMModifyDatabase.INSERT_PRESCRIPTIONS1AfterExecute(
  DataSet: TFDDataSet);
begin
   SuccessfullyCreated('INSERT_PRESCRIPTIONS');
end;

procedure TDMModifyDatabase.INSERT_PRINT_QAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_PRINT_Q');
end;

procedure TDMModifyDatabase.INSERT_PRINT_QUERIESAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_PRINT_QUERIES');
end;

procedure TDMModifyDatabase.INSERT_RESPONSEAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_RESPONSE');
end;

procedure TDMModifyDatabase.INSERT_RXAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_RX');
end;

procedure TDMModifyDatabase.INSERT_SCANNED_DOCAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_SCANNED_DOC');
end;

procedure TDMModifyDatabase.INSERT_SCANNED_RXAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_SCANNED_RX');
end;

procedure TDMModifyDatabase.INSERT_TRANSAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INSERT_TRANS');
end;

procedure TDMModifyDatabase.INVENTORY_CARTAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INVENTORY_CAR');
end;

procedure TDMModifyDatabase.INVENTORY_CONTROLAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INVENTORY_CONTROL');
end;

procedure TDMModifyDatabase.INVENTORY_IMAGEAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('INVENTORY_IMAGE');
end;

procedure TDMModifyDatabase.LOCK_UNLOCKAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('LOCK_UNLOCK');
end;

procedure TDMModifyDatabase.LOCK_UNLOCK_DELAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('LOCK_UNLOCK_DEL');
end;

procedure TDMModifyDatabase.LOINCAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('LOINC');
end;

procedure TDMModifyDatabase.NCIAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('NCI');
end;

procedure TDMModifyDatabase.NC_NOCLIENTE_NORXAfterExecute(DataSet: TFDDataSet);
begin
 SuccessfullyCreated('NC_NOCLIENTE_NORX');
end;

procedure TDMModifyDatabase.NEXT_APPRISS_TNAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('NEXT_APPRISS_TNA');
end;

procedure TDMModifyDatabase.NEXT_BATCH_NUMBERAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('NEXT_BATCH_NUMBER');
end;

procedure TDMModifyDatabase.NEXT_IDAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('NEXT_ID');
end;

procedure TDMModifyDatabase.NEXT_MAIN_COURSE_IDAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('NEXT_MAIN_COURSE_ID');
end;

procedure TDMModifyDatabase.OPEN_TABSAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('OPEN_TABS');
end;

procedure TDMModifyDatabase.OTCHISTORYAfterExecute(DataSet: TFDDataSet);
begin
    SuccessfullyCreated('OTCHISTORY');
end;

procedure TDMModifyDatabase.OTC_HISTORYAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('OTC_HISTORY');
end;

procedure TDMModifyDatabase.OTC_INVENTORY_CONTROLAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('OTC_INVENTORY_CONTROL');
end;

procedure TDMModifyDatabase.PACIENTES_PLANESAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('PACIENTES_PLANES');
end;

procedure TDMModifyDatabase.PATIENT_HIPPA_ORIENTEDAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('PATIENT_HIPPA_ORIENTED');
end;

procedure TDMModifyDatabase.PATIENT_SEARCHAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('PATIENT_SEARCH');
end;

procedure TDMModifyDatabase.PICKUP_TFAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('PICKUP_TF');
end;

procedure TDMModifyDatabase.POST_SHOPPERAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('POST_SHOPPER');
end;

procedure TDMModifyDatabase.POST_SHOPPER_DAILYAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('POST_SHOPPER_DAILY');
end;

procedure TDMModifyDatabase.POS_ADD_EDIT_CLIENTESAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('POS_ADD_EDIT_CLIENTES');
end;

procedure TDMModifyDatabase.POS_CANCEL_TRANSAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('POS_CANCEL_TRANS');
end;

procedure TDMModifyDatabase.POS_DELETE_OPEN_TRANSACTIONSAfterExecute(
  DataSet: TFDDataSet);
begin
 SuccessfullyCreated('POS_DELETE_OPEN_TRANSACTIONS')
end;

procedure TDMModifyDatabase.POS_HOLD_TRANSAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('POS_HOLD_TRANS');
end;

procedure TDMModifyDatabase.POS_INSERT_BUTTON_IMAGEAfterExecute(
  DataSet: TFDDataSet);
begin
 SuccessfullyCreated('POS_INSERT_BUTTON_IMAGE');
end;

procedure TDMModifyDatabase.POS_INSERT_DAILYTOTALSAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('POS_INSERT_DAILYTOTALS');
end;

procedure TDMModifyDatabase.POS_INSERT_EDIT_INVENTORYAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('POS_INSERT_EDIT_INVENTORY');
end;

procedure TDMModifyDatabase.POS_INVENTORY_CONTROLAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('POS_INVENTORY_CONTROL');
end;

procedure TDMModifyDatabase.POS_RECALL_TRANSACTIONAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('POS_RECALL_TRANSACTION');
end;

procedure TDMModifyDatabase.POS_ROUND_TOTALAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('POS_ROUND_TOTAL');
end;

procedure TDMModifyDatabase.POS_SPLIT_TABAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('POS_SPLIT_TAB');
end;

procedure TDMModifyDatabase.POS_TFAM_CALCAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('POS_TFAM_CALC');
end;

procedure TDMModifyDatabase.POS_UPDATE_PAYMENTTYPEAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('POS_UPDATE_PAYMENTTYPE');
end;

procedure TDMModifyDatabase.POS_UPDATE_PRINTEDAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('POS_UPDATE_PRINTED');
end;

procedure TDMModifyDatabase.Prescribers_SpecialtyAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('Prescribers_Specialty');
end;

procedure TDMModifyDatabase.PRESCRIPTIONS_HISTORYAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('PRESCRIPTIONS_HISTORY');
end;

procedure TDMModifyDatabase.PRESCRIPTION_FULLAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('PRESCRIPTION_FULL');
end;

procedure TDMModifyDatabase.PRICE_UPDATEAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('PRICE_UPDATEA');
end;

procedure TDMModifyDatabase.PRODUCTSALESAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('PRODUCTSALES');
end;

procedure TDMModifyDatabase.PURCHASE_SALESAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('PURCHASE_SALES');
end;

procedure TDMModifyDatabase.QAlterViewRxControladasAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('QAlterViewRxControladas');
end;

procedure TDMModifyDatabase.QBorrarNonMatchedNDCAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated(QBorrarNonMatchedNDC.SQL.Text);
end;

procedure TDMModifyDatabase.QBorrarNonMatchedNDCError(ASender,
  AInitiator: TObject; var AException: Exception);
begin
  FrmMain.MemoErrors.Lines.Add(QBorrarNonMatchedNDC.SQL.Text);
end;

procedure TDMModifyDatabase.QBorrarNonMatchedNDCExecuteError(ASender: TObject;
  ATimes, AOffset: Integer; AError: EFDDBEngineException;
  var AAction: TFDErrorAction);
var
  I: Integer;
begin
  for I := 0 to AError.ErrorCount-1 do
  begin
    FrmMain.Memo1.Lines.Add('Error ' + AError.Errors[i].Message);
  end;
end;

procedure TDMModifyDatabase.QCreateBackupDBAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('QCreateBackup');
end;

procedure TDMModifyDatabase.qryCreateError(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  FrmMain.MemoErrors.Lines.Add(qryCreate.SQL.Text);
end;

procedure TDMModifyDatabase.qryNewSPError(ASender, AInitiator: TObject;
  var AException: Exception);
begin
    FrmMain.MemoErrors.Lines.Add(qryNewSP.SQL.Text);
end;

procedure TDMModifyDatabase.QUpdateOTCAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('QUpdateOTC');
end;

procedure TDMModifyDatabase.RECALL_RXAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('RECALL_RX');
end;

procedure TDMModifyDatabase.RECALL_RX_FROM_BACKUPAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('RECALL_RX_FROM_BACKUP');
end;

procedure TDMModifyDatabase.ReindexAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('Reindex');
end;

procedure TDMModifyDatabase.RXAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('RX');
end;

procedure TDMModifyDatabase.RXCONTROLADASAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('RXCONTROLADAS');
end;

procedure TDMModifyDatabase.RXDEPTAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('RXDEPT');
end;

procedure TDMModifyDatabase.RX_CALCULATE_PRICEAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('RX_CALCULATE_PRICE');
end;

procedure TDMModifyDatabase.RX_CHANGE_PATIENT_PLANAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('RX_CHANGE_PATIENT_PLAN');
end;

procedure TDMModifyDatabase.RX_COMPOUND_VALUESAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('RX_COMPOUND_VALUES');
end;

procedure TDMModifyDatabase.RX_PROCESADASAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('RX_PROCESADAS');
end;

procedure TDMModifyDatabase.RX_RECALL_EPRESCRIBE_FROMHISTORYAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('RX_RECALL_EPRESCRIBE_FROMHISTORY');
end;

procedure TDMModifyDatabase.RX_TERMINAR_RECETAAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('RX_TERMINAR_RECETA');
end;

procedure TDMModifyDatabase.RX_UPDATE_REFILL_QUERYAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('RX_UPDATE_REFILL_QUERY');
end;

procedure TDMModifyDatabase.RX_VIEWAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('RX_VIEW');
end;

procedure TDMModifyDatabase.RX_VIEW_COMPOUNDSAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('RX_VIEW_COMPOUNDS');
end;

procedure TDMModifyDatabase.RX_VIEW_NOT_COMPOUNDSAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('RX_VIEW_NOT_COMPOUNDS');
end;

procedure TDMModifyDatabase.SCANED_RX_LINKAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('SCANED_RX_LINK');
end;

procedure TDMModifyDatabase.SENDTOHISTORYAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('SENDTOHISTORY');
end;

procedure TDMModifyDatabase.STARTBANKAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('STARTBANK');
end;

procedure TDMModifyDatabase.SuccessfullyCreated(Token: String);
begin
  FrmMain.Memo1.Lines.Add('Procedure ' + Token +' successfully created!');
end;

procedure TDMModifyDatabase.SurescriptsAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('Surescripts');
end;

procedure TDMModifyDatabase.SurescriptsRX_LABELAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('SurescriptsRX_LABEL');
end;

procedure TDMModifyDatabase.SurescriptsRX_LABEL_INSERT_EDITAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('SurescriptsRX_LABEL_INSERT_EDIT');
end;

procedure TDMModifyDatabase.SURESCRIPTS_EXSISTAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('SURESCRIPTS_EXSIST');
end;

procedure TDMModifyDatabase.SURESCRIPTS_INSERT_IP_CLIENTLISTAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('SURESCRIPTS_INSERT_IP_CLIENTLIST');
end;

procedure TDMModifyDatabase.SURESCRIPTS_IP_CLIENTLISTAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('SURESCRIPTS_IP_CLIENTLIST');
end;

procedure TDMModifyDatabase.SURESCRIPTS_NEXT_MessageIDAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('SURESCRIPTS_NEXT_MessageID');
end;

procedure TDMModifyDatabase.SURESCRIPTS_RX_RENEWAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('SURESCRIPTS_RX_RENEW');
end;

procedure TDMModifyDatabase.SURESCRIPTS_TRANS_TYPEAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('SURESCRIPTS_TRANS_TYPE');
end;

procedure TDMModifyDatabase.SURESCRIPTS_UPDATE_RESPONSEAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('SURESCRIPTS_UPDATE_RESPONS');
end;

procedure TDMModifyDatabase.SURESCRIPTS_UPDATE_RXSTATUSAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('SURESCRIPTS_UPDATE_RXSTATUS');
end;

procedure TDMModifyDatabase.SURESCRIPTS_UPDATE_SURESCRIPTSAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('SURESCRIPTS_UPDATE_SURESCRIPTS');
end;

procedure TDMModifyDatabase.SURESCRIPT_INSERTAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('SURESCRIPT_INSERT');
end;

procedure TDMModifyDatabase.TEMPAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('TEMP');
end;

procedure TDMModifyDatabase.TIMECARD_TOTALHOURSWORKEDAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('TIMECARD_TOTALHOURSWORKED');
end;

procedure TDMModifyDatabase.TIME_STAMPAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('IME_STAMP');
end;

procedure TDMModifyDatabase.TOTAL_POS_TRANSAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('TOTAL_POS_TRANS');
end;

procedure TDMModifyDatabase.TRANSACTIONDETAIL_CANCELTRANSAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('TRANSACTIONDETAIL_CANCEL');
end;

procedure TDMModifyDatabase.TRANSACTIONDETAIL_UPDATEPRICE_MOBILEAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('TRANSACTIONDETAIL_UPDATEPRICE_MOBILE');
end;

procedure TDMModifyDatabase.TRANSFER_PRODAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('TRANSFER_PRO');
end;




Procedure TDMModifyDatabase.UpdateFarmatec;
Var
  SQLStr: String;
begin
  FrmMain.Memo1.Lines.Add('Creating new Stored Procedures!');
  FDQuery1.SQL.Text := 'Select * from rxdata';
  FDQuery1.Open;
  if FDQuery1.RecordCount = 0 then
  begin
    ExecSql('DROP TABLE RXDATA');
    ExecQryCreate(RXDATA.SQL.Text);
  end;

  //================ D0 segments =========================
  //ExecQry(D0_GetSchemaValue.SQL.Text);
  ExecQry(D0_SEG01_Patient_schema.SQL.Text);
  ExecQry(D0_SEG03_Prescriber_schema.SQL.Text);
  ExecQry(D0_SEG04_Insurance_schema.sql.Text);
  ExecQry(D0_SEG05_COB_schema.SQL.Text);
  ExecQry(D0_SEG06_WorkersComp_schema.SQL.Text);
  ExecQry(D0_SEG07_Claim_schema.SQL.Text);
  ExecQry(D0_SEG08_DUR_schema.SQL.Text);
  ExecQry(D0_SEG10_Compound_schema.SQL.Text);
  ExecQry(D0_SEG11_Pricing_schema.sql.Text);

  ExecQry(D0_BuildTransFile_schema.sql.Text);
  //================== Same active ingredients ============
  ExecQry(UpsertNdc9Ingredient.SQL.Text);
  ExecQry(WC_CHECK_ACTIVE_DUPLICATE_INGREDIENTS.SQL.Text);
  ExecQry(WC_GET_MISSING_ACTIVE_NDC9_MAP.SQL.Text);
  //=======================================================
  ExecQry(GET_CONTROLLED_RX_AUDIT_TRAIL.SQL.Text);
  ExecQry(PLANESMEDICOS_SWITCH_SAVE.SQL.Text);
  ExecQry(usp_UpdateOrAppendPatPlanFromEligibility.SQL.Text);
  ExecQry(RX_CHANGE_PRESCRIBER.SQL.Text);
  ExecQry(RX_CHANGE_DRUG.SQL.Text);
  ExecQry(RX_CHANGE_RX_INFORMATION.SQL.Text);
  ExecQry(RX_CHANGE_RX_DETAIL.SQL.Text);
  ExecQry(PR_OTC_INVENTORY_CONTROL.SQL.Text);
  ExecQry(RECALL_DELETED_PRESCRIPTION_EXACT.SQL.Text);

  ExecQry(PROCESS_PATIENT_PRESCRIPTION_STATUS.SQL.Text);
  ExecQry(RX_UPDATE_PRODUCT_CHANGED.SQL.Text);
  ExecQry(INSERT_REFILL_QUERY_FROM_MSGHUB.SQL.Text);
  ExecQry(WORKSTATION_PRINTER_MAP.SQL.Text);
  ExecQry(GET_INVENTORIYINFO.SQL.Text);
  ExecQry(UPDATE_INVENTORIYINFO.SQL.Text);
  ExecQry(PATIENT_LOOKUP.SQL.Text);
  ExecSql2('WF_UPDATE_PICKUP', WF_UPDATE_PICKUP.SQL.Text);
  ExecSql2('WC_CREATE_NEWBAG', WC_CREATE_NEWBAG.SQL.Text);
  ExecSql2('UPDATE_BILLING_REJECTED_RX', UPDATE_BILLING_REJECTED_RX.SQL.Text);
  ExecSql2('rx_post_newrx', rx_post_newrx.SQL.Text);
  ExecSql2('RX_VALIDATE_NEWRX_DATA', RX_VALIDATE_NEWRX_DATA.SQL.Text);
  ExecSql2('WC_UPDATE_NOTIFICATION_MODE',WC_UPDATE_NOTIFICATION_MODE.sql.Text);
  ExecSql2('WC_INSERT_NEWPRODUCT_BAG', WC_INSERT_NEWPRODUCT_BAG.SQL.Text);
  ExecQry(SEARCH_GLOBAL.SQL.Text);
  ExecQry(VALIDATE_OTC_BATCH_INTEGRITY.SQL.Text);
  ExecQry(fn_GetBatchClinicalSignatureHash.SQL.Text);
  ExecQry(GET_PACIENTE_BY_ID.SQL.Text);
  ExecQry(GET_ACTIVE_PATIENT_NDCS.SQL.Text);
  ExecQry(SEARCH_PACIENTES.SQL.Text);
  ExecQry(RX_QUEUE_ADD_NEWRX.SQL.Text);
  ExecQry(RX_INSERT_RX_QUEUE.SQL.Text);
  //ExecQry(EM_UPDATEINV.SQL.Text);
  ExecQry(OTC_INVENTORY_CONTROL.SQL.Text);
  ExecQry(D0_COB_segment_schema.SQL.Text);
  ExecQry(D0_DUR_Segment_schema.SQL.Text);
  ExecQry(D0_Workers_compensation_schema.SQL.Text);
  ExecQry(INVENTORY_ERX.SQL.Text);
  ExecQry(ADD_EDIT_PATINSURANCE.SQL.Text);
  ExecQry(ADD_EDIT_PACIENTES.SQL.Text);
  ExecQry(D0_GetFloatCharacter.SQL.Text);
  ExecQry(D0_COB_segment.SQL.Text);
  ExecQry(D0_DUR_Segment.SQL.Text);
  ExecQry(D0_Workers_compensation.SQL.Text);
  ExecQry(D0_Compound_segment.SQL.Text);
  ExecQry(D0_Clinical_Segment.SQL.Text);
  ExecQry(D0_BuidTransFile.SQL.Text);
  ExecQry(RX_REFILL_NOTIFIED.SQL.Text);
  ExecQry(CAMBIARACASH.SQL.Text);
  ExecQry(INSERT_NOTIFICATION_LOG.SQL.Text);
  ExecQry(inout_report.SQL.Text);
  ExecQry(FN_RX_NEXTREFILL.SQL.Text);
  ExecSql('ALTER TABLE [dbo].[PRESCRIPTIONS] ADD [PROXIMOREFILL] AS dbo.FN_RX_NEXTREFILL([NUMERORECETA])');
  //CommonRoutine.DropColumnIfExists('PRESCRIPTIONS', )
  ExecQry(RX_AMOUNTDUE.SQL.Text);
  ExecQry(RX_AMOUNT_DUE.SQL.Text);
  ExecQry(MERGE_PATIENT_DATA.SQL.Text);
  ExecQry(QUICK_RX_INSERT.SQL.Text);
  ExecQry(QUICK_RX_VIEW.SQL.Text);
  ExecQry(QUICK_RX_ADD_NEWRX.SQL.Text);
  ExecQry(RX_CHANGE_PATIENT_PLAN.SQL.Text);
  ExecQry(INI_VALUES.SQL.Text);
  ExecQry(INSERT_ESIGNATURE_STAMP.SQL.Text);
  ExecQry(INSERT_PICKUP.SQL.Text);
  ExecQry(INSERT_ESIGNATURE_AI.SQL.Text);
  ExecQry(INSERT_ESIGNATURE_PICTURE_AI.SQL.Text);
  ExecQry(SIGNATURE_LINK.SQL.Text);
  ExecQry(BOTONES_MIDIFIERS.SQL.Text);
  ExecQry(TRIPLE_S.SQL.Text);
  ExecQry(WC_BAGPICKUP_UPDATE.SQL.Text);
  ExecQry(PWRD_ISAUTHORIZED.SQL.Text);
  ExecQry(ISAUTHORIZED.SQL.Text);
  ExecQry(UPDATE_OTC_RXPAID2.SQL.Text);
  ExecQry(ADD_EDIT_USERS_RX.SQL.Text);
  ExecQry(SURESCRIPTS_DELETE_IP_CLIENTLIST.SQL.Text);
  ExecQry(SURESCRIPTS_EXSIST.SQL.Text);
  ExecQry(SURESCRIPTS_INSERT_LOG.SQL.Text);
  ExecQry(ADD_EDIT_CONTROLED_LOG.SQL.Text);
  ExecQry(ADD_EDIT_REFIL_QUERY.SQL.Text);
  ExecQry(SURESCRIPTS_ADD_NEWRX.SQL.Text);
  ExecQry(INSERT_EDIT_PRODUCT_IMAGE.SQL.Text);
  ExecQry(INSERT_PRINT_QUERIES.SQL.Text);
  ExecQry(NEXT_ID.SQL.Text);
  ExecQry(RX_RECALL_EPRESCRIBE_FROMHISTORY.SQL.Text);
  ExecQry(INSERT_OTC_MEZCAS.SQL.Text);
  ExecQry(DELETE_OTC.SQL.Text);
  ExecQry(INSERT_SCANNED_DOC.SQL.Text);
  ExecQry(SURESCRIPTS_TRANS_TYPE.SQL.Text);
  ExecQry(WF_UPDATE.SQL.Text);
  ExecQry(GET_PRICE_TABLE_VALUE.SQL.Text);
  ExecQry(RX_CALCULATE_PRICE.SQL.Text);
  ExecQry(EXPORT_TO_RXTEMP1.SQL.Text);
  ExecQry(RX_COMPOUND_VALUES.SQL.Text);
  ExecQry(SURESCRIPTS_UPDATE_RESPONSE.SQL.Text);
  ExecQry(SurescriptsRX_LABEL_INSERT_EDIT.SQL.Text);
  ExecQry(RX_UPDATE_REFILL_QUERY.SQL.Text);
  ExecQry(RX_TERMINAR_RECETA.SQL.Text);
  ExecQry(SURESCRIPTS_UPDATE_RXSTATUS.SQL.Text);
  ExecQry(SURESCRIPT_INSERT.SQL.Text);
  ExecQry(SURESCRIPTS_RX_RENEW.SQL.Text);
  ExecQry(SURESCRIPTS_UPDATE_SURESCRIPTS.SQL.Text);
  ExecQry(SURESCRIPTS_INSERT_IP_CLIENTLIST.SQL.Text);
  ExecQry(UPDATE_WORKERS_COMP_SEGMENT.SQL.Text);
  ExecQry(INSERT_DIRECTORY.SQL.Text);
  ExecQry(DOCTOR_CREATE_UPDATE61.SQL.Text);
  ExecQry(ADD_EDIT_PRESCRIBER.SQL.Text);
  ExecQry(PATIENT_HIPPA_ORIENTED.SQL.Text);
  ExecQry(PRICE_UPDATE.SQL.Text);
  ExecQry(INSERT_PASSWORD_LOG.SQL.Text);
  ExecQry(CHANGE_PRESCRIBER.SQL.Text);
  ExecQry(UPDATE_PATPLAN_PLANNUMBER.SQL.Text);
  ExecQry(CHANGE_PATIENT.SQL.Text);
  ExecQry(INSERT_LOG.SQL.Text);
  ExecQry(NEXT_APPRISS_TN.SQL.Text);
  ExecQry(INSERT_DISPPILL.SQL.Text);
  ExecQry(INSERT_CASH_PLAN_EMPTY.SQL.Text);
  ExecQry(INSERT_APPRISS.SQL.Text);
  ExecQry(UPDATE_PATIENT_NOTIFICATIONS.SQL.Text);
  ExecQry(DELETE_SIGNATURE.SQL.Text);
  ExecQry(EDIT_INVENTORY.SQL.Text);
  ExecQry(CLEAN_OTC.SQL.Text);
  ExecQry(INSERT_OVER_TC.SQL.Text);
  ExecQry(INSERT_MEZLCA.SQL.Text);
  ExecQry(INVENTORY_CONTROL.SQL.Text);
  ExecQry(UPDATE_CLAIM_SEGMENT.SQL.Text);
  ExecQry(UPDATE_PRICING_SEGMENT.SQL.Text);
  ExecQry(PATIENT_SEARCH.SQL.Text);
  ExecQry(UPDATE_OTC_QTY.SQL.Text);
  ExecQry(UPDATE_OTC_BATCH.SQL.Text);
  ExecQry(INSERT_PRESCRIPTIONS.SQL.Text);
  ExecQry(CANCEL_NEW_RX.SQL.Text);
  ExecQry(CANCEL_NEW_RX_NORX.SQL.Text);
  ExecQry(UPDATE_OTC_HEALTHPLAN.SQL.Text);
  ExecQry(CAMBIAR_MEDICAMENTO.SQL.Text);
  ExecQry(UPDATE_RX_SCANED_RXLINK.SQL.Text);
  ExecQry(UPDATE_PRESCRIPTION.SQL.Text);
  ExecQry(UPDATE_OTC_RXPAID.SQL.Text);
  ExecQry(CALCRXDISPONIBLE.SQL.Text);
  ExecQry(INSERT_CLAIM.SQL.Text);
  ExecQry(BACKUPDATABASE.SQL.Text);
  ExecQry(DELETE_PRINT_QUERIES.SQL.Text);
  ExecQry(DELETE_RXTEMP1NORX.SQL.Text);
  ExecQry(DELETE_SCANED_Q.SQL.Text);

  ExecQry(DEUDA.SQL.Text);
  ExecQry(INSERT_OTC.SQL.Text);
  ExecQry(INSERT_PRINT_Q.SQL.Text);
  ExecQry(INSERT_RESPONSE.SQL.Text);
  ExecQry(INSERTPATPLAN.SQL.Text);
  ExecQry(LAST_IDENTITY.SQL.Text);
  ExecQry(NEXTBARCODE.SQL.Text);
  ExecQry(NEXTINSTANCIA_SIGNATURE.SQL.Text);
  ExecQry(NEXTRX_MEZCLA_TRAN_NO.SQL.Text);
  ExecQry(NEXTRX_PARATA_NO.SQL.Text);
  ExecQry(NEXTRX_TRAN_NO.SQL.Text);
  ExecQry(RECONCILIATION_ALL.SQL.Text);
  ExecQry(REFILL_VALUES.SQL.Text);
  ExecQry(REFILL_VALUESD0.SQL.Text);
  ExecQry(SCANED_RX_LINK.SQL.Text);
  ExecQry(SENDTOHISTORY.SQL.Text);
  ExecQry(UPDATE_INVENTORY.SQL.Text);
  ExecQry(UPDATE_PRESCRIPTIONS_NOCLIENTE.SQL.Text);
  ExecQry(UPDATE_PRESCRIPTIONS_NORX.SQL.Text);
  ExecQry(UPDATE_RX_REJECTED.SQL.Text);
  ExecQry(UPDATE_RX_REVERSAL.SQL.Text);
  ExecQry(UPDATE_RXTEMP1_MEZCLA.SQL.Text);
  ExecQry(UPDATE_WC_STATUS.SQL.Text);
  ExecQry(WILLCALL_DELETE.SQL.Text);
  ExecQry(WILLCALL_History_DELETE.SQL.Text);
  ExecQry(WILLCALL_TOTAL_AMOUNT_DUE.SQL.Text);
  ExecQry(WC_PICKUP_TF.SQL.Text);
  ExecQry(UPDATE_OTC_REFILL_NOTIFIED.SQL.Text);
  ExecQry(UPDATE_OTC.SQL.Text);
  ExecQry(RX_INSERT_REFILL_QUERY.SQL.Text);
  //======================= TRIGGERS ============================
  //SurescriptsExportToHistory.ExecSQL;
  ExecQry(INSERT_CASH_PLAN.SQL.Text);
  ExecQry(LOCK_UNLOCK.SQL.Text);
  //ExecQry(LOCK_UNLOCK_DEL.SQL.Text);
  ExecQry(INSERT_RXDATA.SQL.Text);
  ExecQry(EXPORTTOWILLCALLHISTORY.SQL.Text);
  ExecQry(CREATEWILLCAL_STATUS_LHISTORY.SQL.Text);
  ExecQry(EXPORTTOWILLCAL_STATUS_LHISTORY.SQL.Text);
  ExecQry(UPDATE_OTC_WFPRINTED.SQL.Text);
  //ExecQry(PRESC_DEL_DEPENDENCIES.SQL.Text);
  ExecQry(CALC_RXDISPONIBLE_PRESCRIPTION.SQL.Text);
  ExecQry(DELETE_COB_DEPENDENTS.SQL.Text);
  //ExecQry(CALC_RXDISPONIBLE_DEL.SQL.Text);
  //ExecQry(OTC_DeleteCleanup.SQL.Text);
  ExecQry(CALC_RXDISPONIBLE.SQL.Text);
  //===================VIEWS====================================
  ExecQry(VW_RX_CLINICAL_ALERT_APPROVAL.SQL.Text);
  ExecQry(OTC_NON_RX.SQL.Text);
  ExecQry(WC_PATIENTS.SQL.Text);
  ExecQry(WC_PATIENTS_HISTORY.SQL.Text);
  ExecQry(APPRISS_VIEW.SQL.Text);
  ExecQry(APPRISS_VIEW_COMPOUNDS.SQL.Text);
  ExecQry(RX_VIEW_NOT_COMPOUNDS.SQL.Text);
  ExecQry(RX.SQL.Text);
  ExecQry(PRESCRIPTION_FULL.SQL.Text);
  ExecQry(BESTRX.SQL.Text);
  ExecQry(BRAND_RX.SQL.Text);
  ExecQry(OTCHISTORY.SQL.Text);
  ExecQry(PACIENTES_PLANES.SQL.Text);
  ExecQry(RX_PROCESADAS.SQL.Text);
  ExecQry(RX_VIEW.SQL.Text);
  ExecQry(RXCONTROLADAS.SQL.Text);
  ExecQry(RX_VIEW_COMPOUNDS.SQL.Text);
  ExecQry(VW_REFILL_REMINDER_CANDIDATES.SQL.Text);
  //===================Index=========================================

  //Index_Images;
  //ExecQry(NC_PETID.SQL.Text);
  ExecQry(INDEX_PASSWORDS.SQL.Text);
  ExecQry(INDEX_LOG.SQL.Text);
  ExecQry(Index_Surescripts.SQL.Text);
  ExecQry(Index_Claim.SQL.Text);
  ExecQry(Index_Directories.SQL.Text);
  //ExecQry(Index_NCPATNAME.SQL.Text);
  ExecQry(INDEX_INVENTORY.SQL.Text);
  ExecQry(INDEX_MEZCLAS.SQL.Text);
  //ExecQry(INDEX_DOCTORS.SQL.Text);
  ExecQry(INDEX_RESPUESTAS.SQL.Text);
  //ExecQry(Index_OTC_NoReceta.SQL.Text);
  ExecQry(Index_PatPlanNC_NOCLIENTE.SQL.Text);
  //ExecQry(INDEX_OTC_GUID.SQL.Text);
  //ExecQry(NC_NOCLIENTE_NORX.SQL.Text);
  //ExecQry(INDEX_PRESCRIPTIONS_GUID.SQL.Text);
  //ExecQry(NC_MESSAGE_ID.SQL.Text);
  //ExecQry(NC_NUMEROPLAN.SQL.Text);
  ExecQry(PRESCRIPTION_FULL_CREATEINDEX.SQL.Text);

  //================= Prescriptioon Index =========================
   ExecQry(Prescriptons_index.SQL.Text);
  //================= OTC Index ===================================
   ExecQry(OTC_Index.SQL.Text);
  //============ Surescripts Index ================================
  ExecQry(Surescripts_index.SQL.Text);
  //================== Patient Index ==============================
  ExecQry(Patient_Index.SQL.Text);
  //=================== PatPlan Index==============================
  ExecQry(PatPlan_Index.SQL.Text);
  //=================== Doctor Index ==============================
  ExecQry(Doctor_Index.SQL.Text);
  //=================== Images ====================================


  Try
    IMAGES.ExecSQL;
    //INDEX_IMAGES.ExecSQL;
  Except
   //
  End;
  BACKUPDATABASE_IMAGES.ExecSQL;
  INSERT_SCANNED_RX.ExecSQL;
  CreateFieldsImages('DATABASES', 'ACTIVE', 'bit default(1) NOT NULL');


  //============= Functions ============================
  ExecQry(fn_SplitString.SQL.Text);
  ExecQry(fn_D0_GetFloatCharacter.SQL.Text);

  //===================== Foreing Keys ==========================
  CreatePK;
  //=============================================================
end;

procedure TDMModifyDatabase.UpdateFromResponseAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UpdateFromResponse');
end;

procedure TDMModifyDatabase.UPDATE_BILLING_REJECTED_RXAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_BILLING_REJECTED');
end;

procedure TDMModifyDatabase.UPDATE_CLAIM_SEGMENTAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_CLAIM_SEGMENT');
end;

procedure TDMModifyDatabase.UPDATE_OTCAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_OTC');
end;

procedure TDMModifyDatabase.UPDATE_OTC_BATCHAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_OTC_BATCH');
end;

procedure TDMModifyDatabase.UPDATE_OTC_HEALTHPLANAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_OTC_HEALTHPLAN');
end;

procedure TDMModifyDatabase.UPDATE_OTC_QTYAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_OTC_QTY');
end;

procedure TDMModifyDatabase.UPDATE_OTC_REFILL_NOTIFIEDAfterExecute(
  DataSet: TFDDataSet);
begin
    SuccessfullyCreated('UPDATE_OTC_REFILL_NOTIFIED');
end;

procedure TDMModifyDatabase.UPDATE_OTC_RXPAID2AfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_OTC_RXPAID2');
end;

procedure TDMModifyDatabase.UPDATE_OTC_RXPAIDAfterExecute(DataSet: TFDDataSet);
begin
 SuccessfullyCreated('UPDATE_OTC_RXPAID');
end;

procedure TDMModifyDatabase.UPDATE_OTC_WFCASHIERAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_OTC_WFCASHIER');
end;

procedure TDMModifyDatabase.UPDATE_PATIENT_NOTIFICATIONSAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_PATIENT_NOTIFICATIONS');
end;

procedure TDMModifyDatabase.ADD_EDIT_PATINSURANCEAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_PATPLAN');
end;

procedure TDMModifyDatabase.UPDATE_PATPLAN_PLANNUMBERAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_PATPLAN_PLANNUMBER');
end;

procedure TDMModifyDatabase.UPDATE_PRESCRIPTIONAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_PRESCRIPTION');
end;

procedure TDMModifyDatabase.UPDATE_PRESCRIPTION_ALLAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_PRESCRIPTION_ALL');
end;

procedure TDMModifyDatabase.UPDATE_PRICING_SEGMENTAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_PRICING_SEGMENT');
end;

procedure TDMModifyDatabase.UPDATE_RXTEMP1_MEZCLAAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_RXTEMP1_MEZCLA');
end;

procedure TDMModifyDatabase.UPDATE_RX_REJECTEDAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_RX_REJECTED');
end;

procedure TDMModifyDatabase.UPDATE_RX_REVERSALAfterExecute(DataSet: TFDDataSet);
begin
 SuccessfullyCreated('UPDATE_RX_REVERSAL');
end;

procedure TDMModifyDatabase.UPDATE_RX_SCANED_RXLINKAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_RX_SCANED_RXLINK');
end;

procedure TDMModifyDatabase.UPDATE_TH_BALANCEAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_TH_BALANCE');
end;

procedure TDMModifyDatabase.UPDATE_TH_BALANCE_DELAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_TH_BALANCE_DEL');
end;

procedure TDMModifyDatabase.UPDATE_TIME_STAMPAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_TIME_STAMP');
end;

procedure TDMModifyDatabase.UPDATE_TRANSACTION_HEADERAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_TRANSACTION_HEADER');
end;

procedure TDMModifyDatabase.UPDATE_WC_STATUSAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_WC_STATUS');
end;

procedure TDMModifyDatabase.UPDATE_WORKERS_COMP_SEGMENTAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('UPDATE_WORKERS_COMP_SEGMENT');
end;

procedure TDMModifyDatabase.VERIFYRXTEMP1AfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('VERIFYRXTEMP1');
end;

procedure TDMModifyDatabase.VERTRANSACCIONESAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('VERTRANSACCIONES');
end;

procedure TDMModifyDatabase.VIPAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('VIP');
end;

procedure TDMModifyDatabase.WC_PICKUP_TFAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('WC_PICKUP_TF');
end;

procedure TDMModifyDatabase.WF_UPDATEAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('WF_UPDATE');
end;

procedure TDMModifyDatabase.WILLCALL_DELETEAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('WILLCALL_DELETE');
end;

procedure TDMModifyDatabase.WORKERS_COMPENSATION_SEGMENTAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('Surescripts');
end;

procedure TDMModifyDatabase.UpdateNullColumns(TableName: String);
begin

  SysColumns.Close;
  SysColumns.Open;
  SysColumns.First;
  while not SysColumns.Eof do
  begin
    if ((SysColumns.FieldByName('Data type').Value = 'char') or
     (SysColumns.FieldByName('Data type').Value = 'varchar') or
     (SysColumns.FieldByName('Data type').Value = 'nchar')) and
     ((SysColumns.FieldByName('Max Length').Value = '1') or
     (SysColumns.FieldByName('Max Length').Value = '2')  or
     (SysColumns.FieldByName('Max Length').Value = '3')) and
     ((SysColumns.FieldByName('Column Name').Value <> 'INICIALES') and
     (SysColumns.FieldByName('Column Name').Value <> 'SEC_LEVEL')) then
    begin
      ExecSql('Update ' + TableName + ' set '
      +  SysColumns.FieldByName('Column Name').asString + ' = ' + chr(39) + 'F' + chr(39)
      + ' where ' + SysColumns.FieldByName('Column Name').asString + ' is null');
    end;
    if (SysColumns.FieldByName('Data type').Value = 'bit') then
    begin
      ExecSql('Update ' + TableName + ' set '
      +  SysColumns.FieldByName('Column Name').asString + ' = 0'
      + ' where ' + SysColumns.FieldByName('Column Name').asString + ' is null');
    end;

    SysColumns.Next;
  end;
end;

procedure TDMModifyDatabase.AlterColumns(TableName: String);
Var
  fields: array[0..200] of string;
  i: Integer;
begin
  CreateFields(TableName, 'CAMBIARCOSTOYPRECIOVENTA1', 'bit null');
  ExecSql('Update Passwords set CAMBIARCOSTOYPRECIOVENTA1 = CAMBIARCOSTOYPRECIOVENTA');
  ExecQry('Alter table ' + TableName + ' DROP COLUMN CAMBIARCOSTOYPRECIOVENTA');
  ExecQry('EXEC sp_rename ' + chr(39) + TableName +'.'+ 'CAMBIARCOSTOYPRECIOVENTA1' + chr(39) +',' + chr(39) + 'CAMBIARCOSTOYPRECIOVENTA' + chr(39) + ',' + chr(39) + 'COLUMN'+ chr(39));
  ExecQry('ALTER TABLE  ' + TableName + ' ALTER COLUMN RX_NO_EDIT_HISTORY bit NULL');
  ExecQry('ALTER TABLE  ' + TableName + ' ALTER COLUMN RX_EDIT_SIG bit NULL');
  ExecQry('Update Passwords set RX_SEC_LEVEL = 1 WHERE RX_SEC_LEVEL IS NULL or RX_SEC_LEVEL = 0');
  With DMModifyDatabase do
  begin
    FDQuery1.SQL.Text := 'SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, CHARACTER_MAXIMUM_LENGTH,'
    +'NUMERIC_PRECISION, NUMERIC_SCALE '
    +'FROM INFORMATION_SCHEMA. COLUMNS WHERE TABLE_NAME= ' + chr(39) + ' passwords' + chr(39)
    +' and COLUMN_NAME = ' + chr(39) + 'PHARMACIST' + chr(39);
    FDQuery1.Open;
    if FDQuery1.FieldByName('DATA_TYPE').Value <> 'bit' then
    begin
      CreateFields('PASSWORDS', 'PHARMACIST1', 'bit  default(0) null');
      ExecQry('Alter table PASSWORDS DROP COLUMN PHARMACIST');
      ExecQry('EXEC sp_rename ' + chr(39) + 'PASSWORDS.PHARMACIST1' + chr(39) +',' + chr(39) + 'PHARMACIST' + chr(39) + ',' + chr(39) + 'COLUMN'+ chr(39));
    end;
    Try
    FDQuery1.SQL.Text := 'Update Passwords set PHARMACIST = 0 where PHARMACIST is null';
    FDQuery1.ExecSQL;
    Finally
      //
    End;
  end;
  //=============== Encrypt Passwords ===============
   Try
     FDQuery1.SQL.Text := 'Select PasswordCol, USERNO from Passwords order by USERNO';
     FDQuery1.Open;
     while not FDQuery1.Eof do
     begin
       FDQuery2.SQL.Text := 'Update passwords set PASSWORD_COL = ' + chr(39) + base64encode(FDQuery1.FieldByName('PasswordCol').AsString) + chr(39) +' where userno = ' +  FDQuery1.FieldByName('userno').AsString;
       FDQuery2.ExecSQL;
       FDQuery1.Next;
     end;
   Finally
      //
   End;
  //=================================================
  SysColumns.Close;
  SysColumns.Open;
  SysColumns.First;
  i:=0;
  while not SysColumns.Eof do
  begin
    if ((SysColumns.FieldByName('Data type').Value = 'char') or
     (SysColumns.FieldByName('Data type').Value = 'varchar') or
     (SysColumns.FieldByName('Data type').Value = 'nchar')) and
     ((SysColumns.FieldByName('Max Length').Value = '1') or
     (SysColumns.FieldByName('Max Length').Value = '2')  or
     (SysColumns.FieldByName('Max Length').Value = '3')) and
     ((SysColumns.FieldByName('Column Name').Value <> 'INICIALES') and
     (SysColumns.FieldByName('Column Name').Value <> 'SEC_LEVEL')) then
    begin
      CreateFields(TableName, SysColumns.FieldByName('Column Name').asString+'1', 'bit  default(0) null');
      fields[i] := SysColumns.FieldByName('Column Name').asString;
      i := i+1;
    end;
    SysColumns.Next;
  end;
  i:=0;
  for I := 0 to 200 do
  begin
    if Trim(fields[i]) > '' then
    begin
      SQLQuery1.SQL.Text := 'Select ' + fields[i] + ', userno from ' + TableName;
      SQLQuery1.Active := True;
      SQLQuery1.First;
      while not SQLQuery1.Eof do
      begin
          if SQLQuery1.FieldByName(fields[i]).Value = 'T' then
            ExecSql('Update ' + TableName + ' set ' + fields[i]+'1' + ' = 1 where userno = ' + SQLQuery1.FieldByName('userno').AsString)
          else
            ExecSql('Update ' + TableName + ' set ' + fields[i]+'1' + ' = 0 where userno = ' + SQLQuery1.FieldByName('userno').AsString);
          SQLQuery1.Next;
        end;
    end;
  end;

  SysColumns.First;
  while not SysColumns.Eof do
  begin
    if ((SysColumns.FieldByName('Data type').Value = 'char') or
     (SysColumns.FieldByName('Data type').Value = 'varchar') or
     (SysColumns.FieldByName('Data type').Value = 'nchar')) and
     ((SysColumns.FieldByName('Max Length').Value = '1') or
     (SysColumns.FieldByName('Max Length').Value = '2')  or
     (SysColumns.FieldByName('Max Length').Value = '3')) and
     ((SysColumns.FieldByName('Column Name').Value <> 'INICIALES') and
     (SysColumns.FieldByName('Column Name').Value <> 'SEC_LEVEL')) then
    begin
      ExecQry('Alter table ' + TableName + ' DROP COLUMN ' + SysColumns.FieldByName('Column Name').asString);
      ExecQry('EXEC sp_rename ' + chr(39) + TableName +'.'+ SysColumns.FieldByName('Column Name').asString+'1' + chr(39) +',' + chr(39) + SysColumns.FieldByName('Column Name').asString + chr(39) + ',' + chr(39) + 'COLUMN'+ chr(39));
    end;
    SysColumns.Next;
  end;
  ExecQry('Alter table ' + TableName + ' DROP COLUMN PASSWORDCOL');
  ExecQry('Update Passwords set NIVEL = 3 where NIVEL IS NULL');

  SysColumns.First;
  while not SysColumns.Eof do
  begin
    if (SysColumns.FieldByName('Data type').Value = 'bit') then
    begin
      ExecSql('ALTER TABLE [' + TableName +'] ADD CONSTRAINT DF_' + SysColumns.FieldByName('Column Name').asString +' DEFAULT 0 FOR ' + SysColumns.FieldByName('Column Name').asString);
    end;
    SysColumns.Next;
  end;

end;

function TDMModifyDatabase.base64encode(const Text: ansiString): ansiString;
var
  Encoder: TIdEncoderMime;
begin
  try
    Result := EncodeString(Text);
  finally
    // FreeAndNil(Encoder);
  end
end;

Procedure TDMModifyDatabase.CreateTable(TableName, NewTableName: String);
Var
  SQLStr: String;
  Len: Integer;
  DataType: String;
  CharLen: Integer;
begin
  SQLStr := 'CREATE TABLE [dbo].[' + NewTableName + '](';

  qCreateTables.SQL.Text :=
    'SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = N' + QuotedStr(TableName) +
    ' ORDER BY ORDINAL_POSITION';
  qCreateTables.Open;

  while not qCreateTables.Eof do
  begin
    DataType := qCreateTables.FieldByName('DATA_TYPE').AsString;

    SQLStr := SQLStr + '[' + qCreateTables.FieldByName('COLUMN_NAME').AsString + ']'
      + '[' + DataType + ']';

    if (not qCreateTables.FieldByName('CHARACTER_MAXIMUM_LENGTH').IsNull) and
       (LowerCase(DataType) <> 'text') and
       (LowerCase(DataType) <> 'ntext') and
       (LowerCase(DataType) <> 'image') and
       (LowerCase(DataType) <> 'int') and
       (LowerCase(DataType) <> 'bigint') and
       (LowerCase(DataType) <> 'smallint') and
       (LowerCase(DataType) <> 'tinyint') and
       (LowerCase(DataType) <> 'bit') and
       (LowerCase(DataType) <> 'datetime') and
       (LowerCase(DataType) <> 'smalldatetime') and
       (LowerCase(DataType) <> 'date') and
       (LowerCase(DataType) <> 'time') and
       (LowerCase(DataType) <> 'float') and
       (LowerCase(DataType) <> 'real') and
       (LowerCase(DataType) <> 'money') and
       (LowerCase(DataType) <> 'smallmoney') and
       (LowerCase(DataType) <> 'uniqueidentifier')
    then
    begin
      CharLen := qCreateTables.FieldByName('CHARACTER_MAXIMUM_LENGTH').AsInteger;

      if CharLen = -1 then
        SQLStr := SQLStr + '(MAX)'
      else
        SQLStr := SQLStr + '(' + IntToStr(CharLen) + ')';
    end;

    SQLStr := SQLStr + ' NULL,';
    qCreateTables.Next;
  end;

  Len := Length(SQLStr);
  SQLStr := Copy(SQLStr, 1, Len - 1) + ')';

  FDQuery1.SQL.Text := SQLStr;
  FDQuery1.ExecSQL;
end;

{
Procedure TDMModifyDatabase.CreateTable(TableName, NewTableName: String);
Var
  SQLStr: String;
  Len: Integer;
begin
  SQLStr := 'CREATE TABLE [dbo].['+ NewTableName +'](';
  qCreateTables.SQL.Text := 'SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = N' + chr(39) +  TableName + chr(39);
  qCreateTables.Open;
  while not qCreateTables.Eof do
  begin
    SQLStr := SQLStr +'['+ qCreateTables.FieldByName('COLUMN_NAME').Value + ']'
    +'['+qCreateTables.FieldByName('DATA_TYPE').asString + ']';
    if (Trim(qCreateTables.FieldByName('CHARACTER_MAXIMUM_LENGTH').asString) > '') and
    (qCreateTables.FieldByName('DATA_TYPE').asString <> 'text') then
    begin
      SQLStr := SQLStr + '('+ qCreateTables.FieldByName('CHARACTER_MAXIMUM_LENGTH').asString + ')'
    end;
    SQLStr := SQLStr + ' NULL,';
    qCreateTables.Next;
  end;
  Len := Length(SQLStr);
  SQLStr := Copy(SQLStr,1,Len-1) +  ')';
  //ShowMessage(SQLStr);
  FDQuery1.SQL.Text := SQLStr;
  FDQuery1.ExecSQL;
end; }

function ExtractQuotedText(const S: string): string;
var
  p1, p2: Integer;
begin
  Result := '';

  p1 := Pos('''', S); // first quote
  if p1 = 0 then Exit;

  p2 := PosEx('''', S, p1 + 1); // second quote
  if p2 = 0 then Exit;

  Result := Copy(S, p1 + 1, p2 - p1 - 1);
end;

function TableExists(const ATableName: string; const ASchema: string = 'dbo'): Boolean;
begin
  Result :=
    DMModifyDatabase.FDConnection1.ExecSQLScalar(
      'SELECT COUNT(*) ' +
      'FROM sys.tables t ' +
      'JOIN sys.schemas s ON t.schema_id = s.schema_id ' +
      'WHERE t.name = :TableName AND s.name = :SchemaName',
      [ATableName, ASchema]
    ) > 0;
end;


Procedure TDMModifyDatabase.ExecQryCreate(SQLTxt: String);
var
  TableName: String;
begin
  TableName := ExtractQuotedText(SQLTxt);
  if not TableExists(TableName) then
  begin
    qryCreate.sql.Clear;
    qryCreate.sql.Text := SQLTxt;
    qryCreate.ExecSQL;
  end;
end;


procedure TDMModifyDatabase.DropAllNonConstraintIndexes;
begin
  with FDQuery1 do
  begin
    Close;
    SQL.Text :=
      'DECLARE @sql NVARCHAR(MAX) = N'''';' +
      ' ' +
      'SELECT @sql = @sql +' +
      '    N''DROP INDEX '' + QUOTENAME(i.name) +' +
      '    N'' ON '' + QUOTENAME(s.name) + N''.'' + QUOTENAME(t.name) + N'';'' + CHAR(13) + CHAR(10)' +
      ' FROM sys.indexes i' +
      ' INNER JOIN sys.tables  t ON i.object_id = t.object_id' +
      ' INNER JOIN sys.schemas s ON t.schema_id = s.schema_id' +
      ' WHERE i.name IS NOT NULL' +
      '   AND i.type_desc <> ''HEAP''' +
      '   AND i.is_primary_key = 0' +
      '   AND i.is_unique_constraint = 0' +
      '   AND t.is_ms_shipped = 0;' +
      ' ' +
      'IF @sql <> N'''' ' +
      '   EXEC sp_executesql @sql;';

    ExecSQL;
  end;
end;

procedure TDMModifyDatabase.DropProgrammableObjectsAndIndexes;
begin
  with FDQuery1 do
  begin
    Close;
    SQL.Text :=
      'DECLARE @sql NVARCHAR(MAX) = N'''';' + sLineBreak +
      '' + sLineBreak +
      '-- DROP TRIGGERS' + sLineBreak +
      'SELECT @sql = @sql + ' + sLineBreak +
      '    N''DROP TRIGGER '' + QUOTENAME(s.name) + N''.'' + QUOTENAME(tr.name) + N'';'' + CHAR(13) + CHAR(10) ' + sLineBreak +
      'FROM sys.triggers tr ' + sLineBreak +
      'INNER JOIN sys.objects o ON tr.object_id = o.object_id ' + sLineBreak +
      'INNER JOIN sys.schemas s ON o.schema_id = s.schema_id ' + sLineBreak +
      'WHERE tr.parent_class = 1 ' + sLineBreak +
      '  AND ISNULL(tr.is_ms_shipped, 0) = 0; ' + sLineBreak +
      '' + sLineBreak +
      '-- DROP VIEWS' + sLineBreak +
      'SELECT @sql = @sql + ' + sLineBreak +
      '    N''DROP VIEW '' + QUOTENAME(s.name) + N''.'' + QUOTENAME(v.name) + N'';'' + CHAR(13) + CHAR(10) ' + sLineBreak +
      'FROM sys.views v ' + sLineBreak +
      'INNER JOIN sys.schemas s ON v.schema_id = s.schema_id ' + sLineBreak +
      'WHERE ISNULL(v.is_ms_shipped, 0) = 0; ' + sLineBreak +
      '' + sLineBreak +
      '-- DROP FUNCTIONS' + sLineBreak +
      'SELECT @sql = @sql + ' + sLineBreak +
      '    N''DROP FUNCTION '' + QUOTENAME(s.name) + N''.'' + QUOTENAME(o.name) + N'';'' + CHAR(13) + CHAR(10) ' + sLineBreak +
      'FROM sys.objects o ' + sLineBreak +
      'INNER JOIN sys.schemas s ON o.schema_id = s.schema_id ' + sLineBreak +
      'WHERE o.type IN (''FN'',''IF'',''TF'',''FS'',''FT'') ' + sLineBreak +
      '  AND ISNULL(o.is_ms_shipped, 0) = 0; ' + sLineBreak +
      '' + sLineBreak +
      '-- DROP PROCEDURES' + sLineBreak +
      'SELECT @sql = @sql + ' + sLineBreak +
      '    N''DROP PROCEDURE '' + QUOTENAME(s.name) + N''.'' + QUOTENAME(p.name) + N'';'' + CHAR(13) + CHAR(10) ' + sLineBreak +
      'FROM sys.procedures p ' + sLineBreak +
      'INNER JOIN sys.schemas s ON p.schema_id = s.schema_id ' + sLineBreak +
      'WHERE ISNULL(p.is_ms_shipped, 0) = 0; ' + sLineBreak +
      '' + sLineBreak +
      '-- DROP INDEXES' + sLineBreak +
      'SELECT @sql = @sql + ' + sLineBreak +
      '    N''DROP INDEX '' + QUOTENAME(i.name) + ' + sLineBreak +
      '    N'' ON '' + QUOTENAME(s.name) + N''.'' + QUOTENAME(t.name) + N'';'' + CHAR(13) + CHAR(10) ' + sLineBreak +
      'FROM sys.indexes i ' + sLineBreak +
      'INNER JOIN sys.tables t ON i.object_id = t.object_id ' + sLineBreak +
      'INNER JOIN sys.schemas s ON t.schema_id = s.schema_id ' + sLineBreak +
      'WHERE i.name IS NOT NULL ' + sLineBreak +
      '  AND i.type_desc <> ''HEAP'' ' + sLineBreak +
      '  AND i.is_primary_key = 0 ' + sLineBreak +
      '  AND i.is_unique_constraint = 0 ' + sLineBreak +
      '  AND t.is_ms_shipped = 0; ' + sLineBreak +
      '' + sLineBreak +
      'IF @sql <> N'''' ' + sLineBreak +
      '  EXEC sp_executesql @sql;';

    ExecSQL;
  end;
end;

function TDMModifyDatabase.ColumnExists(const ATableName, AColumnName: string): Boolean;
begin
  Result := False;

  with FDQuery1 do
  begin
    Close;
    SQL.Text :=
      'SELECT 1 ' +
      'FROM sys.columns ' +
      'WHERE Name = :ColumnName ' +
      '  AND Object_ID = Object_ID(:TableName)';

    ParamByName('ColumnName').AsString := AColumnName;
    ParamByName('TableName').AsString := ATableName;

    Open;

    Result := not IsEmpty; // ← this is the key
  end;
end;

Procedure TDMModifyDatabase.updatePateientPets;
begin
  if ColumnExists('PACIENTES', 'ANIMAL_NAME') then
  begin
    FDQuery2.Close;
    FDQuery2.SQL.Text := 'Select * from Pacientes where ANIMAL_NAME > ' + chr(39) + chr(39);
    FDQuery2.Open;
    While not FDQuery2.Eof do
    begin
      with FDQuery3 do
      begin
        Close;
        SQL.Text :=
          'INSERT INTO dbo.PETS (' +
          '  NumeroClienteOwner, PetName, Species, Breed, DOB, Sex, IsActive ' +
          ') ' +
          'OUTPUT INSERTED.PetID ' +
          'VALUES (' +
          '  :NumeroClienteOwner, :PetName, :Species, :Breed, :DOB, :Sex, :IsActive' +
          ')';

        ParamByName('NumeroClienteOwner').AsInteger := FDQuery2.fieldbyname('NumeroCliente').Value;
        ParamByName('PetName').AsString := FDQuery2.fieldbyname('ANIMAL_NAME').Value;
        ParamByName('Species').AsString := '02';
        ParamByName('Breed').asString := '';
        ParamByName('DOB').AsDateTime := Date;
        ParamByName('Sex').asString := 'Male';
        ParamByName('IsActive').AsBoolean := true;
        Open;
        var NewID := Fields[0].AsInteger;
        ExecSql('update Prescriptions set PetID = ' + IntToStr(NewID)
        + ' where numerocliente = ' + IntToStr(FDQuery2.fieldbyname('NumeroCliente').Value)
        + ' and VETERINARY = 1');
      end;
      FDQuery2.Next;
    end;
    ExecSql('ALTER TABLE Pacientes DROP COLUMN ANIMAL_NAME');
  end;

end;

procedure FixOrphanDoctorsToNull(AConn: TFDConnection);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := AConn;

    Q.SQL.Text :=
      'UPDATE p ' +
      'SET p.NUMERODOCTOR = NULL ' +
      'FROM dbo.PRESCRIPTIONS p ' +
      'LEFT JOIN dbo.DOCTOR d ' +
      '  ON d.NUMERODOCTOR = p.NUMERODOCTOR ' +
      'WHERE p.NUMERODOCTOR IS NOT NULL ' +
      '  AND d.NUMERODOCTOR IS NULL';

    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

function FixOrphanPatPlanPlanesMedicosNo(AConn: TFDConnection): Integer;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := AConn;

    Q.SQL.Text :=
      'UPDATE pp ' +
      'SET pp.PLANESMEDICOSNO = NULL ' +
      'FROM dbo.PATPLAN pp ' +
      'LEFT JOIN dbo.PLANESMEDICOS pm ' +
      '  ON pm.PLANESMEDICOSNO = pp.PLANESMEDICOSNO ' +
      'WHERE pp.PLANESMEDICOSNO IS NOT NULL ' +
      '  AND pm.PLANESMEDICOSNO IS NULL';

    Q.ExecSQL;
    Result := Q.RowsAffected;
  finally
    Q.Free;
  end;
end;

function DeleteOrphanOTCPatients(AConn: TFDConnection): Integer;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := AConn;

    Q.SQL.Text :=
      'DELETE o ' +
      'FROM dbo.OTC o ' +
      'LEFT JOIN dbo.PACIENTES p ' +
      '  ON p.NUMEROCLIENTE = o.NUMEROCLIENTE ' +
      'WHERE o.NUMEROCLIENTE IS NOT NULL ' +
      '  AND p.NUMEROCLIENTE IS NULL';

    Q.ExecSQL;
    Result := Q.RowsAffected;
  finally
    Q.Free;
  end;
end;

function DeleteOrphanOTCPrescriptions(AConn: TFDConnection): Integer;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := AConn;

    Q.SQL.Text :=
      'DELETE o ' +
      'FROM dbo.OTC o ' +
      'LEFT JOIN dbo.PRESCRIPTIONS p ' +
      '  ON p.NUMERORECETA = o.NUMERORECETA ' +
      'WHERE o.NUMERORECETA IS NOT NULL ' +
      '  AND o.NUMERORECETA <> 0 ' +
      '  AND p.NUMERORECETA IS NULL';

    Q.ExecSQL;
    Result := Q.RowsAffected;
  finally
    Q.Free;
  end;
end;

function GetPrimaryKeyColumnName(AConn: TFDConnection;
  const ATableName: string): string;
var
  Q: TFDQuery;
begin
  Result := '';

  Q := TFDQuery.Create(nil);
  try
    Q.Connection := AConn;

    Q.SQL.Text :=
      'SELECT TOP 1 ' +
      '    c.name AS ColumnName ' +
      'FROM sys.key_constraints kc ' +
      'INNER JOIN sys.index_columns ic ' +
      '    ON kc.parent_object_id = ic.object_id ' +
      '   AND kc.unique_index_id = ic.index_id ' +
      'INNER JOIN sys.columns c ' +
      '    ON ic.object_id = c.object_id ' +
      '   AND ic.column_id = c.column_id ' +
      'INNER JOIN sys.tables t ' +
      '    ON kc.parent_object_id = t.object_id ' +
      'WHERE kc.type = ''PK'' ' +
      '  AND t.name = :TableName ' +
      'ORDER BY ic.key_ordinal';

    Q.ParamByName('TableName').AsString := ATableName;

    Q.Open;

    if not Q.IsEmpty then
      Result := Q.FieldByName('ColumnName').AsString;

  finally
    Q.Free;
  end;
end;

Procedure TDMModifyDatabase.CreatePK;
Var
 primaryKey: String;
begin
  ExecSql(DropFK.SQL.Text);
  DeleteOrphanOTCPatients(FDConnection1);
  DeleteOrphanOTCPrescriptions(FDConnection1);
  ExecSql('UPDATE dbo.OTC SET PRODUCT_ID = NULL WHERE PRODUCT_ID = 0;');
  ExecSql('UPDATE o SET o.PRODUCT_ID = NULL FROM dbo.OTC o LEFT JOIN dbo.INVENTARIOPISO i ON i.PRODUCTNO = o.PRODUCT_ID WHERE o.PRODUCT_ID IS NOT NULL AND o.PRODUCT_ID <> 0 AND i.PRODUCTNO IS NULL;');
  primaryKey := GetPrimaryKeyColumnName(FDConnection1, 'PLANESMEDICOS');
  if primaryKey <> 'PLANESMEDICOSNO' then
  begin
    ExecSql('ALTER TABLE dbo.PLANESMEDICOS DROP CONSTRAINT PK_PLANESMEDICOS;');
    ExecSql('ALTER TABLE dbo.PLANESMEDICOS ADD CONSTRAINT PK_PLANESMEDICOSNO PRIMARY KEY CLUSTERED (PLANESMEDICOSNO);');
  end;
  ExecSql('DELETE pp FROM dbo.PATPLAN pp LEFT JOIN dbo.PACIENTES p ON p.NUMEROCLIENTE = pp.NUMEROCLIENTE WHERE pp.NUMEROCLIENTE IS NOT NULL AND p.NUMEROCLIENTE IS NULL;');
  ExecSql('UPDATE dbo.PATPLAN SET PLANESMEDICOSNO = NULL WHERE PLANESMEDICOSNO = 0;');
  FixOrphanPatPlanPlanesMedicosNo(FDConnection1);
  ExecSql('ALTER TABLE dbo.PATPLAN WITH CHECK ADD CONSTRAINT FK_PATPLAN_PLANESMEDICOS FOREIGN KEY (PLANESMEDICOSNO) REFERENCES dbo.PLANESMEDICOS (PLANESMEDICOSNO);');
  FixOrphanDoctorsToNull(FDConnection1);
  ExecSql('UPDATE dbo.PRESCRIPTIONS SET NUMERODOCTOR = NULL WHERE NUMERODOCTOR = 0;');
  ExecSql('ALTER TABLE dbo.PRESCRIPTIONS WITH CHECK ADD CONSTRAINT FK_PRESCRIPTIONS_DOCTOR FOREIGN KEY (NUMERODOCTOR) REFERENCES dbo.DOCTOR (NUMERODOCTOR);');
  ExecQry(UpdatePlanesMedicoNo.SQL.Text);
  ExecSql('ALTER TABLE dbo.OTC WITH CHECK ADD CONSTRAINT FK_OTC_PLANESMEDICOS FOREIGN KEY (PLANESMEDICOSNO) REFERENCES dbo.PLANESMEDICOS (PLANESMEDICOSNO);');
  ExecSql('ALTER TABLE dbo.OTC WITH CHECK ADD CONSTRAINT FK_OTC_PRESCRIPTIONS FOREIGN KEY (NUMERORECETA) REFERENCES dbo.PRESCRIPTIONS (NUMERORECETA);');
  ExecSql('ALTER TABLE dbo.OTC WITH CHECK ADD CONSTRAINT FK_OTC_PACIENTES FOREIGN KEY (NUMEROCLIENTE) REFERENCES dbo.PACIENTES (NUMEROCLIENTE);');
  ExecSql('ALTER TABLE dbo.OTC WITH CHECK ADD CONSTRAINT FK_OTC_PRODUCT FOREIGN KEY (PRODUCT_ID) REFERENCES dbo.INVENTARIOPISO (PRODUCTNO);');
  ExecSql('UPDATE p SET p.NUMEROCLIENTE = NULL FROM dbo.PATPLAN p LEFT JOIN dbo.PACIENTES pa ON pa.NUMEROCLIENTE = p.NUMEROCLIENTE WHERE p.NUMEROCLIENTE IS NOT NULL AND pa.NUMEROCLIENTE IS NULL;');
  ExecSql('UPDATE p SET p.NUMEROCLIENTE = NULL FROM dbo.PRESCRIPTIONS p LEFT JOIN dbo.PACIENTES pa ON pa.NUMEROCLIENTE = p.NUMEROCLIENTE WHERE p.NUMEROCLIENTE IS NOT NULL AND pa.NUMEROCLIENTE IS NULL;');
  ExecSql('ALTER TABLE dbo.PRESCRIPTIONS WITH CHECK ADD CONSTRAINT FK_PRESCRIPTIONS_PACIENTES FOREIGN KEY (NUMEROCLIENTE) REFERENCES dbo.PACIENTES (NUMEROCLIENTE);');
  ExecSql('UPDATE p SET p.PRODUCT_ID = NULL FROM dbo.PRESCRIPTIONS p LEFT JOIN dbo.INVENTARIOPISO i ON i.PRODUCTNO = p.PRODUCT_ID WHERE p.PRODUCT_ID IS NOT NULL AND i.PRODUCTNO IS NULL;');
  ExecSql('ALTER TABLE dbo.PRESCRIPTIONS WITH CHECK ADD CONSTRAINT FK_PRESCRIPTIONS_PRODUCT FOREIGN KEY (PRODUCT_ID) REFERENCES dbo.INVENTARIOPISO (PRODUCTNO);');
  ExecSql('ALTER TABLE dbo.PATPLAN WITH CHECK ADD CONSTRAINT FK_PATPLAN_PACIENTES FOREIGN KEY (NUMEROCLIENTE) REFERENCES dbo.PACIENTES (NUMEROCLIENTE);');
end;








end.
