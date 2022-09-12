unit ewMII;

interface

const
    APIVERSION = 'ewMII version 6.10 build date: 30.07.2008';

type
    // APIVOID         = void;
    APIBOOLEAN      = Integer;
    APIOCTET        = Integer;
    APICHAR         = char;                   {  8 bit }
    APISHORT        = Shortint;               { 16 bit }
    APILONG         = Longint;                { 32 dbit }
    APIFLOAT        = double;
    APIDOUBLE       = double;
    APISTRING       = PChar;

const
    _TRUE         = 1;
    _FALSE        = 0;

    DEFAULT_OPTIONS_FILE_PATH               = 'ewMII.options';
    DEFAULT_LIBRARY_LOGFILEPATH             = 'ewMIIlib.log';
    DEFAULT_LIBRARY_LCFFILEPATH             = 'ewMII.lcf';
    DEFAULT_OPTIONS_FILE_LINE_LENGTH        = 10000;
    DEFAULT_OPTIONS_FILE_COMMENT_SIGN       = '#';
    DEFAULT_SERVICE_NAME                    = 'EWApiServices';
    MAX_ERR_STRING_LENGTH                   = 256;
    MAX_PARAMETER_STRING_LENGTH             = 256;
    MAX_NUMBER_OF_SESSIONS                  = 100;


{  error/return codes }
    RES_OK                                    = 0;

    RES_ERR_JNI_CALL_API_METHOD            = -100;

    RES_ERR_JNI_JVM_UNKNOWN_ERROR          = -101;
    RES_ERR_JNI_JVM_THREAD_ERROR           = -102;
    RES_ERR_JNI_JVM_VERSION_ERROR          = -103;
    RES_ERR_JNI_JVM_OUT_OF_MEMORY          = -104;
    RES_ERR_JNI_JVM_ALREADY_CREATED        = -105;
    RES_ERR_JNI_JVM_INVALID_ARGUMENTS      = -106;

    RES_ERR_JNI_STATIC_METHOD_NOT_FOUND    = -110;
    RES_ERR_JNI_CANT_CREATE_UTF_STRING     = -111;
    RES_ERR_JNI_CANT_RELEASE_UTF_STRING    = -112;
    RES_ERR_JNI_CALL_STATIC_METHOD         = -113;
    RES_ERR_JNI_CALL_OBJECT_METHOD         = -114;
    RES_ERR_JNI_CLASS_NOT_FOUND_FOR_OBJECT = -115;
    RES_ERR_JNI_CLASS_NOT_FOUND            = -116;
    RES_ERR_JNI_METHOD_NOT_FOUND           = -117;
    RES_ERR_JNI_FIELD_NOT_FOUND            = -118;
    RES_ERR_JNI_CANT_CREATE_OBJECT         = -119;
    RES_ERR_JNI_CANT_RELEASE_OBJECT        = -120;
    RES_ERR_JNI_CANT_ACCESS_ARRAY_ELEMENTS = -121;
    RES_ERR_JNI_CANT_QUERY_ARRAY_SIZE      = -122;
    RES_ERR_JNI_RETURNED_REFERENCE_IS_NULL = -123;
    RES_ERR_JNI_POINTER_IS_NULL            = -124;
    RES_ERR_JNI_CANT_DELETE_REF            = -125;

    RES_ERR_API_NOT_INITIALIZED            = -130;
    RES_ERR_API_ALREADY_INITIALIZED        = -131;
    RES_ERR_API_NO_VALID_LOGIN             = -132;
    RES_ERR_API_MAX_SESSIONS_REACHED       = -133;
    RES_ERR_API_CANT_READ_OPTIONS_FILE     = -134;
    RES_ERR_API_NO_ENTRIES_IN_OPTIONS_FILE = -135;
    RES_ERR_API_NOT_ENOUGH_MEMORY          = -136;
    RES_ERR_API_CANT_WRITE_LOGFILE         = -137;
    RES_ERR_API_NULL_POINTER               = -138;
    RES_ERR_API_INVALID_ARRAY_SIZE         = -139;

    RES_ERR_API_END_OF_RESULT_RANGE        = -199;



// definition of structure KeyValuePair
type
  TKeyValuePair = packed record
      name  : APISTRING;
      value : APISTRING;
  end;

{ definition of structure ApiSessionValidationStruct }
  TApiSessionValidationStruct = packed record
      user      : APISTRING;
      password  : APISTRING;
      client    : APISTRING;
      isVip     : APIBOOLEAN;
      isStation : APIBOOLEAN;
      systemIdentifier : APISTRING;
  end;

{ definition of structure ResultData }
  TResultData = packed record
      name     : APISTRING;
      value    : APISTRING;
      failCode : APILONG;
  end;

{ definition of structure ResultDataExtendedStruct }
    TResultDataExtendedStruct =  record
        nr       : APIFLOAT;
        name     : APISTRING;
        value    : APISTRING;
        min      : APISTRING;
        max      : APISTRING;
        nom      : APISTRING;
        toleranz : APISTRING;
        _unit    : APISTRING;
        failCode : APILONG;
        messtyp  : APISTRING;
    end;

{ definition of structure ResultDataExtendedLimitsStruct }
    TResultDataExtendedLimitsStruct = packed record
        resDataExtendedStruct : TResultDataExtendedStruct;
        min_eg_ok  : APISTRING;
        max_eg_ok  : APISTRING;
        min_eg_aus : APISTRING;
        max_eg_aus : APISTRING;
        typ        : APISTRING;
        weighting  : APILONG;
        distributionType : APILONG;
        confidenceInterval : APILONG;
        cpRed       : APIDOUBLE;
        cpGreen     : APIDOUBLE;
        cpkRed      : APIDOUBLE ;
        cpkGreen    : APIDOUBLE;
        noiseFactor : APIDOUBLE;
        cleanupMode : APILONG;
    end;

{ definition of structure RecipeData }
    TRecipeData = packed record
        name  : APISTRING;
        value : APISTRING;
    end;

{ definition of structure SerialNumberData }
    TSerialNumberData = packed record
        serialNumber    : APISTRING;
        serialNumberPos : APISTRING;
    end;

{ definition of structure BomCompFailData }
    TBomCompFailData = packed record
        compName : APISTRING;
        partNr   : APISTRING;
        comment  : APISTRING;
    end;

{ definition of structure MergePartsData }
    TMergePartsData = packed record
        stationNr       : APISTRING;
        stationDesc     : APISTRING;
        serialNumber    : APISTRING;
        serialNumberPos : APISTRING;
        parentSerialNumber : APISTRING;
        slaveSerialNumber   : APISTRING;
        level       : APISTRING;
        workOrder   : APISTRING;
        partNr      : APISTRING;
        partDesc    : APISTRING;
        bomVersion  : APILONG;
        bomIndex    : APISTRING;
        cadPartNr   : APISTRING;
    end;

{ definition of structure WorkStationData }
    TWorkStationData = packed record
        workOrderNr  : APISTRING;
        resourceNr   : APISTRING;
        resourceDesc : APISTRING;
        snr          : APISTRING;
        position     : APISTRING;
        state        : APISTRING;
        cycleTime    : APIFLOAT;
        bookDate     : APISTRING;
        createDate   : APISTRING;
    end;

{ definition of structure ProductInfoData }
    TProductInfoData = packed record
        partNr          : APISTRING;
        partDesc        : APISTRING;
        secPartNr       : APISTRING;
        partGrpNr       : APISTRING;
        level           : APILONG;
        bomVersion      : APILONG;
        bomIndex        : APISTRING;
        cadPartNr       : APISTRING;
        validationDate  : APILONG;
        validFrom       : APILONG;
        validTo         : APILONG;
    end;

{ definition of structure ErrorData }
    TErrorData = packed record
        workOrderNr     : APISTRING;
        resourceNr      : APISTRING;
        snr             : APISTRING;
        position        : APISTRING;
        partName        : APISTRING;
        errorTypeDesc   : APISTRING;
        partNumber      : APISTRING;
        repaired        : APISTRING;
        adapResNumber   : APISTRING;
        serialError     : APISTRING;
    end;

{ definition of structure TestData }
    TTestData = packed record
        snr             : APISTRING;
        position        : APISTRING;
        resourceNr      : APISTRING;
        resourceDesc    : APISTRING;
        asNr            : APILONG;
        seqNr           : APILONG;
        name            : APISTRING;
        value           : APISTRING;
        failCode        : APILONG;
        step            : APILONG;
        registrated     : APISTRING;
    end;

{ definition of structure StateData }
    TStateData = packed record
        serialNumber    : APISTRING ;
        serialNumberPos : APISTRING;
        loopCounter     : APILONG;
        state           : APILONG;
    end;

