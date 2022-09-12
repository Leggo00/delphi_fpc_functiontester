#ifndef __EWMII_H
#define __EWMII_H

#ifdef __cplusplus
extern "C" {
#endif

#define APIVERSION "ewMII version 6.10 build date: 30.07.2008"

#undef WINDOWS
#undef LINUX
#undef OS9

#ifdef _WIN32
#define WINDOWS
#elif defined(__linux__)
#define LINUX
#elif (defined(_OSK) || defined(_OS9000))
#define OS9
#endif

#ifdef WINDOWS
#define APIVOID          void                   
#define APIBOOLEAN       int                    
#define APIOCTET         int                    
#define APICHAR          char                   /*  8 bit */
#define APISHORT         short                  /* 16 bit */
#define APILONG          long                   /* 32 bit */
#define APIFLOAT         double                 
#define APIDOUBLE        double                 
#define APISTRING        char*
#elif defined(LINUX)
#define APIVOID          void                   
#define APIBOOLEAN       int                    
#define APIOCTET         int                    
#define APICHAR          char                   /*  8 bit */
#define APISHORT         short                  /* 16 bit */
#define APILONG          long                   /* 32 bit */
#define APIFLOAT         double                 
#define APIDOUBLE        double                 
#define APISTRING        char*                  
#endif


#ifndef TRUE
#define TRUE         1
#define FALSE        0
#endif


#define DEFAULT_OPTIONS_FILE_PATH               "ewMII.options"
#define DEFAULT_LIBRARY_LOGFILEPATH             "ewMIIlib.log"
#define DEFAULT_LIBRARY_LCFFILEPATH             "ewMII.lcf"
#define DEFAULT_OPTIONS_FILE_LINE_LENGTH        10000
#define DEFAULT_OPTIONS_FILE_COMMENT_SIGN       '#'
#define DEFAULT_SERVICE_NAME                    "EWApiServices"
#define MAX_ERR_STRING_LENGTH                   256
#define MAX_PARAMETER_STRING_LENGTH             256
#define MAX_NUMBER_OF_SESSIONS                  100


/*  error/return codes */
#define RES_OK                                    (0)

#define RES_ERR_JNI_CALL_API_METHOD            (-100)

#define RES_ERR_JNI_JVM_UNKNOWN_ERROR          (-101)
#define RES_ERR_JNI_JVM_THREAD_ERROR           (-102)
#define RES_ERR_JNI_JVM_VERSION_ERROR          (-103)
#define RES_ERR_JNI_JVM_OUT_OF_MEMORY          (-104)
#define RES_ERR_JNI_JVM_ALREADY_CREATED        (-105)
#define RES_ERR_JNI_JVM_INVALID_ARGUMENTS      (-106)

#define RES_ERR_JNI_STATIC_METHOD_NOT_FOUND    (-110)
#define RES_ERR_JNI_CANT_CREATE_UTF_STRING     (-111)
#define RES_ERR_JNI_CANT_RELEASE_UTF_STRING    (-112)
#define RES_ERR_JNI_CALL_STATIC_METHOD         (-113)
#define RES_ERR_JNI_CALL_OBJECT_METHOD         (-114)
#define RES_ERR_JNI_CLASS_NOT_FOUND_FOR_OBJECT (-115)
#define RES_ERR_JNI_CLASS_NOT_FOUND            (-116)
#define RES_ERR_JNI_METHOD_NOT_FOUND           (-117)
#define RES_ERR_JNI_FIELD_NOT_FOUND            (-118)
#define RES_ERR_JNI_CANT_CREATE_OBJECT         (-119)
#define RES_ERR_JNI_CANT_RELEASE_OBJECT        (-120)
#define RES_ERR_JNI_CANT_ACCESS_ARRAY_ELEMENTS (-121)
#define RES_ERR_JNI_CANT_QUERY_ARRAY_SIZE      (-122)
#define RES_ERR_JNI_RETURNED_REFERENCE_IS_NULL (-123)
#define RES_ERR_JNI_POINTER_IS_NULL            (-124)
#define RES_ERR_JNI_CANT_DELETE_REF            (-125)

#define RES_ERR_API_NOT_INITIALIZED            (-130)
#define RES_ERR_API_ALREADY_INITIALIZED        (-131)
#define RES_ERR_API_NO_VALID_LOGIN             (-132)
#define RES_ERR_API_MAX_SESSIONS_REACHED       (-133)
#define RES_ERR_API_CANT_READ_OPTIONS_FILE     (-134)
#define RES_ERR_API_NO_ENTRIES_IN_OPTIONS_FILE (-135)
#define RES_ERR_API_NOT_ENOUGH_MEMORY          (-136)
#define RES_ERR_API_CANT_WRITE_LOGFILE         (-137)
#define RES_ERR_API_NULL_POINTER               (-138)
#define RES_ERR_API_INVALID_ARRAY_SIZE         (-139)

#define RES_ERR_API_END_OF_RESULT_RANGE        (-199)



/* definition of structure KeyValuePair */
struct KeyValuePair
{
  APISTRING name;
  APISTRING value;
};

/* definition of structure ApiSessionValidationStruct */
struct ApiSessionValidationStruct
{
  APISTRING user;
  APISTRING password;
  APISTRING client;
  APIBOOLEAN isVip;
  APIBOOLEAN isStation;
  APISTRING systemIdentifier;
};

/* definition of structure ResultData */
struct ResultData
{
  APISTRING name;
  APISTRING value;
  APILONG failCode;
};

/* definition of structure ResultDataExtendedStruct */
struct ResultDataExtendedStruct
{
  APIFLOAT nr;
  APISTRING name;
  APISTRING value;
  APISTRING min;
  APISTRING max;
  APISTRING nom;
  APISTRING toleranz;
  APISTRING unit;
  APILONG failCode;
  APISTRING messtyp;
};

/* definition of structure ResultDataExtendedLimitsStruct */
struct ResultDataExtendedLimitsStruct
{
  struct ResultDataExtendedStruct resDataExtendedStruct;
  APISTRING min_eg_ok;
  APISTRING max_eg_ok;
  APISTRING min_eg_aus;
  APISTRING max_eg_aus;
  APISTRING typ;
  APILONG weighting;
  APILONG distributionType;
  APILONG confidenceInterval;
  APIDOUBLE cpRed;
  APIDOUBLE cpGreen;
  APIDOUBLE cpkRed;
  APIDOUBLE cpkGreen;
  APIDOUBLE noiseFactor;
  APILONG cleanupMode;
};

/* definition of structure RecipeData */
struct RecipeData
{
  APISTRING name;
  APISTRING value;
};

/* definition of structure SerialNumberData */
struct SerialNumberData
{
  APISTRING serialNumber;
  APISTRING serialNumberPos;
};

/* definition of structure BomCompFailData */
struct BomCompFailData
{
  APISTRING compName;
  APISTRING partNr;
  APISTRING comment;
};

/* definition of structure MergePartsData */
struct MergePartsData
{
  APISTRING stationNr;
  APISTRING stationDesc;
  APISTRING serialNumber;
  APISTRING serialNumberPos;
  APISTRING parentSerialNumber;
  APISTRING slaveSerialNumber;
  APISTRING level;
  APISTRING workOrder;
  APISTRING partNr;
  APISTRING partDesc;
  APILONG bomVersion;
  APISTRING bomIndex;
  APISTRING cadPartNr;
};

/* definition of structure WorkStationData */
struct WorkStationData
{
  APISTRING workOrderNr;
  APISTRING resourceNr;
  APISTRING resourceDesc;
  APISTRING snr;
  APISTRING position;
  APISTRING state;
  APIFLOAT cycleTime;
  APISTRING bookDate;
  APISTRING createDate;
};

/* definition of structure ProductInfoData */
struct ProductInfoData
{
  APISTRING partNr;
  APISTRING partDesc;
  APISTRING secPartNr;
  APISTRING partGrpNr;
  APILONG level;
  APILONG bomVersion;
  APISTRING bomIndex;
  APISTRING cadPartNr;
  APILONG validationDate;
  APILONG validFrom;
  APILONG validTo;
};

/* definition of structure ErrorData */
struct ErrorData
{
  APISTRING workOrderNr;
  APISTRING resourceNr;
  APISTRING snr;
  APISTRING position;
  APISTRING partName;
  APISTRING errorTypeDesc;
  APISTRING partNumber;
  APISTRING repaired;
  APISTRING adapResNumber;
  APISTRING serialError;
};

/* definition of structure TestData */
struct TestData
{
  APISTRING snr;
  APISTRING position;
  APISTRING resourceNr;
  APISTRING resourceDesc;
  APILONG asNr;
  APILONG seqNr;
  APISTRING name;
  APISTRING value;
  APILONG failCode;
  APILONG step;
  APISTRING registrated;
};

/* definition of structure StateData */
struct StateData
{
  APISTRING serialNumber;
  APISTRING serialNumberPos;
  APILONG loopCounter;
  APILONG state;
};

/* definition of structure SetupData */
struct SetupData
{
  APISTRING workorder;
  APISTRING productNo;
  APISTRING productDesc;
  APISTRING partOrder;
  APISTRING partNo;
  APISTRING partDesc;
  APISTRING partName;
  APISTRING partDateCode;
  APISTRING customerNo;
  APISTRING customerName;
  APISTRING position;
  APIDOUBLE quantity;
  APILONG startDate;
  APILONG endDate;
  APILONG creationDate;
};

/* definition of structure SetupDataExt */
struct SetupDataExt
{
  APISTRING workorder;
  APISTRING productNo;
  APISTRING productDesc;
  APISTRING partOrder;
  APISTRING partNo;
  APISTRING partDesc;
  APISTRING partName;
  APISTRING partDateCode;
  APISTRING customerNo;
  APISTRING customerName;
  APISTRING position;
  APIDOUBLE quantity;
  APILONG startDate;
  APILONG endDate;
  APILONG creationDate;
  APISTRING materialBinNr;
  APISTRING creationUser;
  APIDOUBLE totalQuantity;
  APILONG state;
};

/* definition of structure SetupDataInf */
struct SetupDataInf
{
  APISTRING stationNr;
  APISTRING position;
  APILONG startDate;
  APILONG endDate;
  APISTRING materialBinNr;
  APISTRING partOrder;
  APISTRING partNo;
  APISTRING partDateCode;
};

/* definition of structure SetupPrepareData */
struct SetupPrepareData
{
  APISTRING position;
  APISTRING materialBinNr;
};

/* definition of structure StringStruct */
struct StringStruct
{
  APISTRING value;
};

/* definition of structure FailData */
struct FailData
{
  APISTRING fehlerOrt;
  APISTRING fehlerArt;
  APILONG lage;
  APILONG repariert;
};

/* definition of structure CompFailData */
struct CompFailData
{
  APISTRING compName;
  APISTRING compPartNo;
  APISTRING failureType;
  APISTRING failureCause;
  APISTRING infoText;
  APILONG processLayer;
  APILONG repair;
};

/* definition of structure BomItemData */
struct BomItemData
{
  APISTRING partNo;
  APISTRING partDesc;
  APISTRING secPartNo;
  APISTRING compName;
  APISTRING process;
  APILONG processLayer;
  APISTRING processInfo;
  APISTRING bomInfo;
  APILONG quantity;
  APISTRING unit;
  APILONG setup;
  APILONG isProduct;
  APILONG isAlternative;
};

/* definition of structure MasterDataBom */
struct MasterDataBom
{
  APISTRING partNo;
  APISTRING partDesc;
  APISTRING secPartNo;
  APISTRING compName;
  APILONG alternative;
  APIDOUBLE quantity;
  APISTRING unit;
  APILONG isProduct;
  APILONG bomVersion;
  APISTRING bomInfo;
  APILONG processType;
  APISTRING processGrp;
  APILONG processLayer;
  APILONG traceFlag;
  APISTRING processInfo;
  APILONG workstepNo;
};

/* definition of structure MaterialBinData */
struct MaterialBinData
{
  APISTRING materialBinNr;
  APISTRING productNr;
  APIDOUBLE quantity;
  APISTRING chargeNr;
  APISTRING binLocationNr;
  APISTRING binLocationDescr;
  APISTRING state;
  APILONG expirationDate;
  APISTRING dateCode;
  APIDOUBLE totalQuantity;
  APIDOUBLE cost;
  APILONG costBase;
};

/* definition of structure ConfigData */
struct ConfigData
{
  APISTRING name;
  APISTRING value;
};

/* definition of structure CalendarData */
struct CalendarData
{
  APISTRING localizedDate;
  APILONG date;
  APILONG calendar_week;
  APILONG day_of_week;
  APILONG year;
  APILONG month;
  APILONG day;
  APILONG hour;
  APILONG minute;
  APILONG second;
};

/* definition of structure SerialNumberStruct */
struct SerialNumberStruct
{
  APISTRING serialNumber;
};

/* definition of structure ChargeInfoStruct */
struct ChargeInfoStruct
{
  APISTRING chargeExt;
  APISTRING state;
  APILONG qty;
};

/* definition of structure ShippingLotStruct */
struct ShippingLotStruct
{
  APISTRING partNo;
  APISTRING partDesc;
  APILONG meh;
  APISTRING custCode;
  APISTRING customerName;
  APISTRING extCustCode;
  APILONG startDate;
  APILONG endDate;
  APISTRING snrMatExt;
  APIDOUBLE meTotal;
  APIDOUBLE meRest;
  APISTRING beaStatus;
  APISTRING artBezPart;
  APISTRING artPart;
};

/* definition of structure SetupHistoryData */
struct SetupHistoryData
{
  APISTRING stationNr;
  APISTRING workOrder;
  APILONG workStep;
  APISTRING position;
  APISTRING materialBinNr;
  APISTRING kompInfo;
  APILONG dateFrom;
  APILONG dateTo;
  APILONG returnCode;
  APISTRING returnComment;
};

/* definition of structure RecipeHeaderAndVersion */
struct RecipeHeaderAndVersion
{
  APILONG recipeId;
  APISTRING recipeTitle;
  APILONG partId;
  APISTRING partNr;
  APILONG bomVersion;
  APILONG processVersion;
  APISTRING revisionIndex;
  APILONG processStep;
  APILONG stationId;
  APISTRING stationNr;
  APILONG recipeVersionId;
  APIDOUBLE recipeVersion;
  APISTRING recipeVersionTitle;
  APISTRING recipeVersionDescription;
  APIBOOLEAN active;
  APISTRING comment;
  APILONG validFrom;
  APILONG validTo;
};

/* definition of structure RecipeDataExtendedStruct */
struct RecipeDataExtendedStruct
{
  APILONG recipeVersionId;
  APIDOUBLE sequentialNumber;
  APISTRING name;
  APISTRING type;
  APISTRING remark;
  APISTRING lowerLimit;
  APISTRING upperLimit;
  APISTRING nominal;
  APISTRING tolerance;
  APISTRING unit;
  APISTRING measureType;
  APISTRING lowerActionLimit;
  APISTRING upperActionLimit;
  APISTRING lowerScrapLimit;
  APISTRING upperScrapLimit;
  APILONG weighting;
  APILONG distributionType;
  APILONG confidenceInterval;
};

/* definition of structure SnrAttributeInfo */
struct SnrAttributeInfo
{
  APILONG snrId;
  APISTRING serialNumber;
  APILONG attributeNumber;
  APISTRING attributeValue;
  APISTRING attributeCode;
};

/* definition of structure MaterialBinAttributeInfo */
struct MaterialBinAttributeInfo
{
  APILONG snrMatId;
  APISTRING materialBinNr;
  APILONG attributeNumber;
  APISTRING attributeDesc;
  APISTRING attributeValue;
  APISTRING attributeCode;
};

/* definition of structure ChargeAttributeInfo */
struct ChargeAttributeInfo
{
  APILONG chargeNr;
  APISTRING chargeExt;
  APILONG attributeNumber;
  APISTRING attributeValue;
  APISTRING attributeCode;
  APISTRING attributeValueDesc;
  APISTRING attributeType;
  APISTRING objectKey;
  APISTRING partNo;
};

/* definition of structure AttributeInfo */
struct AttributeInfo
{
  APISTRING attributeCode;
  APISTRING value;
};

/* definition of structure StoreInfo */
struct StoreInfo
{
  APISTRING storageCell;
  APISTRING storageCellDesc;
  APISTRING storageGroup;
  APISTRING storageGroupDesc;
  APISTRING storage;
  APISTRING storageDesc;
  APISTRING materialBinNo;
  APISTRING partNo;
  APISTRING partDesc;
  APIDOUBLE totalQuantity;
  APIDOUBLE quantity;
  APISTRING unit;
  APISTRING supplierNo;
  APISTRING supplierName;
  APISTRING chargeNo;
  APISTRING dateCode;
  APILONG expirationDate;
  APICHAR materialBinState;
  APIDOUBLE cost;
  APILONG costBase;
  APISTRING weNr;
  APISTRING classification;
  APILONG createDate;
  APILONG changeDate;
};

/* definition of structure SetupCompData */
struct SetupCompData
{
  APILONG stationId;
  APISTRING stationNr;
  APISTRING stationDesc;
  APILONG snrId;
  APISTRING serialNumber;
  APISTRING serialNumberRef;
  APISTRING workorder;
  APILONG level;
  APILONG startDate;
  APILONG asNr;
  APISTRING position;
  APILONG dateFrom;
  APILONG dateTo;
  APILONG partId;
  APISTRING partNo;
  APISTRING partDesc;
  APILONG skslPositionNr;
  APISTRING partName;
  APISTRING compName;
  APISTRING partOrder;
  APISTRING partDateCode;
  APISTRING customerNo;
  APISTRING customerName;
  APISTRING materialBinNr;
  APIDOUBLE totalQuantity;
  APILONG state;
  APISTRING classification;
  APILONG expirationDate;
  APILONG readyForUseDate;
  APISTRING beaStatus;
};

/* definition of structure WorkplanData */
struct WorkplanData
{
  APISTRING stationNr;
  APISTRING workOrder;
  APILONG workstepNo;
  APILONG processStepNo;
  APILONG voucherNo;
  APILONG threadNo;
  APILONG validFrom;
  APILONG validTo;
  APILONG prevWorkstep;
  APILONG nextWorkstep;
  APILONG prevWorkstepConfirm;
  APILONG nextWorkstepConfirm;
  APILONG qtyWoTotal;
  APILONG pass;
  APILONG scrap;
  APILONG fail;
  APILONG qtyWoOpen;
  APILONG qtyPsScrap;
  APILONG processLayer;
  APILONG separationFlag;
  APISTRING erpGroupNo;
  APISTRING erpGroupDesc;
  APISTRING obligatoryConfirmFlag;
  APISTRING setupFlag;
  APISTRING workplanProcessStepNo;
  APISTRING avo;
};

/* definition of structure MDAObject */
struct MDAObject
{
  APISTRING uniqueFileName;
  APISTRING mdaFileName;
  APISTRING uniqueFilePath;
  APISTRING urlName;
  APISTRING mdaDataType;
  APISTRING docType;
  APISTRING mdaName;
  APISTRING mdaDesc;
  APISTRING mdaVersion;
  APISTRING mdaVersName;
  APISTRING mdaVersDesc;
  APISTRING mdaStatus;
  APISTRING mdaActive;
};

/* definition of structure AdviceConfirmation */
struct AdviceConfirmation
{
  APILONG userId;
  APISTRING userName;
  APISTRING userFirstName;
  APILONG confirmed;
  APILONG confirmationTime;
  APISTRING adviceEditText;
};

/* definition of structure Advice */
struct Advice
{
  APILONG id;
  APISTRING text;
  APISTRING name;
  APILONG mdaRootKey;
  APILONG adviceType;
};

/* definition of structure MaterialBinDataExt */
struct MaterialBinDataExt
{
  APISTRING materialBinNr;
  APISTRING partNr;
  APIDOUBLE totalQuantity;
  APIDOUBLE quantity;
  APISTRING supplierNo;
  APISTRING supplierName;
  APISTRING chargeNr;
  APISTRING dateCode;
  APILONG expirationDate;
  APISTRING materialBinState;
  APISTRING binLocationNr;
  APISTRING binLocationDescr;
  APIDOUBLE cost;
  APILONG costBase;
  APISTRING weNr;
  APILONG createDate;
  APILONG stamp;
  APILONG changeDate;
  APISTRING classification1;
  APISTRING classification2;
  APISTRING classification3;
  APISTRING classification4;
  APISTRING classification5;
};

/* definition of structure WorkorderForLine */
struct WorkorderForLine
{
  APISTRING workorder;
  APISTRING workorderDesc;
  APISTRING productNo;
  APIDOUBLE quantity;
  APISTRING workorderState;
  APISTRING workorderType;
  APILONG bomVersion;
  APISTRING revisionIndex;
  APILONG processVersion;
  APILONG workPlanVers;
  APILONG plannedStartDate;
  APILONG plannedShipDate;
  APILONG workorderStartDate;
  APISTRING infoTxt1;
  APISTRING infoTxt2;
  APISTRING infoTxt3;
  APISTRING infoTxt4;
  APISTRING infoTxt5;
  APISTRING infoTxt6;
  APILONG infoNo1;
  APILONG infoNo2;
  APILONG infoNo3;
  APILONG infoNo4;
};

/* definition of structure MaterialBinBookings */
struct MaterialBinBookings
{
  APILONG counter;
  APISTRING partNr;
  APISTRING materialBinNr;
  APIDOUBLE quantity;
  APILONG transact;
  APISTRING workorder;
  APILONG processLayer;
  APISTRING stationNoBook;
  APILONG bookDate;
  APILONG errorcode;
  APISTRING errortxt;
};

/* definition of structure FailureCauseData */
struct FailureCauseData
{
  APISTRING failureGroupCode;
  APISTRING failureGroupBez;
  APISTRING failureGroupInfo;
  APISTRING failureCauseCode;
  APISTRING failureCauseBez;
  APISTRING failureCauseInfo;
  APILONG errorcode;
  APISTRING errortxt;
};

/* definition of structure FailureTypData */
struct FailureTypData
{
  APISTRING failureGroupCode;
  APISTRING failureGroupBez;
  APISTRING failureGroupInfo;
  APISTRING failureTypeCode;
  APISTRING failureTypeBez;
  APISTRING failureTypeInfo;
  APILONG failureTypePseudo;
  APICHAR failureTypeCategory;
  APILONG errorcode;
  APISTRING errortxt;
};

/* definition of structure FailureData */
struct FailureData
{
  APISTRING serialNumber;
  APILONG serialNumberPos;
  APISTRING workorder;
  APILONG workstepNo;
  APISTRING stationNr;
  APILONG processLayer;
  APILONG seqNumber;
  APISTRING compName;
  APISTRING compPartNumber;
  APISTRING failureType;
  APISTRING failureCause;
  APILONG failureBookDate;
  APISTRING repair;
  APIDOUBLE cycleTime;
  APISTRING infoText;
};

/* definition of structure FailureSlipData */
struct FailureSlipData
{
  APISTRING workorder;
  APILONG workstepNo;
  APISTRING stationNr;
  APILONG processLayer;
  APILONG seqNumber;
  APISTRING infoText;
  APILONG failureBookDate;
};

/* definition of structure FailureResultData */
struct FailureResultData
{
  APISTRING workorder;
  APILONG workstepNo;
  APISTRING stationNr;
  APILONG processLayer;
  APILONG seqNumber;
  APILONG nr;
  APISTRING name;
  APISTRING type;
  APISTRING messType;
  APISTRING value;
  APISTRING min;
  APISTRING max;
  APISTRING nom;
  APISTRING toleranz;
  APISTRING unit;
  APILONG failCode;
};

/* definition of structure EquipmentPrepareData */
struct EquipmentPrepareData
{
  APISTRING equipmentNo;
  APISTRING equipmentIndex;
};

/* definition of structure EquipmentSetupData */
struct EquipmentSetupData
{
  APISTRING equipmentNo;
  APISTRING equipmentIndex;
  APISTRING equipmentNoExt;
  APISTRING equipmentDescription;
  APISTRING info1;
  APISTRING info2;
  APISTRING info3;
  APILONG status;
  APILONG secondsBeforeExpiration;
  APILONG usagesBeforeExpiration;
  APILONG failuresBeforeExpiration;
};

/* definition of structure EquipmentCheckData */
struct EquipmentCheckData
{
  APISTRING equipmentNo;
  APISTRING equipmentIndex;
  APILONG checkStatus;
  APISTRING equipmentSetupGroup;
  APISTRING partNo;
  APISTRING partGrp;
  APISTRING equipmentExt;
  APISTRING equipmentDescription;
  APILONG groupItemType;
  APISTRING info1;
  APISTRING info2;
  APISTRING info3;
};

/* definition of structure CompPosition */
struct CompPosition
{
  APILONG compReference;
  APISTRING compName;
  APILONG panelPosition;
};

/* definition of structure MaterialSetupData */
struct MaterialSetupData
{
  APISTRING position;
  APISTRING materialBinNr;
  APISTRING stationNr;
  APISTRING productNr;
  APISTRING supplierCode;
  APISTRING supplierName;
  APISTRING workOrder;
  APISTRING placementName;
  APISTRING partNr;
  APILONG compReference;
  APILONG setupDate;
  APILONG endDate;
  APILONG returnCode;
  APISTRING returnComment;
  APISTRING dateCode;
  APIBOOLEAN removeSetup;
};

/* definition of structure MaterialBinBookingsExt */
struct MaterialBinBookingsExt
{
  APILONG counter;
  APISTRING partNr;
  APISTRING materialBinNr;
  APIDOUBLE quantity;
  APILONG transact;
  APISTRING workorder;
  APILONG processLayer;
  APISTRING stationNoBook;
  APILONG bookDate;
  APILONG errorcode;
  APISTRING errortxt;
  APIDOUBLE qtyPlaced;
  APIDOUBLE qtyWasted;
};

/* definition of structure SmtSerialNo */
struct SmtSerialNo
{
  APISTRING serialNumber;
  APILONG serialNumberPosition;
  APILONG serialNumberState;
  APILONG validationFlag;
  APILONG processFlag;
};

/* definition of structure SmtEvent */
struct SmtEvent
{
  APILONG eventId;
  APILONG eventDate;
  APILONG validationFlag;
  APILONG processFlag;
  APISTRING position;
  APISTRING feederBank;
  APISTRING feederId;
  APILONG placementId;
  APILONG qtyRemain;
  APILONG qtyPlaced;
  APILONG qtyWasted;
  APISTRING materialBinNr;
  APIBOOLEAN createMaterialBin;
  APISTRING partNo;
  APIDOUBLE quantity;
  APISTRING supplier;
  APISTRING lotNo;
  APISTRING dateCode;
};

/* definition of structure SmtPlacement */
struct SmtPlacement
{
  APILONG placementId;
  APISTRING compName;
  APISTRING xPosition;
  APISTRING yPosition;
  APILONG panelPosition;
};

/* definition of structure Failureslip */
struct Failureslip
{
  APISTRING compName;
  APISTRING testStepName;
  APISTRING testStepDescription;
};

/* definition of structure SerialNumberBookInfo */
struct SerialNumberBookInfo
{
  APISTRING serialNumber;
  APILONG serialNumberPos;
  APILONG state;
  APISTRING workorder;
  APILONG workstepNo;
  APISTRING stationNr;
  APILONG processLayer;
  APISTRING avo;
  APILONG seqNumber;
  APISTRING serialNumberRef;
  APILONG serialNumberRefPos;
};

/* definition of structure MergedUnitsData */
struct MergedUnitsData
{
  APISTRING stationNr;
  APISTRING stationDesc;
  APISTRING serialNumber;
  APISTRING serialNumberPos;
  APILONG level;
  APISTRING masterSerialNumber;
  APISTRING masterSerialNumberPos;
  APISTRING slaveSerialNumber;
  APISTRING slaveSerialNumberPos;
  APISTRING plantNr;
  APISTRING workOrder;
  APISTRING partNr;
  APISTRING partDesc;
  APILONG bomVersion;
  APISTRING bomIndex;
  APISTRING bomInfo;
  APISTRING cadPartNr;
  APISTRING info1;
  APISTRING info2;
  APISTRING info3;
};

/* definition of structure MergePartData */
struct MergePartData
{
  APISTRING serialNumber;
  APILONG serialNumberPos;
  APISTRING compPartNo;
  APISTRING compName;
  APIDOUBLE compBomQty;
  APIDOUBLE mergedInSnrQty;
  APISTRING info1;
  APISTRING info2;
  APISTRING info3;
};

/* definition of structure Feeder */
struct Feeder
{
  APISTRING reelNr;
  APILONG reelId;
  APIDOUBLE currentQty;
};

/* definition of structure MdcCondition */
struct MdcCondition
{
  APISTRING colorRGB;
  APISTRING level4;
  APISTRING conditionCode;
  APISTRING conditionDesc;
  APISTRING conditionName;
  APILONG startDate;
  APILONG endDate;
  APISTRING txt;
};

/* definition of structure MdcMessage */
struct MdcMessage
{
  APISTRING colorRGB;
  APISTRING conditionCode;
  APISTRING conditionDesc;
  APISTRING conditionName;
  APILONG startDate;
  APILONG endDate;
  APISTRING txt;
};

/* definition of structure MdcLog */
struct MdcLog
{
  APILONG startDate;
  APILONG endDate;
  APISTRING subject;
  APISTRING txt;
};

/* definition of structure MdcConditionCode */
struct MdcConditionCode
{
  APISTRING name;
  APISTRING code;
  APISTRING level4;
  APISTRING colorRGB;
  APILONG type;
};

/* definition of structure MdataBomItem */
struct MdataBomItem
{
  APISTRING partNo;
  APISTRING partDesc;
  APISTRING secPartNo;
  APILONG artGrpNo;
  APISTRING compName;
  APILONG alternative;
  APISTRING erpPosNo;
  APILONG posTyp;
  APIDOUBLE quantity;
  APILONG unit;
  APILONG isProduct;
  APISTRING bomVersionERP;
  APISTRING bomInfoTxt;
  APILONG processType;
  APISTRING processGrp;
  APILONG processLayer;
  APILONG traceFlag;
  APILONG workstepNo;
  APISTRING returnComment;
};

/* definition of structure LockInformation */
struct LockInformation
{
  APISTRING serialNumber;
  APISTRING serialNumberPos;
  APISTRING lockName;
  APISTRING workOrder;
  APILONG serialNumberLockCount;
};

/* definition of structure LockHistory */
struct LockHistory
{
  APISTRING serialNumber;
  APISTRING serialNumberPos;
  APISTRING lockName;
  APISTRING workOrder;
  APILONG lockDate;
  APISTRING lockUser;
  APISTRING lockStation;
  APISTRING lockInfo;
  APILONG unlockDate;
  APISTRING unlockUser;
  APISTRING unlockStation;
  APISTRING unlockInfo;
  APILONG serialNumberLockCount;
};


/* definition of array KeyValuePairArray */
typedef struct KeyValuePair* KeyValuePairArray;

/* definition of array ResultDataArray */
typedef struct ResultData* ResultDataArray;

/* definition of array ResultDataExtendedStructArray */
typedef struct ResultDataExtendedStruct* ResultDataExtendedStructArray;

/* definition of array ResultDataExtendedLimitsStructArray */
typedef struct ResultDataExtendedLimitsStruct* ResultDataExtendedLimitsStructArray;

/* definition of array RecipeDataArray */
typedef struct RecipeData* RecipeDataArray;

/* definition of array SerialNumberArray */
typedef struct SerialNumberData* SerialNumberArray;

/* definition of array BomCompFailDataArray */
typedef struct BomCompFailData* BomCompFailDataArray;

/* definition of array MergePartsArray */
typedef struct MergePartsData* MergePartsArray;

/* definition of array ProductInfoArray */
typedef struct ProductInfoData* ProductInfoArray;

/* definition of array SetupDataArray */
typedef struct SetupData* SetupDataArray;

/* definition of array SetupDataExtArray */
typedef struct SetupDataExt* SetupDataExtArray;

/* definition of array SetupDataInfArray */
typedef struct SetupDataInf* SetupDataInfArray;

/* definition of array SetupPrepareDataArray */
typedef struct SetupPrepareData* SetupPrepareDataArray;

/* definition of array WorkStationDataArray */
typedef struct WorkStationData* WorkStationDataArray;

/* definition of array ErrorDataArray */
typedef struct ErrorData* ErrorDataArray;

/* definition of array TestDataArray */
typedef struct TestData* TestDataArray;

/* definition of array StateDataArray */
typedef struct StateData* StateDataArray;

/* definition of array StringStructArray */
typedef struct StringStruct* StringStructArray;

/* definition of array FailDataArray */
typedef struct FailData* FailDataArray;

/* definition of array CompFailDataArray */
typedef struct CompFailData* CompFailDataArray;

/* definition of array BomItemDataArray */
typedef struct BomItemData* BomItemDataArray;

/* definition of array MasterDataBomArray */
typedef struct MasterDataBom* MasterDataBomArray;

/* definition of array MaterialBinDataArray */
typedef struct MaterialBinData* MaterialBinDataArray;

/* definition of array ConfigDataArray */
typedef struct ConfigData* ConfigDataArray;

/* definition of array SerialNumberStructArray */
typedef struct SerialNumberStruct* SerialNumberStructArray;

/* definition of array ChargeInfoStructArray */
typedef struct ChargeInfoStruct* ChargeInfoStructArray;

/* definition of array ShippingLotArray */
typedef struct ShippingLotStruct* ShippingLotArray;

/* definition of array SetupHistoryDataArray */
typedef struct SetupHistoryData* SetupHistoryDataArray;

/* definition of array RecipeHeaderAndVersionArray */
typedef struct RecipeHeaderAndVersion* RecipeHeaderAndVersionArray;

/* definition of array RecipeDataExtendedStructArray */
typedef struct RecipeDataExtendedStruct* RecipeDataExtendedStructArray;

/* definition of array SnrAttributeInfoArray */
typedef struct SnrAttributeInfo* SnrAttributeInfoArray;

/* definition of array MaterialBinAttributeInfoArray */
typedef struct MaterialBinAttributeInfo* MaterialBinAttributeInfoArray;

/* definition of array ChargeAttributeInfoArray */
typedef struct ChargeAttributeInfo* ChargeAttributeInfoArray;

/* definition of array AttributeArray */
typedef struct AttributeInfo* AttributeArray;

/* definition of array StoreInfoArray */
typedef struct StoreInfo* StoreInfoArray;

/* definition of array SetupCompDataArray */
typedef struct SetupCompData* SetupCompDataArray;

/* definition of array WorkplanDataArray */
typedef struct WorkplanData* WorkplanDataArray;

/* definition of array MDAObjectArray */
typedef struct MDAObject* MDAObjectArray;

/* definition of array AdviceConfirmationArray */
typedef struct AdviceConfirmation* AdviceConfirmationArray;

/* definition of array AdviceArray */
typedef struct Advice* AdviceArray;

/* definition of array MaterialBinDataExtArray */
typedef struct MaterialBinDataExt* MaterialBinDataExtArray;

/* definition of array WorkorderForLineArray */
typedef struct WorkorderForLine* WorkorderForLineArray;

/* definition of array MaterialBinBookingsArray */
typedef struct MaterialBinBookings* MaterialBinBookingsArray;

/* definition of array FailureCauseDataArray */
typedef struct FailureCauseData* FailureCauseDataArray;

/* definition of array FailureTypDataArray */
typedef struct FailureTypData* FailureTypDataArray;

/* definition of array FailureDataArray */
typedef struct FailureData* FailureDataArray;

/* definition of array FailureSlipDataArray */
typedef struct FailureSlipData* FailureSlipDataArray;

/* definition of array FailureResultDataArray */
typedef struct FailureResultData* FailureResultDataArray;

/* definition of array EquipmentPrepareDataArray */
typedef struct EquipmentPrepareData* EquipmentPrepareDataArray;

/* definition of array EquipmentSetupDataArray */
typedef struct EquipmentSetupData* EquipmentSetupDataArray;

/* definition of array EquipmentCheckDataArray */
typedef struct EquipmentCheckData* EquipmentCheckDataArray;

/* definition of array CompPositionArray */
typedef struct CompPosition* CompPositionArray;

/* definition of array MaterialSetupDataArray */
typedef struct MaterialSetupData* MaterialSetupDataArray;

/* definition of array MaterialBinBookingsExtArray */
typedef struct MaterialBinBookingsExt* MaterialBinBookingsExtArray;

/* definition of array SmtSerialNoArray */
typedef struct SmtSerialNo* SmtSerialNoArray;

/* definition of array SmtEventArray */
typedef struct SmtEvent* SmtEventArray;

/* definition of array SmtPlacementArray */
typedef struct SmtPlacement* SmtPlacementArray;

/* definition of array FailureslipArray */
typedef struct Failureslip* FailureslipArray;

/* definition of array SerialNumberBookInfoArray */
typedef struct SerialNumberBookInfo* SerialNumberBookInfoArray;

/* definition of array MergedUnitsArray */
typedef struct MergedUnitsData* MergedUnitsArray;

/* definition of array MergePartArray */
typedef struct MergePartData* MergePartArray;

/* definition of array FeederArray */
typedef struct Feeder* FeederArray;

/* definition of array MdcConditionArray */
typedef struct MdcCondition* MdcConditionArray;

/* definition of array MdcMessageArray */
typedef struct MdcMessage* MdcMessageArray;

/* definition of array MdcLogArray */
typedef struct MdcLog* MdcLogArray;

/* definition of array MdcConditionCodeArray */
typedef struct MdcConditionCode* MdcConditionCodeArray;

/* definition of array MdataBomItemArray */
typedef struct MdataBomItem* MdataBomItemArray;

/* definition of array LockInformationArray */
typedef struct LockInformation* LockInformationArray;

/* definition of array LockHistoryArray */
typedef struct LockHistory* LockHistoryArray;


/* definition of fix functions */
APILONG apiInit(APISTRING aOptionsFilePath, APISTRING* errorString);
APILONG apiShutdown(APISTRING* errorString);
APILONG apiFreeBuffers(APIVOID);
APISTRING apiGetVersion(APIVOID);

/* definition of idl functions */
APILONG apiLogin(struct ApiSessionValidationStruct* sessValData, APISTRING* errorString);
APIVOID apiLogout(APILONG sessionId, APISTRING* errorString);
APILONG apiHeartbeat(APILONG sessionId, APISTRING* errorString);
APILONG logMessage(APILONG sessionId, APISTRING category, APILONG level, APISTRING message, APISTRING source, APISTRING* errorString);
APILONG changeWorkOrderForLine(APILONG sessionId, APISTRING stationNr, APISTRING* partNr, APISTRING* partDesc, APILONG* bomVersion, APISTRING* bomIndex, APISTRING* cadPartNr, APILONG* processLayer, APISTRING* workOrder, APILONG* quantity, APISTRING* state, APISTRING* customerName, APISTRING* customerPartNr, APISTRING* attribut1, APISTRING* errorString);
APILONG changeWorkOrder(APILONG sessionId, APISTRING stationNr, APISTRING* partNr, APISTRING* partDesc, APILONG* bomVersion, APISTRING* bomIndex, APISTRING* cadPartNr, APILONG* processLayer, APISTRING* workOrder, APILONG* quantity, APISTRING* state, APISTRING* customerName, APISTRING* customerPartNr, APISTRING* attribut1, APISTRING* errorString);
APILONG setWorkOrderFromSerialNumber(APILONG sessionId, APISTRING stationNr, APISTRING serialNumber, APISTRING* partNr, APISTRING* partDesc, APILONG* bomVersion, APISTRING* bomIndex, APISTRING* cadPartNr, APILONG* processLayer, APISTRING* workOrder, APILONG* quantity, APISTRING* state, APISTRING* customerName, APISTRING* customerPartNr, APISTRING* attribut1, APISTRING* errorString);
APILONG getStationSetup(APILONG sessionId, APISTRING stationNr, APISTRING* partNr, APILONG* bomVersion, APISTRING* bomIndex, APISTRING* partDesc, APISTRING* workOrder, APILONG* quantity, APISTRING* state, APISTRING* cadPartNr, APILONG* processLayer, APISTRING* customerName, APISTRING* customerPartNr, APISTRING* attribut1, APISTRING* errorString);
APILONG getSerialnumberInfo(APILONG sessionId, APISTRING serialnumber, APISTRING serialnumberPos, APISTRING* partNr, APILONG* bomVersion, APISTRING* bomIndex, APISTRING* partDesc, APISTRING* workOrder, APILONG* quantity, APISTRING* state, APISTRING* cadPartNr, APISTRING* customerName, APISTRING* customerPartNr, APISTRING* attribut1, APISTRING* errorString);
APILONG getSnrUploadInfo(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialnumber, APISTRING serialnumberPos, APILONG checkProcessStep, APISTRING* partNr, APISTRING* workOrder, APISTRING* uploadStationNr, APILONG* processStep, APILONG* loopCounter, APILONG* state, APILONG* bookDate, APISTRING* oldSerialNumber, APISTRING* errorString);
APILONG assignSerialNumberToWorkOrder(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumberRef, APISTRING serialNumberRefPos, APILONG serialNumberArraySize, struct SerialNumberData* serialNumberArray, APISTRING* errorString);
APILONG mergeParts(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APILONG duplicateSerialNumber, APISTRING serialNumberMaster, APISTRING serialNumberSlave, APISTRING* errorString);
APILONG removeMergeParts(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumberSlave, APISTRING textInfo, APISTRING* errorString);
APILONG verifyMerge(APILONG sessionId, APISTRING stationNr, APISTRING serialNumberSlave, APISTRING* errorString);
APILONG verifyMergeBySnrRef(APILONG sessionId, APISTRING stationNr, APISTRING serialNumberSlave, APILONG* testDataArraySize, struct StateData** testDataArray, APISTRING* errorString);
APILONG verifyMergeProduct(APILONG sessionId, APISTRING stationNr, APISTRING productId, APILONG bomVersion, APISTRING bomIndex, APISTRING serialNumberSlave, APILONG booking, APISTRING* errorString);
APILONG getProductInfo(APILONG sessionId, APISTRING stationNr, APISTRING partNr, APILONG level, APILONG* productInfosSize, struct ProductInfoData** productInfos, APISTRING* errorString);
APILONG getMergeParts(APILONG sessionId, APISTRING serialNumber, APILONG* mergePartsArraySize, struct MergePartsData** mergePartsArray, APISTRING* errorString);
APILONG getSerialNumberBySnrRef(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumberRef, APILONG* serialNumberArraySize, struct SerialNumberData** serialNumberArray, APISTRING* errorString);
APILONG switchSerialNumber(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APILONG duplicateSerialNumber, APISTRING serialNumberOld, APISTRING serialNumberNew, APISTRING* errorString);
APILONG switchSerialNumberBySnrRef(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumberRef, APISTRING serialNumberPos, APISTRING serialNumberNew, APISTRING* errorString);
APILONG checkSerialNumberState(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumber, APISTRING serialNumberPos, APILONG* loopCounter, APISTRING* errorString);
APILONG checkSnrStateBySnrRef(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumber, APILONG* testDataArraySize, struct StateData** testDataArray, APISTRING* errorString);
APILONG uploadStateAndResultData(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumber, APISTRING serialNumberPos, APILONG serialNumberState, APILONG duplicateSerialNumber, APILONG resultDataArraySize, struct ResultData* resultDataArray, APIFLOAT cycleTime, APILONG* loopCounter, APISTRING* errorString);
APILONG uploadState(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumberRef, APISTRING serialNumberRefPos, APILONG serialNumberState, APILONG duplicateSerialNumber, APILONG checkActiveWorkOrder, APISTRING* errorString);
APILONG uploadFailureslip(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumber, APISTRING serialnumberPos, APISTRING partNr, APILONG state, APILONG bookDate, APILONG failureslipSize, struct Failureslip* failureslip, APILONG checkActiveWorkorder, APISTRING* errorString);
APILONG queryTestData(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumber, APILONG* resultDataArraySize, struct ResultData** resultDataArray, APILONG* loopCounter, APIFLOAT* cycleTime, APISTRING* errorString);
APILONG queryRecipeData(APILONG sessionId, APISTRING stationNr, APISTRING workOrder, APILONG* recipeDataArraySize, struct RecipeData** recipeDataArray, APISTRING* errorString);
APILONG getNextSerialNumber(APILONG sessionId, APISTRING stationNr, APISTRING* serialNumber, APISTRING* errorString);
APILONG getNextSerialNumberForWorkOrder(APILONG sessionId, APISTRING stationNr, APISTRING workOrder, APILONG* serialNumberArraySize, struct SerialNumberData** serialNumberArray, APISTRING* errorString);
APILONG bomCheck(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumber, APILONG checkActivPreparation, APILONG* aBomCompFailDataSize, struct BomCompFailData** aBomCompFailData, APISTRING* errorString);
APILONG bomCheckForWorkorder(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING workorder, APILONG checkActivPreparation, APILONG* aBomCompFailDataSize, struct BomCompFailData** aBomCompFailData, APISTRING* errorString);
APILONG setupActivation(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING workorder, APILONG activateFlag, APISTRING* errorString);
APILONG updateSetupData(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APILONG setupFlag, APILONG setupPrepareDataArraySize, struct SetupPrepareData* setupPrepareDataArray, APISTRING* errorString);
APILONG uploadStateAndFailData(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING artikel, APISTRING serialNumber, APISTRING serialNumberPos, APISTRING nutzenBez, APILONG serialNumberState, APILONG duplicateSerialNumber, APILONG fehlerDatenArraySize, struct FailData* fehlerDatenArray, APIFLOAT cycleTime, APILONG* loopCounter, APISTRING* errorString);
APILONG getStationQuantity(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING workOrder, APILONG funcMode, APILONG* qtyWoTotal, APILONG* qtyWoStarted, APILONG* qtyWoFinished, APILONG* qtyStGood, APILONG* qtyStReject, APILONG* qtyStScrap, APILONG* qtyPsGood, APILONG* qtyPsReject, APILONG* qtyPsScrap, APISTRING* errorString);
APILONG getSnrHistoryData(APILONG sessionId, APISTRING serialNumber, APISTRING* workOrderNr, APISTRING* SAPCode, APISTRING* secondPartNr, APISTRING* partName, APISTRING* quantity, APISTRING* lastReportDate, APILONG* workStationDataArraySize, struct WorkStationData** workStationDataArray, APILONG* errorDataArraySize, struct ErrorData** errorDataArray, APILONG* testDataArraySize, struct TestData** testDataArray, APISTRING* errorString);
APILONG getSerialNumberHistoryData(APILONG sessionId, APISTRING stationNr, APISTRING serialNumber, APISTRING* workOrderNr, APISTRING* SAPCode, APISTRING* secondPartNr, APISTRING* partName, APISTRING* quantity, APISTRING* lastReportDate, APILONG* workStationDataArraySize, struct WorkStationData** workStationDataArray, APILONG* errorDataArraySize, struct ErrorData** errorDataArray, APILONG* testDataArraySize, struct TestData** testDataArray, APISTRING* errorString);
APILONG uploadResultDataAndRecipe(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumberRef, APISTRING serialNumberRefPos, APILONG serialNumberState, APISTRING produktNo, APISTRING produktRev, APILONG bookDate, APIFLOAT cycleTime, APILONG resultDataExtArraySize, struct ResultDataExtendedStruct* resultDataExtArray, APISTRING* errorString);
APILONG uploadStationResult(APILONG sessionId, APISTRING stationNr, APILONG resultDataArraySize, struct ResultDataExtendedStruct* resultDataArray, APILONG startDate, APILONG createRecipe, APILONG snrTrace, APISTRING* errorString);
APILONG createNewMaterialBin(APILONG sessionId, APISTRING stationNr, APISTRING materialBinNr, APISTRING productNr, APISTRING chargeNr, APISTRING dateCode, APIDOUBLE quantity, APISTRING* errorString);
APILONG createNewMaterialBinExt(APILONG sessionId, APISTRING stationNr, APISTRING materialBinNr, APISTRING productNr, APISTRING chargeNr, APISTRING dateCode, APIDOUBLE quantity, APISTRING supplierNo, APISTRING supplierName, APILONG expirationDate, APICHAR materialBinState, APISTRING weNumber, APILONG classificationSize, APISTRING* classification, APISTRING* errorString);
APILONG getStorage(APILONG sessionId, APISTRING stationNr, APISTRING binLocation, APISTRING binLocationBarcode, APISTRING partNo, APISTRING supplierNo, APISTRING chargeNo, APISTRING dateCode, APISTRING materialBinstate, APISTRING classification, APILONG attributeArraySize, struct AttributeInfo* attributeArray, APILONG* storeInfoArraySize, struct StoreInfo** storeInfoArray, APISTRING* errorString);
APILONG setMaterialBinLocation(APILONG sessionId, APISTRING stationNr, APISTRING materialBinNr, APISTRING binLocation, APISTRING binLocationBarcode, APILONG transactionType, APISTRING* errorString);
APILONG changeMaterialBinQuantity(APILONG sessionId, APISTRING stationNr, APISTRING materialBinNr, APIDOUBLE quantity, APILONG transactionType, APISTRING workOrder, APISTRING textInfo, APISTRING* errorString);
APILONG getMaterialBinInfo(APILONG sessionId, APISTRING stationNr, APISTRING materialBinNr, struct MaterialBinData** materialBinData, APISTRING* errorString);
APILONG changeMaterialBinAttributes(APILONG sessionId, APISTRING stationNr, APISTRING MaterialBinNr, APILONG configDataArraySize, struct ConfigData* configDataArray, APISTRING* errorString);
APILONG setMaterialBinState(APILONG sessionId, APISTRING stationNr, APISTRING materialBinNr, APISTRING state, APISTRING* errorString);
APILONG getNextMaterialBinNumber(APILONG sessionId, APISTRING stationNr, APISTRING productNr, APISTRING* materialBinNr, APISTRING* errorString);
APILONG reportRmQuantity(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING workOrder, APIDOUBLE passQty, APIDOUBLE failQty, APIDOUBLE scrapQty, APISTRING* errorString);
APILONG getNumberOfProducts(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING partNr, APILONG dateFrom, APILONG dateTo, APILONG checkWorkStep, APILONG* numberOfProducts, APISTRING* errorString);
APILONG getCurrentMaterialSetup(APILONG sessionId, APISTRING stationNr, APILONG completeSetupData, APISTRING* setupWorkOrder, APILONG* setupActive, APILONG* setupDataSize, struct SetupData** setupData, APISTRING* errorString);
APILONG getMaterialSetupData(APILONG sessionId, APISTRING stationNr, APILONG setupState, APILONG date, APISTRING* setupWorkOrder, APILONG* setupActive, APILONG* setupDataSize, struct SetupDataExt** setupData, APISTRING* errorString);
APILONG getMaterialBinDataByProductNo(APILONG sessionId, APISTRING stationNr, APISTRING productNo, APILONG includeEmptyBin, APILONG* materialBinDataArraySize, struct MaterialBinData** materialBinDataArray, APISTRING* errorString);
APILONG getCurrentCalendar(APILONG sessionId, APISTRING stationNr, APILONG* shift, struct CalendarData** calendarData, APISTRING* errorString);
APILONG shipRemoveSnrFromShippingLot(APILONG sessionId, APISTRING stationNr, APISTRING lotNr, APISTRING serialNumber, APISTRING* errorString);
APILONG shipCheckSnrFromShippingLot(APILONG sessionId, APISTRING stationNr, APISTRING lotNr, APISTRING serialNumber, APISTRING* errorString);
APILONG shipAddSnrToShippingLot(APILONG sessionId, APISTRING stationNr, APISTRING lotNr, APISTRING serialNumber, APISTRING* errorString);
APILONG shipDeactivateShippingLotAtKap(APILONG sessionId, APISTRING stationNr, APISTRING lotNr, APISTRING* errorString);
APILONG shipActivateShippingLotAtKap(APILONG sessionId, APISTRING stationNr, APISTRING lotNr, APISTRING* errorString);
APILONG shipGetSnrDataForShippingLot(APILONG sessionId, APISTRING stationNr, APISTRING lotNr, APILONG* serialNrArraySize, struct SerialNumberStruct** serialNrArray, APISTRING* errorString);
APILONG shipCompleteLot(APILONG sessionId, APISTRING stationNr, APISTRING lotNr, APILONG allowLessQty, APISTRING* errorString);
APILONG shipReplaceShippingLot(APILONG sessionId, APISTRING stationNr, APISTRING lotNr, struct ShippingLotStruct** shippingLot, APISTRING* errorString);
APILONG shipGetShippingLotForLotNo(APILONG sessionId, APISTRING stationNr, APISTRING lotNr, struct ShippingLotStruct** shippingLot, APISTRING* errorString);
APILONG shipGetShippingLotsForPartNo(APILONG sessionId, APISTRING stationNr, APISTRING partNoPattern, APILONG onlyActive, APILONG* shippingLotsSize, struct ShippingLotStruct** shippingLots, APISTRING* errorString);
APILONG shipReopenShippingLot(APILONG sessionId, APISTRING stationNr, APISTRING lotNr, APISTRING* errorString);
APILONG shipCheckSnrAddToShippingLot(APILONG sessionId, APISTRING stationNr, APISTRING lotNr, APISTRING serialNumber, APISTRING* errorString);
APILONG uploadStationState(APILONG sessionId, APISTRING stationNr, APILONG date, APISTRING stationState, APILONG withHistory, APISTRING infoText, APISTRING* errorString);
APILONG uploadStationWasteTime(APILONG sessionId, APISTRING stationNr, APILONG dateFrom, APILONG dateTo, APISTRING stationState, APISTRING infoText, APISTRING* errorString);
APILONG uploadStateAndFailureData(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING productNo, APISTRING productRev, APISTRING serialNumber, APISTRING serialNumberPos, APISTRING posDescr, APILONG serialNumberState, APILONG duplicateSerialNumber, APILONG compFailDataArraySize, struct CompFailData* compFailDataArray, APIFLOAT cycleTime, APILONG bookDate, APILONG* loopCounter, APISTRING* errorString);
APILONG getBomItems(APILONG sessionId, APISTRING stationNr, APISTRING workorder, APISTRING serialNumber, APILONG alternative, APILONG processBased, APILONG bomType, APILONG* bomItemDataSize, struct BomItemData** bomItemData, APISTRING* errorString);
APILONG mdataGetBomData(APILONG sessionId, APISTRING stationNr, APISTRING workorder, APISTRING serialNumber, APISTRING materialNo, APILONG bomVersion, APISTRING bomIndex, APILONG processVersion, APILONG processBased, APILONG processType, APILONG alternative, APILONG bomType, APILONG* masterDataBomSize, struct MasterDataBom** masterDataBom, APISTRING* errorString);
APILONG assignSerialNumberMergeAndUploadState(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumberRef, APISTRING serialNumberRefPos, APILONG serialNumberArraySize, struct SerialNumberData* serialNumberArray, APISTRING serialNumberSlave, APILONG doUploadState, APILONG serialNumberState, APISTRING* errorString);
APILONG getMaterialSetupDataForKapAndPeriod(APILONG sessionId, APISTRING stationNr, APILONG dateFrom, APILONG dateTo, APILONG* setupDataSize, struct SetupDataInf** setupData, APISTRING* errorString);
APILONG getKapSetupDataForMaterial(APILONG sessionId, APISTRING materialBinNr, APILONG* setupDataSize, struct SetupDataInf** setupData, APISTRING* errorString);
APILONG updateSetupDataHistory(APILONG sessionId, APILONG* setupHistoryDataArraySize, struct SetupHistoryData** setupHistoryDataArray, APISTRING* errorString);
APILONG assignSerialNumberForProductOrWorkorder(APILONG sessionId, APISTRING stationNr, APISTRING workOrder, APISTRING partNr, APISTRING bomVersion, APISTRING serialNumberRef, APISTRING serialNumberRefPos, APILONG processLayer, APILONG serialNumberArraySize, struct SerialNumberData* serialNumberArray, APILONG activateWorkOrder, APISTRING* errorString);
APILONG shipAddChildLotToParentLot(APILONG sessionId, APISTRING stationNr, APISTRING childLot, APISTRING parentLot, APISTRING* errorString);
APILONG shipRemoveChildLotFromLot(APILONG sessionId, APISTRING stationNr, APISTRING childLot, APISTRING parentLot, APISTRING* errorString);
APILONG shipRemoveAllChildLotFromParentLot(APILONG sessionId, APISTRING stationNr, APISTRING parentLot, APISTRING* errorString);
APILONG shipGetChildLotsForParentLot(APILONG sessionId, APISTRING stationNr, APISTRING parentLot, APILONG* shippingLotsSize, struct ShippingLotStruct** shippingLots, APISTRING* errorString);
APILONG shipMoveAllChildLotsToNewParentLot(APILONG sessionId, APISTRING stationNr, APISTRING newParentLot, APISTRING* errorString);
APILONG shipMoveChildLotToNewParentLot(APILONG sessionId, APISTRING stationNr, APISTRING childLot, APISTRING newParentLot, APISTRING* errorString);
APILONG shipMoveChildLotsFromLotToLot(APILONG sessionId, APISTRING stationNr, APILONG childLotsSize, struct StringStruct* childLots, APISTRING actParentLot, APISTRING newParentLot, APISTRING* errorString);
APILONG getCalendarData(APILONG sessionId, APILONG* year, APILONG* month, APILONG* weekOfYear, APILONG* weekOfMonth, APILONG* dayOfMonth, APILONG* dayOfYear, APILONG* dayOfWeek, APILONG* dayOfWeekInMonth, APILONG* amPm, APILONG* hour, APILONG* hourOfDay, APILONG* minute, APILONG* second, APILONG* zoneOffset, APILONG* dstOffset, APISTRING* errorString);
APILONG registerUser(APILONG sessionId, APISTRING stationNr, APISTRING userName, APISTRING password, APISTRING client, APISTRING* errorString);
APILONG unregisterUser(APILONG sessionId, APISTRING stationNr, APISTRING userName, APISTRING password, APISTRING client, APISTRING* errorString);
APILONG getRegisteredUser(APILONG sessionId, APISTRING stationNr, APISTRING* userName, APISTRING* name, APISTRING* firstname, APISTRING* errorString);
APILONG activateWorkorder(APILONG sessionId, APISTRING station, APISTRING workorder, APILONG processLayer, APILONG flag, APISTRING* errorString);
APILONG getSnrInfoData(APILONG sessionId, APISTRING stationNr, APISTRING serialnumber, APISTRING serialnumberPos, APISTRING* partNr, APILONG* bomVersion, APISTRING* bomIndex, APISTRING* partDesc, APISTRING* workOrder, APILONG* quantity, APISTRING* state, APISTRING* cadPartNr, APISTRING* customerName, APISTRING* customerPartNr, APISTRING* attribut1, APISTRING* errorString);
APILONG getRecipeHeaderAndVersion(APILONG sessionId, APISTRING stationNr, APISTRING partNr, APILONG bomVersion, APILONG processVersion, APISTRING revisionIndex, APIBOOLEAN onlyActive, APILONG* recipeHeadersSize, struct RecipeHeaderAndVersion** recipeHeaders, APISTRING* errorString);
APILONG getRecipeData(APILONG sessionId, APILONG recipeVersionId, APISTRING stationNr, APISTRING partNr, APILONG bomVersion, APILONG processVersion, APISTRING revisionIndex, APILONG* recipeDataSize, struct RecipeDataExtendedStruct** recipeData, APISTRING* errorString);
APILONG activateRecipe(APILONG sessionId, APILONG recipeId, APILONG recipeVersionId, APISTRING stationNr, APISTRING* errorString);
APILONG createRecipe(APILONG sessionId, APISTRING stationNr, APISTRING partNr, APILONG bomVersion, APILONG processVersion, APISTRING revisionIndex, APILONG* recipeDataSize, struct RecipeDataExtendedStruct** recipeData, APIBOOLEAN activate, APISTRING* errorString);
APILONG shipGetLotFromSerialNo(APILONG sessionId, APISTRING stationNr, APISTRING serialNumber, struct ShippingLotStruct** shippingLot, APISTRING* errorString);
APILONG appendAttributeToWorkorder(APILONG sessionId, APISTRING stationNr, APISTRING chargeExt, APISTRING serialNumber, APISTRING partNo, APISTRING attributeCode, APISTRING attributeValue, APISTRING attributeValueDesc, APISTRING attributeType, APISTRING objectKey, APISTRING* errorString);
APILONG appendAttributeToSerialNumber(APILONG sessionId, APISTRING stationNr, APISTRING serialNumber, APISTRING attributeCode, APISTRING attributeValue, APISTRING* errorString);
APILONG appendAttributesToMaterialBin(APILONG sessionId, APISTRING stationNr, APISTRING materialBinNr, APILONG infosSize, struct AttributeInfo* infos, APISTRING* errorString);
APILONG removeAttributeFromSerialNumber(APILONG sessionId, APISTRING stationNr, APISTRING serialNumber, APISTRING attributeCode, APISTRING* errorString);
APILONG removeAttributeFromMaterialBin(APILONG sessionId, APISTRING stationNr, APISTRING materialBinNr, APISTRING attributeCode, APISTRING* errorString);
APILONG removeAttributeFromWorkorder(APILONG sessionId, APISTRING stationNr, APISTRING chargeExt, APISTRING serialNumber, APISTRING attributeCode, APISTRING objectKey, APISTRING* errorString);
APILONG getAttributesForSerialNumber(APILONG sessionId, APISTRING stationNr, APISTRING serialNumber, APISTRING attributeCode, APILONG* snrAttributeInfosSize, struct SnrAttributeInfo** snrAttributeInfos, APISTRING* errorString);
APILONG getAttributesForMaterialBin(APILONG sessionId, APISTRING stationNr, APISTRING materialBinNr, APISTRING attributeCode, APILONG* matBinAttributeInfosSize, struct MaterialBinAttributeInfo** matBinAttributeInfos, APISTRING* errorString);
APILONG getAttributesForWorkorder(APILONG sessionId, APISTRING stationNr, APISTRING chargeExt, APISTRING serialNumber, APISTRING partNo, APISTRING attributeCode, APISTRING attributeType, APILONG* chargeAttributeInfosSize, struct ChargeAttributeInfo** chargeAttributeInfos, APISTRING* errorString);
APILONG getSerialNumbersForAttribute(APILONG sessionId, APISTRING stationNr, APISTRING attributeCode, APISTRING attributeValue, APILONG* serialNrArraySize, struct SerialNumberStruct** serialNrArray, APISTRING* errorString);
APILONG getWorkordersForAttribute(APILONG sessionId, APISTRING stationNr, APISTRING attributeCode, APISTRING partNo, APISTRING attributeValue, APISTRING attributeType, APISTRING objectKey, APILONG* chargeInfoArraySize, struct ChargeInfoStruct** chargeInfoArray, APISTRING* errorString);
APILONG getSetupDataBySerialNumber(APILONG sessionId, APISTRING stationNr, APISTRING serialNumber, APISTRING partNr, APISTRING location, APILONG* setupDataArraySize, struct SetupCompData** setupDataArray, APISTRING* errorString);
APILONG getWorkplanItems(APILONG sessionId, APISTRING stationNr, APISTRING workOrder, APISTRING serialNumber, APILONG processLayer, APILONG wpFlag, APILONG* workplanDataSize, struct WorkplanData** workplanData, APISTRING* errorString);
APILONG testPaa(APILONG sessionId, APISTRING stationNr, APISTRING serialNumber, APILONG processLayer, APILONG model, APILONG* resultPaa, APISTRING* infoText, APISTRING* errorString);
APILONG testSpa(APILONG sessionId, APISTRING stationNr, APISTRING serialNumber, APILONG processLayer, APILONG model, APILONG* resultCp, APILONG* resultCpk, APISTRING* infoText, APISTRING* errorString);
APILONG getMdaDocuments(APILONG sessionId, APISTRING stationNr, APILONG keyValuesSize, struct KeyValuePair* keyValues, APILONG mdaDataTypesSize, struct KeyValuePair* mdaDataTypes, APILONG* mdaObjectsSize, struct MDAObject** mdaObjects, APISTRING* errorString);
APILONG getAdvice(APILONG sessionId, APISTRING stationNr, APIBOOLEAN ignoreStationNr, APISTRING workOrder, APISTRING partNr, APISTRING serialNumber, APILONG workstepNo, APISTRING erpGrpme, APISTRING userName, APIBOOLEAN checkStationGroup, APIBOOLEAN checkPartGroup, APILONG* advicesSize, struct Advice** advices, APISTRING* errorString);
APILONG confirmAdvice(APILONG sessionId, APISTRING userName, APISTRING password, APILONG adviceId, APILONG confirmationStatus, APILONG adviceEditTextSize, APISTRING* adviceEditText, APISTRING* errorString);
APILONG getMaterialBinData(APILONG sessionId, APISTRING stationNr, APISTRING materialBinNr, APISTRING materialBinState, APISTRING partNr, APISTRING partGrp, APILONG changeDate, APILONG* materialBinDataExtSize, struct MaterialBinDataExt** materialBinDataExt, APISTRING* errorString);
APILONG getWorkorderForLine(APILONG sessionId, APISTRING stationNr, APISTRING workorderState, APISTRING workorder, APISTRING productNo, APISTRING partGrp, APILONG startDate, APILONG* workorderForLineSize, struct WorkorderForLine** workorderForLine, APISTRING* errorString);
APILONG uploadMaterialBookings(APILONG sessionId, APISTRING stationNr, APILONG* materialBinBookingsSize, struct MaterialBinBookings** materialBinBookings, APISTRING* errorString);
APILONG updateSetupDataBySnr(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING workorder, APISTRING serialNumberSlave, APISTRING position, APISTRING* errorString);
APILONG updateEquipmentData(APILONG sessionId, APISTRING stationNr, APILONG setupFlag, APILONG equipmentPrepareDataSize, struct EquipmentPrepareData* equipmentPrepareData, APISTRING* errorString);
APILONG getSetupEquipmentData(APILONG sessionId, APISTRING stationNr, APILONG* equipmentSetupDataSize, struct EquipmentSetupData** equipmentSetupData, APISTRING* errorString);
APILONG getRequiredEquipmentData(APILONG sessionId, APISTRING stationNr, APISTRING workOrder, APISTRING partNo, APILONG processLayer, APISTRING pmGroup, APILONG* equipmentCheckDataSize, struct EquipmentCheckData** equipmentCheckData, APISTRING* errorString);
APILONG checkEquipmentData(APILONG sessionId, APISTRING stationNr, APISTRING workOrder, APISTRING partNo, APILONG processLayer, APILONG returnFailuresOnly, APILONG* equipmentCheckDataSize, struct EquipmentCheckData** equipmentCheckData, APISTRING* errorString);
APILONG removeEquipmentForWorkorder(APILONG sessionId, APISTRING stationNr, APISTRING workOrder, APISTRING* errorString);
APILONG getFailureCauseForStation(APILONG sessionId, APISTRING stationNr, APILONG* failureCauseDataSize, struct FailureCauseData** failureCauseData, APISTRING* errorString);
APILONG getFailureTypForStation(APILONG sessionId, APISTRING stationNr, APILONG* failureTypDataSize, struct FailureTypData** failureTypData, APISTRING* errorString);
APILONG getFailureDataForSerialNumber(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumber, APILONG serialNumberPos, APILONG allProductEntries, APILONG* failureDataSize, struct FailureData** failureData, APISTRING* errorString);
APILONG getFailureSlipDataForSerialNumber(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumber, APILONG serialNumberPos, APILONG allProductEntries, APILONG onlyLastEntry, APILONG* failureSlipDataSize, struct FailureSlipData** failureSlipData, APISTRING* errorString);
APILONG getResultDataForSerialNumber(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumber, APILONG serialNumberPos, APISTRING type, APISTRING name, APILONG allProductEntries, APILONG onlyLastEntry, APILONG* failureResultDataSize, struct FailureResultData** failureResultData, APISTRING* errorString);
APILONG uploadMaterialBinBookingsExt(APILONG sessionId, APISTRING stationNr, APILONG* materialBinDataSize, struct MaterialBinBookingsExt** materialBinData, APISTRING* errorString);
APILONG getPlacementName(APILONG sessionId, APISTRING stationNr, APISTRING* placementName, APISTRING* errorString);
APILONG updateMaterialSetup(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APILONG* materialSetupDataSize, struct MaterialSetupData** materialSetupData, APILONG* compPositionsSize, struct CompPosition** compPositions, APISTRING* errorString);
APILONG changeFeederBank(APILONG sessionId, APISTRING stationNr, APISTRING feederBank, APILONG flag, APISTRING* errorString);
APILONG updateMaterialSetupHistory(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APILONG* materialSetupDataSize, struct MaterialSetupData** materialSetupData, APILONG* compPositionsSize, struct CompPosition** compPositions, APISTRING* errorString);
APILONG getNextBookingForStationAndLayer(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APILONG bookDate, APILONG* lastBookDate, APISTRING* errorString);
APILONG getCompleteMaterialSetup(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APILONG bookDate, APISTRING* workOrder, APILONG* materialSetupDataSize, struct MaterialSetupData** materialSetupData, APILONG* compPositionArraySize, struct CompPosition** compPositionArray, APISTRING* errorString);
APILONG smtConsumption(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING lineName, APISTRING setupName, APISTRING productName, APISTRING bomVersion, APISTRING placementRecipe, APIBOOLEAN assignSerialnumbers, APIBOOLEAN bookSerialnumbers, APIBOOLEAN activateSetup, APILONG* serialNumbersSize, struct SmtSerialNo** serialNumbers, APILONG* eventsSize, struct SmtEvent** events, APILONG* placementsSize, struct SmtPlacement** placements, APIBOOLEAN ignoreContainerProblems, APIBOOLEAN createWorkorder, APIBOOLEAN activateWorkorder, APISTRING workOrder, APIDOUBLE cycleTime, APISTRING* errorString);
APILONG smtEventSetup(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING lineName, APISTRING setupName, APISTRING productName, APISTRING bomVersion, APISTRING placementRecipe, APIBOOLEAN assignSerialnumbers, APIBOOLEAN bookSerialnumbers, APIBOOLEAN activateSetup, APILONG* serialNumbersSize, struct SmtSerialNo** serialNumbers, APILONG* eventsSize, struct SmtEvent** events, APILONG* placementsSize, struct SmtPlacement** placements, APIBOOLEAN ignoreContainerProblems, APIBOOLEAN createWorkorder, APIBOOLEAN activateWorkorder, APISTRING workOrder, APIDOUBLE cycleTime, APISTRING* errorString);
APILONG smtSetupPreparation(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING lineName, APISTRING setupName, APISTRING productName, APISTRING bomVersion, APISTRING placementRecipe, APIBOOLEAN assignSerialnumbers, APIBOOLEAN bookSerialnumbers, APIBOOLEAN activateSetup, APILONG* serialNumbersSize, struct SmtSerialNo** serialNumbers, APILONG* eventsSize, struct SmtEvent** events, APILONG* placementsSize, struct SmtPlacement** placements, APIBOOLEAN ignoreContainerProblems, APIBOOLEAN createWorkorder, APIBOOLEAN activateWorkorder, APISTRING workOrder, APIDOUBLE cycleTime, APISTRING* errorString);
APILONG smtSerialNumberSetup(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING lineName, APISTRING setupName, APISTRING productName, APISTRING bomVersion, APISTRING placementRecipe, APIBOOLEAN assignSerialnumbers, APIBOOLEAN bookSerialnumbers, APIBOOLEAN activateSetup, APILONG* serialNumbersSize, struct SmtSerialNo** serialNumbers, APILONG* eventsSize, struct SmtEvent** events, APILONG* placementsSize, struct SmtPlacement** placements, APIBOOLEAN ignoreContainerProblems, APIBOOLEAN createWorkorder, APIBOOLEAN activateWorkorder, APISTRING workOrder, APIDOUBLE cycleTime, APISTRING* errorString);
APILONG assignBatchNoToWorkorder(APILONG sessionId, APISTRING stationNr, APISTRING workorder, APISTRING partNumber, APISTRING bomVersion, APILONG processLayer, APISTRING batchNumber, APIDOUBLE quantity, APILONG activateWorkorder, APISTRING* errorString);
APILONG registerBatch(APILONG sessionId, APISTRING stationNr, APISTRING batchNumber, APILONG processLayer, APILONG ignoreBatchComplete, APISTRING* errorString);
APILONG unregisterBatch(APILONG sessionId, APISTRING stationNr, APISTRING batchNumber, APILONG processLayer, APIDOUBLE batchDeltaQuantity, APILONG batchComplete, APISTRING* errorString);
APILONG splitBatchNoToSerialNumber(APILONG sessionId, APISTRING stationNr, APISTRING serialNumberRef, APISTRING serialNumberPos, APISTRING batchNumber, APILONG processLayer, APIDOUBLE usedBatchQuantity, APILONG duplicateSerialNumber, APILONG ignoreBatchComplete, APISTRING* errorString);
APILONG mergeBatch(APILONG sessionId, APISTRING stationNr, APISTRING serialNumberRef, APISTRING serialNumberPos, APISTRING batchNumber, APILONG processLayer, APIDOUBLE usedBatchQuantity, APILONG duplicateSerialNumber, APILONG ignoreBatchComplete, APISTRING* errorString);
APILONG getRegisteredBatch(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING* batchNumber, APILONG* batchComplete, APILONG* batchQuantity, APISTRING* errorString);
APILONG getSnrForWorkorderAndWorkstep(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING workorder, APILONG workstepNo, APILONG multiplePanel, APILONG state, APILONG numberOfRecords, APILONG confirmFlag, APILONG* serialNumberBookInfoSize, struct SerialNumberBookInfo** serialNumberBookInfo, APISTRING* errorString);
APILONG getMergedUnits(APILONG sessionId, APISTRING stationNr, APISTRING serialNumber, APILONG resolveDirection, APILONG resolveLevel, APILONG* mergedUnitsDataSize, struct MergedUnitsData** mergedUnitsData, APISTRING* errorString);
APILONG checkMergedPartsForSnrComplete(APILONG sessionId, APISTRING stationNr, APISTRING serialNumberRef, APILONG serialNumberPos, APILONG allMergePartsVisible, APILONG checkMultibleBoard, APILONG* mergePartArraySize, struct MergePartData** mergePartArray, APISTRING* errorString);
APILONG createAttribute(APILONG sessionId, APISTRING stationNo, APILONG attributeMode, APISTRING attributeCode, APISTRING attributeDesc, APISTRING uniquenesType, APISTRING* errorString);
APILONG getBoxContent(APILONG sessionId, APISTRING station, APISTRING boxNo, APISTRING* boxContent, APISTRING* errorString);
APILONG mergeMaterialBin(APILONG sessionId, APISTRING station, APISTRING materialBinMaster, APISTRING materialBinSlave, APIBOOLEAN unique, APILONG* feederArraySize, struct Feeder** feederArray, APISTRING* errorString);
APILONG changeMatBinForSerialNumberRepair(APILONG sessionId, APISTRING stationNo, APILONG processLayer, APISTRING serialNumber, APILONG serialNumberPos, APISTRING materialNo, APISTRING compName, APISTRING materialBinNoOld, APISTRING materialBinNoNew, APISTRING* errorString);
APILONG mdcUploadStationCondition(APILONG sessionId, APISTRING stationNo, APISTRING conditionCode, APILONG startDate, APILONG endDate, APISTRING text, APILONG bookingTarget, APISTRING* errorString);
APILONG mdcGetStationConditions(APILONG sessionId, APISTRING stationNo, APILONG fromDate, APILONG toDate, APILONG* conditionArraySize, struct MdcCondition** conditionArray, APISTRING* errorString);
APILONG mdcGetStationMessages(APILONG sessionId, APISTRING stationNo, APILONG fromDate, APILONG toDate, APILONG* messageArraySize, struct MdcMessage** messageArray, APISTRING* errorString);
APILONG mdcCreateLog(APILONG sessionId, APISTRING stationNo, APILONG startDate, APILONG endDate, APISTRING subject, APISTRING text, APILONG forLine, APISTRING* errorString);
APILONG mdcGetLog(APILONG sessionId, APISTRING stationNo, APILONG fromDate, APILONG toDate, APILONG* logArraySize, struct MdcLog** logArray, APISTRING* errorString);
APILONG setSetupCycleTime(APILONG sessionId, APISTRING stationNo, APISTRING workorder, APILONG cycleTime, APILONG processLayer, APISTRING* errorString);
APILONG setProductionCycleTime(APILONG sessionId, APISTRING stationNo, APISTRING workorder, APILONG cycleTime, APILONG processLayer, APISTRING* errorString);
APILONG mdcGetConditionCodes(APILONG sessionId, APISTRING stationNo, APILONG type, APILONG* conditionCodeArraySize, struct MdcConditionCode** conditionCodeArray, APISTRING* errorString);
APILONG getMaterialBinsForAttribute(APILONG sessionId, APISTRING stationNr, APISTRING attributeCode, APISTRING attributeValue, APILONG* materialBinArraySize, struct MaterialBinAttributeInfo** materialBinArray, APISTRING* errorString);
APILONG registerUserAtLine(APILONG sessionId, APISTRING stationNr, APISTRING userId, APISTRING password, APILONG registrationType, APISTRING* errorString);
APILONG mdataBomVerify(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING workorder, APISTRING productNo, APISTRING bareBoardNo, APISTRING bomIndex, APISTRING bomInfo, APILONG bomValidFrom, APISTRING bomVersionERP, APILONG verifyCompNameBased, APILONG createNewBom, APILONG* mdataBomItemArraySize, struct MdataBomItem** mdataBomItemArray, APISTRING* errorString);
APILONG customFunction(APILONG sessionId, APISTRING methodName, APILONG inArgsSize, APISTRING* inArgs, APILONG* outArgsSize, APISTRING** outArgs, APISTRING* errorString);
APILONG trLockSerialNumbers(APILONG sessionId, APISTRING stationNo, APISTRING lockName, APISTRING lockInformation, APILONG serialNumberArraySize, struct SerialNumberData* serialNumberArray, APISTRING* errorString);
APILONG trUnlockSerialNumbers(APILONG sessionId, APISTRING stationNo, APILONG fullUnlock, APISTRING lockName, APISTRING lockInformation, APILONG serialNumberArraySize, struct SerialNumberData* serialNumberArray, APISTRING* errorString);
APILONG trGetLockedSerialNumbers(APILONG sessionId, APISTRING stationNo, APILONG dateFrom, APILONG dateTo, APISTRING lockName, APISTRING workOrder, APILONG* lockInformationSize, struct LockInformation** lockInformation, APISTRING* errorString);
APILONG trGetSerialNumberLockHistory(APILONG sessionId, APISTRING stationNo, APISTRING serialNumber, APISTRING serialNumberPos, APILONG dateFrom, APILONG dateto, APISTRING lockName, APISTRING workOrder, APILONG onlyLocked, APILONG* lockHistorySize, struct LockHistory** lockHistory, APISTRING* errorString);


#ifdef __cplusplus
}
#endif

#endif
