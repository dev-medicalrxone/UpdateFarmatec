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
  Soap.EncdDecd, System.IniFiles;

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
    CALC_HEAD_TOTALS: TFDQuery;
    CALC_ORDER_TOTAL: TFDQuery;
    CALC_TOTAL_RXDISPONIBLE: TFDQuery;
    CALCRXDISPONIBLE: TFDQuery;
    CALCULARAUSPICIO: TFDQuery;
    DELETE_PRINT_QUERIES: TFDQuery;
    DELETE_RXTEMP1NORX: TFDQuery;
    DELETE_RXTEMP1TERMINADA: TFDQuery;
    DELETE_SCANED_Q: TFDQuery;
    DEUDA: TFDQuery;
    EM_UPDATEINV: TFDQuery;
    FIXGROUP: TFDQuery;
    GROUP_PROD_POS: TFDQuery;
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
    STARTBANK: TFDQuery;
    GETNEWHEADER: TFDQuery;
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
    CALC_DAILYTOTALS_READ: TFDQuery;
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
    TIME_STAMP: TFDQuery;
    UPDATE_TH_BALANCE: TFDQuery;
    UPDATE_TH_BALANCE_DEL: TFDQuery;
    OPEN_TABS: TFDQuery;
    CALC_TAB_BALANCE: TFDQuery;
    CANCEL_TABS: TFDQuery;
    NEXT_MAIN_COURSE_ID: TFDQuery;
    POS_INVENTORY_CONTROL: TFDQuery;
    CALC_DAILYTOTALS_READ_REST: TFDQuery;
    CALC_HEAD_TOTALS_DEL_TRIG: TFDQuery;
    CALC_HEAD_TOTALS_TRIG: TFDQuery;
    INSERT_NEWTAB: TFDQuery;
    UPDATE_TIME_STAMP: TFDQuery;
    HOLD_SAVE_TRANSACTION: TFDQuery;
    POS_DELETE_OPEN_TRANSACTIONS: TFDQuery;
    TIMECARD_TOTALHOURSWORKED: TFDQuery;
    UPDATE_TRANSACTION_HEADER: TFDQuery;
    PRICE_UPDATE: TFDQuery;
    POS_INSERT_EDIT_INVENTORY: TFDQuery;
    CAL_BALANCE_TEMP: TFDQuery;
    CALC_BALANCE_DELETE: TFDQuery;
    CALC_BALANCE: TFDQuery;
    POS_CANCEL_TRANS: TFDQuery;
    PATIENT_HIPPA_ORIENTED: TFDQuery;
    POS_RECALL_TRANSACTION: TFDQuery;
    POS_SPLIT_TAB: TFDQuery;
    POST_SHOPPER: TFDQuery;
    CALC_CHANGE: TFDQuery;
    POS_INSERT_BUTTON_IMAGE: TFDQuery;
    POS_UPDATE_PRINTED: TFDQuery;
    POS_INSERT_DAILYTOTALS: TFDQuery;
    POS_UPDATE_PAYMENTTYPE: TFDQuery;
    POST_SHOPPER_DAILY: TFDQuery;
    VIP: TFDQuery;
    FarmatecImages: TFDQuery;
    INSERT_SCANNED_RX: TFDQuery;
    IMAGES: TFDQuery;
    FDConnectionFarmatecImages: TFDConnection;
    ADD_EDIT_PRESCRIBER: TFDQuery;
    FDQueryImages: TFDQuery;
    ADD_EDIT_PACIENTES: TFDQuery;
    ADD_EDIT_PATPLAN: TFDQuery;
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
    CALC_COMMISSION: TFDQuery;
    SURESCRIPTS_UPDATE_SURESCRIPTS: TFDQuery;
    Reindex: TFDQuery;
    POS_TFAM_CALC: TFDQuery;
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
    TRANSFER_DETAIL: TFDQuery;
    TRANSFER_HEADER: TFDQuery;
    TRANSFERED_PRODUCTS: TFDQuery;
    POS_ADD_EDIT_CLIENTES: TFDQuery;
    INSERT_ICD10: TFDQuery;
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
    INSERT_EDIT_SHOPPINGCART_DETAIL: TFDQuery;
    INSERT_EDIT_SHOPPINGCART_HEADER: TFDQuery;
    CART_DETAIL: TFDQuery;
    CART_HEADER: TFDQuery;
    ADD_EDIT_REFIL_QUERY: TFDQuery;
    CONTROLED_LOG: TFDQuery;
    ADD_EDIT_CONTROLED_LOG: TFDQuery;
    CALC_CART_TOTAL: TFDQuery;
    INSERT_EDIT_PRODUCT_IMAGE: TFDQuery;
    FDQuery5: TFDQuery;
    CALC_TOTALS_CART_HEADER: TFDQuery;
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
    ADD_EDIT_MOBILE_BUTTONS_DETAIL: TFDQuery;
    ADD_EDIT_BUTTONS_MOBILE_HEADER: TFDQuery;
    BUTTONS_MOBILE_DETAIL: TFDQuery;
    BUTTONS_MOBILE_HEADER: TFDQuery;
    UPDATE_BALANCE: TFDQuery;
    UPDATE_GBY_ID: TFDQuery;
    NOTIFICATION_LOG: TFDQuery;
    INSERT_NOTIFICATION_LOG: TFDQuery;
    DRUG_EXPI_BATCH: TFDQuery;
    payment_type: TFDQuery;
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
    POS_INSERT_EVERTEC_TRANS: TFDQuery;
    EVERTEC: TFDQuery;
    PAYMENT_TYPES: TFDQuery;
    CALC_DAILYTOTALS: TFDQuery;
    CALC_SPLIT_PAYMENT_TAX: TFDQuery;
    D0_BuidTransFile: TFDQuery;
    D0_GetFloatCharacter: TFDQuery;
    D0_COB_segment: TFDQuery;
    D0_DUR_Segment: TFDQuery;
    D0_Workers_compensation: TFDQuery;
    D0_Compound_setment: TFDQuery;
    D0_Clinical_Segment: TFDQuery;
    INSERTPOS: TFDQuery;
    SOFTWARE_VERSION: TFDQuery;
    POS_DISCOUNT: TFDQuery;
    BOGOF: TFDQuery;
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
    POS_UPDATE_DEPART_ATTRIB: TFDQuery;
    POS_GET_HANDHELDINFO: TFDQuery;
    PAYMENT_CARD_LOG: TFDQuery;
    Counters: TFDQuery;
    CALC_PERCENTAGE_DISCOUNT: TFDQuery;
    POS_GET_Stickers: TFDQuery;
    POS_EDIT_INVENTORY: TFDQuery;
    usp_POSStickersSave: TFDQuery;
    POS_GET_PROCESS832INFO: TFDQuery;
    usp_POSStickersFilter: TFDQuery;
    usp_POSStickersPrintReport: TFDQuery;
    ufn_GetUPCA: TFDQuery;
    ufn_ChecksumDigit: TFDQuery;
    USP_POS_INSERT_SPINPOS_TRANS: TFDQuery;
    CALC_PAYOUT: TFDQuery;
    TR_DAILYTOTALS_DELETE_LOG: TFDQuery;
    FDConnection3: TFDConnection;
    EM_INSERT_PRODS: TFDQuery;
    FDTransaction2: TFDTransaction;
    FDPhysMSSQLDriverLink2: TFDPhysMSSQLDriverLink;
    FDGUIxWaitCursor2: TFDGUIxWaitCursor;
    FDConnection2: TFDConnection;
    DROP_TABLES: TFDQuery;
    RX_INSERT_TO_WILLCALL: TFDQuery;
    PR_OTC_INSERT_TO_WILLCALL: TFDQuery;
    WILLCALL_BAG: TFDQuery;
    WC_CREATE_WILLCALL_BAG_IF_MISSING: TFDQuery;
    WC_WILLCALL_DELETE_RX: TFDQuery;
    WC_WILLCALL_RTS_BAG: TFDQuery;
    WC_WILLCALL_ADD_LOG: TFDQuery;
    WC_WILLCALL_PICKUP_BAG: TFDQuery;
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
    procedure ADD_EDIT_PATPLANAfterExecute(DataSet: TFDDataSet);
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
    function DropConstraint(Token, TableName: String): String;
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
    procedure UpdatePOS;
    procedure USP_POS_INSERT_SPINPOS_TRANSAfterExecute(DataSet: TFDDataSet);
   private
    procedure CreateTable(TableName, NewTableName: String);
    procedure ExecSql2(Token1, SQL_Text: String);
    procedure ExecQryCreate(SQLTxt: String);
    procedure Identity(TableName, OnOff: String);





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