{ definition of structure SetupData }
    TSetupData = packed record
        workorder       : APISTRING;
        productNo       : APISTRING;
        productDesc     : APISTRING;
        partOrder       : APISTRING;
        partNo          : APISTRING;
        partDesc        : APISTRING;
        partName        : APISTRING;
        partDateCode    : APISTRING;
        customerNo      : APISTRING;
        customerName    : APISTRING;
        position        : APISTRING;
        quantity        : APIDOUBLE;
        startDate       : APILONG;
        endDate         : APILONG;
        creationDate    : APILONG;
    end;

{ definition of structure SetupDataExt }
    TSetupDataExt = packed record
        workorder       : APISTRING;
        productNo       : APISTRING;
        productDesc     : APISTRING;
        partOrder       : APISTRING;
        partNo          : APISTRING;
        partDesc        : APISTRING;
        partName        : APISTRING;
        partDateCode    : APISTRING;
        customerNo      : APISTRING;
        customerName    : APISTRING;
        position        : APISTRING;
        quantity        : APIDOUBLE;
        startDate       : APILONG;
        endDate         : APILONG;
        creationDate    : APILONG;
        materialBinNr   : APISTRING;
        creationUser    : APISTRING;
        totalQuantity   : APIDOUBLE;
        state           : APILONG;
    end;

{ definition of structure SetupDataInf }
    TSetupDataInf = packed record
        stationNr       : APISTRING;
        position        : APISTRING;
        startDate       : APILONG;
        endDate         : APILONG;
        materialBinNr   : APISTRING;
        partOrder       : APISTRING;
        partNo          : APISTRING;
        partDateCode    : APISTRING;
    end;

{ definition of structure SetupPrepareData }
    TSetupPrepareData = packed record
        position      : APISTRING;
        materialBinNr : APISTRING;
    end;

{ definition of structure StringStruct }
    TStringStruct = packed record
        value : APISTRING;
    end;

{ definition of structure FailData }
    TFailData = packed record
        fehlerOrt   : APISTRING;
        fehlerArt   : APISTRING;
        lage        : APILONG;
        repariert   : APILONG;
    end;

{ definition of structure CompFailData }
    TCompFailData = packed record
        compName        : APISTRING;
        compPartNo      : APISTRING;
        failureType     : APISTRING;
        failureCause    : APISTRING;
        infoText        : APISTRING;
        processLayer    : APILONG;
        repair          : APILONG;
    end;

{ definition of structure BomItemData }
    TBomItemData = packed record
        partNo          : APISTRING;
        partDesc        : APISTRING;
        secPartNo       : APISTRING;
        compName        : APISTRING;
        process         : APISTRING;
        processLayer    : APILONG;
        processInfo     : APISTRING;
        bomInfo         : APISTRING;
        quantity        : APILONG;
        _unit           : APISTRING;
        setup           : APILONG;
        isProduct       : APILONG;
        isAlternative   : APILONG;
    end;

{ definition of structure MasterDataBom }
    TMasterDataBom = packed record
        partNo          : APISTRING;
        partDesc        : APISTRING;
        secPartNo       : APISTRING;
        compName        : APISTRING;
        alternative     : APILONG;
        quantity        : APIDOUBLE;
        _unit           : APISTRING;
        isProduct       : APILONG;
        bomVersion      : APILONG;
        bomInfo         : APISTRING;
        processType     : APILONG;
        processGrp      : APISTRING;
        processLayer    : APILONG;
        traceFlag       : APILONG;
        processInfo     : APISTRING;
        workstepNo      : APILONG;
    end;

{ definition of structure MaterialBinData }
    TMaterialBinData = packed record
        materialBinNr    : APISTRING;
        productNr        : APISTRING;
        quantity         : APIDOUBLE;
        chargeNr         : APISTRING;
        binLocationNr    : APISTRING;
        binLocationDescr : APISTRING;
        state            : APISTRING;
        expirationDate   : APILONG;
        dateCode         : APISTRING;
        totalQuantity    : APIDOUBLE;
        cost             : APIDOUBLE;
        costBase         : APILONG;
    end;

{ definition of structure ConfigData }
    TConfigData = packed record
        name    : APISTRING;
        value   : APISTRING;
    end;

{ definition of structure CalendarData }
    TCalendarData = packed record
        localizedDate   : APISTRING;
        date            : APILONG;
        calendar_week   : APILONG;
        day_of_week     : APILONG;
        year            : APILONG;
        month           : APILONG;
        day             : APILONG;
        hour            : APILONG;
        minute          : APILONG;
        second          : APILONG;
    end;

{ definition of structure SerialNumberStruct }
    TSerialNumberStruct = packed record
        serialNumber  : APISTRING;
    end;

{ definition of structure ChargeInfoStruct }
    TChargeInfoStruct = packed record
        chargeExt   : APISTRING;
        state       : APISTRING;
        qty         : APILONG;
    end;

{ definition of structure ShippingLotStruct }
    TShippingLotStruct = packed record
        partNo          : APISTRING;
        partDesc        : APISTRING;
        meh             : APILONG;
        custCode        : APISTRING;
        customerName    : APISTRING;
        extCustCode     : APISTRING;
        startDate       : APILONG;
        endDate         : APILONG;
        snrMatExt       : APISTRING;
        meTotal         : APIDOUBLE;
        meRest          : APIDOUBLE;
        beaStatus       : APISTRING;
        artBezPart      : APISTRING;
        artPart         : APISTRING;
    end;

{ definition of structure SetupHistoryData }
    TSetupHistoryData = packed record
        stationNr       : APISTRING;
        workOrder       : APISTRING;
        workStep        : APILONG;
        position        : APISTRING;
        materialBinNr   : APISTRING;
        kompInfo        : APISTRING;
        dateFrom        : APILONG;
        dateTo          : APILONG;
        returnCode      : APILONG;
        returnComment   :APISTRING;
    end;

{ definition of structure RecipeHeaderAndVersion }
    TRecipeHeaderAndVersion = packed record
        recipeId        : APILONG;
        recipeTitle     : APISTRING;
        partId          : APILONG;
        partNr          : APISTRING;
        bomVersion      : APILONG;
        processVersion  : APILONG;
        revisionIndex   : APISTRING;
        processStep     : APILONG;
        stationId       : APILONG;
        stationNr       : APISTRING;
        recipeVersionId : APILONG;
        recipeVersion   : APIDOUBLE;
        recipeVersionTitle  : APISTRING;
        recipeVersionDescription : APISTRING;
        active          : APIBOOLEAN;
        comment         : APISTRING;
        validFrom       : APILONG;
        validTo         : APILONG;
    end;

{ definition of structure RecipeDataExtendedStruct }
    TRecipeDataExtendedStruct = packed record
        recipeVersionId     : APILONG;
        sequentialNumber    : APIDOUBLE;
        name                : APISTRING;
        _type               : APISTRING;
        remark              : APISTRING;
        lowerLimit          : APISTRING;
        upperLimit          : APISTRING;
        nominal             : APISTRING;
        tolerance           : APISTRING;
        _unit               : APISTRING;
        measureType         : APISTRING;
        lowerActionLimit    : APISTRING;
        upperActionLimit    : APISTRING;
        lowerScrapLimit     : APISTRING;
        upperScrapLimit     : APISTRING;
        weighting           : APILONG;
        distributionType    : APILONG;
        confidenceInterval  : APILONG;
    end;

{ definition of structure SnrAttributeInfo }
    TSnrAttributeInfo = packed record
        snrId           : APILONG;
        serialNumber    : APISTRING;
        attributeNumber : APILONG;
        attributeValue  : APISTRING;
        attributeCode   : APISTRING;
    end;

{ definition of structure MaterialBinAttributeInfo }
    TMaterialBinAttributeInfo = packed record
        snrMatId        : APILONG;
        materialBinNr   : APISTRING;
        attributeNumber : APILONG;
        attributeDesc   : APISTRING;
        attributeValue  : APISTRING;
        attributeCode   : APISTRING;
    end;

{ definition of structure ChargeAttributeInfo }
    TChargeAttributeInfo = packed record
        chargeNr            : APILONG;
        chargeExt           : APISTRING;
        attributeNumber     : APILONG;
        attributeValue      : APISTRING;
        attributeCode       : APISTRING;
        attributeValueDesc  : APISTRING;
        attributeType       : APISTRING;
        objectKey           : APISTRING;
        partNo              : APISTRING;
    end;

{ definition of structure AttributeInfo }
    TAttributeInfo = packed record
        attributeCode   : APISTRING;
        value           : APISTRING;
    end;

{ definition of structure StoreInfo }
    TStoreInfo = packed record
        storageCell     : APISTRING;
        storageCellDesc : APISTRING;
        storageGroup    : APISTRING;
        storageGroupDesc : APISTRING;
        storage         : APISTRING;
        storageDesc     : APISTRING;
        materialBinNo   : APISTRING;
        partNo          : APISTRING;
        partDesc        : APISTRING;
        totalQuantity   : APIDOUBLE;
        quantity        : APIDOUBLE;
        _unit           : APISTRING;
        supplierNo      : APISTRING;
        supplierName    : APISTRING;
        chargeNo        : APISTRING;
        dateCode        : APISTRING;
        expirationDate  : APILONG;
        materialBinState: APICHAR;
        cost            : APIDOUBLE;
        costBase        : APILONG;
        weNr            : APISTRING;
        classification  : APISTRING;
        createDate      : APILONG;
        changeDate      : APILONG;
    end;

{ definition of structure SetupCompData }
    TSetupCompData = packed record
        stationId       : APILONG;
        stationNr       : APISTRING;
        stationDesc     : APISTRING;
        snrId           : APILONG;
        serialNumber    : APISTRING;
        serialNumberRef : APISTRING;
        workorder       : APISTRING;
        level           : APILONG;
        startDate       : APILONG;
        asNr            : APILONG;
        position        : APISTRING;
        dateFrom        : APILONG;
        dateTo          : APILONG;
        partId          : APILONG;
        partNo          : APISTRING;
        partDesc        : APISTRING;
        skslPositionNr  : APILONG;
        partName        : APISTRING;
        compName        : APISTRING;
        partOrder       : APISTRING;
        partDateCode    : APISTRING;
        customerNo      : APISTRING;
        customerName    : APISTRING;
        materialBinNr   : APISTRING;
        totalQuantity   : APIDOUBLE;
        state           : APILONG;
        classification  : APISTRING;
        expirationDate  : APILONG;
        readyForUseDate : APILONG;
        beaStatus       : APISTRING;
    end;

{ definition of structure WorkplanData }
    TWorkplanData = packed record
        stationNr             : APISTRING;
        workOrder             : APISTRING;
        workstepNo            : APILONG;
        processStepNo         : APILONG;
        voucherNo             : APILONG;
        threadNo              : APILONG;
        validFrom             : APILONG;
        validTo               : APILONG;
        prevWorkstep          : APILONG;
        nextWorkstep          : APILONG;
        prevWorkstepConfirm   : APILONG;
        nextWorkstepConfirm   : APILONG;
        qtyWoTotal            : APILONG;
        pass                  : APILONG;
        scrap                 : APILONG;
        fail                  : APILONG;
        qtyWoOpen             : APILONG;
        qtyPsScrap            : APILONG;
        processLayer          : APILONG;
        separationFlag        : APILONG;
        erpGroupNo            : APISTRING;
        erpGroupDesc          : APISTRING;
        obligatoryConfirmFlag : APISTRING;
        setupFlag             : APISTRING;
        workplanProcessStepNo : APISTRING;
        avo                   : APISTRING;
    end;

{ definition of structure MDAObject }
    TMDAObject = packed record
        uniqueFileName  : APISTRING;
        mdaFileName     : APISTRING;
        uniqueFilePath  : APISTRING;
        urlName         : APISTRING;
        mdaDataType     : APISTRING;
        docType         : APISTRING;
        mdaName         : APISTRING;
        mdaDesc         : APISTRING;
        mdaVersion      : APISTRING;
        mdaVersName     : APISTRING;
        mdaVersDesc     : APISTRING;
        mdaStatus       : APISTRING;
        mdaActive       : APISTRING;
    end;

{ definition of structure AdviceConfirmation }
    TAdviceConfirmation = packed record
        userId          : APILONG;
        userName        : APISTRING;
        userFirstName   : APISTRING;
        confirmed       : APILONG;
        confirmationTime : APILONG;
        adviceEditText  : APISTRING;
    end;

{ definition of structure Advice }
    TAdvice = packed record
        id          : APILONG;
        text        : APISTRING;
        name        : APISTRING;
        mdaRootKey  : APILONG;
        adviceType  : APILONG;
    end;

{ definition of structure MaterialBinDataExt }
    TMaterialBinDataExt = packed record
        materialBinNr : APISTRING;
        partNr : APISTRING;
        totalQuantity : APIDOUBLE;
        quantity : APIDOUBLE;
        supplierNo : APISTRING;
        supplierName : APISTRING;
        chargeNr : APISTRING;
        dateCode : APISTRING;
        expirationDate : APILONG;
        materialBinState : APISTRING;
        binLocationNr : APISTRING;
        binLocationDescr : APISTRING;
        cost : APIDOUBLE;
        costBase : APILONG;
        weNr : APISTRING;
        createDate : APILONG;
        stamp : APILONG;
        changeDate : APILONG;
        classification1 : APISTRING;
        classification2 : APISTRING;
        classification3 : APISTRING;
        classification4 : APISTRING;
        classification5 : APISTRING;
    end;

{ definition of structure WorkorderForLine }
    TWorkorderForLine = packed record
        workorder : APISTRING;
        workorderDesc : APISTRING;
        productNo : APISTRING;
        quantity : APIDOUBLE;
        workorderState : APISTRING;
        workorderType : APISTRING;
        bomVersion : APILONG;
        revisionIndex : APISTRING;
        processVersion : APILONG;
        workPlanVers : APILONG;
        plannedStartDate : APILONG;
        plannedShipDate : APILONG;
        workorderStartDate : APILONG;
        infoTxt1 : APISTRING;
        infoTxt2 : APISTRING;
        infoTxt3 : APISTRING;
        infoTxt4 : APISTRING;
        infoTxt5 : APISTRING;
        infoTxt6 : APISTRING;
        infoNo1 : APILONG;
        infoNo2 : APILONG;
        infoNo3 : APILONG;
        infoNo4 : APILONG;
    end;

{ definition of structure MaterialBinBookings }
    TMaterialBinBookings = packed record
        counter : APILONG;
        partNr : APISTRING;
        materialBinNr : APISTRING;
        quantity : APIDOUBLE;
        transact : APILONG;
        workorder : APISTRING;
        processLayer : APILONG;
        stationNoBook : APISTRING;
        bookDate : APILONG;
        errorcode : APILONG;
        errortxt : APISTRING;
    end;

{ definition of structure FailureCauseData }
    TFailureCauseData = packed record
        failureGroupCode : APISTRING;
        failureGroupBez : APISTRING;
        failureGroupInfo : APISTRING;
        failureCauseCode : APISTRING;
        failureCauseBez : APISTRING;
        failureCauseInfo : APISTRING;
        errorcode : APILONG;
        errortxt : APISTRING;
    end;

{ definition of structure FailureTypData }
    TFailureTypData = packed record
        failureGroupCode : APISTRING;
        failureGroupBez : APISTRING;
        failureGroupInfo : APISTRING;
        failureTypeCode : APISTRING;
        failureTypeBez : APISTRING;
        failureTypeInfo : APISTRING;
        failureTypePseudo : APILONG;
        failureTypeCategory : APICHAR;
        errorcode : APILONG;
        errortxt : APISTRING;
    end;

{ definition of structure FailureData }
    TFailureData = packed record
        serialNumber : APISTRING;
        serialNumberPos : APILONG;
        workorder : APISTRING;
        workstepNo : APILONG;
        stationNr : APISTRING;
        processLayer : APILONG;
        seqNumber : APILONG;
        compName : APISTRING;
        compPartNumber : APISTRING;
        failureType : APISTRING;
        failureCause : APISTRING;
        failureBookDate : APILONG;
        repair : APISTRING;
        cycleTime : APIDOUBLE;
        infoText : APISTRING;
    end;

{ definition of structure FailureSlipData }
    TFailureSlipData = packed record
        workorder : APISTRING;
        workstepNo : APILONG;
        stationNr : APISTRING;
        processLayer : APILONG;
        seqNumber : APILONG;
        infoText : APISTRING;
        failureBookDate : APILONG;
    end;

{ definition of structure FailureResultData }
    TFailureResultData = packed record
        workorder : APISTRING;
        workstepNo : APILONG;
        stationNr : APISTRING;
        processLayer : APILONG;
        seqNumber : APILONG;
        nr : APILONG;
        name : APISTRING;
        _type : APISTRING;
        messType : APISTRING;
        value : APISTRING;
        min : APISTRING;
        max : APISTRING;
        nom : APISTRING;
        toleranz : APISTRING;
        _unit : APISTRING;
        failCode : APILONG;
    end;

{ definition of structure EquipmentPrepareData }
    TEquipmentPrepareData = packed record
        equipmentNo : APISTRING;
        equipmentIndex : APISTRING;
    end;

{ definition of structure EquipmentSetupData }
    TEquipmentSetupData = packed record
        equipmentNo : APISTRING;
        equipmentIndex : APISTRING;
        equipmentNoExt : APISTRING;
        equipmentDescription : APISTRING;
        info1 : APISTRING;
        info2 : APISTRING;
        info3 : APISTRING;
        status : APILONG;
        secondsBeforeExpiration : APILONG;
        usagesBeforeExpiration : APILONG;
        failuresBeforeExpiration : APILONG;
    end;