uses UntMain, UntDMePrescribe;
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
begin
  FrmMain.Memo1.Clear;
  DropAll;
  FrmMain.PageControlInfo.ActivePageIndex := 0;
  CreateFields('INVENTARIOPISO', 'CUSTOMER_ID_REQUIRED', 'bit null');


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

  //======================== Passwords =========================================
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
  ExecSql('ALTER TABLE passwords DROP CONSTRAINT PK_PASSWORDS');
  ExecSql('ALTER TABLE passwords ADD PRIMARY KEY (USERNO)');
  ExecSql('UPDATE PASSWORDS SET PASSWORD_COL = 123456 WHERE PASSWORD_COL IS NULL');
  ExecSql('UPDATE PASSWORDS SET PASSWORDCOL = 123456 WHERE PASSWORDCOL IS NULL');
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
  ExecQryCreate(INVENTORY_IMAGE.SQL.Text);
  ExecQryCreate(CART_HEADER.SQL.Text);
  ExecQryCreate(CART_DETAIL.SQL.Text);
  CreateFieldsBackup('DATABASES', 'RENAME', 'bit  default(0) null');
  ExecSqlBackup('UPDATE DATABASES SET RENAME = 0 WHERE RENAME IS NULL');
  CreateFieldsBackup('DATABASES', 'LAST_CLOUD_BACKUP', 'datetime null');
  CreateFieldsBackup('DATABASES', 'NOTE', 'varchar(max) null');
  CreateFields('INVENTARIOPISO', 'TRIPLES_PRODUCT', 'bit  default(0) null');
  CreateFields('TABS_HEADER', 'TRANS_TYPE', 'nchar(1) null');
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
    ExecSql('ALTER TABLE PACIENTES ALTER COLUMN PATROCINIO DECIMAL(18,2)');
    ExecSql('ALTER TABLE PACIENTES ALTER COLUMN VETERANO DECIMAL(18,2)');
  end;
  //=============== change Log colum Note DataType to VARCHAR(MAX) ==========================
  FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'LOG'+ chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'NOTE' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('DATA_TYPE').Value = 'varchar' then
  begin
    ExecSql('ALTER TABLE LOG ALTER COLUMN NOTE NVARCHAR(MAX)');
  end;
    ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_DEUDA DEFAULT 0 FOR DEUDA');
    ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_LIMITECREDITO DEFAULT 0 FOR LIMITECREDITO');
    ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_LAWAY DEFAULT 0 FOR LAWAY');
    ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_AUSPICIO DEFAULT 0 FOR AUSPICIO');
    ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_DEUDA_WEB DEFAULT 0 FOR DEUDA_WEB');
    ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_ACCIONES DEFAULT 0 FOR ACCIONES');
    ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_PATROCINIO DEFAULT 0 FOR PATROCINIO');
    ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_VETERANO DEFAULT 0 FOR VETERANO');
    ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_OVERRIDE_SYSTEM_DEFAULT_PRICE DEFAULT 0 FOR OVERRIDE_SYSTEM_DEFAULT_PRICE');
    ExecSql('ALTER TABLE [PACIENTES] ADD CONSTRAINT DF_PACIENTES_RECORD_LOCKED DEFAULT 0 FOR RECORD_LOCKED');

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
    ExecSql('ALTER TABLE INVENTARIOPISO ALTER COLUMN PRECIO2 DECIMAL(18,2)');
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
    DropConstraint('INVENT','INVENTARIOPISO');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_FECHA_EXPIRACION DEFAULT getdate() FOR FECHA_EXPIRACION');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_CMAXINVENTARIO DEFAULT 0 FOR CMAXINVENTARIO');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_CMININVENTARIO DEFAULT 0 FOR CMININVENTARIO');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_STATUS DEFAULT ' + chr(39) +  'A' + chr(39) + ' FOR STATUS');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_PRICE_TABLE_ID DEFAULT 0 FOR PRICE_TABLE_ID');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_OVERRIDE_SYSTEM_DEFAULT_PRICE DEFAULT 0 FOR OVERRIDE_SYSTEM_DEFAULT_PRICE');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_PRICE_UPDATE DEFAULT 0 FOR PRICE_UPDATE');

    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_PSEUDOEPHEDRINE DEFAULT 0 FOR PSEUDOEPHEDRINE');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_EDITAR_PRECIO DEFAULT 1 FOR EDITAR_PRECIO');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_QTYINVENTARIO DEFAULT 0 FOR QTYINVENTARIO');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_SHOWINDIVIDUAL DEFAULT 0 FOR SHOWINDIVIDUAL');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_PROCESSED_FOOD DEFAULT 0 FOR PROCESSED_FOOD');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_COSTO DEFAULT 0 FOR COSTO');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_RBP DEFAULT 0 FOR RBP');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_ESPECIAL DEFAULT 0 FOR ESPECIAL');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_PRECIO DEFAULT 0 FOR PRECIO');

    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_METRICSIZE DEFAULT 0 FOR METRICSIZE');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_PACKAGESIZE DEFAULT 0 FOR PACKAGESIZE');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_PRECIO2 DEFAULT 0 FOR PRECIO2');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_ROBOT DEFAULT 0 FOR ROBOT');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_PRECIOVENTA2 DEFAULT 0 FOR PRECIOVENTA2');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_WAC_PRICE DEFAULT 0 FOR WAC_PRICE');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_MAC_PRICE DEFAULT 0 FOR MAC_PRICE');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_DIRECT_PRICE DEFAULT 0 FOR DIRECT_PRICE');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_UC_PRICE DEFAULT 0 FOR UC_PRICE');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_FOODITEM DEFAULT 0 FOR FOODITEM');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_INITIAL_QTY DEFAULT 0 FOR INITIAL_QTY');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_RECIPE_PRICE DEFAULT 0 FOR RECIPE_PRICE');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_RECIPE DEFAULT 0 FOR RECIPE');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_KITCHEN DEFAULT 0 FOR KITCHEN');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_DAILY_SPECIAL_PRICE DEFAULT 0 FOR DAILY_SPECIAL_PRICE');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_AAC_PRICE DEFAULT 0 FOR AAC_PRICE');
    ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_NONEBC DEFAULT 0 FOR NONEBC');



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

  //=============== change ORDER_HEADER DataType to datetime ==========================
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

  CreateFields('DAILYTOTALS', 'TAX_PROCESSED_FOOD', 'FLOAT default(0) NULL');

  ExecSql('UPDATE INVENTARIOPISO SET EDITAR_PRECIO = 1 WHERE EDITAR_PRECIO IS NULL');
  ExecSql('ALTER TABLE TransactionHeader_TEMP DROP COLUMN AMOUNT_TENDERED');
  ExecSql('ALTER TABLE TransactionHeader DROP COLUMN AMOUNT_TENDERED');





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



  CreateFields('PACIENTES', 'SIGNATURE_RX_LINK', 'INT NULL');
  CreateFields('INVENTARIOPISO', 'NOTE', 'TEXT NULL');
  CreateFields('BOTONES', 'BUTTON_NAME', 'VARCHAR(20) NULL');
  //CreateFields('TRANSACTIONHEADER_TEMP', 'TABS_ID', 'INT NULL');
  //CreateFields('TRANSACTIONHEADER', 'TABS_ID', 'INT NULL');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'TERMINO', 'NCHAR(15) NULL');
  CreateFields('TRANSACTIONDETAIL', 'TERMINO', 'NCHAR(15) NULL');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'MAIN_COURSE', 'BIT DEFAULT 0 NULL');
  CreateFields('TRANSACTIONDETAIL', 'MAIN_COURSE', 'BIT DEFAULT 0 NULL');
  CreateFields('INVENTARIOPISO', 'MODIFIER_QTY', 'INT NULL');
  CreateFields('INVENTARIOPISO', 'KITCHEN', 'BIT DEFAULT 0 NULL ');
  CreateFields('TRANSACTIONDETAIL', 'KITCHEN', 'BIT DEFAULT 0 NULL');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'KITCHEN', 'BIT NULL');
  CreateFields('PACIENTES', 'MIDDLE_NAME', 'varchar(12) NULL');
  CreateFields('Log', 'PRESCRIBER_ID', 'INT NULL');
  CreateFields('Log', 'CUSTOMER_ID', 'INT NULL');
  CreateFields('Log', 'PASSWORD_ID', 'INT NULL');
  CreateFields('Log', 'HEALTH_PLAN_ID', 'INT NULL');
  CreateFields('Log', 'PATIENT_HEALTH_PLAN_ID', 'INT NULL');
  CreateFields('Log', 'DRUG_ID', 'INT NULL');
  CreateFields('CLAIM', 'OTCNUMBER', 'INT NULL');

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
  ExecSql('UPDATE CREDITDEBITSETUP SET SHOW_MARKET_STAUS = 0 WHERE SHOW_MARKET_STAUS IS NULL');
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
  ExecQryCreate(INVENTARIO_ITEM.SQL.Text);
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
  SQLStr := 'IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = ' + chr(39) + TABLENAME + chr(39) + ' AND [COLUMN_NAME] = ' + chr(39) + COLUMN_NAME + chr(39) +') BEGIN ALTER TABLE ' + TABLENAME + ' ADD ' + COLUMN_NAME + ' ' + FieldType +  '  END';
  QBorrarNonMatchedNDC.SQL.Text := SQLStr;
  QBorrarNonMatchedNDC.ExecSQL;
  Except
    on E: EMSSQLNativeException do
    begin
      FrmMain.MemoErrors.Lines.Add(SQLStr +' Execute error: '+#13#10+ E.Message);
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
  {Vendor := Registro.ReadString('Vendor');
  if Registro.ReadString('Vendor') = 'PharmaTech Express' then
  begin
    //Registro.WriteString('Vendor', 'WesCom, Inc.');
    Vendor := Registro.ReadString('Vendor');
  end;}
  Ini := TIniFile.Create('C:\Wescom_Decimal\IniFile\farmatec.ini');
  try
    ServerName := Ini.ReadString('Farmatec', 'ServerPOS', '<None>');
    DataBaseName := Ini.ReadString('Farmatec', 'databasenamePOS', '<None>');
  finally
    Ini.Free;
  end;
  if Trim(DataBaseName) = '<None>' then
  begin
    try
      ServerName := Registro.ReadString('ServerNamePOS');
      DataBaseName := Registro.ReadString('DataBaseNamePOS');
    except
    end;
  end;
  With FDConnection1.Params do
  begin
    Values['Server'] := ServerName;
    Values['Database'] := Trim(DataBaseName);
    Values['User_Name'] := 'dbo';
    Values['password'] := 'agabriel';
    //Values['ODBCAdvanced'] := 'Encrypt=No;TrustServerCertificate=yes';

    FDConnection1.Connected := TRUE;
  end;
  With FDConnection3.Params do
  begin
    Values['Server'] := ServerName;
    Values['Database'] := 'InventoryIQ';
    Values['User_Name'] := 'dbo';
    Values['password'] := 'agabriel';
    //Values['ODBCAdvanced'] := 'Encrypt=No;TrustServerCertificate=yes';
    FDConnection3.Connected := TRUE;
  end;
  FrmMain.StatusBar1.Panels[0].Text := Trim(DataBaseName) + ' ' + Trim(ServerName);
  Try
    With FDConnectionBackup.Params do
    begin
      Values['Server'] := ServerName;
      Values['Database'] := 'Backup';
      Values['User_Name'] := 'dbo';
      Values['password'] := 'agabriel';
      //Values['ODBCAdvanced'] := 'Encrypt=No;TrustServerCertificate=yes';
      FDConnectionBackup.Connected := TRUE;
    end;
  Except
  //
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
  ExecQry('DROP TABLE RX_LABEL');
  Directory61.ExecSQL;
  Prescribers_Specialty.ExecSQL;
  //===================Procedures====================================
  qProcedures.Connection := FDConnection1;       //Assign connection since connection for DB InventoryIQ has been added AGC042826
  cdsProcedures.Close;
  cdsProcedures.CommandText := 'SELECT * FROM sys.procedures where is_ms_shipped = 0';
  cdsProcedures.Open;
  cdsProcedures.First;
  while not cdsProcedures.Eof do
  begin
    ExecQry('DROP PROCEDURE ' + Trim(cdsProceduresname.Value));
    cdsProcedures.Next;
  end;
  qProcedures.Connection := FDConnection3;       //Assign connection since connection for DB InventoryIQ has been added AGC042826
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
  qTriggers.Connection := FDConnection1;    //Assign connection since connection for DB InventoryIQ has been added AGC042826
  cdsTriggers.Close;
  cdsTriggers.CommandText := 'SELECT name, is_instead_of_trigger FROM sys.triggers WHERE type = ' + chr(39) + 'TR' + chr(39);
  cdsTriggers.Open;
  cdsTriggers.First;
  while not cdsTriggers.Eof do
  begin
    ExecQry('DROP Trigger ' + Trim(cdsTriggersname.Value));
    cdsTriggers.Next;
  end;
  qTriggers.Connection := FDConnection3;    //Assign connection since connection for DB InventoryIQ has been added AGC042826
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
  //ExecSql('DROP INDEX [NC_RESPUESTAS_NUMERORECETA] ON [dbo].[RESPUESTAS]');
  //ExecSql('DROP INDEX [NC_RESPUESTAS_OTCNUMBER] ON [dbo].[RESPUESTAS]');
  //==========================================================
  //ExecQryImages('DROP PROCEDURE INSERT_SCANNED_RX');
  //ExecQryImages('DROP PROCEDURE BACKUPDATABASE');
  //======= Image INDEX ==========================
  //ExecQryImages('DROP INDEX [NC_IMAGES_SCANNED_RX_LINK] ON [dbo].[IMAGES]');
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
begin
  Try
  QBorrarNonMatchedNDC.SQL.Text := SQLStr;
  QBorrarNonMatchedNDC.ExecSQL;
  Except
    FrmMain.Memo2.Lines.Add('Error executing: ' + QBorrarNonMatchedNDC.SQL.Text);
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
   DatabaseName := 'Connected: ' + FDConnection1.Params.Values['DataBase'];
end;

procedure TDMModifyDatabase.FDQuery1Error(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  FrmMain.MemoErrors.Lines.Add(FDQuery1.SQL.Text);
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

procedure TDMModifyDatabase.FIX_CONTROLADOAfterExecute(DataSet: TFDDataSet);
begin
  SuccessfullyCreated('FIX_CONTROLADO');
end;

function TDMModifyDatabase.DropConstraint(Token, TableName: String): String;
begin
  cdsObjects.Close;
  cdsObjects.CommandText := 'SELECT NAME FROM sys.objects WHERE name LIKE ' + chr(39) + '%' + Token + '%' + chr(39) + ' AND type = ' + chr(39) + 'D' + chr(39);
  cdsObjects.Open;
  cdsObjects.First;
  While not cdsObjects.Eof do
  begin
     DMModifyDatabase.ExecSql('ALTER TABLE ' + TableName + ' DROP CONSTRAINT ' + Trim(cdsObjectsNAME.Value));
     cdsObjects.Next;
  end;
  Result := '';
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

procedure TDMModifyDatabase.ADD_EDIT_PATPLANAfterExecute(DataSet: TFDDataSet);
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

procedure TDMModifyDatabase.USP_POS_INSERT_SPINPOS_TRANSAfterExecute(
  DataSet: TFDDataSet);
begin
  SuccessfullyCreated('USP_POS_INSERT_SPINPOS_TRANS');
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
end;


Procedure TDMModifyDatabase.ExecQryCreate(SQLTxt: String);
begin
  qryCreate.sql.Clear;
  qryCreate.sql.Text := SQLTxt;
  qryCreate.ExecSQL;
end;


Procedure TDMModifyDatabase.UpdatePOS;
begin
  //Wescosoft new tables ======================================================
  ExecQryCreate(Counters.SQL.Text);
  FDQuery2.Close;
  FDQuery2.SQL.Text := 'select * from counters';
  FDQuery2.Open;
  if FDQuery2.RecordCount = 0 then
  begin
    FDQuery2.Close;
    FDQuery2.SQL.Text := 'insert into COUNTERS (sticker, titulo1, titulo2, titulo3, titulo4, ReceiptMessage) values ('
    + chr(39) + '1' + chr(39) + ','
    + chr(39) + chr(39) + ','
    + chr(39) + chr(39) + ','
    + chr(39) + chr(39) + ','
    + chr(39) + chr(39) + ','
    + chr(39) + chr(39) + ')';
    FDQuery2.ExecSQL;
  end;
  ExecQryCreate(PAYMENT_CARD_LOG.SQL.Text);
  //End Wescosoft new tables ==================================================

  //POS stored procedures ======================================================
  FrmMain.Memo1.Clear;
  DropAll;
  FrmMain.PageControlInfo.ActivePageIndex := 0;
  CreateFields('INVENTARIOPISO', 'PRODUCT_CLASSIFICATION', 'NCHAR(20) null');
  CreateFields('INVENTARIOPISO', 'PRODUCT_IMAGE', 'IMAGE null');
  CreateFields('INVENTARIOPISO', 'AAC_PRICE', 'DECIMAL(18,2) null');
  CreateFields('INVENTARIOPISO', 'CUSTOMER_ID_REQUIRED', 'bit null');
  CreateFields('INVENTARIOPISO', 'GENERIC_LNK', 'INT null');
  CreateFields('INVENTARIOPISO', 'SPI', 'VARCHAR(10) null');
  CreateFields('InventarioPiso', 'DF_QTY', 'NUMERIC(18,2) null');
  CreateFields('InventarioPiso', 'DF_SIG', 'CHAR(4) null');

  CreateFields('INVENTARIOPISO', 'CUSTOMER_ID_REQUIRED', 'bit null');
  CreateFields('EVERTEC', 'DATE_TIME', 'datetime default(getdate()) null');
  //================== Transaction Header ======================================
  CreateFields('TRANSACTIONHEADER_TEMP', 'UT_PAYMENT', 'decimal(18,2) null');
  CreateFields('TRANSACTIONHEADER', 'UT_PAYMENT', 'decimal(18,2) null');
  //============== POS =========================================================
  CreateFields('ORDER_DETAIL', 'INV_QTY_TODATE', 'DECIMAL(18,2) default(0) null');

  CreateFields('DAILYTOTALS', 'UTILITY_CASH_READ', 'DECIMAL(18,2) default(0) null');
  CreateFields('DAILYTOTALS', 'CASHBACK', 'DECIMAL(18,2) default(0) null');
  CreateFields('DAILYTOTALS', 'PAYPALREAD', 'DECIMAL(18,2) default(0) null');
  CreateFields('DAILYTOTALS', 'PAYPALCOUNT', 'DECIMAL(18,2) default(0) null');
  CreateFields('DAILYTOTALS', 'END_OF_DAY', 'BIT null');
  CreateFields('DAILYTOTALS', 'END_OF_DAY_COMPLETED', 'BIT default (0) null');
  CreateFields('DAILYTOTALS', 'EOD_LINK', 'int null');
  ExecQryCreate(CALC_DAILYTOTALS.SQL.Text);
  CreateFields('BUTTONS_MOBILE_DETAIL', 'row', 'int null');
  CreateFields('BUTTONS_MOBILE_DETAIL', 'col', 'int null');
  CreateFields('BUTTONS_MOBILE_DETAIL', 'tab_id', 'int default(0) null');
  CreateFields('BUTTONS_MOBILE_DETAIL', 'category_id', 'int null');
  CreateFields('BUTTONS_MOBILE_HEADER', 'button_category', 'int null');
  CreateFields('BUTTONS_MOBILE_DETAIL', 'add_on', 'nchar(20) null');
  CreateFields('BUTTONS_MOBILE_DETAIL', 'recipe', 'bit null');

  CreateFields('TABS_HEADER', 'GROUP_BY_ID', 'int null');
  CreateFields('TABS_HEADER', 'ISTABLE', 'BIT DEFAULT(0) null') ;
  CreateFields('TABS_DETAIL', 'GROUP_BY_ID', 'int null');
  CreateFields('TABS_DETAIL', 'GROUP_BY_NAME', 'nchar(20) null');
  CreateFields('TABS_HEADER', 'GROUP_BY_NAME', 'nchar(20) null');
  CreateFields('TRANSACTIONHEADER_TEMP', 'TRANS_TYPE', 'NCHAR(2) null');
  CreateFields('TRANSACTIONHEADER', 'TRANS_TYPE', 'NCHAR(2) null');

  CreateFields('TRANSACTIONHEADER_TEMP', 'BALANCE', 'DECIMAL(18,2) null');
  CreateFields('TRANSACTIONHEADER', 'BALANCE', 'DECIMAL(18,2) null');
  CreateFields('PRINT_QUERIES', 'TRANSACTION_NUMBER', 'int null');
  CreateFields('PRINT_QUERIES', 'TRANS_TYPE', 'nchar(4) null');
  CreateFields('PRINT_QUERIES', 'FINAL_RECEIPT', 'bit null');
  CreateFields('PRINT_QUERIES', 'PRINT_TYPE', 'int null');
  CreateFields('PRINT_QUERIES', 'EMAIL', 'NCHAR(80) null');
  CreateFields('PRINT_QUERIES', 'MOBILE_PHONE', 'NCHAR(10) null');
  CreateFields('PRINT_QUERIES', 'CUSTOMER_NUMBER', 'INT null');
  CreateFields('PRINT_QUERIES', 'DELIVERY', 'BIT null');
  CreateFields('PRINT_QUERIES', 'QUOTE', 'BIT null');

  //=============== PASSWORDS ===========================================
  CreateFields('PASSWORDS', 'POS_PRINT_BALANCE', 'bit null');
  ExecSql('update PASSWORDS set POS_PRINT_BALANCE = 0 where POS_PRINT_BALANCE is Null');
  CreateFields('PASSWORDS', 'HOLD_RECALL_EPRESCRIBE', 'bit null');
  CreateFields('PASSWORDS', 'POS_DELETE_RX', 'bit null');
  CreateFields('PASSWORDS', 'PROCESS_HANDHELD', 'bit  DEFAULT ((0))');
  CreateFields('PASSWORDS', 'CREATE_INVENTORY', 'bit null');
  CreateFields('PASSWORDS', 'DELETE_INVENTORY', 'bit null');
  CreateFields('PASSWORDS', 'EDIT_INVENTORY', 'bit null');
  ExecSql('update PASSWORDS set EDIT_INVENTORY = 1, CREATE_INVENTORY = 1, DELETE_INVENTORY = 1 where EDITAR_INVENTARIO = 1');
  ExecSql('ALTER TABLE PASSWORDS ADD CONSTRAINT df_POS_DELETE_RX DEFAULT 0 FOR POS_DELETE_RX');
  ExecSql('ALTER TABLE PASSWORDS ADD CONSTRAINT df_HOLD_RECALL_EPRESCRIBE DEFAULT 0 FOR HOLD_RECALL_EPRESCRIBE');
  ExecSql('ALTER TABLE PASSWORDS ADD CONSTRAINT df_CAMBIARCOSTOYPRECIOVENTA DEFAULT 0 FOR CAMBIARCOSTOYPRECIOVENTA');
  ExecSql('ALTER TABLE PASSWORDS ADD CONSTRAINT df_PHARMACIST_LICENCE DEFAULT '' FOR PHARMACIST_LICENCE');
  CreateFields('PACIENTES', 'RETAILPRICE_SELECTED', 'CHAR(7) null');
  //=============== DEPARTAMENTO ===========================================
  CreateFields('DEPARTAMENTO', 'ALWDISC', 'bit default(0) null');
  CreateFields('DEPARTAMENTO', 'ROUND', 'bit default(0) null');
  CreateFields('DEPARTAMENTO', 'NLINE', 'bit default(0) null');
  CreateFields('DEPARTAMENTO', 'EBT', 'bit default(0) null');
  CreateFields('DEPARTAMENTO', 'Sigis', 'bit default(0) null');
  CreateFields('DEPARTAMENTO', 'OTCCard', 'bit default(0) null');
  CreateFields('DEPARTAMENTO', 'Pseudo', 'bit default(0) null');
  CreateFields('DEPARTAMENTO', 'pseudoMgD', 'INT null');
  CreateFields('DEPARTAMENTO', 'PseudoMgP', 'INT null');
  CreateFields('DEPARTAMENTO', 'NonRefund', 'bit default(0) null');
  CreateFields('DEPARTAMENTO', 'PepSpray', 'bit default(0) null');
  CreateFields('DEPARTAMENTO', 'MaxPerTx', 'int  DEFAULT ((0))');
  CreateFields('DEPARTAMENTO', 'SkipPriceUpd', 'bit  DEFAULT ((0))');
  CreateFields('DEPARTAMENTO', 'SkipPriceDistUpd', 'bit  DEFAULT ((0))');
  CreateFields('DEPARTAMENTO', 'Taxable', 'bit  DEFAULT ((0))');
  CreateFields('DEPARTAMENTO', 'Gm1', 'decimal(18,2) default(0) null');
  CreateFields('DEPARTAMENTO', 'AskID', 'INT not null DEFAULT ((0))');

  //=============== SUB_DEPARTAMENTO ===========================================
  CreateFields('SUB_DEPARTAMENTO', 'ALWDISC', 'bit default(0) null');
  CreateFields('SUB_DEPARTAMENTO', 'ROUND', 'bit default(0) null');
  CreateFields('SUB_DEPARTAMENTO', 'NLINE', 'bit default(0) null');
  CreateFields('SUB_DEPARTAMENTO', 'EBT', 'bit default(0) null');
  CreateFields('SUB_DEPARTAMENTO', 'Sigis', 'bit default(0) null');
  CreateFields('SUB_DEPARTAMENTO', 'OTCCard', 'bit default(0) null');
  CreateFields('SUB_DEPARTAMENTO', 'Pseudo', 'bit default(0) null');
  CreateFields('SUB_DEPARTAMENTO', 'pseudoMgD', 'INT null');
  CreateFields('SUB_DEPARTAMENTO', 'PseudoMgP', 'INT null');
  CreateFields('SUB_DEPARTAMENTO', 'NonRefund', 'bit default(0) null');
  CreateFields('SUB_DEPARTAMENTO', 'PepSpray', 'bit default(0) null');
  CreateFields('SUB_DEPARTAMENTO', 'MaxPerTx', 'int  DEFAULT ((0))');
  CreateFields('SUB_DEPARTAMENTO', 'SkipPriceUpd', 'bit  DEFAULT ((0))');
  CreateFields('SUB_DEPARTAMENTO', 'SkipPriceDistUpd', 'bit  DEFAULT ((0))');
  CreateFields('SUB_DEPARTAMENTO', 'Taxable', 'bit  DEFAULT ((0))');
  CreateFields('SUB_DEPARTAMENTO', 'Gm1', 'decimal(18,2) default(0) null');
  CreateFields('SUB_DEPARTAMENTO', 'AskID', 'INT not null DEFAULT ((0))');
  //=============== INVENTARIO PISO ===========================================
  CreateFields('INVENTARIOPISO', 'SHOWINDIVIDUAL', 'bit default(0) null');
  CreateFields('INVENTARIOPISO', 'Gm1', 'decimal(18,2) default(0) null');
  CreateFields('INVENTARIOPISO', 'Gm2', 'decimal(18,2) default(0) null');
  CreateFields('INVENTARIOPISO', 'ALWDISC', 'bit default(0) null');
  CreateFields('INVENTARIOPISO', 'ROUND', 'bit default(0) null');
  CreateFields('INVENTARIOPISO', 'DepL', 'VARCHAR(4) null');
  CreateFields('INVENTARIOPISO', 'DepS', 'VARCHAR(4) null');
  CreateFields('INVENTARIOPISO', 'NLINE', 'bit default(0) null');
  CreateFields('INVENTARIOPISO', 'EBT', 'bit default(0) null');
  CreateFields('INVENTARIOPISO', 'Sigis', 'bit default(0) null');
  CreateFields('INVENTARIOPISO', 'OTCCard', 'bit default(0) null');
  CreateFields('INVENTARIOPISO', 'Pseudo', 'bit default(0) null');
  CreateFields('INVENTARIOPISO', 'pseudoMgD', 'INT null');
  CreateFields('INVENTARIOPISO', 'PseudoMgP', 'INT null');
  CreateFields('INVENTARIOPISO', 'NonRefund', 'bit default(0) null');
  CreateFields('INVENTARIOPISO', 'PepSpray', 'bit default(0) null');
  CreateFields('INVENTARIOPISO', 'MaxPerTx', 'int  DEFAULT ((0))');
  CreateFields('INVENTARIOPISO', 'SkipPriceUpd', 'bit  DEFAULT ((0))');
  CreateFields('INVENTARIOPISO', 'DtSkipPriceUpd', 'datetime NULL');
  CreateFields('INVENTARIOPISO', 'SkipPriceUpdInit', 'varchar(10) NULL');
  CreateFields('INVENTARIOPISO', 'Gm3', 'decimal(18, 2)  DEFAULT ((0))');
  CreateFields('INVENTARIOPISO', 'line_loc', 'VARCHAR(10)');
  CreateFields('INVENTARIOPISO', 'shelf_loc', 'VARCHAR(10)');
  CreateFields('INVENTARIOPISO', 'stock_loc', 'VARCHAR(10)');
  CreateFields('INVENTARIOPISO', 'ITEM_NUM', 'VARCHAR(20)');
  CreateFields('INVENTARIOPISO', 'SIZE_IT', 'VARCHAR(20)');
  CreateFields('INVENTARIOPISO', 'LST_MODIF_PR', 'datetime NULL');
  CreateFields('INVENTARIOPISO', 'AskID', 'INT not null DEFAULT ((0))');
  CreateFields('INVENTARIOPISO', 'SkipPriceDistUpd', 'bit  DEFAULT ((0))');
  CreateFields('INVENTARIOPISO', 'vendor_ide', 'VARCHAR(10) null');
  CreateFields('InventarioPiso', 'pseudo', 'bit default(0)  null');
  CreateFields('InventarioPiso', 'pep_spray', 'bit default(0)  null');
  CreateFields('InventarioPiso', 'inactive', 'bit default(0)  null');
  CreateFields('InventarioPiso', 'SHOW_ON_ECOMM', 'bit NULL');
  CreateFields('InventarioPiso', 'BARCODE2', 'NCHAR(14) NULL');
  CreateFields('SUPLIDORES', 'STATE', 'char(2) null');
  CreateFields('SUPLIDORES', 'EMAIL', 'nchar(80) null');
  CreateFields('SUPLIDORES', 'WEBSITE', 'NVARCHAR(MAX) null');
  CreateFields('SUPLIDORES', 'COUNTRY', 'nchar(30) null');
  CreateFields('SUPLIDORES', 'CITY', 'nchar(20) null');
  CreateFields('SUPLIDORES', 'VENDOR_NUMBER', 'nchar(12) null');
  CreateFields('SUPLIDORES', 'vendor_id', 'varchar(10) null');
  CreateFields('PACIENTES', 'TAX_EXEMPT', 'bit default(0) null');
  ExecSql('UPDATE PACIENTES SET TAX_EXEMPT = 0 WHERE TAX_EXEMPT IS NULL');
    ExecSql('delete from Pick_up');
  CreateFields('PICK_UP', 'REGISTER_ID', 'int not null');
  ExecSql('ALTER TABLE PICK_UP ALTER COLUMN OTCNUMBER INT NOT NULL');
  ExecSql('ALTER TABLE PICK_UP ADD PRIMARY KEY (OTCNUMBER)');
  ExecSql('ALTER TABLE TRANSACTIONHEADER DROP COLUMN TRIPLES_CUSTOMERID');
  ExecSql('ALTER TABLE TRANSACTIONHEADER_TEMP DROP COLUMN TRIPLES_CUSTOMERID');
  CreateFields('DAILYTOTALS', 'PAYPALREAD', 'decimal(18,2) default(0) null');
  CreateFields('DAILYTOTALS', 'PAYPALCOUNT', 'decimal(18,2) default(0) null');
  CreateFields('DAILYTOTALS', 'TRIPLESREAD', 'decimal(18,2) default(0) null');
  CreateFields('INVENTARIOPISO', 'TRIPLES_PRODUCT', 'bit null');
  DropConstraint('INVENT','INVENTARIOPISO');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_FECHA_EXPIRACION DEFAULT getdate() FOR FECHA_EXPIRACION');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_CMAXINVENTARIO DEFAULT 0 FOR CMAXINVENTARIO');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_CMININVENTARIO DEFAULT 0 FOR CMININVENTARIO');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_STATUS DEFAULT ' + chr(39) +  'A' + chr(39) + ' FOR STATUS');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_PRICE_TABLE_ID DEFAULT 0 FOR PRICE_TABLE_ID');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_OVERRIDE_SYSTEM_DEFAULT_PRICE DEFAULT 0 FOR OVERRIDE_SYSTEM_DEFAULT_PRICE');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_PRICE_UPDATE DEFAULT 0 FOR PRICE_UPDATE');

  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_PSEUDOEPHEDRINE DEFAULT 0 FOR PSEUDOEPHEDRINE');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_EDITAR_PRECIO DEFAULT 1 FOR EDITAR_PRECIO');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_QTYINVENTARIO DEFAULT 0 FOR QTYINVENTARIO');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_SHOWINDIVIDUAL DEFAULT 0 FOR SHOWINDIVIDUAL');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_PROCESSED_FOOD DEFAULT 0 FOR PROCESSED_FOOD');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_COSTO DEFAULT 0 FOR COSTO');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_ESPECIAL DEFAULT 0 FOR ESPECIAL');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_PRECIO DEFAULT 0 FOR PRECIO');

  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_RBP DEFAULT 0 FOR RBP');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_METRICSIZE DEFAULT 0 FOR METRICSIZE');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_PACKAGESIZE DEFAULT 0 FOR PACKAGESIZE');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_PRECIO2 DEFAULT 0 FOR PRECIO2');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_ROBOT DEFAULT 0 FOR ROBOT');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_PRECIOVENTA2 DEFAULT 0 FOR PRECIOVENTA2');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_WAC_PRICE DEFAULT 0 FOR WAC_PRICE');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_MAC_PRICE DEFAULT 0 FOR MAC_PRICE');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_DIRECT_PRICE DEFAULT 0 FOR DIRECT_PRICE');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_UC_PRICE DEFAULT 0 FOR UC_PRICE');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_FOODITEM DEFAULT 0 FOR FOODITEM');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_INITIAL_QTY DEFAULT 0 FOR INITIAL_QTY');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_RECIPE_PRICE DEFAULT 0 FOR RECIPE_PRICE');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_RECIPE DEFAULT 0 FOR RECIPE');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_KITCHEN DEFAULT 0 FOR KITCHEN');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_DAILY_SPECIAL_PRICE DEFAULT 0 FOR DAILY_SPECIAL_PRICE');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_AAC_PRICE DEFAULT 0 FOR AAC_PRICE');
  ExecSql('ALTER TABLE [INVENTARIOPISO] ADD CONSTRAINT DF_INVENTARIOPISO_NONEBC DEFAULT 0 FOR NONEBC');

  //=============== change DAILYTOTALS DataType to DECIMAL(18,2) ==========================
  FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'DAILYTOTALS'+ chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'CASHCOUNT' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('DATA_TYPE').Value <> 'decimal' then
  begin
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN CASHCOUNT DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN CASHREAD DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN CHECKCOUNT DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN CHECKREAD DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN CCARDCOUNT DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN CCARDREAD DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN ATHCOUNT DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN ATHREAD DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN WICCOUNT DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN WICREAD DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN POCOUNT DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN POREAD DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN OTHERCOUNT DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN OTHERREAD DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN STARTBANK DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN PAYOUTCOUNT DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN PAYOUTREAD DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN FAMREAD DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN FAMCOUNT DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN CRPAYREAD DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN CRPAYCOUNT DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN WICPAYCOUNT DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN WICPAYREAD DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN WICCRCOUNT DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN WICCRREAD DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN LOTOREAD DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN LOTOCOUNT DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN REFUNDREAD DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN UTILITYREAD DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN TAX_ESTATAL DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN TAX_MUNICIPAL DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN TAX_SERVICIO DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN TOTAL_READ DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN DIFFERENCE_AMOUNT DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN TOTAL_COUNT DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN ATHMCOUNT DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN ATHMREAD DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN TIPSREAD DECIMAL(18,2)');
    ExecSql('ALTER TABLE DAILYTOTALS ALTER COLUMN TAX_PROCESSED_FOOD DECIMAL(18,2)');
  end;
    DropConstraint('DAILYT','DAILYTOTALS');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_CASHCOUNT DEFAULT 0 FOR CASHCOUNT');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_CASHREAD DEFAULT 0 FOR CASHREAD');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_CHECKCOUNT DEFAULT 0 FOR CHECKCOUNT');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_CHECKREAD DEFAULT 0 FOR CHECKREAD');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_CCARDCOUNT DEFAULT 0 FOR CCARDCOUNT');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_CCARDREAD DEFAULT 0 FOR CCARDREAD');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_ATHCOUNT DEFAULT 0 FOR ATHCOUNT');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_ATHREAD DEFAULT 0 FOR ATHREAD');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_WICCOUNT DEFAULT 0 FOR WICCOUNT');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_WICREAD DEFAULT 0 FOR WICREAD');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_POCOUNT DEFAULT 0 FOR POCOUNT');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_POREAD DEFAULT 0 FOR POREAD');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_OTHERCOUNT DEFAULT 0 FOR OTHERCOUNT');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_OTHERREAD DEFAULT 0 FOR OTHERREAD');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_STARTBANK DEFAULT 0 FOR STARTBANK');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_PAYOUTCOUNT DEFAULT 0 FOR PAYOUTCOUNT');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_PAYOUTREAD DEFAULT 0 FOR PAYOUTREAD');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_FAMREAD DEFAULT 0 FOR FAMREAD');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_FAMCOUNT DEFAULT 0 FOR FAMCOUNT');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_CRPAYREAD DEFAULT 0 FOR CRPAYREAD');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_DAILYTOTALS_CRPAYCOUNT DEFAULT 0 FOR CRPAYCOUNT');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_OTC_WICPAYCOUNT DEFAULT 0 FOR WICPAYCOUNT');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_OTC_WICPAYREAD DEFAULT 0 FOR WICPAYREAD');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_OTC_WICCRCOUNT DEFAULT 0 FOR WICCRCOUNT');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_OTC_WICCRREAD DEFAULT 0 FOR WICCRREAD');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_OTC_LOTOREAD DEFAULT 0 FOR LOTOREAD');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_OTC_LOTOCOUNT DEFAULT 0 FOR LOTOCOUNT');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_OTC_REFUNDREAD DEFAULT 0 FOR REFUNDREAD');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_OTC_UTILITYREAD DEFAULT 0 FOR UTILITYREAD');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_OTC_TAX_ESTATAL DEFAULT 0 FOR TAX_ESTATAL');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_OTC_TAX_MUNICIPAL DEFAULT 0 FOR TAX_MUNICIPAL');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_OTC_TAX_SERVICIO DEFAULT 0 FOR TAX_SERVICIO');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_OTC_TOTAL_READ DEFAULT 0 FOR TOTAL_READ');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_OTC_DIFFERENCE_AMOUNT DEFAULT 0 FOR DIFFERENCE_AMOUNT');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_OTC_TOTAL_COUNT DEFAULT 0 FOR TOTAL_COUNT');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_OTC_ATHMCOUNT DEFAULT 0 FOR ATHMCOUNT');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_OTC_ATHMREAD DEFAULT 0 FOR ATHMREAD');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_OTC_TIPSREAD DEFAULT 0 FOR TIPSREAD');
    ExecSql('ALTER TABLE [DAILYTOTALS] ADD CONSTRAINT DF_OTC_TAX_PROCESSED_FOOD DEFAULT 0 FOR TAX_PROCESSED_FOOD');
    CreateFields('SHOPPER_DETAIL', 'COST', 'FLOAT NULL');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'NOTE', 'NCHAR(30) NULL');
  CreateFields('TRANSACTIONDETAIL', 'NOTE', 'NCHAR(30) NULL');
  CreateFields('CREDITDEBITSETUP', 'LOGO', 'image null');
  CreateFields('CREDITDEBITSETUP', 'LOGO', 'image null');
  CreateFields('CREDITDEBITSETUP', 'CLASSIC_LOGIN', 'bit null');
  CreateFields('CREDITDEBITSETUP', 'POS_RESTAURANT', 'bit null');
  CreateFields('CREDITDEBITSETUP', 'WF_OVERRIDE_CHECKED', 'bit default (0) null');
  CreateFields('CREDITDEBITSETUP', 'POS_INSERT_NEW_PRODUCT', 'bit null');
  ExecSql('UPDATE CREDITDEBITSETUP SET POS_INSERT_NEW_PRODUCT = 0');
  CreateFields('CREDITDEBITSETUP', 'TIME_CARD', 'bit null');
  CreateFields('CREDITDEBITSETUP', 'SpinPosURL', 'VARCHAR(50) null');
  //========================== TRANSACTION DETAIL ================================
  CreateFields('TRANSACTIONDETAIL', 'DISCOUNT_PERCENTAGE', 'decimal(18,2) NULL');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'DISCOUNT_PERCENTAGE', 'decimal(18,2) NULL');
  CreateFields('TRANSACTIONDETAIL', 'SALES_PROMO', 'bit default(0) null');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'SALES_PROMO', 'bit default(0) null');
  CreateFields('TRANSACTIONDETAIL', 'pseudo', 'bit default(0) null');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'pseudo', 'bit default(0) null');
  CreateFields('TRANSACTIONDETAIL', 'pep_spray', 'bit default(0) null');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'pep_spray', 'bit default(0) null');
  CreateFields('TRANSACTIONDETAIL', 'ALWDISC', 'bit default(0) null');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'ALWDISC', 'bit default(0) null');
  CreateFields('TRANSACTIONDETAIL', 'OTCCARD', 'bit default(0) null');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'OTCCARD', 'bit default(0) null');
  CreateFields('TRANSACTIONDETAIL', 'FSA', 'bit default(0) null');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'FSA', 'bit default(0) null');
  CreateFields('TRANSACTIONDETAIL', 'COOPHARMA_DISCOUNT', 'bit default(0) null');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'COOPHARMA_DISCOUNT', 'bit default(0) null');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'TRIPLES_PRODUCT', 'bit null');
  CreateFields('TRANSACTIONDETAIL', 'TRIPLES_PRODUCT', 'bit null');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'TRIPLES_COVERED', 'bit null');
  CreateFields('TRANSACTIONDETAIL', 'TRIPLES_COVERED', 'bit null');
  CreateFields('TRANSACTIONDETAIL', 'TRIPLES_CLAIM_NUMBER', 'nchar(10) null');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'TRIPLES_CLAIM_NUMBER', 'nchar(10) null');
  CreateFields('TRANSACTIONDETAIL', 'TRIPLES_VOID', 'bit null');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'TRIPLES_VOID', 'bit null');
  CreateFields('PASSWORDS', 'POS_REST_DELETEPRODUCT', 'bit null');
  CreateFields('PASSWORDS', 'TIME_CARD', 'bit null');
  CreateFields('CREDITDEBITSETUP', 'SSSOTC_StoreKey', 'NCHAR(50) null');
  CreateFields('CREDITDEBITSETUP', 'SSSOTC_APIKey', 'NCHAR(50) null');
  CreateFields('CREDITDEBITSETUP', 'POS_APP_OPEN_DRAWER', 'bit null');
  ExecSql('UPDATE CREDITDEBITSETUP SET POS_APP_OPEN_DRAWER = 0 WHERE POS_APP_OPEN_DRAWER IS NULL');
  CreateFields('BOTONES', 'PROCESSED_FOOD', 'bit NULL');
  ExecSql('UPDATE BOTONES SET PROCESSED_FOOD = 0 WHERE PROCESSED_FOOD IS NULL');
  CreateFields('PARTNERS', 'ID', '[int] IDENTITY(1,1) NOT NULL PRIMARY KEY');
  CreateFields('TRANSACTIONHEADER', 'DELIVERY_CITY', 'nchar(20) NULL');
  CreateFields('TRANSACTIONHEADER', 'DELIVERY_ZIPCODE', 'nchar(15) NULL');
  CreateFields('TRANSACTIONHEADER', 'DELIVERY_STATE', 'char(2) NULL');
  CreateFields('TRANSACTIONHEADER_TEMP', 'DELIVERY_CITY', 'nchar(20) NULL');
  CreateFields('TRANSACTIONHEADER_TEMP', 'DELIVERY_ZIPCODE', 'nchar(15) NULL');
  CreateFields('TRANSACTIONHEADER_TEMP', 'DELIVERY_STATE', 'char(2) NULL');
  ExecSql('DROP TABLE dbo.PurchaseOrderDetail');
  CreateFields('CREDITDEBITSETUP', 'RECEIPT_MESSAGE', 'varchar(MAX) NULL');
  CreateFields('CREDITDEBITSETUP', 'SETTLEMENT_AT_LOGOUT', 'bit null');
  CreateFields('CREDITDEBITSETUP', 'COOPHARMA_PHARMACY_ID', 'nchar(10) null');
  CreateFields('CREDITDEBITSETUP', 'max_cashback', 'DECIMAL(18,2) default(0) null');
  ExecSql('UPDATE CREDITDEBITSETUP SET max_cashback = 0 WHERE max_cashback IS NULL');
  CreateFields('CREDITDEBITSETUP', 'show_inv_status', 'bit default(0) null');
  ExecSql('UPDATE CREDITDEBITSETUP SET show_inv_status = 0 WHERE show_inv_status IS NULL');
  CreateFields('CREDITDEBITSETUP', 'override_inv_qty', 'bit default(1) null');
  ExecSql('UPDATE CREDITDEBITSETUP SET override_inv_qty = 1 WHERE override_inv_qty IS NULL');
  ExecSql('UPDATE CREDITDEBITSETUP SET RxTrans = '+chr(39)+'0'+chr(39)+' WHERE RxTrans IS NULL');
  CreateFields('CREDITDEBITSETUP', 'SALESTECH_STAND_ALONE', 'BIT NULL');
  CreateFields('CREDITDEBITSETUP', 'CONFIRM_OPEN_REGISTER', 'BIT NULL');
 CreateFields('CREDITDEBITSETUP', 'POS_PRINT_LOGO', 'bit null');
  ExecSql('update CREDITDEBITSETUP set POS_PRINT_LOGO = 1 where POS_PRINT_LOGO is Null');
  CreateFields('CREDITDEBITSETUP', 'POS_CLASIC_PETTYCASH','bit default(0) null');
  ExecSql('update CREDITDEBITSETUP set POS_CLASIC_PETTYCASH = 1 where POS_CLASIC_PETTYCASH is Null');
  CreateFields('BOTONES', 'CATEGORY','int null');
  CreateFields('CLIENTTRANSACTIONS', 'ID', '[int] IDENTITY(1,1) NOT NULL PRIMARY KEY');
  CreateFields('BOTONES', 'RECIPE_PRICE','bit default(0) null');
  CreateFields('CREDITDEBITSETUP', 'POS_ADD_QTY', 'bit null');
  ExecSql('update CREDITDEBITSETUP set POS_ADD_QTY = 0 where POS_ADD_QTY is Null');
  CreateFields('CREDITDEBITSETUP', 'DELETE_ALL_ONNEWRX', 'bit null');
  ExecSql('update CREDITDEBITSETUP set DELETE_ALL_ONNEWRX = 0 where DELETE_ALL_ONNEWRX is Null');
  CreateFields('CREDITDEBITSETUP', 'TIP_PERCENTAGE1', 'decimal(18,2) NULL');
  CreateFields('CREDITDEBITSETUP', 'TIP_PERCENTAGE2', 'decimal(18,2) NULL');
  CreateFields('CREDITDEBITSETUP', 'TIP_PERCENTAGE3', 'decimal(18,2) NULL');
  CreateFields('TRANSACTIONHEADER', 'TIP', 'decimal(18,2) NULL');
  CreateFields('TRANSACTIONHEADER_TEMP', 'TIP', 'decimal(18,2) NULL');
  CreateFields('TRANSACTIONDETAIL', 'INVCONTROL_RECIPE', 'bit NULL');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'INVCONTROL_RECIPE', 'bit NULL');
  CreateFields('TRANSACTIONDETAIL', 'BUTTON_QTY', 'decimal(18,2) NULL');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'BUTTON_QTY', 'decimal(18,2) NULL');
  CreateFields('DAILYTOTALS', 'TIPSREAD', 'real null');
  CreateFields('TABS_HEADER', 'DELIVER_BY_ID', 'Integer null');
  CreateFields('TABS_HEADER', 'CUSTOMER_ID', 'Integer null');
  CreateFields('DAILYTOTALS', 'ATHMCOUNT', 'real null');
  CreateFields('DAILYTOTALS', 'ATHMREAD', 'real null');
  CreateFields('INVENTARIOPISO', 'RECIPE_PRICE', 'decimal(18,2) NULL');
  CreateFields('INVENTARIOPISO', 'RECIPE', 'bit null');
  CreateFields('TIMECARD', 'SECONDS', 'int null');
  CreateFields('DAILYTOTALS', 'TOTAL_READ', 'FLOAT NULL');
  CreateFields('DAILYTOTALS', 'TOTAL_COUNT', 'FLOAT NULL');
  CreateFields('DAILYTOTALS', 'DIFFERENCE_AMOUNT', 'FLOAT NULL');
  CreateFields('TRANSACTIONHEADER', 'TOTAL_DISCOUNT', 'decimal(18,2) NULL');
  CreateFields('TRANSACTIONHEADER_TEMP', 'TOTAL_DISCOUNT', 'decimal(18,2) NULL');
  CreateFields('INVENTARIOPISO', 'SALES_PROMOTION_ID', 'INT NULL');
  CreateFields('SHOPPER_HEADER', 'DEPARTMENT', 'INT NULL');
  CreateFields('SHOPPER_HEADER', 'SUB_DEPARTMENT', 'INT NULL');
  CreateFields('SUB_DEPARTAMENTO', 'EXCLUDE', 'BIT NULL');
  CreateFields('TRANSACTIONHEADER', 'CASHBACK', 'decimal(18,2) default(0) NULL');
  CreateFields('TRANSACTIONHEADER_TEMP', 'CASHBACK', 'decimal(18,2) default(0) NULL');
  CreateFields('CREDITDEBITSETUP', 'STOP_NEWRX_IFSIMILAR_ING', 'bit null');
  ExecSql('Update CREDITDEBITSETUP set SURESCRIPT_VERSION = ' + chr(39) +  '201701' + chr(39) + ' where (SURESCRIPT_VERSION is null) or SURESCRIPT_VERSION = ' + chr(39) + chr(39));
  CreateFields('CREDITDEBITSETUP', 'POS_USER_INDIVIDUAL_BALANCING', 'bit null');
  ExecSql('update CREDITDEBITSETUP set POS_USER_INDIVIDUAL_BALANCING = 1 where POS_USER_INDIVIDUAL_BALANCING is Null');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'TAB_SAVED', 'bit NULL');
  CreateFields('TRANSACTIONDETAIL', 'TAB_SAVED', 'bit NULL');
  CreateFields('CREDITDEBITSETUP', 'AUTOMOVIL_APP', 'bit null');
  CreateFields('CREDITDEBITSETUP', 'POS_REST_ALWAYSLOGOUT', 'bit null');
  CreateFields('TRANSACTIONHEADER', 'AMOUNT_TENDERED1', 'decimal(18,2) default(0) NULL');
  CreateFields('TRANSACTIONHEADER_TEMP', 'AMOUNT_TENDERED1', 'decimal(18,2) default(0) NULL');
  CreateFields('TRANSACTIONHEADER', 'AMOUNT_TENDERED2', 'decimal(18,2) default(0) NULL');
  CreateFields('TRANSACTIONHEADER_TEMP', 'AMOUNT_TENDERED2', 'decimal(18,2) default(0) NULL');
  CreateFields('SHOPPER_HEADER', 'DAILY_SALE_START_TIME', 'time(7) NULL');
  CreateFields('SHOPPER_HEADER', 'DAILY_SALE_END_TIME', 'time(7) NULL');
  CreateFields('SHOPPER_HEADER', 'PERCENTAGE_DISCOUNT', 'DECIMAL(18,2) default(0) NULL');
  CreateFields('INVENTARIOPISO', 'DAILY_SALE_START_TIME', 'time(7) NULL');
  CreateFields('INVENTARIOPISO', 'DAILY_SALE_END_TIME', 'time(7) NULL');
  CreateFields('INVENTARIOPISO', 'DAILY_SALE_ACTIVE', 'BIT NULL');
  CreateFields('INVENTARIOPISO', 'DAILY_SPECIAL_PRICE', 'DECIMAL(18,2) NULL');
  CreateFields('SHOPPER_DETAIL', 'SHOPER_ID', '[int] IDENTITY(1,1) NOT NULL PRIMARY KEY');
  CreateFields('BOTONES', 'RETAIL','bit null');
  CreateFields('TRANSACTIONHEADER', 'TIP2', 'decimal(18,2) default(0) NULL');
  CreateFields('TRANSACTIONHEADER_TEMP', 'TIP2', 'decimal(18,2) default(0) NULL');
  CreateFields('TRANSACTIONHEADER', 'TOTAL_TIP', 'decimal(18,2) default(0) NULL');
  CreateFields('TRANSACTIONHEADER_TEMP', 'TOTAL_TIP', 'decimal(18,2) default(0) NULL');
  CreateFields('TRANSACTIONHEADER', 'OTCCard', 'decimal(18,2) default(0) null');
  CreateFields('TRANSACTIONHEADER_TEMP', 'OTCCard', 'decimal(18,2) default(0) null');
  CreateFields('TRANSACTIONHEADER', 'FSA', 'decimal(18,2) default(0) null');
  CreateFields('TRANSACTIONHEADER_TEMP', 'FSA', 'decimal(18,2) default(0) null');
  CreateFields('TRANSACTIONHEADER', 'TAX_PROCESSED_FOOD', 'decimal(18,2) default(0) NULL');
  CreateFields('TRANSACTIONHEADER_TEMP', 'TAX_PROCESSED_FOOD', 'decimal(18,2) default(0) NULL');
  CreateFields('INVENTARIOPISO', 'PROCESSED_FOOD', 'BIT default(0)');
  CreateFields('TRANSACTIONDETAIL', 'TAX_PROCESSED_FOOD', 'bit default(0)');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'TAX_PROCESSED_FOOD', 'bit default(0)');
  CreateFields('INVENTARIOPISO', 'PROCESSED_FOOD', 'bit null');
  CreateFields('CREDITDEBITSETUP', 'TAX_PROCESSED_FOOD', 'decimal(18,2) default(0) NULL');
  CreateFields('CREDITDEBITSETUP', 'COMMISSION1', 'decimal(18,2) null');
  CreateFields('CREDITDEBITSETUP', 'COMMISSION2', 'decimal(18,2) null');
  CreateFields('CREDITDEBITSETUP', 'COMMISSION3', 'decimal(18,2) null');
  CreateFields('CREDITDEBITSETUP', 'ACTIVE_COMMISSIONS', 'bit null');
  CreateFields('TRANSACTIONHEADER', 'SALESMAN', 'NCHAR(3) null');
  CreateFields('TRANSACTIONHEADER_TEMP', 'SALESMAN', 'NCHAR(3) null');
  CreateFields('TRANSACTIONDETAIL_TEMP', 'COMMISSION', 'decimal(18,2) null');
  CreateFields('TRANSACTIONDETAIL', 'COMMISSION', 'decimal(18,2) null');
  CreateFields('INVENTARIOPISO', 'PRECIOVENTA3', 'float null');
  CreateFields('CREDITDEBITSETUP', 'FAX', 'NCHAR(13) null');
  CreateFields('CREDITDEBITSETUP', 'POS_IMPORT_SIGNATURE', 'bit NULL');
  CreateFields('CREDITDEBITSETUP', 'POS_IMPORT_SIGNATURE', 'bit NULL');
  ExecQry('Update CreditDebitSetup set POS_IMPORT_SIGNATURE = 1 where POS_IMPORT_SIGNATURE  IS NULL');
  CreateFields('CREDITDEBITSETUP', 'PERMIT_ZERO_MANUALSALE', 'bit null');
  ExecSql('UPDATE CREDITDEBITSETUP SET PERMIT_ZERO_MANUALSALE = 0 WHERE PERMIT_ZERO_MANUALSALE IS NULL');
  CreateFields('CREDITDEBITSETUP', 'WC_NOTIFY_BIRTHDAYWISH', 'bit default(1) null');
  ExecSql('UPDATE CREDITDEBITSETUP SET WC_NOTIFY_BIRTHDAYWISH = 1 WHERE WC_NOTIFY_BIRTHDAYWISH IS NULL');
  CreateFields('CREDITDEBITSETUP', 'WC_REFILLREMINDER_NOTIFICATION', 'bit default(1) null');
  ExecSql('UPDATE CREDITDEBITSETUP SET WC_REFILLREMINDER_NOTIFICATION = 1 WHERE WC_REFILLREMINDER_NOTIFICATION IS NULL');
  CreateFields('CREDITDEBITSETUP', 'WC_USE_MSGHUB', 'bit default(0) null');
  CreateFields('CREDITDEBITSETUP', 'WC_ACTIVE', 'bit default(0) null');
  CreateFields('CREDITDEBITSETUP', 'API_KEY', 'varchar(100) null');

  //========================== PRODUCT_SIGNATURE/PSEUDO_SALES_LOG ================================
  CreateFields('PRODUCT_SIGNATURE', 'PICKEDUP_ADDRESS', 'text null');
  CreateFields('PRODUCT_SIGNATURE', 'PICKEDUP_ID_TYPE', 'nchar(30) null');

  //=============== change shopper DataType to datetime ==========================


  //=============== change shopper DataType to datetime ==========================
  FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'SHOPPER'+ chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'FROM_DATE' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('DATA_TYPE').Value = 'date' then
  begin
    ExecQry('ALTER TABLE [dbo].[SHOPPER] DROP COLUMN [FROM_DATE]');
    ExecQry('ALTER TABLE [dbo].[SHOPPER] DROP COLUMN [TO_DATE]');
    CreateFields('SHOPPER', 'TO_DATE', 'DATETIME NULL');
    CreateFields('SHOPPER', 'FROM_DATE', 'DATETIME NULL');
  end;
  //=============== change shopper header DataType to datetime ==========================
  FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'SHOPPER_HEADER'+ chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'START_DATE' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('DATA_TYPE').Value = 'date' then
  begin
    ExecQry('ALTER TABLE [dbo].[SHOPPER_HEADER] DROP COLUMN [START_DATE]');
    ExecQry('ALTER TABLE [dbo].[SHOPPER_HEADER] DROP COLUMN [END_DATE]');
    CreateFields('SHOPPER_HEADER', 'START_DATE', 'DATETIME NULL');
    CreateFields('SHOPPER_HEADER', 'END_DATE', 'DATETIME NULL');
  end;

  //=============== change Inventory SHOWINDIVIDUAL DataType to bit ==========================
  FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'INVENTARIOPISO'+ chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'SHOWINDIVIDUAL' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('DATA_TYPE').Value = 'varchar' then
  begin
    ExecQry('ALTER TABLE [dbo].[INVENTARIOPISO] DROP COLUMN [SHOWINDIVIDUAL]');
    CreateFields('INVENTARIOPISO', 'SHOWINDIVIDUAL', 'bit NULL DEFAULT 0');
    ExecQry('UPDATE TABLE INVENTARIOPISO SET SHOWINDIVIDUAL = 0');
  end;

  //=============== change Inventory EditarPrecio DataType to bit ==========================
  FDQuery1.SQL.Text := 'SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '+ CHR(39) + 'INVENTARIOPISO'+ chr(39) + ' AND ' +
     ' COLUMN_NAME = ' + chr(39) + 'EDITAR_PRECIO' +chr(39);
  FDQuery1.Open;
  if FDQuery1.FieldByName('DATA_TYPE').Value = 'char' then
  begin
    ExecQry('ALTER TABLE [dbo].[INVENTARIOPISO] DROP COLUMN [EDITAR_PRECIO]');
    CreateFields('INVENTARIOPISO', 'EDITAR_PRECIO', 'bit NULL');
  end;
  ExecQry('update INVENTARIOPISO set KITCHEN = 0 where KITCHEN  is null');
  FDQuery1.SQL.Text := 'select column_name, data_type, character_maximum_length from information_schema.columns ' +
                        ' where table_name = ' + CHR(39) + 'transactionDetail' + CHR(39) +
                        ' and column_name = ' + CHR(39) + 'UPC' + CHR(39);
  FDQuery1.Open;
  if (FDQuery1.FieldByName('character_maximum_length').Value = 13) then
  begin
    CreateFields('transactionDetail', 'UPC2', 'CHAR(14) NULL');
    CreateFields('transactionDetail_temp', 'UPC2', 'CHAR(14) NULL');
    ExecQry('update transactionDetail set upc2 = upc');
    ExecQry('update transactionDetail_temp set upc2 = upc');
    FDConnection1.Connected := False;
    ExecQry('ALTER TABLE [dbo].[transactionDetail] DROP COLUMN [UPC]');
    FDConnection1.Connected := False;
    ExecQry('ALTER TABLE [dbo].[transactionDetail_temp] DROP COLUMN [UPC]');
    FDConnection1.Connected := False;
    ExecQry('EXEC sp_rename ' + chr(39) + 'transactionDetail.UPC2' + chr(39) +',' + chr(39) + 'UPC' + chr(39) + ',' + chr(39) + 'COLUMN'+ chr(39));
    FDConnection1.Connected := False;
    ExecQry('EXEC sp_rename ' + chr(39) + 'transactionDetail_TEMP.UPC2' + chr(39) +',' + chr(39) + 'UPC' + chr(39) + ',' + chr(39) + 'COLUMN'+ chr(39));
  end;

  //=============== change Willcall datatypes ==========================
  WILLCALL_BAG.ExecSQL;
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
  //=============== end change Willcall datatypes ==========================

  ExecQryCreate(POS_ROUND_TOTAL.SQL.Text);
  ExecQryCreate(POS_HOLD_TRANS.SQL.Text);
  ExecQryCreate(ADD_EDIT_PATPLAN.SQL.Text);
  ExecQryCreate(ADD_EDIT_PACIENTES.SQL.Text);
  ExecQryCreate(POST_SHOPPER_DAILY.SQL.Text);
  ExecQryCreate(POS_UPDATE_PAYMENTTYPE.SQL.Text);
  ExecQryCreate(POS_INSERT_DAILYTOTALS.SQL.Text);
  ExecQryCreate(POS_UPDATE_PRINTED.SQL.Text);
  ExecQryCreate(POS_INSERT_BUTTON_IMAGE.SQL.Text);
  ExecQryCreate(POST_SHOPPER.SQL.Text);
  ExecQryCreate(POS_SPLIT_TAB.SQL.Text);
  ExecQryCreate(POS_RECALL_TRANSACTION.SQL.Text);
  ExecQryCreate(POS_CANCEL_TRANS.SQL.Text);
  ExecQryCreate(POS_INSERT_EDIT_INVENTORY.SQL.Text);
  ExecQryCreate(UPDATE_TRANSACTION_HEADER.SQL.Text);
  ExecQryCreate(TIMECARD_TOTALHOURSWORKED.SQL.Text);
  ExecQryCreate(POS_DELETE_OPEN_TRANSACTIONS.SQL.Text);
  ExecQryCreate(HOLD_SAVE_TRANSACTION.SQL.Text);
  ExecQryCreate(INSERT_NEWTAB.SQL.Text);
  ExecQryCreate(CALC_DAILYTOTALS_READ_REST.SQL.Text);
  ExecQryCreate(POS_INVENTORY_CONTROL.SQL.Text);
  ExecQryCreate(NEXT_MAIN_COURSE_ID.SQL.Text);
  ExecQryCreate(CANCEL_TABS.SQL.Text);
  ExecQryCreate(CALC_TAB_BALANCE.SQL.Text);
  ExecQryCreate(TIME_STAMP.SQL.Text);
  ExecQryCreate(PICKUP_TF.SQL.Text);
  ExecQryCreate(CALC_DAILYTOTALS_READ.SQL.Text);
  ExecQryCreate(CALC_HEAD_TOTALS.SQL.Text);
  ExecQryCreate(CALC_ORDER_TOTAL.SQL.Text);
  ExecQryCreate(CALC_TOTAL_RXDISPONIBLE.SQL.Text);
  ExecQryCreate(POS_UPDATE_DEPART_ATTRIB.SQL.Text);
  ExecQryCreate(POS_GET_HANDHELDINFO.SQL.Text);
  ExecQryCreate(TRANSACTIONDETAIL_CANCELTRANS.SQL.Text);
  ExecQryCreate(TRANSACTIONDETAIL_DELETE.SQL.Text);
  ExecQryCreate(TRANSACTIONDETAIL_DELETE_PRODUCT.SQL.Text);
  ExecQryCreate(TRANSACTIONDETAIL_UPDATEPRICE.SQL.Text);
  ExecQryCreate(UPDATE_DEBT.SQL.Text);
  ExecQryCreate(STARTBANK.SQL.Text);
  ExecQryCreate(GETNEWHEADER.SQL.Text);
  ExecQryCreate(INSERT_ESIGNATURE_PICTURE.SQL.Text);
  ExecQryCreate(TRANSACTIONDETAIL_UPDATEPRICE_MOBILE.SQL.Text);
  ExecQryCreate(CALCULARAUSPICIO.SQL.Text);
  ExecQryCreate(INSERT_ESIGNATURE.SQL.Text);
  ExecQryCreate(INSERT_TRANS.SQL.Text);
  ExecQryCreate(INSERT_TRANS_TEMP.SQL.Text);
  ExecQryCreate(INSERT_TRANSACTION_CREDITO.SQL.Text);
  ExecQryCreate(FIXGROUP.SQL.Text);
  ExecQryCreate(GROUP_PROD_POS.SQL.Text);
  ExecQryCreate(WILLCALL_TOTAL_AMOUNT_DUE.SQL.Text);
  ExecQryCreate(WILLCALL_History_DELETE.SQL.Text);
  ExecQryCreate(WILLCALL_DELETE.SQL.Text);
  ExecQryCreate(WC_PICKUP_TF.SQL.Text);
  //=========== WILLCALL NEW ====================
  ExecQryCreate(WC_INSERT_NEWPRODUCT_BAG.SQL.Text);
  ExecQryCreate(WC_CREATE_WILLCALL_BAG_IF_MISSING.SQL.Text);
  ExecQryCreate(PR_OTC_INSERT_TO_WILLCALL.SQL.Text);
  ExecQryCreate(RX_INSERT_TO_WILLCALL.SQL.Text);
  ExecQryCreate(WC_WILLCALL_DELETE_RX.SQL.Text);
  ExecQryCreate(WC_WILLCALL_RTS_BAG.SQL.Text);
  ExecQryCreate(WC_WILLCALL_ADD_LOG.SQL.Text);
  ExecQryCreate(WC_WILLCALL_PICKUP_BAG.SQL.Text);


  ExecQryCreate(WC_BAGPICKUP_UPDATE.SQL.Text);
  ExecQryCreate(UPDATE_WC_STATUS.SQL.Text);
  ExecQryCreate(INSERT_PICKUP.SQL.Text);
  ExecQryCreate(WF_UPDATE_PICKUP.SQL.Text);


  ExecQryCreate(WF_UPDATE.SQL.Text);
  ExecQryCreate(NEXTBARCODE.SQL.Text);
  ExecQryCreate(SIGNATURE_LINK.SQL.Text);
  ExecQryCreate(DELETE_PRINT_QUERIES.SQL.Text);
  ExecQryCreate(ADD_EDIT_USERS_RX.SQL.Text);
  ExecQryCreate(POS_GET_Stickers.SQL.Text);
  ExecQryCreate(POS_EDIT_INVENTORY.SQL.Text);
  ExecQryCreate(usp_POSStickersFilter.SQL.Text);
  //ExecQryCreate(usp_POSStickersSave.SQL.Text);
  ExecQryCreate(POS_GET_PROCESS832INFO.SQL.Text);
  ExecQryCreate(usp_POSStickersPrintReport.SQL.Text);
  ExecQryCreate(USP_POS_INSERT_SPINPOS_TRANS.sql.Text) ;
  ExecQryCreate(INSERT_PRODUCT_SIGNATURE.SQL.Text);
  ExecQryCreate(CALC_PAYOUT.SQL.Text);
  ExecQryCreate(EM_INSERT_PRODS.SQL.Text);  //Procedure for DB InventoryIQ AGC042826
  ExecQryCreate(BACKUPDATABASE.SQL.Text);
  //=========== triggers ======================================================
  ExecQryCreate(CALC_CART_TOTAL.SQL.Text);
  ExecQryCreate(UPDATE_BALANCE.SQL.Text);
  ExecQryCreate(CALC_BALANCE_DELETE.SQL.Text);
  ExecQryCreate(CALC_BALANCE.SQL.Text);
  ExecQryCreate(UPDATE_TIME_STAMP.SQL.Text);
  ExecQryCreate(CALC_HEAD_TOTALS_TRIG.SQL.Text);
  ExecQryCreate(CALC_HEAD_TOTALS_DEL_TRIG.SQL.Text);
  ExecQryCreate(OPEN_TABS.SQL.Text);
  ExecQryCreate(UPDATE_TH_BALANCE_DEL.SQL.Text);
  ExecQryCreate(UPDATE_TH_BALANCE.SQL.Text);
  ExecQryCreate(CALC_RXDISPONIBLE.SQL.Text);
  ExecQryCreate(CALC_RXDISPONIBLE_DEL.SQL.Text);
  ExecQryCreate(DELETETRANS.SQL.Text);
  ExecQryCreate(CALC_TRANSFER_TOTAL.SQL.Text);
  ExecQryCreate(ORDER_TOTAL.SQL.Text);
  ExecQryCreate(INSERTGPID.SQL.Text);
  ExecQryCreate(EXPORTTOWILLCALLHISTORY.SQL.Text);
  ExecQryCreate(CREATEWILLCAL_STATUS_LHISTORY.SQL.Text);
  ExecQryCreate(EXPORTTOWILLCAL_STATUS_LHISTORY.SQL.Text);
  ExecQryCreate(CALC_PERCENTAGE_DISCOUNT.SQL.Text);
  ExecQryCreate(TR_DAILYTOTALS_DELETE_LOG.SQL.Text);

  ExecQryCreate(PSEUDO_SALES_LOG.sql.Text);
  ExecQryCreate(INVENTORY_CART.SQL.Text);
  ExecQryCreate(VIP.SQL.Text);
  ExecQryCreate(PURCHASE_SALES.SQL.Text);
  ExecQryCreate(AUSPICIO.SQL.Text);
  ExecQryCreate(AUSPICIOTOTAL.SQL.Text);
  ExecQryCreate(PRODUCTSALES.SQL.Text);
  ExecQryCreate(TOTAL_POS_TRANS.SQL.Text);
  ExecQryCreate(VERTRANSACCIONES.SQL.Text);
  ExecQryCreate(INV_INOUT_RPT.SQL.Text);
  ExecQryCreate(POS_DISCOUNT.SQL.Text);
  ExecQryCreate(INSERTPOS.SQL.Text);
  ExecQryCreate(CALC_SPLIT_PAYMENT_TAX.SQL.Text);
  ExecQryCreate(POS_INSERT_EVERTEC_TRANS.SQL.Text);
  ExecQryCreate(POS_INSERT_TRIPLES_PAYMENT.SQL.Text);
  ExecQryCreate(POS_ADD_EDIT_CLIENTES.SQL.Text);
  ExecQryCreate(POS_TFAM_CALC.SQL.Text);
  ExecQryCreate(CALC_PRODUCT_TAX.SQL.Text);
  ExecQryCreate(CALC_TRIPLES_TAX.SQL.Text);
  ExecQryCreate(CALC_TOTALS_CART_HEADER.SQL.Text);
  ExecQryCreate(POS_UPDATE_TAX_TFAM.SQL.Text);
  ExecQryCreate(ADD_EDIT_BUTTONS_MOBILE_HEADER.SQL.Text);
  ExecQryCreate(ADD_EDIT_MOBILE_BUTTONS_DETAIL.SQL.Text);
  ExecQryCreate(CLOSE_BALANCE.SQL.Text);
  ExecQryCreate(ADD_EDIT_USERS_POS.SQL.Text);
  ExecQryCreate(EDIT_DAILYTOTALS.SQL.Text);
  ExecQryCreate(CALC_COMMISSION.SQL.Text);
  ExecQryCreate(INSERT_EDIT_SHOPPINGCART_HEADER.SQL.Text);
  ExecQryCreate(INSERT_EDIT_SHOPPINGCART_DETAIL.SQL.Text);
  ExecQryCreate(INSERT_FROMCART_TOTRANSACTION.SQL.Text);
  ExecQryCreate(SURESCRIPTS_INSERT_LOG.SQL.Text);
  ExecQryCreate(OTC_INVENTORY_CONTROL.SQL.Text);
  ExecQryCreate(PWRD_ISAUTHORIZED.SQL.Text);
  ExecQryCreate(ISAUTHORIZED.SQL.Text);
  ExecQryCreate(UPDATE_INVENTORY.SQL.Text) ;
  ExecQryCreate(CLONE_PRODUCT.SQL.Text);
  ExecQryCreate(NEXT_ID.SQL.Text);
  ExecQryCreate(INSERT_LOG.SQL.Text);
  ExecQryCreate(LOGEADOPOS.SQL.Text);
  ExecQryCreate(NEXTINSTANCIA_SIGNATURE.SQL.Text);
  ExecQryCreate(INSERT_PRINT_Q.SQL.Text);
  ExecQryCreate(DEUDA.SQL.Text);
  ExecQryCreate(EM_UPDATEINV.SQL.Text);
  ExecQryCreate(BOGOF.SQL.Text);
  ExecQryCreate(PAYMENT_TYPES.SQL.Text);
  ExecQryCreate(EVERTEC.SQL.Text);
  ExecQryCreate(payment_type.SQL.Text);
  ExecQryCreate(BUTTONS_MOBILE_HEADER.SQL.Text);
  ExecQryCreate(BUTTONS_MOBILE_DETAIL.SQL.Text);
  ExecQryCreate(CUSTOMER_CLASSIFICATION.SQL.Text);
  ExecQryCreate(INVENTORY_INOUT_REPORT.SQL.Text);
  //=========== FUNCTIONS ======================================================
  ExecQryCreate(ufn_GetUPCA.SQL.Text);
  ExecQryCreate(ufn_ChecksumDigit.SQL.Text);
end;

end.