{ definition of structure EquipmentCheckData }
    TEquipmentCheckData = packed record
        equipmentNo : APISTRING;
        equipmentIndex : APISTRING;
        checkStatus : APILONG;
        equipmentSetupGroup : APISTRING;
        partNo : APISTRING;
        partGrp : APISTRING;
        equipmentExt : APISTRING;
        equipmentDescription : APISTRING;
        groupItemType : APILONG;
        info1 : APISTRING;
        info2 : APISTRING;
        info3 : APISTRING;
    end;

{ definition of structure CompPosition }
    TCompPosition = packed record
        compReference : APILONG;
        compName : APISTRING;
        panelPosition : APILONG;
    end;

{ definition of structure MaterialSetupData }
    TMaterialSetupData = packed record
        position : APISTRING;
        materialBinNr : APISTRING;
        stationNr : APISTRING;
        productNr : APISTRING;
        supplierCode : APISTRING;
        supplierName : APISTRING;
        workOrder : APISTRING;
        placementName : APISTRING;
        partNr : APISTRING;
        compReference : APILONG;
        setupDate : APILONG;
        endDate : APILONG;
        returnCode : APILONG;
        returnComment : APISTRING;
        dateCode : APISTRING;
        removeSetup : APIBOOLEAN;
    end;

{ definition of structure MaterialBinBookingsExt }
    TMaterialBinBookingsExt = packed record
        counter       : APILONG;
        partNr        : APISTRING;
        materialBinNr : APISTRING;
        quantity      : APIDOUBLE;
        transact      : APILONG;
        workorder     : APISTRING;
        processLayer  : APILONG;
        stationNoBook : APISTRING;
        bookDate      : APILONG;
        errorcode     : APILONG;
        errortxt      : APISTRING;
        qtyPlaced     : APIDOUBLE;
        qtyWasted     : APIDOUBLE;
    end;

{ definition of structure SmtSerialNo }
    TSmtSerialNo = packed record
        serialNumber : APISTRING;
        serialNumberPosition:  APILONG;
        serialNumberState : APILONG;
        validationFlag : APILONG;
        processFlag : APILONG;
    end;

{ definition of structure SmtEvent }
    TSmtEvent = packed record
        eventId           : APILONG;
        eventDate         : APILONG;
        validationFlag    : APILONG;
        processFlag       : APILONG;
        position          : APISTRING;
        feederBank        : APISTRING;
        feederId          : APISTRING;
        placementId       : APILONG;
        qtyRemain         : APILONG;
        qtyPlaced         : APILONG;
        qtyWasted         : APILONG;
        materialBinNr     : APISTRING;
        createMaterialBin : APIBOOLEAN;
        partNo            : APISTRING;
        quantity          : APIDOUBLE;
        supplier          : APISTRING;
        lotNo             : APISTRING;
        dateCode          : APISTRING;
    end;

{ definition of structure SmtPlacement }
    TSmtPlacement = packed record
        placementId : APILONG;
        compName : APISTRING;
        xPosition : APISTRING;
        yPosition : APISTRING;
        panelPosition : APILONG;
    end;

{ definition of structure Failureslip }
    TFailureslip = packed record
        compName : APISTRING;            //
        testStepName : APISTRING;        //
        testStepDescription : APISTRING; //
    end;

{ definition of structure SerialNumberBookInfo }
    TSerialNumberBookInfo = packed record
        serialNumber : APISTRING;
        serialNumberPos : APILONG;
        state : APILONG;
        workorder : APISTRING;
        workstepNo : APILONG;
        stationNr : APISTRING;
        processLayer : APILONG;
        avo : APISTRING;
        seqNumber : APILONG;
        serialNumberRef : APISTRING;
        serialNumberRefPos : APILONG;
    end;

{ definition of structure MergedUnitsData }
    TMergedUnitsData = packed record
        stationNr : APISTRING;
        stationDesc : APISTRING;
        serialNumber : APISTRING;
        serialNumberPos : APISTRING;
        level : APILONG;
        masterSerialNumber : APISTRING;
        masterSerialNumberPos : APISTRING;
        slaveSerialNumber : APISTRING;
        slaveSerialNumberPos : APISTRING;
        plantNr : APISTRING;
        workOrder : APISTRING;
        partNr : APISTRING;
        partDesc : APISTRING;
        bomVersion : APILONG;
        bomIndex : APISTRING;
        bomInfo : APISTRING;
        cadPartNr : APISTRING;
        info1 : APISTRING;
        info2 : APISTRING;
        info3 : APISTRING;
    end;

{ definition of structure MergePartData }
    TMergePartData = packed  record
        serialNumber : APISTRING;
        serialNumberPos : APILONG;
        compPartNo : APISTRING;
        compName : APISTRING;
        compBomQty : APIDOUBLE;
        mergedInSnrQty : APIDOUBLE;
        info1 : APISTRING;
        info2 : APISTRING;
        info3 : APISTRING;
    end;

{ definition of structure Feeder }
    TFeeder = packed record
        reelNr : APISTRING;
        reelId : APILONG;
        currentQty : APIDOUBLE;
    end;

{ definition of structure MdcCondition }
    TMdcCondition = packed record
        colorRGB : APISTRING;
        level4 : APISTRING;
        conditionCode : APISTRING;
        conditionDesc : APISTRING;
        conditionName : APISTRING;
        startDate : APILONG;
        endDate : APILONG;
        txt : APISTRING;
    end;

{ definition of structure MdcMessage }
    TMdcMessage = packed record
        colorRGB : APISTRING;
        conditionCode : APISTRING;
        conditionDesc : APISTRING;
        conditionName : APISTRING;
        startDate : APILONG;
        endDate : APILONG;
        txt: APISTRING;
    end;

{ definition of structure MdcLog }
    TMdcLog = packed record
        startDate : APILONG;
        endDate : APILONG;
        subject : APISTRING;
        txt : APISTRING;
    end;

{ definition of structure MdcConditionCode }
    TMdcConditionCode = packed record
        name : APISTRING;
        code : APISTRING;
        level4 : APISTRING;
        colorRGB : APISTRING;
        _type : APILONG;
    end;

{ definition of structure MdataBomItem }
    TMdataBomItem = packed record
        partNo : APISTRING;
        partDesc : APISTRING;
        secPartNo : APISTRING;
        artGrpNo : APILONG;
        compName : APISTRING;
        alternative : APILONG;
        erpPosNo : APISTRING;
        posTyp : APILONG;
        quantity: APIDOUBLE;
        _unit : APILONG;
        isProduct : APILONG;
        bomVersionERP : APISTRING;
        bomInfoTxt : APISTRING;
        processType : APILONG;
        processGrp : APISTRING;
        processLayer : APILONG;
        traceFlag: APILONG;
        workstepNo : APILONG;
        returnComment : APISTRING;
    end;

{ definition of structure LockInformation }
    TLockInformation = packed record
        serialNumber : APISTRING;
        serialNumberPos : APISTRING;
        lockName : APISTRING;
        workOrder : APISTRING;
        serialNumberLockCount: APILONG;
    end;

{ definition of structure LockHistory }
    TLockHistory = packed record
        serialNumber : APISTRING;
        serialNumberPos : APISTRING;
        lockName : APISTRING;
        workOrder : APISTRING;
        lockDate : APILONG;
        lockUser : APISTRING;
        lockStation : APISTRING;
        lockInfo : APISTRING;
        unlockDate : APILONG;
        unlockUser : APISTRING;
        unlockStation : APISTRING;
        unlockInfo : APISTRING;
        serialNumberLockCount : APILONG;
  end;


type
{ definition of array KeyValuePairArray }
  PKeyValuePairArray = ^TKeyValuePair;

{ definition of array ResultDataArray }
  PResultDataArray   = ^TResultData;

{ definition of array ResultDataExtendedStructArray }
  PResultDataExtendedStructArray = ^TResultDataExtendedStruct;

{ definition of array ResultDataExtendedLimitsStructArray }
  PResultDataExtendedLimitsStructArray = ^TResultDataExtendedLimitsStruct;

{ definition of array RecipeDataArray }
  PRecipeDataArray = ^TRecipeData;

{ definition of array SerialNumberArray }
  PSerialNumberArray = ^TSerialNumberData;

{ definition of array BomCompFailDataArray }
  PBomCompFailDataArray = ^TBomCompFailData;

{ definition of array MergePartsArray }
  PMergePartsArray = ^TMergePartsData;

{ definition of array ProductInfoArray }
  PProductInfoArray = ^TProductInfoData;

{ definition of array SetupDataArray }
  PSetupDataArray    = ^TSetupData;

{ definition of array SetupDataExtArray }
  PSetupDataExtArray    = ^TSetupDataExt;

{ definition of array SetupDataInfArray }
  PSetupDataInfArray    = ^TSetupDataInf;

{ definition of array SetupPrepareDataArray }
  PSetupPrepareDataArray    = ^TSetupPrepareData;

{ definition of array WorkStationDataArray }
  PWorkStationDataArray    = ^TWorkStationData;

{ definition of array ErrorDataArray }
  PErrorDataArray    = ^TErrorData;

{ definition of array TestDataArray }
  PTestDataArray    = ^TTestData;

{ definition of array StateDataArray }
  PStateDataArray    = ^TStateData;

{ definition of array StringStructArray }
  PStringStructArray    = ^TStringStruct;

{ definition of array FailDataArray }
  PFailDataArray    = ^TFailData;

{ definition of array CompFailDataArray }
  PCompFailDataArray    = ^TCompFailData;

{ definition of array BomItemDataArray }
  PBomItemDataArray    = ^TBomItemData;

{ definition of array MasterDataBomArray }
  PMasterDataBomArray    = ^TMasterDataBom;

{ definition of array MaterialBinDataArray }
  PMaterialBinDataArray    = ^TMaterialBinData;

{ definition of array ConfigDataArray }
  PConfigDataArray    = ^TConfigData;

{ definition of array SerialNumberStructArray }
  PSerialNumberStructArray    = ^TSerialNumberStruct;

{ definition of array ChargeInfoStructArray }
  PChargeInfoStructArray    = ^TChargeInfoStruct;

{ definition of array ShippingLotArray }
  PShippingLotArray    = ^TShippingLotStruct;

{ definition of array SetupHistoryDataArray }
  PSetupHistoryDataArray    = ^TSetupHistoryData;

{ definition of array RecipeHeaderAndVersionArray }
  PRecipeHeaderAndVersionArray    = ^TRecipeHeaderAndVersion;

{ definition of array RecipeDataExtendedStructArray }
  PRecipeDataExtendedStructArray    = ^TRecipeDataExtendedStruct;

{ definition of array SnrAttributeInfoArray }
  PSnrAttributeInfoArray    = ^TSnrAttributeInfo;

{ definition of array MaterialBinAttributeInfoArray }
  PMaterialBinAttributeInfoArray    = ^TMaterialBinAttributeInfo;

{ definition of array ChargeAttributeInfoArray }
  PChargeAttributeInfoArray    = ^TChargeAttributeInfo;

{ definition of array AttributeArray }
  PAttributeArray    = ^TAttributeInfo;

{ definition of array StoreInfoArray }
  PStoreInfoArray    = ^TStoreInfo;

{ definition of array SetupCompDataArray }
  PSetupCompDataArray    = ^TSetupCompData;

{ definition of array WorkplanDataArray }
  PWorkplanDataArray    = ^TWorkplanData;

{ definition of array MDAObjectArray }
  PMDAObjectArray    = ^TMDAObject;

{ definition of array AdviceConfirmationArray }
  PAdviceConfirmationArray    = ^TAdviceConfirmation;

{ definition of array AdviceArray }
  PAdviceArray    = ^TAdvice;

{ definition of array MaterialBinDataExtArray }
  PMaterialBinDataExtArray    = ^TMaterialBinDataExt;

{ definition of array WorkorderForLineArray }
  PWorkorderForLineArray    = ^TWorkorderForLine;

{ definition of array MaterialBinBookingsArray }
  PMaterialBinBookingsArray    = ^TMaterialBinBookings;

{ definition of array FailureCauseDataArray }
  PFailureCauseDataArray    = ^TFailureCauseData;

{ definition of array FailureTypDataArray }
  PFailureTypDataArray    = ^TFailureTypData;

{ definition of array FailureDataArray }
  PFailureDataArray    = ^TFailureData;

{ definition of array FailureSlipDataArray }
  PFailureSlipDataArray    = ^TFailureSlipData;

{ definition of array FailureResultDataArray }
  PFailureResultDataArray    = ^TFailureResultData;

{ definition of array EquipmentPrepareDataArray }
  PEquipmentPrepareDataArray    = ^TEquipmentPrepareData;

{ definition of array EquipmentSetupDataArray }
  PEquipmentSetupDataArray    = ^TEquipmentSetupData;

{ definition of array EquipmentCheckDataArray }
  PEquipmentCheckDataArray    = ^TEquipmentCheckData;

{ definition of array CompPositionArray }
  PCompPositionArray    = ^TCompPosition;

{ definition of array MaterialSetupDataArray }
  PMaterialSetupDataArray    = ^TMaterialSetupData;

{ definition of array MaterialBinBookingsExtArray }
  PMaterialBinBookingsExtArray    = ^TMaterialBinBookingsExt;

{ definition of array SmtSerialNoArray }
  PSmtSerialNoArray    = ^TSmtSerialNo;

{ definition of array SmtEventArray }
   PSmtEventArray    = ^TSmtEvent;

{ definition of array SmtPlacementArray }
   PSmtPlacementArray    = ^TSmtPlacement;

{ definition of array FailureslipArray }
   PFailureslipArray    = ^TFailureslip;

{ definition of array SerialNumberBookInfoArray }
   PSerialNumberBookInfoArray    = ^TSerialNumberBookInfo;

{ definition of array MergedUnitsArray }
   PMergedUnitsArray    = ^TMergedUnitsData;

{ definition of array MergePartArray }
   PMergePartArray    = ^TMergePartData;

{ definition of array FeederArray }
   PFeederArray    = ^TFeeder;

{ definition of array MdcConditionArray }
   PMdcConditionArray    = ^TMdcCondition;

{ definition of array MdcMessageArray }
   PMdcMessageArray    = ^TMdcMessage;

{ definition of array MdcLogArray }
   PMdcLogArray    = ^TMdcLog;

{ definition of array MdcConditionCodeArray }
   PMdcConditionCodeArray    = ^TMdcConditionCode;

{ definition of array MdataBomItemArray }
   PMdataBomItemArray    = ^TMdataBomItem;

{ definition of array LockInformationArray }
   PLockInformationArray    = ^TLockInformation;

{ definition of array LockHistoryArray }
   PLockHistoryArray    = ^TLockHistory;


{ definition of fix functions }
function apiInit(aOptionsFilePath : APISTRING; var errorString : APISTRING) : APILONG; cdecl;
function apiShutdown(var errorString : APISTRING) : APILONG; cdecl;
function apiFreeBuffers() : APILONG; cdecl;
function apiGetVersion() : APISTRING; cdecl;


{ definition of idl functions }
function  apiLogin(var sessValData : TApiSessionValidationStruct; var errorString : APISTRING) : APILONG; cdecl;
procedure apiLogout(sessionId : APILONG; var errorString : APISTRING); cdecl;
function  apiHeartbeat(sessionId : APILONG; var errorString : APISTRING) : APILONG; cdecl;
function  logMessage(sessionId : APILONG; category : APISTRING; level : APILONG; _message : APISTRING; source : APISTRING; var errorString : APISTRING) : APILONG; cdecl;
function  changeWorkOrderForLine(sessionId : APILONG; stationNr : APISTRING; var partNr : APISTRING; var partDesc : APISTRING; var bomVersion : APILONG; var bomIndex : APISTRING; var cadPartNr : APISTRING; var processLayer : APILONG; var workOrder; var quantity : APILONG; var state :APISTRING; var customerName : APISTRING; var customerPartNr : APISTRING; var attribut1 : APISTRING; var errorString : APISTRING) : APILONG; cdecl;
{
APILONG changeWorkOrder(APILONG sessionId, APISTRING stationNr, APISTRING* partNr, APISTRING* partDesc, APILONG* bomVersion, APISTRING* bomIndex, APISTRING* cadPartNr, APILONG* processLayer, APISTRING* workOrder, APILONG* quantity, APISTRING* state, APISTRING* customerName, APISTRING* customerPartNr, APISTRING* attribut1, APISTRING* errorString);
APILONG setWorkOrderFromSerialNumber(APILONG sessionId, APISTRING stationNr, APISTRING serialNumber, APISTRING* partNr, APISTRING* partDesc, APILONG* bomVersion, APISTRING* bomIndex, APISTRING* cadPartNr, APILONG* processLayer, APISTRING* workOrder, APILONG* quantity, APISTRING* state, APISTRING* customerName, APISTRING* customerPartNr, APISTRING* attribut1, APISTRING* errorString);
}
function getStationSetup(sessionId :APILONG ; stationNr : APISTRING ; var partNr : APISTRING ; var bomVersion:  APILONG; var  bomIndex : APISTRING; var partDesc: APISTRING; var  workOrder :APISTRING; var quantity : APILONG; var  state : APISTRING; var cadPartNr : APISTRING; var  processLayer: APILONG; var customerName : APISTRING; var customerPartNr : APISTRING; var attribut1 : APISTRING; var errorString : APISTRING): APILONG; cdecl;

{APILONG getStationSetup(APILONG sessionId, APISTRING stationNr, APISTRING* partNr, APILONG* bomVersion, APISTRING* bomIndex, APISTRING* partDesc, APISTRING* workOrder, APILONG* quantity, APISTRING* state, APISTRING* cadPartNr, APILONG* processLayer, APISTRING* customerName, APISTRING* customerPartNr, APISTRING* attribut1, APISTRING* errorString);
APILONG getSerialnumberInfo(APILONG sessionId, APISTRING serialnumber, APISTRING serialnumberPos, APISTRING* partNr, APILONG* bomVersion, APISTRING* bomIndex, APISTRING* partDesc, APISTRING* workOrder, APILONG* quantity, APISTRING* state, APISTRING* cadPartNr, APISTRING* customerName, APISTRING* customerPartNr, APISTRING* attribut1, APISTRING* errorString);
}

function getSnrUploadInfo(sessionId : APILONG; stationNr: APISTRING;  processLayer :APILONG;  serialnumber: APISTRING;  serialnumberPos :APISTRING; checkProcessStep :APILONG; var partNr:APISTRING; var workOrder: APISTRING; var uploadStationNr : APISTRING; var processStep: APILONG; var loopCounter : APILONG; var state: APILONG; var bookDate : APILONG;  var oldSerialNumber: APISTRING; var errorString: APISTRING): APILONG; cdecl;

{APILONG assignSerialNumberToWorkOrder(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumberRef, APISTRING serialNumberRefPos, APILONG serialNumberArraySize, struct SerialNumberData* serialNumberArray, APISTRING* errorString);
APILONG mergeParts(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APILONG duplicateSerialNumber, APISTRING serialNumberMaster, APISTRING serialNumberSlave, APISTRING* errorString);
APILONG removeMergeParts(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumberSlave, APISTRING textInfo, APISTRING* errorString);
}

function verifyMerge( sessionId: APILONG;  stationNr: APISTRING;  serialNumberSlave: APISTRING; var errorString: APISTRING): APILONG; cdecl;

{APILONG verifyMergeBySnrRef(APILONG sessionId, APISTRING stationNr, APISTRING serialNumberSlave, APILONG* testDataArraySize, struct StateData** testDataArray, APISTRING* errorString);
APILONG verifyMergeProduct(APILONG sessionId, APISTRING stationNr, APISTRING productId, APILONG bomVersion, APISTRING bomIndex, APISTRING serialNumberSlave, APILONG booking, APISTRING* errorString);
APILONG getProductInfo(APILONG sessionId, APISTRING stationNr, APISTRING partNr, APILONG level, APILONG* productInfosSize, struct ProductInfoData** productInfos, APISTRING* errorString);
APILONG getMergeParts(APILONG sessionId, APISTRING serialNumber, APILONG* mergePartsArraySize, struct MergePartsData** mergePartsArray, APISTRING* errorString);
APILONG getSerialNumberBySnrRef(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumberRef, APILONG* serialNumberArraySize, struct SerialNumberData** serialNumberArray, APISTRING* errorString);
}
function switchSerialNumber(sessionId : APILONG; stationNr : APISTRING; processLayer : APILONG; duplicateSerialNumber : APILONG; serialNumberOld : APISTRING; serialNumberNew : APISTRING; var errorString : APISTRING) : APILONG; cdecl;
{
APILONG switchSerialNumberBySnrRef(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumberRef, APISTRING serialNumberPos, APISTRING serialNumberNew, APISTRING* errorString);
}
function checkSerialNumberState(sessionId : APILONG; stationNr : APISTRING; processLayer : APILONG; serialNumber : APISTRING; serialNumberPos : APISTRING; var loopCounter : APILONG; var errorString : APISTRING) : APILONG; cdecl;
{
APILONG checkSnrStateBySnrRef(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumber, APILONG* testDataArraySize, struct StateData** testDataArray, APISTRING* errorString);
}
function uploadStateAndResultData(sessionId : APILONG; stationNr : APISTRING; processLayer : APILONG; serialNumber : APISTRING; serialNumberPos : APISTRING; serialNumberState : APILONG; duplicateSerialNumber : APILONG; resultDataArraySize : APILONG; resultDataArray : PResultDataArray; cycleTime : APIFLOAT; var loopCounter : APILONG; var errorString : APISTRING) : APILONG; cdecl;
function uploadState(sessionId : APILONG; stationNr : APISTRING; processLayer : APILONG; serialNumberRef : APISTRING; serialNumberRefPos : APISTRING; serialNumberState : APILONG; duplicateSerialNumber : APILONG; checkActiveWorkOrder : APILONG; var errorString : APISTRING) : APILONG; cdecl;
function uploadFailureslip(sessionId : APILONG; stationNr : APISTRING; processLayer : APILONG; serialNumber : APISTRING; serialnumberPos: APISTRING;  partNr : APISTRING;  state: APILONG;  bookDate : APILONG;  failureslipSize : APILONG; failureslip: PFailureslipArray; checkActiveWorkorder: APILONG; var errorString: APISTRING): APILONG; cdecl;

//APILONG queryTestData(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumber, APILONG* resultDataArraySize, struct ResultData** resultDataArray, APILONG* loopCounter, APIFLOAT* cycleTime, APISTRING* errorString);

function queryRecipeData(sessionId : APILONG; stationNr, workOrder : APISTRING; var recipeDataArraySize : APILONG; recipeDataArray : PRecipeDataArray; var errorString : APISTRING) : APILONG; cdecl;
//APILONG queryRecipeData(APILONG sessionId, APISTRING stationNr, APISTRING workOrder, APILONG* recipeDataArraySize, struct RecipeData** recipeDataArray, APISTRING* errorString);
//APILONG getNextSerialNumber(APILONG sessionId, APISTRING stationNr, APISTRING* serialNumber, APISTRING* errorString);

function getNextSerialNumberForWorkOrder(sessionId : APILONG; stationNr : APISTRING; workOrder : APISTRING; var serialNumberArraySize : APILONG; serialNumberArray : PSerialNumberArray; var errorString : APISTRING) : APILONG; cdecl;
{
APILONG bomCheck(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumber, APILONG checkActivPreparation, APILONG* aBomCompFailDataSize, struct BomCompFailData** aBomCompFailData, APISTRING* errorString);
APILONG bomCheckForWorkorder(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING workorder, APILONG checkActivPreparation, APILONG* aBomCompFailDataSize, struct BomCompFailData** aBomCompFailData, APISTRING* errorString);
APILONG setupActivation(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING workorder, APILONG activateFlag, APISTRING* errorString);
APILONG updateSetupData(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APILONG setupFlag, APILONG setupPrepareDataArraySize, struct SetupPrepareData* setupPrepareDataArray, APISTRING* errorString);
APILONG uploadStateAndFailData(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING artikel, APISTRING serialNumber, APISTRING serialNumberPos, APISTRING nutzenBez, APILONG serialNumberState, APILONG duplicateSerialNumber, APILONG fehlerDatenArraySize, struct FailData* fehlerDatenArray, APIFLOAT cycleTime, APILONG* loopCounter, APISTRING* errorString);
APILONG getStationQuantity(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING workOrder, APILONG funcMode, APILONG* qtyWoTotal, APILONG* qtyWoStarted, APILONG* qtyWoFinished, APILONG* qtyStGood, APILONG* qtyStReject, APILONG* qtyStScrap, APILONG* qtyPsGood, APILONG* qtyPsReject, APILONG* qtyPsScrap, APISTRING* errorString);
APILONG getSnrHistoryData(APILONG sessionId, APISTRING serialNumber, APISTRING* workOrderNr, APISTRING* SAPCode, APISTRING* secondPartNr, APISTRING* partName, APISTRING* quantity, APISTRING* lastReportDate, APILONG* workStationDataArraySize, struct WorkStationData** workStationDataArray, APILONG* errorDataArraySize, struct ErrorData** errorDataArray, APILONG* testDataArraySize, struct TestData** testDataArray, APISTRING* errorString);
APILONG getSerialNumberHistoryData(APILONG sessionId, APISTRING stationNr, APISTRING serialNumber, APISTRING* workOrderNr, APISTRING* SAPCode, APISTRING* secondPartNr, APISTRING* partName, APISTRING* quantity, APISTRING* lastReportDate, APILONG* workStationDataArraySize, struct WorkStationData** workStationDataArray, APILONG* errorDataArraySize, struct ErrorData** errorDataArray, APILONG* testDataArraySize, struct TestData** testDataArray, APISTRING* errorString);
}
//function uploadResultDataAndRecipe(sessionId : APILONG; stationNr:APISTRING; processLayer : APILONG; serialNumberRef : APISTRING; serialNumberRefPos : APISTRING; serialNumberState : APILONG; produktNo : APISTRING; produktRev : APISTRING; bookDate : APILONG; cycleTime : APIFLOAT; resultDataExtArraySize : APILONG; resultDataExtArray : PResultDataExtendedStructArray; var errorString : APISTRING) : APILONG; cdecl;
function uploadResultDataAndRecipe( sessionId : APILONG;stationNr:APISTRING; processLayer : APILONG; serialNumberRef : APISTRING; serialNumberRefPos : APISTRING; serialNumberState : APILONG; produktNo : APISTRING; produktRev : APISTRING; bookDate : APILONG; cycleTime : APIFLOAT; resultDataExtArraySize : APILONG; resultDataExtArray : PResultDataExtendedStructArray; var errorString : APISTRING) : APILONG; cdecl;
//APILONG uploadResultDataAndRecipe(APILONG sessionId, APISTRING stationNr, APILONG processLayer, APISTRING serialNumberRef, APISTRING serialNumberRefPos, APILONG serialNumberState, APISTRING produktNo, APISTRING produktRev, APILONG bookDate, APIFLOAT cycleTime, APILONG resultDataExtArraySize, struct ResultDataExtendedStruct* resultDataExtArray, APISTRING* errorString);
{
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
}
function assignSerialNumberMergeAndUploadState(sessionId: APILONG;  stationNr: APISTRING;  processLayer: APILONG;  serialNumberRef: APISTRING;  serialNumberRefPos: APISTRING;  serialNumberArraySize: APILONG; SerialNumberData : PSerialNumberArray;  serialNumberSlave :APISTRING; doUploadState : APILONG;   serialNumberState: APILONG;  var errorString: APISTRING): APILONG; cdecl;

{APILONG getMaterialSetupDataForKapAndPeriod(APILONG sessionId, APISTRING stationNr, APILONG dateFrom, APILONG dateTo, APILONG* setupDataSize, struct SetupDataInf** setupData, APISTRING* errorString);
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
}
function getSnrInfoData(sessionId : APILONG; stationNr : APISTRING; serialnumber : APISTRING; serialnumberPos : APISTRING; var partNr : APISTRING; var bomVersion : APILONG; var bomIndex : APISTRING; var partDesc : APISTRING; var workOrder : APISTRING; var quantity : APILONG; var state : APISTRING; var cadPartNr : APISTRING; var customerName : APISTRING; var customerPartNr : APISTRING; var attribut1 : APISTRING; var errorString : APISTRING) : APILONG; cdecl;
{
APILONG getRecipeHeaderAndVersion(APILONG sessionId, APISTRING stationNr, APISTRING partNr, APILONG bomVersion, APILONG processVersion, APISTRING revisionIndex, APIBOOLEAN onlyActive, APILONG* recipeHeadersSize, struct RecipeHeaderAndVersion** recipeHeaders, APISTRING* errorString);
APILONG getRecipeData(APILONG sessionId, APILONG recipeVersionId, APISTRING stationNr, APISTRING partNr, APILONG bomVersion, APILONG processVersion, APISTRING revisionIndex, APILONG* recipeDataSize, struct RecipeDataExtendedStruct** recipeData, APISTRING* errorString);
APILONG activateRecipe(APILONG sessionId, APILONG recipeId, APILONG recipeVersionId, APISTRING stationNr, APISTRING* errorString);
APILONG createRecipe(APILONG sessionId, APISTRING stationNr, APISTRING partNr, APILONG bomVersion, APILONG processVersion, APISTRING revisionIndex, APILONG* recipeDataSize, struct RecipeDataExtendedStruct** recipeData, APIBOOLEAN activate, APISTRING* errorString);
APILONG shipGetLotFromSerialNo(APILONG sessionId, APISTRING stationNr, APISTRING serialNumber, struct ShippingLotStruct** shippingLot, APISTRING* errorString);
APILONG appendAttributeToWorkorder(APILONG sessionId, APISTRING stationNr, APISTRING chargeExt, APISTRING serialNumber, APISTRING partNo, APISTRING attributeCode, APISTRING attributeValue, APISTRING attributeValueDesc, APISTRING attributeType, APISTRING objectKey, APISTRING* errorString);
}
function appendAttributeToSerialNumber(sessionId : APILONG; stationNr : APISTRING; serialNumber : APISTRING; attributeCode : APISTRING; attributeValue : APISTRING; var errorString : APISTRING) : APILONG; cdecl;
// APILONG appendAttributesToMaterialBin(APILONG sessionId, APISTRING stationNr, APISTRING materialBinNr, APILONG infosSize, struct AttributeInfo* infos, APISTRING* errorString);
function removeAttributeFromSerialNumber(sessionId : APILONG; stationNr : APISTRING; serialNumber : APISTRING; attributeCode : APISTRING; var errorString : APISTRING) : APILONG; cdecl;
{
APILONG removeAttributeFromMaterialBin(APILONG sessionId, APISTRING stationNr, APISTRING materialBinNr, APISTRING attributeCode, APISTRING* errorString);
APILONG removeAttributeFromWorkorder(APILONG sessionId, APISTRING stationNr, APISTRING chargeExt, APISTRING serialNumber, APISTRING attributeCode, APISTRING objectKey, APISTRING* errorString);
}

function getAttributesForSerialNumber(sessionId : APILONG; stationNr : APISTRING; serialNumber : APISTRING; attributeCode : APISTRING; var snrAttributeInfosSize : APILONG; snrAttributeInfos : PSnrAttributeInfoArray; var errorString : APISTRING) : APILONG; cdecl;
// APILONG getAttributesForMaterialBin(APILONG sessionId, APISTRING stationNr, APISTRING materialBinNr, APISTRING attributeCode, APILONG* matBinAttributeInfosSize, struct MaterialBinAttributeInfo** matBinAttributeInfos, APISTRING* errorString);
function getAttributesForWorkorder(sessionId : APILONG; stationNr, chargeExt, serialNumber,  partNo, attributeCode, attributeType : APISTRING; var chargeAttributeInfosSize : APILONG; chargeAttributeInfos : PChargeAttributeInfoArray; var errorString : APISTRING) : APILONG; cdecl;
function getSerialNumbersForAttribute( sessionId: APILONG;   stationNr: APISTRING;  attributeCode: APISTRING;  attributeValue: APISTRING; var  serialNrArraySize : APILONG;  serialNrArray : PSerialNumberStructArray; var errorString: APISTRING): APILONG; cdecl;

{APILONG getSerialNumbersForAttribute(APILONG sessionId, APISTRING stationNr, APISTRING attributeCode, APISTRING attributeValue, APILONG* serialNrArraySize, struct SerialNumberStruct** serialNrArray, APISTRING* errorString);
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

}
implementation

const
  DLL_Name = 'ewMII.dll';

{ definition of fix functions }
function apiInit;              external DLL_Name;
function apiShutdown;          external DLL_Name;
function apiFreeBuffers;       external DLL_Name;
function apiGetVersion;        external DLL_Name;

{ definition of idl functions }
function  apiLogin;                      external DLL_Name;
procedure apiLogout;                     external DLL_Name;
function  apiHeartbeat;                  external DLL_Name;
function  logMessage;                    external DLL_Name;
function  changeWorkOrderForLine;        external DLL_Name;
{
function changeWorkOrder;               external DLL_Name;
function setWorkOrderFromSerialNumber;  external DLL_Name;
}
function getStationSetup;               external DLL_Name;

{function getSerialnumberInfo;           external DLL_Name;
}
function getSnrUploadInfo;               external DLL_Name;
function verifyMerge;                   external DLL_Name;
{function assignSerialNumberToWorkOrder(function sessionId, APISTRING stationNr, function processLayer, APISTRING serialNumberRef, APISTRING serialNumberRefPos, function serialNumberArraySize, struct SerialNumberData* serialNumberArray, APISTRING* errorString);
function mergeParts(function sessionId, APISTRING stationNr, function processLayer, function duplicateSerialNumber, APISTRING serialNumberMaster, APISTRING serialNumberSlave, APISTRING* errorString);
function removeMergeParts(function sessionId, APISTRING stationNr, function processLayer, APISTRING serialNumberSlave, APISTRING textInfo, APISTRING* errorString);
}

{function verifyMergeBySnrRef(function sessionId, APISTRING stationNr, APISTRING serialNumberSlave, APILONG* testDataArraySize, struct StateData** testDataArray, APISTRING* errorString);
function verifyMergeProduct(function sessionId, APISTRING stationNr, APISTRING productId, function bomVersion, APISTRING bomIndex, APISTRING serialNumberSlave, function booking, APISTRING* errorString);
function getProductInfo(function sessionId, APISTRING stationNr, APISTRING partNr, function level, APILONG* productInfosSize, struct ProductInfoData** productInfos, APISTRING* errorString);
function getMergeParts(function sessionId, APISTRING serialNumber, APILONG* mergePartsArraySize, struct MergePartsData** mergePartsArray, APISTRING* errorString);
function getSerialNumberBySnrRef(function sessionId, APISTRING stationNr, function processLayer, APISTRING serialNumberRef, APILONG* serialNumberArraySize, struct SerialNumberData** serialNumberArray, APISTRING* errorString);
}
function switchSerialNumber;            external DLL_Name;
{
function switchSerialNumberBySnrRef     external DLL_Name;
}
function checkSerialNumberState;        external DLL_Name;
{
function checkSnrStateBySnrRef          external DLL_Name;
}
function uploadStateAndResultData;      external DLL_Name;
function uploadState;                   external DLL_Name;

function uploadFailureslip;             external DLL_Name;
{function queryTestData;                 external DLL_Name;
}
function queryRecipeData;               external DLL_Name;
{
function getNextSerialNumber;           external DLL_Name;
}
function getNextSerialNumberForWorkOrder;    external DLL_Name;
{
function bomCheck;                      external DLL_Name;
function bomCheckForWorkorder;          external DLL_Name;
function setupActivation;               external DLL_Name;
function updateSetupData;               external DLL_Name;
function uploadStateAndFailData;        external DLL_Name;
function getStationQuantity;            external DLL_Name;
function getSnrHistoryData;             external DLL_Name;
function getSerialNumberHistoryData;    external DLL_Name;
}
function uploadResultDataAndRecipe;     external DLL_Name;
{
function uploadStationResult;           external DLL_Name;
function createNewMaterialBin;          external DLL_Name;
function createNewMaterialBinExt;       external DLL_Name;
function getStorage;                    external DLL_Name;
function setMaterialBinLocation;        external DLL_Name;
function changeMaterialBinQuantity;     external DLL_Name;
function getMaterialBinInfo;            external DLL_Name;
function changeMaterialBinAttributes;   external DLL_Name;
function setMaterialBinState;           external DLL_Name;
function getNextMaterialBinNumber;      external DLL_Name;
function reportRmQuantity;              external DLL_Name;
function getNumberOfProducts;           external DLL_Name;
function getCurrentMaterialSetup;       external DLL_Name;
function getMaterialSetupData;          external DLL_Name;
function getMaterialBinDataByProductNo; external DLL_Name;
function getCurrentCalendar;            external DLL_Name;
function shipRemoveSnrFromShippingLot;  external DLL_Name;
function shipCheckSnrFromShippingLot;   external DLL_Name;
function shipAddSnrToShippingLot;       external DLL_Name;
function shipDeactivateShippingLotAtKap; external DLL_Name;
function shipActivateShippingLotAtKap;  external DLL_Name;
function shipGetSnrDataForShippingLot;  external DLL_Name;
function shipCompleteLot;               external DLL_Name;
function shipReplaceShippingLot;        external DLL_Name;
function shipGetShippingLotForLotNo;    external DLL_Name;
function shipGetShippingLotsForPartNo;  external DLL_Name;
function shipReopenShippingLot;         external DLL_Name;
function shipCheckSnrAddToShippingLot;  external DLL_Name;
function uploadStationState;            external DLL_Name;
function uploadStationWasteTime;        external DLL_Name;
function uploadStateAndFailureData;     external DLL_Name;
function getBomItems;                   external DLL_Name;
function mdataGetBomData;               external DLL_Name;
}

function assignSerialNumberMergeAndUploadState;     external DLL_Name;


{function getMaterialSetupDataForKapAndPeriod;       external DLL_Name;
function getKapSetupDataForMaterial;    external DLL_Name;
function updateSetupDataHistory;        external DLL_Name;
function assignSerialNumberForProductOrWorkorder;  external DLL_Name;
function shipAddChildLotToParentLot;    external DLL_Name;
function shipRemoveChildLotFromLot;     external DLL_Name;
function shipRemoveAllChildLotFromParentLot;        external DLL_Name;
function shipGetChildLotsForParentLot;  external DLL_Name;
function shipMoveAllChildLotsToNewParentLot;        external DLL_Name;
function shipMoveChildLotToNewParentLot;            external DLL_Name;
function shipMoveChildLotsFromLotToLot;             external DLL_Name;
function getCalendarData;               external DLL_Name;
function registerUser;                  external DLL_Name;
function unregisterUser;                external DLL_Name;
function getRegisteredUser;             external DLL_Name;
function activateWorkorder;             external DLL_Name;
}
function getSnrInfoData;                external DLL_Name;
{
function getRecipeHeaderAndVersion;     external DLL_Name;
function getRecipeData;                 external DLL_Name;
function activateRecipe;                external DLL_Name;
function createRecipe;                  external DLL_Name;
function shipGetLotFromSerialNo;        external DLL_Name;
function appendAttributeToWorkorder;    external DLL_Name;
}
function appendAttributeToSerialNumber; external DLL_Name;
{
function appendAttributesToMaterialBin;     external DLL_Name;
}
function removeAttributeFromSerialNumber;   external DLL_Name;
{
function removeAttributeFromMaterialBin;    external DLL_Name;
function removeAttributeFromWorkorder;      external DLL_Name;
}
function getAttributesForSerialNumber;      external DLL_Name;
{
function getAttributesForMaterialBin;       external DLL_Name;
}
function getAttributesForWorkorder;         external DLL_Name;
function getSerialNumbersForAttribute;      external DLL_Name;
{
function getSerialNumbersForAttribute;      external DLL_Name;
function getWorkordersForAttribute;         external DLL_Name;
function getSetupDataBySerialNumber;        external DLL_Name;
function getWorkplanItems;                  external DLL_Name;
function testPaa;                       external DLL_Name;
function testSpa;                       external DLL_Name;
function getMdaDocuments;               external DLL_Name;
function getAdvice;                     external DLL_Name;
function confirmAdvice;                 external DLL_Name;
function getMaterialBinData;            external DLL_Name;
function getWorkorderForLine;           external DLL_Name;
function uploadMaterialBookings;        external DLL_Name;
function updateSetupDataBySnr;          external DLL_Name;
function updateEquipmentData;           external DLL_Name;
function getSetupEquipmentData;         external DLL_Name;
function getRequiredEquipmentData;      external DLL_Name;
function checkEquipmentData;            external DLL_Name;
function removeEquipmentForWorkorder;   external DLL_Name;
function getFailureCauseForStation;     external DLL_Name;
function getFailureTypForStation;       external DLL_Name;
function getFailureDataForSerialNumber; external DLL_Name;
function getFailureSlipDataForSerialNumber; external DLL_Name;
function getResultDataForSerialNumber;      external DLL_Name;
function uploadMaterialBinBookingsExt;      external DLL_Name;
function getPlacementName;                  external DLL_Name;
function updateMaterialSetup;           external DLL_Name;
function changeFeederBank;              external DLL_Name;
function updateMaterialSetupHistory;    external DLL_Name;
function getNextBookingForStationAndLayer;        external DLL_Name;
function getCompleteMaterialSetup;      external DLL_Name;
function smtConsumption;                external DLL_Name;
function smtEventSetup;                 external DLL_Name;
function smtSetupPreparation;           external DLL_Name;
function smtSerialNumberSetup;          external DLL_Name;
function assignBatchNoToWorkorder;      external DLL_Name;
function registerBatch;                 external DLL_Name;
function unregisterBatch;               external DLL_Name;
function splitBatchNoToSerialNumber;    external DLL_Name;
function mergeBatch;                    external DLL_Name;
function getRegisteredBatch;            external DLL_Name;
function getSnrForWorkorderAndWorkstep; external DLL_Name;
function getMergedUnits;                external DLL_Name;
function checkMergedPartsForSnrComplete;    external DLL_Name;
function createAttribute;               external DLL_Name;
function getBoxContent;                 external DLL_Name;
function mergeMaterialBin;              external DLL_Name;
function changeMatBinForSerialNumberRepair;    external DLL_Name;
function mdcUploadStationCondition;     external DLL_Name;
function mdcGetStationConditions;       external DLL_Name;
function mdcGetStationMessages;         external DLL_Name;
function mdcCreateLog;                  external DLL_Name;
function mdcGetLog;                     external DLL_Name;
function setSetupCycleTime;             external DLL_Name;
function setProductionCycleTime;        external DLL_Name;
function mdcGetConditionCodes;          external DLL_Name;
function getMaterialBinsForAttribute;   external DLL_Name;
function registerUserAtLine;            external DLL_Name;
function mdataBomVerify;                external DLL_Name;
function customFunction;                external DLL_Name;
function trLockSerialNumbers;           external DLL_Name;
function trUnlockSerialNumbers;         external DLL_Name;
function trGetLockedSerialNumbers;      external DLL_Name;
function trGetSerialNumberLockHistory;  external DLL_Name;
}
end.
