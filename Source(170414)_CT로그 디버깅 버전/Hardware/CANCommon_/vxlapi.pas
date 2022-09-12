unit vxlapi;

interface
{----------------------------------------------------------------------------
| File:
|   vxlapi.pas   conversion by jung sung-il  2008.06.09
| Project:
|   Multi Bus driver for Win98/WinNT/Win2000/WinXP
|
| Description:
|   Driver Interface Prototypes - customer version
|
|-----------------------------------------------------------------------------
| $Author: Jörg $    $Locker: $   $Revision: 49 $
| $Header: /VCANDRV/XLAPI/bin/vxlapi.h 49    27.08.08 7:02 Jörg $
|-----------------------------------------------------------------------------
| Copyright (c) 2008 by Vector Informatik GmbH.  All rights reserved.
 ----------------------------------------------------------------------------}

//------------------------------------------------------------------------------
// Transceiver types
//------------------------------------------------------------------------------
// CAN Cab
const
    XL_TRANSCEIVER_TYPE_NONE                 = $0000;
    XL_TRANSCEIVER_TYPE_CAN_251              = $0001;
    XL_TRANSCEIVER_TYPE_CAN_252              = $0002;
    XL_TRANSCEIVER_TYPE_CAN_DNOPTO           = $0003;
    XL_TRANSCEIVER_TYPE_CAN_SWC_PROTO        = $0005;  //!< Prototype. Driver may latch-up.
    XL_TRANSCEIVER_TYPE_CAN_SWC              = $0006;
    XL_TRANSCEIVER_TYPE_CAN_EVA              = $0007;
    XL_TRANSCEIVER_TYPE_CAN_FIBER            = $0008;
    XL_TRANSCEIVER_TYPE_CAN_1054_OPTO        = $000B;  //!< 1054 with optical isolation
    XL_TRANSCEIVER_TYPE_CAN_SWC_OPTO         = $000C;  //!< SWC with optical isolation
    XL_TRANSCEIVER_TYPE_CAN_B10011S          = $000D;  //!< B10011S truck-and-trailer
    XL_TRANSCEIVER_TYPE_CAN_1050             = $000E;  //!< 1050
    XL_TRANSCEIVER_TYPE_CAN_1050_OPTO        = $000F;  //!< 1050 with optical isolation
    XL_TRANSCEIVER_TYPE_CAN_1041             = $0010;  //!< 1041
    XL_TRANSCEIVER_TYPE_CAN_1041_OPTO        = $0011;  //!< 1041 with optical isolation
    XL_TRANSCEIVER_TYPE_LIN_6258_OPTO        = $0017;  //!< Vector LINcab 6258opto with transceiver Infineon TLE6258
    XL_TRANSCEIVER_TYPE_LIN_6259_OPTO        = $0019;  //!< Vector LINcab 6259opto with transceiver Infineon TLE6259
    XL_TRANSCEIVER_TYPE_DAIO_8444_OPTO       = $001D;  //!< Vector IOcab 8444  (8 dig.Inp.; 4 dig.Outp.; 4 ana.Inp.; 4 ana.Outp.)
    XL_TRANSCEIVER_TYPE_CAN_1041A_OPTO       = $0021;  //!< 1041A with optical isolation
    XL_TRANSCEIVER_TYPE_LIN_6259_MAG         = $0023;  //!< LIN transceiver 6259, with transceiver Infineon TLE6259, magnetically isolated, stress functionality
    XL_TRANSCEIVER_TYPE_LIN_7259_MAG         = $0025;  //!< LIN transceiver 7259, with transceiver Infineon TLE7259, magnetically isolated, stress functionality
    XL_TRANSCEIVER_TYPE_CAN_1054_MAG         = $0033;  //!< TJA1054, magnetically isolated, with selectable termination resistor (via 4th IO line)
    XL_TRANSCEIVER_TYPE_CAN_251_MAG          = $0035;  //!< 82C250/251 or equivalent, magnetically isolated
    XL_TRANSCEIVER_TYPE_CAN_1050_MAG         = $0037;  //!< TJA1050, magnetically isolated
    XL_TRANSCEIVER_TYPE_CAN_1040_MAG         = $0039;  //!< TJA1040, magnetically isolated
    XL_TRANSCEIVER_TYPE_CAN_1041A_MAG        = $003B;  //!< TJA1041A, magnetically isolated
    XL_TRANSCEIVER_TYPE_TWIN_CAN_1041A_MAG   = $0080;  //!< TWINcab with two TJA1041A, magnetically isolated

// CAN PiggyBack
    XL_TRANSCEIVER_TYPE_PB_CAN_251           = $0101;
    XL_TRANSCEIVER_TYPE_PB_CAN_1054          = $0103;
    XL_TRANSCEIVER_TYPE_PB_CAN_251_OPTO      = $0105;
    XL_TRANSCEIVER_TYPE_PB_CAN_SWC           = $010B;
// = $010D not supported, = $010F, = $0111, = $0113 reserved for future use!!
    XL_TRANSCEIVER_TYPE_PB_CAN_1054_OPTO     = $0115;
    XL_TRANSCEIVER_TYPE_PB_CAN_SWC_OPTO      = $0117;
    XL_TRANSCEIVER_TYPE_PB_CAN_TT_OPTO       = $0119;
    XL_TRANSCEIVER_TYPE_PB_CAN_1050          = $011B;
    XL_TRANSCEIVER_TYPE_PB_CAN_1050_OPTO     = $011D;
    XL_TRANSCEIVER_TYPE_PB_CAN_1041          = $011F;
    XL_TRANSCEIVER_TYPE_PB_CAN_1041_OPTO     = $0121;
    XL_TRANSCEIVER_TYPE_PB_LIN_6258_OPTO     = $0129; //!< LIN piggy back with transceiver Infineon TLE6258
    XL_TRANSCEIVER_TYPE_PB_LIN_6259_OPTO     = $012B; //!< LIN piggy back with transceiver Infineon TLE6259
    XL_TRANSCEIVER_TYPE_PB_LIN_6259_MAG      = $012D; //!< LIN piggy back with transceiver Infineon TLE6259, magnetically isolated, stress functionality
    XL_TRANSCEIVER_TYPE_PB_CAN_1041A_OPTO    = $012F; //!< CAN transceiver 1041A
    XL_TRANSCEIVER_TYPE_PB_LIN_7259_MAG      = $0131; //!< LIN piggy back with transceiver Infineon TLE7259, magnetically isolated, stress functionality
    XL_TRANSCEIVER_TYPE_PB_CAN_251_MAG       = $0135; //!< 82C250/251 or compatible, magnetically isolated
    XL_TRANSCEIVER_TYPE_PB_CAN_1050_MAG      = $0136; //!< TJA 1050, magnetically isolated
    XL_TRANSCEIVER_TYPE_PB_CAN_1040_MAG      = $0137; //!< TJA 1040, magnetically isolated
    XL_TRANSCEIVER_TYPE_PB_CAN_1041A_MAG     = $0138; //!< TJA 1041A, magnetically isolated
    XL_TRANSCEIVER_TYPE_PB_DAIO_8444_OPTO    = $0139; //!< optically isolated IO piggy
    XL_TRANSCEIVER_TYPE_PB_CAN_1054_MAG      = $013B; //!< TJA1054, magnetically isolated, with selectable termination resistor (via 4th IO line)

// FlexRay PiggyBacks
    XL_TRANSCEIVER_TYPE_PB_FR_1080           = $0201; //!< refer to \\vistrpnifs1\data\Hardware\Projects\cab-piggy-cartridge\!Technical_Info_CANcab_CANpiggy.xls
    XL_TRANSCEIVER_TYPE_PB_FR_1080_MAG       = $0202; //!< TJA 1080 magnetically isolated piggy

//------------------------------------------------------------------------------
// Transceiver Operation Modes
//------------------------------------------------------------------------------
    XL_TRANSCEIVER_LINEMODE_NA               = $0000;
    XL_TRANSCEIVER_LINEMODE_TWO_LINE         = $0001;
    XL_TRANSCEIVER_LINEMODE_CAN_H            = $0002;
    XL_TRANSCEIVER_LINEMODE_CAN_L            = $0003;
    XL_TRANSCEIVER_LINEMODE_SWC_SLEEP        = $0004;  //!< SWC Sleep Mode.
    XL_TRANSCEIVER_LINEMODE_SWC_NORMAL       = $0005;  //!< SWC Normal Mode.
    XL_TRANSCEIVER_LINEMODE_SWC_FAST         = $0006;  //!< SWC High-Speed Mode.
    XL_TRANSCEIVER_LINEMODE_SWC_WAKEUP       = $0007;  //!< SWC Wakeup Mode.
    XL_TRANSCEIVER_LINEMODE_SLEEP            = $0008;
    XL_TRANSCEIVER_LINEMODE_NORMAL           = $0009;
    XL_TRANSCEIVER_LINEMODE_STDBY            = $000a;  //!< Standby for those who support it
    XL_TRANSCEIVER_LINEMODE_TT_CAN_H         = $000b;  //!< truck & trailer: operating mode single wire using CAN high
    XL_TRANSCEIVER_LINEMODE_TT_CAN_L         = $000c;  //!< truck & trailer: operating mode single wire using CAN low
    XL_TRANSCEIVER_LINEMODE_EVA_00           = $000d;  //!< CANcab Eva
    XL_TRANSCEIVER_LINEMODE_EVA_01           = $000e;  //!< CANcab Eva
    XL_TRANSCEIVER_LINEMODE_EVA_10           = $000f;  //!< CANcab Eva
    XL_TRANSCEIVER_LINEMODE_EVA_11           = $0010;  //!< CANcab Eva



//------------------------------------------------------------------------------
// Transceiver Capabilities
//------------------------------------------------------------------------------
    XL_TRANSCEIVER_CAPABILITY_NONE           = 0;
    XL_TRANSCEIVER_CAPABILITY_HIGHSPEED      = 1;

//------------------------------------------------------------------------------
// Transceiver Status Flags
//------------------------------------------------------------------------------
// (not all used, but for compatibility reasons)
  XL_TRANSCEIVER_STATUS_PRESENT            = $0001;
  XL_TRANSCEIVER_STATUS_POWER              = $0002;
  XL_TRANSCEIVER_STATUS_MEMBLANK           = $0004;
  XL_TRANSCEIVER_STATUS_MEMCORRUPT         = $0008;
  XL_TRANSCEIVER_STATUS_POWER_GOOD         = $0010;
  XL_TRANSCEIVER_STATUS_EXT_POWER_GOOD     = $0020;

////////////////////////////////////////////////////////////////////////////////
// For the timestamps and the access mask the API use 64 bit values
type
  XLuint64 = Int64;   //typedef unsigned __int64 XLuint64;

////////////////////////////////////////////////////////////////////////////////
  XLstringType = PChar;

////////////////////////////////////////////////////////////////////////////////
// accessmask
  XLaccess = XLuint64;

////////////////////////////////////////////////////////////////////////////////
// handle for xlSetNotification
  XLhandle = THandle;


////////////////////////////////////////////////////////////////////////////////
// LIN lib
//------------------------------------------------------------------------------
// defines for LIN
//------------------------------------------------------------------------------

const
// defines for xlLinSetChannelParams
  XL_LIN_MASTER                           =  01; //!< channel is a LIN master
  XL_LIN_SLAVE                            =  02; //!< channel is a LIN slave
  XL_LIN_VERSION_1_3                      = $01; //!< LIN version 1.3
  XL_LIN_VERSION_2_0                      = $02; //!< LIN version 2.0

// defines for xlLinSetSlave
  XL_LIN_CALC_CHECKSUM                   = $100; //!< flag for automatic 'classic' checksum calculation
  XL_LIN_CALC_CHECKSUM_ENHANCED          = $200; //!< flag for automatic 'enhanced' checksum calculation

// defines for the SleepMode function call
  XL_LIN_SET_SILENT                       = $01; //!< set hardware into sleep mode
  XL_LIN_SET_WAKEUPID                     = $03; //!< set hardware into sleep mode and send a request at wake-up

// defines for xlLinSetChecksum. For LIN >= 2.0 there can be used two different Checksum models.
  XL_LIN_CHECKSUM_CLASSIC                 = $00; //!< Use classic CRC
  XL_LIN_CHECKSUM_ENHANCED                = $01; //!< Use enhanced CRC
  XL_LIN_CHECKSUM_UNDEFINED               = $ff; //!< Set the checksum calculation to undefined.

// defines for the wake-up events
  XL_LIN_STAYALIVE                        = $00; //!< flag if nothing changes
  XL_LIN_SET_SLEEPMODE                    = $01; //!< flag if the hardware is set into the sleep mode
  XL_LIN_COMESFROM_SLEEPMODE              = $02; //!< flag if the hardware comes from the sleep mode

  XL_LIN_WAKUP_INTERNAL                   = $01; //!< flag to signal a internal WAKEUP (event)
  XL_LIN_UNDEFINED_DLC                    = $ff; //!< set the DLC to undefined (xlLINSetDLC)

// defines for xlLinSwitchSlave
  XL_LIN_SLAVE_ON                         = $ff; //!< switch on the LIN slave
  XL_LIN_SLAVE_OFF                        = $00; //!< switch off the LIN slave

//------------------------------------------------------------------------------
// structures for LIN
//------------------------------------------------------------------------------
type
  XLlinStatPar = packed record
     LINMode    : Longword;                        //!< XL_LIN_SLAVE | XL_LIN_MASTER
     baudrate   : Integer;                         //!< the baudrate will be calculated within the API. Here: e.g. 9600, 19200
     LINVersion : Longword;                        //!< define for the LIN version (actual V1.3 of V2.0)
     reserved   : Longword;                        //!< for future use
  end;

////////////////////////////////////////////////////////////////////////////////
// Defines
//------------------------------------------------------------------------------
// message flags
const MAX_MSG_LEN = 8;

// interface version for our events
  XL_INTERFACE_VERSION_V2    = 2;
  XL_INTERFACE_VERSION_V3    = 3;
  XL_INTERFACE_VERSION_V4    = 4;
//current version
  XL_INTERFACE_VERSION       = XL_INTERFACE_VERSION_V3;

  XL_CAN_EXT_MSG_ID          = $80000000;

  XL_CAN_MSG_FLAG_ERROR_FRAME   = $01;
  XL_CAN_MSG_FLAG_OVERRUN       = $02;           //!< Overrun in Driver or CAN Controller
                                                   //!< special case: OVERRUN combined with TIMER
                                                   //!< means the 32 bit timer has overrun
  XL_CAN_MSG_FLAG_NERR          = $04;           //!< Line Error on Lowspeed
  XL_CAN_MSG_FLAG_WAKEUP        = $08;           //!< High Voltage Message on Single Wire CAN
  XL_CAN_MSG_FLAG_REMOTE_FRAME  = $10;
  XL_CAN_MSG_FLAG_RESERVED_1    = $20;
  XL_CAN_MSG_FLAG_TX_COMPLETED  = $40;           //!< Message Transmitted
  XL_CAN_MSG_FLAG_TX_REQUEST    = $80;           //!< Transmit Message stored into Controller

// LIN flags
  XL_LIN_MSGFLAG_TX             = XL_CAN_MSG_FLAG_TX_COMPLETED;  //!< LIN TX flag
  XL_LIN_MSGFLAG_CRCERROR       = $81;                           //!< Wrong LIN CRC

//------------------------------------------------------------------------------
// structure for XL_RECEIVE_MSG, XL_TRANSMIT_MSG

type
  s_xl_can_msg = packed record  // 32 Bytes
     id    : Longword;                         // 4
     flags : word;                             // 2
     dlc   : word;                             // 2
     res1  : XLuint64;                         // 8
     data  : array [0..MAX_MSG_LEN-1] of byte; // 8
     res2  : XLuint64;                         // 8
  end;

//------------------------------------------------------------------------------
// structure for XL_TRANSMIT_DAIO_DATA
const
// flags masks
  XL_DAIO_DATA_GET                     = $8000;
  XL_DAIO_DATA_VALUE_DIGITAL           = $0001;
  XL_DAIO_DATA_VALUE_ANALOG            = $0002;
  XL_DAIO_DATA_PWM                     = $0010;

// optional function flags
  XL_DAIO_MODE_PULSE                   = $0020;  // generates pulse in values of PWM

type
  s_xl_daio_data = packed record   { 32 Bytes }
    flags                : word;                // 2
    timestamp_correction : Longword;            // 4
    mask_digital         : byte;                // 1
    value_digital        : byte;                // 1
    mask_analog          : byte;                // 1
    reserved0            : byte;                // 1
    value_analog         : array[0..3] of word; // 8
    pwm_frequency        : Longword;            // 4
    pwm_value            : word;                // 2
    reserved1            : Longword;            // 4
    reserved2            : Longword;            // 4
  end;

//------------------------------------------------------------------------------
// structure for XL_CHIP_STATE 
const
    XL_CHIPSTAT_BUSOFF              = $01;
    XL_CHIPSTAT_ERROR_PASSIVE       = $02;
    XL_CHIPSTAT_ERROR_WARNING       = $04;
    XL_CHIPSTAT_ERROR_ACTIVE        = $08;

    XL_CAN_STATE_FLAG_SJA_MODE      = $00000001;

type
  s_xl_chip_state = packed record
    busStatus       : byte;
    txErrorCounter  : byte;
    rxErrorCounter  : byte;
    chipState       : byte;  // raw Status Register Value
    flags           : word;
  end;

//------------------------------------------------------------------------------
// structure for XL_SYNC_PULSE
const 
  XL_SYNC_PULSE_EXTERNAL      = $00;
  XL_SYNC_PULSE_OUR           = $01;
  XL_SYNC_PULSE_OUR_SHARED    = $02;

type
  s_xl_sync_pulse = packed record
    pulseCode : byte;                 //!< generated by us
    time      : XLuint64;             //!< 1ns resolution
  end;

//------------------------------------------------------------------------------
// structure and defines for XL_TRANSCEIVER 
const
  XL_TRANSCEIVER_EVENT_NONE                = 0;
  XL_TRANSCEIVER_EVENT_INSERTED            = 1;  //!< cable was inserted
  XL_TRANSCEIVER_EVENT_REMOVED             = 2;  //!< cable was removed
  XL_TRANSCEIVER_EVENT_STATE_CHANGE        = 3;  //!< transceiver state changed

type
  s_xl_transceiver = packed record
    event_reason : byte;                //!< reason for what was event sent
    is_present   : byte;                //!< allways valid transceiver presence flag
  end;

//------------------------------------------------------------------------------
// defines for SET_OUTPUT_MODE
const
  XL_OUTPUT_MODE_SILENT                    = 0;  //!< switch CAN trx into default silent mode
  XL_OUTPUT_MODE_NORMAL                    = 1;  //!< switch CAN trx into normal mode
  XL_OUTPUT_MODE_TX_OFF                    = 2;  //!< switch CAN trx into silent mode with tx pin off
  XL_OUTPUT_MODE_SJA_1000_SILENT           = 3;  //!< switch CAN trx into SJA1000 silent mode

//------------------------------------------------------------------------------
// Transceiver modes
  XL_TRANSCEIVER_EVENT_ERROR               = 1;
  XL_TRANSCEIVER_EVENT_CHANGED             = 2;

  XL_TRANSCEIVER_RESNET_NA                 = 0;
  XL_TRANSCEIVER_RESNET_MASTER             = 1;
  XL_TRANSCEIVER_RESNET_MASTER_STBY        = 2;
  XL_TRANSCEIVER_RESNET_SLAVE              = 3;

//------------------------------------------------------------------------------
// definitions for the events and commands used by the driver
   XL_NO_COMMAND               = 0;
   XL_RECEIVE_MSG              = 1;
   XL_CHIP_STATE               = 4;
   XL_TRANSCEIVER              = 6;
   XL_TIMER                    = 8;
   XL_TRANSMIT_MSG             =10;
   XL_SYNC_PULSE               =11;
   XL_APPLICATION_NOTIFICATION =15;

   //for LIN we have special events
   XL_LIN_MSG                  =20;
   XL_LIN_ERRMSG               =21;
   XL_LIN_SYNCERR              =22;
   XL_LIN_NOANS                =23;
   XL_LIN_WAKEUP               =24;
   XL_LIN_SLEEP                =25;
   XL_LIN_CRCINFO              =26;

   // for D/A IO bus
   XL_RECEIVE_DAIO_DATA        =32;                 //!< D/A IO data message

{
enum e_XLevent_type {
       XL_NO_COMMAND               = 0,
       XL_RECEIVE_MSG              = 1,
       XL_CHIP_STATE               = 4,
       XL_TRANSCEIVER              = 6,
       XL_TIMER                    = 8,
       XL_TRANSMIT_MSG             =10,
       XL_SYNC_PULSE               =11,
       XL_APPLICATION_NOTIFICATION =15,

       //for LIN we have special events
       XL_LIN_MSG                  =20,
       XL_LIN_ERRMSG               =21,
       XL_LIN_SYNCERR              =22,
       XL_LIN_NOANS                =23,
       XL_LIN_WAKEUP               =24,
       XL_LIN_SLEEP                =25,
       XL_LIN_CRCINFO              =26,

       // for D/A IO bus 
       XL_RECEIVE_DAIO_DATA        =32,                 //!< D/A IO data message

     }

////////////////////////////////////////////////////////////////////////////////
// LIN lib
//------------------------------------------------------------------------------
// LIN event structures 
type
  s_xl_lin_msg = packed record
    id    : byte;
    dlc   : byte;
    flags : word;
    data  : array [0..7] of byte;
    crc   : byte
  end;
  
  s_xl_lin_sleep = packed record
    flag : byte;
  end;

  s_xl_lin_no_ans = packed record
    id : byte;
  end;

  s_xl_lin_wake_up = packed record
    flag : byte;
  end;

  s_xl_lin_crc_info = packed record
    id    : byte;
    flags : byte;
  end;

//------------------------------------------------------------------------------
// LIN messages structure
  s_xl_lin_msg_api = packed record
    case Byte of
      0: (linMsg     : s_xl_lin_msg);
      1: (linNoAns   : s_xl_lin_no_ans);
      2: (linWakeUp  : s_xl_lin_wake_up);
      3: (linSleep   : s_xl_lin_sleep);
      4: (linCRCinfo : s_xl_lin_crc_info);
  end;

//------------------------------------------------------------------------------
// BASIC bus message structure
  s_xl_tag_data = packed record
      case Byte of
        0: (msg         : s_xl_can_msg);
        1: (chipState   : s_xl_chip_state);
        2: (linMsgApi   : s_xl_lin_msg_api);   // ÂÍÀÌ»óÇÑµ¥...?
        3: (syncPulse   : s_xl_sync_pulse);
        4: (daioData    : s_xl_daio_data);
        5: (transceiver : s_xl_transceiver);
  end;
  XLeventTag = byte;



//------------------------------------------------------------------------------
// XL_EVENT structures
// event type definition 

  s_xl_event = packed record
    tag        : XLeventTag;    // 1
    chanIndex  : byte;          // 1
    transId    : word;          // 2
    portHandle : word;          // 2 internal use only !!!!
    reserved   : word;          // 2
    timeStamp  : XLuint64;      // 8
    tagData    : s_xl_tag_data; // 32 Bytes
  end;
                                // --------
                                // 48 Bytes
  XLevent = s_xl_event;

// message name to aquire a unique message id from windows
const
  DriverNotifyMessageName = 'VectorCanDriverChangeNotifyMessage';

// defines for the supported hardware
  XL_HWTYPE_NONE                         =  0;
  XL_HWTYPE_VIRTUAL                      =  1;
  XL_HWTYPE_CANCARDX                     =  2;
  XL_HWTYPE_CANCARDY                     = 12;
  XL_HWTYPE_CANCARDXL                    = 15;
  XL_HWTYPE_CANCASEXL                    = 21;
  XL_HWTYPE_CANCASEXL_LOG_OBSOLETE       = 23;
  XL_HWTYPE_CANBOARDXL                   = 25;
  XL_HWTYPE_CANBOARDXL_PXI               = 27;
  XL_HWTYPE_VN2600                       = 29;
  XL_HWTYPE_VN2610                       = XL_HWTYPE_VN2600;
  XL_HWTYPE_VN3300                       = 37;
  XL_HWTYPE_VN3600                       = 39;
  XL_HWTYPE_VN7600                       = 41;
  XL_HWTYPE_CANCARDXLE                   = 43;
  XL_MAX_HWTYPE                          = 43;

//------------------------------------------------------------------------------
// build a channels mask from the channels index
//function XL_CHANNEL_MASK(x : Integer) : Int64 begin Result := (1 shl (x)) end;
//  XL_CHANNEL_MASK(x) (1I64<<(x))

  XL_MAX_APPNAME = 32;


//------------------------------------------------------------------------------
// driver status

type
  XLstatus = smallint;

const
  XL_SUCCESS                    = 0;
  XL_PENDING                    = 1;

  XL_ERR_QUEUE_IS_EMPTY         = 10;
  XL_ERR_QUEUE_IS_FULL          = 11;
  XL_ERR_TX_NOT_POSSIBLE        = 12;
  XL_ERR_NO_LICENSE             = 14;
  XL_ERR_WRONG_PARAMETER        = 101;
  XL_ERR_TWICE_REGISTER         = 110;
  XL_ERR_INVALID_CHAN_INDEX     = 111;
  XL_ERR_INVALID_ACCESS         = 112;
  XL_ERR_PORT_IS_OFFLINE        = 113;
  XL_ERR_CHAN_IS_ONLINE         = 116;
  XL_ERR_NOT_IMPLEMENTED        = 117;
  XL_ERR_INVALID_PORT           = 118;
  XL_ERR_HW_NOT_READY           = 120;
  XL_ERR_CMD_TIMEOUT            = 121;
  XL_ERR_HW_NOT_PRESENT         = 129;
  XL_ERR_NOTIFY_ALREADY_ACTIVE  = 131;
  XL_ERR_NO_RESOURCES           = 152;
  XL_ERR_WRONG_CHIP_TYPE        = 153;
  XL_ERR_WRONG_COMMAND          = 154;
  XL_ERR_INVALID_HANDLE         = 155;
  XL_ERR_CANNOT_OPEN_DRIVER     = 201;
  XL_ERR_WRONG_BUS_TYPE         = 202;
  XL_ERROR                      = 255;

//defines for xlGetDriverConfig structures
  XL_MAX_LENGTH                 = 31;
  XL_CONFIG_MAX_CHANNELS        = 64;

//activate - channel flags
  XL_ACTIVATE_NONE              = 0;
  XL_ACTIVATE_RESET_CLOCK       = 8;

//activate - bus types
  XL_BUS_TYPE_NONE           = $00000000;
  XL_BUS_TYPE_CAN            = $00000001;
  XL_BUS_TYPE_LIN            = $00000002;
  XL_BUS_TYPE_FLEXRAY        = $00000004;
  XL_BUS_TYPE_MOST           = $00000010;
  XL_BUS_TYPE_DAIO           = $00000040; // IO cab
  XL_BUS_TYPE_HWSYNC         = $00000080;
  XL_BUS_TYPE_J1708          = $00000100;

// device capabilities
  XL_CHCAP_LOG_CAPABLE       = $00002000;

  XL_BUS_COMPATIBLE_CAN              = XL_BUS_TYPE_CAN;
  XL_BUS_COMPATIBLE_LIN              = XL_BUS_TYPE_LIN;
  XL_BUS_COMPATIBLE_FLEXRAY          = XL_BUS_TYPE_FLEXRAY;
  XL_BUS_COMPATIBLE_MOST             = XL_BUS_TYPE_MOST;
  XL_BUS_COMPATIBLE_DAIO             = XL_BUS_TYPE_DAIO;      //io cab
  XL_BUS_COMPATIBLE_HWSYNC           = XL_BUS_TYPE_HWSYNC;    //external sync line
  XL_BUS_COMPATIBLE_J1708            = XL_BUS_TYPE_J1708;

// the following bus types can be used with the current cab / piggy
  XL_BUS_ACTIVE_CAP_CAN              = XL_BUS_COMPATIBLE_CAN shl 16;
  XL_BUS_ACTIVE_CAP_LIN              = XL_BUS_COMPATIBLE_LIN shl 16;
  XL_BUS_ACTIVE_CAP_FLEXRAY          = XL_BUS_COMPATIBLE_FLEXRAY  shl 16;
  XL_BUS_ACTIVE_CAP_MOST             = XL_BUS_COMPATIBLE_MOST  shl 16;
  XL_BUS_ACTIVE_CAP_DAIO             = XL_BUS_COMPATIBLE_DAIO shl 16;
  XL_BUS_ACTIVE_CAP_HWSYNC           = XL_BUS_COMPATIBLE_HWSYNC shl 16;
  XL_BUS_ACTIVE_CAP_J1708            = XL_BUS_COMPATIBLE_J1708 shl 16;


//------------------------------------------------------------------------------
// acceptance filter                                                                      

  XL_CAN_STD = 01;                                  //!< flag for standard ID's
  XL_CAN_EXT = 02;                                  //!< flag for extended ID's

//------------------------------------------------------------------------------
// bit timing
type
  XLchipParams = packed record
    bitRate : Longword;
    sjw   : byte;
    tseg1 : byte;
    tseg2 : byte;
    sam   : byte;  // 1 or 3
  end;

  XLbusParams = packed record
    busType : LongWord;
    case Byte of
        0: ( can : record
                bitRate : LongWord;
                sjw   : byte;
                tseg1 : byte;
                tseg2 : byte;
                sam   : byte;  // 1 or 3
                outputMode : byte;
            end; );
        1 : (raw : array[0..31] of byte );
  end;

// porthandle
const
  XL_INVALID_PORTHANDLE = -1;

type
  XLportHandle  = Integer;
  pXLportHandle = ^XLportHandle;

// structures for xlGetDriverConfig
  s_xl_channel_config = packed record
    name                   : array[0..XL_MAX_LENGTH] of char;
    hwType                 : byte;          //!< HWTYPE_xxxx (see above)
    hwIndex                : byte;          //!< Index of the hardware (same type) (0,1,...)
    hwChannel              : byte;          //!< Index of the channel (same hardware) (0,1,...)
    transceiverType        : word;          //!< TRANSCEIVER_TYPE_xxxx (see above)
    transceiverState       : Longword;      //!< transceiver state
    channelIndex           : byte;          //!< Global channel index (0,1,...)
    channelMask            : XLuint64;      //!< Global channel mask (=1<<channelIndex)
    channelCapabilities    : Longword;
    channelBusCapabilities : Longword;      //!< what buses are supported and which are possible to be activated

    // Channel
    isOnBus                : byte;          //!< The channel is on bus
    connectedBusType       : Longword;      //!< currently selected bus
    busParams              : XLbusParams;

    driverVersion          : Longword;
    interfaceVersion       : Longword;      //!< version of interface with driver
    raw_data               : array [0..9] of Longword;

    serialNumber           : Longword;
    articleNumber          : Longword;

    transceiverName        : array [0..XL_MAX_LENGTH] of char;  //!< name for CANcab or another transceiver

    specialCabFlags        : Longword;      //!< XL_SPECIAL_CAB_LIN_RECESSIVE_STRESS, XL_SPECIAL_CAB_LIN_DOMINANT_TIMEOUT flags
    dominantTimeout        : Longword;      //!< Dominant Timeout in us.
    dominantRecessiveDelay : byte;          //!< Delay in us.
    recessiveDominantDelay : byte;          //!< Delay in us.
    connectionInfo         : byte;          //!< XL_CONNECTION_INFO_XXX
    reserved01             : byte;
    minimalSupplyVoltage   : word;          //!< Minimal Supply Voltage of the Cab/Piggy in 1/100 V
    maximalSupplyVoltage   : word;          //!< Maximal Supply Voltage of the Cab/Piggy in 1/100 V
    reserved               : array[0..5] of Longword;
  end;
  XL_CHANNEL_CONFIG = s_xl_channel_config;

  XLchannelConfig  = XL_CHANNEL_CONFIG;
  pXLchannelConfig = ^XL_CHANNEL_CONFIG;

  s_xl_driver_config = packed record
    dllVersion   : Longword;
    channelCount : Longword;  // total number of channels
    reserved : array [0..9] of Longword;
    channel  : array [0..XL_CONFIG_MAX_CHANNELS-1] of XLchannelConfig;    // [channelCount]
  end;
  XL_DRIVER_CONFIG = s_xl_driver_config;
  XLdriverConfig   = XL_DRIVER_CONFIG;
  pXLdriverConfig  = ^XL_DRIVER_CONFIG;
{
typedef XL_DRIVER_CONFIG  XLdriverConfig;
typedef XL_DRIVER_CONFIG  *pXLdriverConfig;
}
///////////////////////////////////////////////////////
// DAIO params definition
const
// analog and digital port configuration
  XL_DAIO_DIGITAL_ENABLED                = $00000001;  // digital port is enabled
  XL_DAIO_DIGITAL_INPUT                  = $00000002;  // digital port is input, otherwise it is an output
  XL_DAIO_DIGITAL_TRIGGER                = $00000004;  // digital port is trigger

  XL_DAIO_ANALOG_ENABLED                 = $00000001;  // analog port is enabled
  XL_DAIO_ANALOG_INPUT                   = $00000002;  // analog port is input, otherwise it is an output
  XL_DAIO_ANALOG_TRIGGER                 = $00000004;  // analog port is trigger
  XL_DAIO_ANALOG_RANGE_32V               = $00000008;  // analog port is in range 0..32,768V, otherwise 0..8,192V

// XL_DAIO trigger mode
  XL_DAIO_TRIGGER_MODE_NONE              = $00000000;  // no trigger configured
  XL_DAIO_TRIGGER_MODE_DIGITAL           = $00000001;  // trigger on preconfigured digital lines
  XL_DAIO_TRIGGER_MODE_ANALOG_ASCENDING  = $00000002;  // trigger on input 3 ascending
  XL_DAIO_TRIGGER_MODE_ANALOG_DESCENDING = $00000004;  // trigger on input 3 ascending
  XL_DAIO_TRIGGER_MODE_ANALOG            = (XL_DAIO_TRIGGER_MODE_ANALOG_ASCENDING + XL_DAIO_TRIGGER_MODE_ANALOG_DESCENDING);  // trigger on input 3

// XL_DAIO trigger level
  XL_DAIO_TRIGGER_LEVEL_NONE                     = 0;  // no trigger level is defined

// periodic measurement setting
  XL_DAIO_POLLING_NONE                           = 0;  // periodic measurement is disabled

// capture mode settings
  XL_DAIO_CAPTURE_NONE                   = $00000000;  // no capture is defined
  XL_DAIO_CAPTURE_PWM                    = $00000001;  // capture is on PWM signal
  XL_DAIO_CAPTURE_DIGITAL_INPUT_4        = $00000002;  // capture is on digital input 4
  XL_DAIO_CAPTURE_FREQ_10000KHZ          = $00000100;  // setting for capture counter: using 10 MHz
  XL_DAIO_CAPTURE_FREQ_5000KHZ           = $00000200;  //                              using 5 Mhz
  XL_DAIO_CAPTURE_FREQ_2500KHZ           = $00000400;  //                              using 2,5 Mhz
  XL_DAIO_CAPTURE_FREQ_1250KHZ           = $00000800;  //                              using 1,25 MHz

// structure for the acceptance filter
type
  _XLacc_filt = packed record
    isSet : byte;
    code : Longword	;
    mask : Longword	; // relevant = 1
  end;
  XLaccFilt = _XLacc_filt;

// structure for the acceptance filter of one CAN chip
  _XLacceptance = packed record
    std : XLaccFilt;
    xtd : XLaccFilt;
  end;
  XLacceptance = _XLacceptance;

// defines for xlSetGlobalTimeSync
const
  XL_SET_TIMESYNC_NO_CHANGE    = 0;
  XL_SET_TIMESYNC_ON           = 1;
  XL_SET_TIMESYNC_OFF          = 2;


//#include <poppack.h>
{
////////////////////////////////////////////////////////////////////////////////
// MOST lib
//------------------------------------------------------------------------------
// special MOST defines

  XLuserHandle               word

// size of allocation table 
  MOST_ALLOC_TABLE_SIZE                    64   // size of channel alloctaion table + 4Bytes (MPR, MDR; ?, ?)

// max. size of rx fifo for rx event in bytes 
  RX_FIFO_MOST_QUEUE_SIZE_MAX                  131072 

// defines for the event tags
  XL_MOST_START                                $0101
  XL_MOST_STOP                                 $0102
  XL_MOST_EVENTSOURCES                         $0103
  XL_MOST_ALLBYPASS                            $0107
  XL_MOST_TIMINGMODE                           $0108
  XL_MOST_FREQUENCY                            $0109
  XL_MOST_REGISTER_BYTES                       $010a
  XL_MOST_REGISTER_BITS                        $010b
  XL_MOST_SPECIAL_REGISTER                     $010c
  XL_MOST_CTRL_RX_SPY                          $010d
  XL_MOST_CTRL_RX_OS8104                       $010e
  XL_MOST_CTRL_TX                              $010f
  XL_MOST_ASYNC_MSG                            $0110
  XL_MOST_ASYNC_TX                             $0111
  XL_MOST_SYNC_ALLOCTABLE                      $0112
  XL_MOST_SYNC_VOLUME_STATUS                   $0116
  XL_MOST_RXLIGHT                              $0117
  XL_MOST_TXLIGHT                              $0118
  XL_MOST_LOCKSTATUS                           $0119
  XL_MOST_ERROR                                $011a
  XL_MOST_CTRL_RXBUFFER                        $011c
  XL_MOST_CTRL_SYNC_AUDIO                      $011f
  XL_MOST_SYNC_MUTE_STATUS                     $0120
  XL_MOST_GENLIGHTERROR                        $0121
  XL_MOST_GENLOCKERROR                         $0122
  XL_MOST_TXLIGHT_POWER                        $0123
  XL_MOST_CTRL_BUSLOAD                         $0126
  XL_MOST_ASYNC_BUSLOAD                        $0127
  XL_MOST_CTRL_SYNC_AUDIO_EX                   $012a
  XL_MOST_TIMINGMODE_SPDIF                     $012b
  XL_MOST_STREAM_STATE                         $012c
  XL_MOST_STREAM_BUFFER                        $012d

// defines for xlMostSwitchEventSources
  XL_MOST_SOURCE_ASYNC_SPY                     $8000
  XL_MOST_SOURCE_ASYNC_RX                      $1000
  XL_MOST_SOURCE_ASYNC_TX                      $0800
  XL_MOST_SOURCE_CTRL_OS8104A                  $0400
  XL_MOST_SOURCE_CTRL_SPY                      $0100
  XL_MOST_SOURCE_SYNCLINE                      $0010
  XL_MOST_SOURCE_ASYNC_RX_FIFO_OVER            $0008

// data for XL_MOST_ERROR:
  XL_MOST_OS8104_TX_LOCK_ERROR             $00000001
  XL_MOST_OS8104_SPDIF_LOCK_ERROR          $00000002
  XL_MOST_OS8104_ASYNC_BUFFER_FULL         $00000003
  XL_MOST_OS8104_ASYNC_CRC_ERROR           $00000004
  XL_MOST_ASYNC_TX_UNDERRUN                $00000005
  XL_MOST_CTRL_TX_UNDERRUN                 $00000006
  XL_MOST_MCU_TS_CMD_QUEUE_UNDERRUN        $00000007
  XL_MOST_MCU_TS_CMD_QUEUE_OVERRUN         $00000008
  XL_MOST_CMD_TX_UNDERRUN                  $00000009
  XL_MOST_SYNCPULSE_ERROR                  $0000000A
  XL_MOST_OS8104_CODING_ERROR              $0000000B
  XL_MOST_ERROR_UNKNOWN_COMMAND            $0000000C
  XL_MOST_ASYNC_RX_OVERFLOW_ERROR          $0000000D
  XL_MOST_FPGA_TS_FIFO_OVERFLOW            $0000000E
  XL_MOST_SPY_OVERFLOW_ERROR               $0000000F
  XL_MOST_CTRL_TYPE_QUEUE_OVERFLOW         $00000010
  XL_MOST_ASYNC_TYPE_QUEUE_OVERFLOW        $00000011
  XL_MOST_CTRL_UNKNOWN_TYPE                $00000012
  XL_MOST_CTRL_QUEUE_UNDERRUN              $00000013
  XL_MOST_ASYNC_UNKNOWN_TYPE               $00000014
  XL_MOST_ASYNC_QUEUE_UNDERRUN             $00000015
 
// data for demanded timstamps
  XL_MOST_DEMANDED_START                   $00000001

  XL_MOST_RX_DATA_SIZE                           1028
  XL_MOST_TS_DATA_SIZE                             12
  XL_MOST_RX_ELEMENT_HEADER_SIZE                   32
  XL_MOST_CTRL_RX_SPY_SIZE                         36
  XL_MOST_CTRL_RX_OS8104_SIZE                      28
  XL_MOST_SPECIAL_REGISTER_CHANGE_SIZE             20
  XL_MOST_ERROR_EV_SIZE_4                           4  // dwords
  XL_MOST_ERROR_EV_SIZE                            16  // bytes


// defines for the audio devices
  XL_MOST_DEVICE_CASE_LINE_IN                       0
  XL_MOST_DEVICE_CASE_LINE_OUT                      1
  XL_MOST_DEVICE_SPDIF_IN                           7
  XL_MOST_DEVICE_SPDIF_OUT                          8
  XL_MOST_DEVICE_SPDIF_IN_OUT_SYNC                 11

// defines for xlMostCtrlSyncAudioEx, mode
  XL_MOST_SPDIF_LOCK_OFF                            0
  XL_MOST_SPDIF_LOCK_ON                             1

// defines for the XL_MOST_SYNC_MUTES_STATUS event
  XL_MOST_NO_MUTE                                   0
  XL_MOST_MUTE                                      1

// defines for the event sources in XLmostEvent
  XL_MOST_VN2600                                 $01
  XL_MOST_OS8104A                                $02
  XL_MOST_OS8104B                                $04
  XL_MOST_SPY                                    $08

// defines for xlMostSetAllBypass and XL_MOST_ALLBYPASS
  XL_MOST_MODE_DEACTIVATE                           0
  XL_MOST_MODE_ACTIVATE                             1
  XL_MOST_MODE_FORCE_DEACTIVATE                     2

  XL_MOST_RX_BUFFER_CLEAR_ONCE                      2

// defines for xlMostSetTimingMode and the XL_MOST_TIMINGMODE(_SPDIF)_EV event.
  XL_MOST_TIMING_SLAVE                              0
  XL_MOST_TIMING_MASTER                             1
  XL_MOST_TIMING_SLAVE_SPDIF_MASTER                 2
  XL_MOST_TIMING_SLAVE_SPDIF_SLAVE                  3
  XL_MOST_TIMING_MASTER_SPDIF_MASTER                4
  XL_MOST_TIMING_MASTER_SPDIF_SLAVE                 5
  XL_MOST_TIMING_MASTER_FROM_SPDIF_SLAVE            6


// defines for xlMostSetFrequency and the XL_MOST_FREQUENCY_EV event.
  XL_MOST_FREQUENCY_44100                           0
  XL_MOST_FREQUENCY_48000                           1
  XL_MOST_FREQUENCY_ERROR                           2

// defines for xlMostSetTxLight 
  XL_MOST_LIGHT_OFF                                 0
  XL_MOST_LIGHT_FORCE_ON                            1   // unmodulated on
  XL_MOST_LIGHT_MODULATED                           2   // modulated light

//defines for xlMostSetTxLightPower and the XL_MOST_TXLIGHT_POWER_EV event.
  XL_MOST_LIGHT_FULL                                3
  XL_MOST_LIGHT_3DB                                 4

// defines for the XL_MOST_LOCKSTATUS event 
  XL_MOST_UNLOCK                                    5
  XL_MOST_LOCK                                      6
  XL_MOST_STATE_UNKNOWN                             9

// defines for the XL_MOST_CTRL_RX_OS8104 event (tx event)
  XL_MOST_TX_WHILE_UNLOCKED                $80000000  
  XL_MOST_TX_TIMEOUT                       $40000000  
  XL_MOST_DIRECTION_RX                              0
  XL_MOST_DIRECTION_TX                              1

  XL_MOST_NO_QUEUE_OVERFLOW                    $0000
  XL_MOST_QUEUE_OVERFLOW                       $8000
  XL_MOST_COMMAND_FAILED                       $4000
  XL_MOST_INTERNAL_OVERFLOW                    $2000
  XL_MOST_MEASUREMENT_NOT_ACTIVE               $1000
  XL_MOST_QUEUE_OVERFLOW_ASYNC                 $0800
  XL_MOST_QUEUE_OVERFLOW_CTRL                  $0400
  XL_MOST_NOT_SUPPORTED                        $0200

  XL_MOST_NA_CHANGED                           $0001 // node address changed 
  XL_MOST_GA_CHANGED                           $0002 // group address changed 
  XL_MOST_APA_CHANGED                          $0004 // alternative packet address changed 
  XL_MOST_NPR_CHANGED                          $0008 // node position register changed 
  XL_MOST_MPR_CHANGED                          $0010 // max position register changed
  XL_MOST_NDR_CHANGED                          $0020 // node delay register changed 
  XL_MOST_MDR_CHANGED                          $0040 // max delay register changed 
  XL_MOST_SBC_CHANGED                          $0080 // 
  XL_MOST_XTIM_CHANGED                         $0100 // 
  XL_MOST_XRTY_CHANGED                         $0200 // 

// defines for the MOST register (xlMostWriteRegister)
  XL_MOST_bGA                                    $89  // Group Address
  XL_MOST_bNAH                                   $8A  // Node Address High
  XL_MOST_bNAL                                   $8B  // Node Address Low
  XL_MOST_bSDC2                                  $8C  // Source Data Control 2
  XL_MOST_bSDC3                                  $8D  // Source Data Control 3
  XL_MOST_bCM2                                   $8E  // Clock Manager 2
  XL_MOST_bNDR                                   $8F  // Node Delay
  XL_MOST_bMPR                                   $90  // Maximum Position
  XL_MOST_bMDR                                   $91  // Maximum Delay
  XL_MOST_bCM4                                   $93  // Clock Manager 4
  XL_MOST_bSBC                                   $96  // Synchronous Bandwidth Control
  XL_MOST_bXSR2                                  $97  // Transceiver Status 2

  XL_MOST_bRTYP                                  $A0  // Receive Message Type
  XL_MOST_bRSAH                                  $A1  // Source Address High
  XL_MOST_bRSAL                                  $A2  // Source Address Low
  XL_MOST_bRCD0                                  $A3  // Receive Control Data 0 --> bRCD16 = bRCD0+16

  XL_MOST_bXTIM                                  $BE  // Transmit Retry Time
  XL_MOST_bXRTY                                  $BF  // Transmit Retries

  XL_MOST_bXPRI                                  $C0  // Transmit Priority
  XL_MOST_bXTYP                                  $C1  // Transmit Message Type
  XL_MOST_bXTAH                                  $C2  // Target Address High
  XL_MOST_bXTAL                                  $C3  // Target Address Low
  XL_MOST_bXCD0                                  $C4  // Transmit Control Data 0 --> bXCD16 = bXCD0+16

  XL_MOST_bXTS                                   $D5  // Transmit Transfer Status

  XL_MOST_bPCTC                                  $E2  // Packet Control
  XL_MOST_bPCTS                                  $E3  // Packet Status

// defines 
  XL_MOST_SPY_RX_STATUS_NO_LIGHT                 $01
  XL_MOST_SPY_RX_STATUS_NO_LOCK                  $02
  XL_MOST_SPY_RX_STATUS_BIPHASE_ERROR            $04
  XL_MOST_SPY_RX_STATUS_MESSAGE_LENGTH_ERROR     $08
  XL_MOST_SPY_RX_STATUS_PARITY_ERROR             $10
  XL_MOST_SPY_RX_STATUS_FRAME_LENGTH_ERROR       $20
  XL_MOST_SPY_RX_STATUS_PREAMBLE_TYPE_ERROR      $40
  XL_MOST_SPY_RX_STATUS_CRC_ERROR                $80

// defines for status of async frames
  XL_MOST_ASYNC_NO_ERROR                         $00
  XL_MOST_ASYNC_SBC_ERROR                        $0C
  XL_MOST_ASYNC_NEXT_STARTS_TO_EARLY             $0D
  XL_MOST_ASYNC_TO_LONG                          $0E

  XL_MOST_ASYNC_UNLOCK                           $0F // unlock occured within receiption of packet

// defines for XL_MOST_SYNC_PULSE_EV member trigger_source 
  SYNC_PULSE_EXTERNAL                            $00 
  SYNC_PULSE_OUR                                 $01 

// ctrlType value within the XL_CTRL_SPY event 
  XL_MOST_CTRL_TYPE_NORMAL                       $00
  XL_MOST_CTRL_TYPE_REMOTE_READ                  $01
  XL_MOST_CTRL_TYPE_REMOTE_WRITE                 $02
  XL_MOST_CTRL_TYPE_RESOURCE_ALLOCATE            $03
  XL_MOST_CTRL_TYPE_RESOURCE_DEALLOCATE          $04
  XL_MOST_CTRL_TYPE_GET_SOURCE                   $05

// counterType for the xlMost****GenerateBusload function
  XL_MOST_BUSLOAD_COUNTER_TYPE_NONE              $00
  XL_MOST_BUSLOAD_COUNTER_TYPE_1_BYTE            $01
  XL_MOST_BUSLOAD_COUNTER_TYPE_2_BYTE            $02
  XL_MOST_BUSLOAD_COUNTER_TYPE_3_BYTE            $03
  XL_MOST_BUSLOAD_COUNTER_TYPE_4_BYTE            $04

// selection bits for xlMostGetDeviceStates / CMD_GET_DEVICE_STATE->selection_mask 
  XL_MOST_STATESEL_LIGHTLOCK                   $0001
  XL_MOST_STATESEL_REGISTERBUNCH1              $0002 
  XL_MOST_STATESEL_BYPASSTIMING                $0004
  XL_MOST_STATESEL_REGISTERBUNCH2              $0008
  XL_MOST_STATESEL_REGISTERBUNCH3              $0010
  XL_MOST_STATESEL_VOLUMEMUTE                  $0020
  XL_MOST_STATESEL_EVENTSOURCE                 $0040
  XL_MOST_STATESEL_RXBUFFERMODE                $0080
  XL_MOST_STATESEL_ALLOCTABLE                  $0100
  XL_MOST_STATESEL_SUPERVISOR_LOCKSTATUS       $0200
  XL_MOST_STATESEL_SUPERVISOR_MESSAGE          $0400

// defines for sync data streaming
  XL_MOST_STREAM_RX_DATA                             0 // RX streaming: MOST -> PC
  XL_MOST_STREAM_TX_DATA                             1 // TX streaming: PC -> MOST

  XL_MOST_STREAM_ADD_FRAME_HEADER                    1 // only for RX: additionally the orig. TS + status information are reported

// stream states
  XL_MOST_STREAM_STATE_CLOSED                     $01
  XL_MOST_STREAM_STATE_OPENED                     $02
  XL_MOST_STREAM_STATE_STARTED                    $03
  XL_MOST_STREAM_STATE_STOPPED                    $04
  XL_MOST_STREAM_STATE_START_PENDING              $05 // waiting for result from hw
  XL_MOST_STREAM_STATE_STOP_PENDING               $06 // waiting for result from hw
  XL_MOST_STREAM_STATE_UNKNOWN                    $FF 

// stream modes
  XL_MOST_STREAM_ACTIVATE                            0
  XL_MOST_STREAM_DEACTIVATE                          1

  XL_MOST_STREAM_INVALID_HANDLE                      0  

// latency values
  XL_MOST_STREAM_LATENCY_VERY_LOW                    0
  XL_MOST_STREAM_LATENCY_LOW                         1
  XL_MOST_STREAM_LATENCY_MEDIUM                      2
  XL_MOST_STREAM_LATENCY_HIGH                        3
  XL_MOST_STREAM_LATENCY_VERY_HIGH                   4

// error defines for sync data streaming
  XL_MOST_STREAM_ERR_NO_ERROR                     $00
  XL_MOST_STREAM_ERR_INVALID_HANDLE               $01
  XL_MOST_STREAM_ERR_NO_MORE_BUFFERS_AVAILABLE    $02
  XL_MOST_STREAM_ERR_ANY_BUFFER_LOCKED            $03
  XL_MOST_STREAM_ERR_WRITE_RE_FAILED              $04
  XL_MOST_STREAM_ERR_STREAM_ALREADY_STARTED       $05
  XL_MOST_STREAM_ERR_TX_BUFFER_UNDERRUN           $06
  XL_MOST_STREAM_ERR_RX_BUFFER_OVERFLOW           $07
  XL_MOST_STREAM_ERR_INSUFFICIENT_RESOURCES       $08


#include <pshpack8.h>
// -------------------------------------------------------------
//                    Structures for MOST events
// -------------------------------------------------------------

typedef struct s_xl_most_ctrl_spy {
  Longword arbitration;
  word targetAddress;
  word sourceAddress;
  byte ctrlType;
  byte ctrlData[17];
  word crc;
  word txStatus;
  word ctrlRes;
  Longword spyRxStatus;
// XL_MOST_CTRL_SPY_EV;

typedef struct s_xl_most_ctrl_msg {
  byte ctrlPrio;
  byte ctrlType;
  word targetAddress;
  word sourceAddress;
  byte ctrlData[17];
  byte direction;           // transmission or real receiption
  Longword status;               // unused for real rx msgs
// XL_MOST_CTRL_MSG_EV;

typedef struct s_xl_most_async_msg {
  Longword status;               // read as last data from PLD but stored first
  Longword crc;                  // not used
  byte arbitration;
  byte length;              // real length of async data in quadlets
  word targetAddress;
  word sourceAddress;
  byte asyncData[1018];     // max size but only used data is transmitted to pc
// XL_MOST_ASYNC_MSG_EV;

typedef struct s_xl_most_async_tx {
  byte arbitration;
  byte length;              // real length of async data in quadlets
  word targetAddress;
  word sourceAddress;
  byte asyncData[1014];     // worst case
// XL_MOST_ASYNC_TX_EV;

typedef struct s_xl_most_special_register {
  Longword changeMask;          // see defines "XL_MOST_..._CHANGED"
  Longword lockStatus;
  byte register_bNAH;
  byte register_bNAL;
  byte register_bGA;
  byte register_bAPAH;
  byte register_bAPAL;
  byte register_bNPR;
  byte register_bMPR;
  byte register_bNDR;
  byte register_bMDR;
  byte register_bSBC;
  byte register_bXTIM;
  byte register_bXRTY;
// XL_MOST_SPECIAL_REGISTER_EV;

typedef struct s_xl_most_event_source {
  Longword mask;
  Longword state;
// XL_MOST_EVENT_SOURCE_EV;

typedef struct s_xl_most_all_bypass {
  Longword bypassState;
// XL_MOST_ALL_BYPASS_EV;

typedef struct s_xl_most_timing_mode {
  Longword timingmode;
// XL_MOST_TIMING_MODE_EV;

typedef struct s_xl_most_timing_mode_spdif {
  Longword timingmode;
// XL_MOST_TIMING_MODE_SPDIF_EV;

typedef struct s_xl_most_frequency {
  Longword frequency;
// XL_MOST_FREQUENCY_EV;

typedef struct s_xl_most_register_bytes {
  Longword number;
  Longword address;
  byte value[16];
// XL_MOST_REGISTER_BYTES_EV;

typedef struct s_xl_most_register_bits {
  Longword address;
  Longword value;
  Longword mask;
// XL_MOST_REGISTER_BITS_EV;

typedef struct s_xl_most_sync_alloc {
  byte allocTable[MOST_ALLOC_TABLE_SIZE];
// XL_MOST_SYNC_ALLOC_EV;

typedef struct s_xl_most_ctrl_sync_audio {
  Longword channelMask[4];
  Longword device;
  Longword mode;
// XL_MOST_CTRL_SYNC_AUDIO_EV;

typedef struct s_xl_most_ctrl_sync_audio_ex {
  Longword channelMask[16];
  Longword device;
  Longword mode;
// XL_MOST_CTRL_SYNC_AUDIO_EX_EV;

typedef struct s_xl_most_sync_volume_status {
  Longword device;
  Longword volume;
// XL_MOST_SYNC_VOLUME_STATUS_EV;

typedef struct s_xl_most_sync_mutes_status {
  Longword device;
  Longword mute;
// XL_MOST_SYNC_MUTES_STATUS_EV;

typedef struct s_xl_most_rx_light {
  Longword light;
// XL_MOST_RX_LIGHT_EV;

typedef struct s_xl_most_tx_light {
  Longword light;
// XL_MOST_TX_LIGHT_EV;

typedef struct s_xl_most_light_power {
  Longword lightPower;
// XL_MOST_LIGHT_POWER_EV;

typedef struct s_xl_most_lock_status {
  Longword lockStatus;
// XL_MOST_LOCK_STATUS_EV;

typedef struct s_xl_most_supervisor_lock_status {
  Longword supervisorLockStatus;
// XL_MOST_SUPERVISOR_LOCK_STATUS_EV;

typedef struct s_xl_most_gen_light_error {
  Longword lightOnTime;
  Longword lightOffTime;
  Longword repeat;
// XL_MOST_GEN_LIGHT_ERROR_EV;

typedef struct s_xl_most_gen_lock_error {
  Longword lockOnTime;
  Longword lockOffTime;
  Longword repeat;
// XL_MOST_GEN_LOCK_ERROR_EV;

typedef struct s_xl_most_rx_buffer {
  Longword mode;
// XL_MOST_RX_BUFFER_EV;

typedef struct s_xl_most_error {
  Longword errorCode;
  Longword parameter[3];
// XL_MOST_ERROR_EV;

typedef struct s_xl_most_sync_pulse {
  Longword     triggerSource;              // e.g. external or internal trigger source
  unsigned __int64 time;                       // internal generated timestamp
// XL_MOST_SYNC_PULSE_EV;

typedef struct s_xl_most_ctrl_busload {
  Longword busloadCtrlStarted;
// XL_MOST_CTRL_BUSLOAD_EV;

typedef struct s_xl_most_async_busload {
  Longword busloadAsyncStarted;
// XL_MOST_ASYNC_BUSLOAD_EV;

typedef struct s_xl_most_stream_state {
  Longword streamHandle;
  Longword streamState; // see XL_MOST_STREAM_STATE_...
  Longword streamError; // see XL_MOST_STREAM_ERR_...
  Longword reserved;
// XL_MOST_STREAM_STATE_EV;

typedef struct s_xl_most_stream_buffer {
  Longword   streamHandle;
  byte* pBuffer;
  Longword   validBytes;
  Longword   status; // // see XL_MOST_STREAM_ERR_...
  Longword   reserved;
// XL_MOST_STREAM_BUFFER_EV;


  XL_MOST_EVENT_HEADER_SIZE                                                          32
  XL_MOST_EVENT_MAX_DATA_SIZE                                                      1024
  XL_MOST_EVENT_MAX_SIZE      (XL_MOST_EVENT_HEADER_SIZE + XL_MOST_EVENT_MAX_DATA_SIZE)

// rx event definition
union s_xl_most_tag_data {
    XL_MOST_CTRL_SPY_EV                mostCtrlSpy;
    XL_MOST_CTRL_MSG_EV                mostCtrlMsg;
    XL_MOST_ASYNC_MSG_EV               mostAsyncMsg;            // received async frame
    XL_MOST_ASYNC_TX_EV                mostAsyncTx;             // async frame tx acknowledge
    XL_MOST_SPECIAL_REGISTER_EV        mostSpecialRegister;
    XL_MOST_EVENT_SOURCE_EV            mostEventSource;
    XL_MOST_ALL_BYPASS_EV              mostAllBypass;
    XL_MOST_TIMING_MODE_EV             mostTimingMode;
    XL_MOST_TIMING_MODE_SPDIF_EV       mostTimingModeSpdif;
    XL_MOST_FREQUENCY_EV               mostFrequency;
    XL_MOST_REGISTER_BYTES_EV          mostRegisterBytes;
    XL_MOST_REGISTER_BITS_EV           mostRegisterBits;
    XL_MOST_SYNC_ALLOC_EV              mostSyncAlloc;
    XL_MOST_CTRL_SYNC_AUDIO_EV         mostCtrlSyncAudio;
    XL_MOST_CTRL_SYNC_AUDIO_EX_EV      mostCtrlSyncAudioEx;
    XL_MOST_SYNC_VOLUME_STATUS_EV      mostSyncVolumeStatus;
    XL_MOST_SYNC_MUTES_STATUS_EV       mostSyncMutesStatus;
    XL_MOST_RX_LIGHT_EV                mostRxLight;
    XL_MOST_TX_LIGHT_EV                mostTxLight;
    XL_MOST_LIGHT_POWER_EV             mostLightPower;
    XL_MOST_LOCK_STATUS_EV             mostLockStatus;
    XL_MOST_GEN_LIGHT_ERROR_EV         mostGenLightError;
    XL_MOST_GEN_LOCK_ERROR_EV          mostGenLockError;
    XL_MOST_RX_BUFFER_EV               mostRxBuffer;
    XL_MOST_ERROR_EV                   mostError;
    XL_MOST_SYNC_PULSE_EV              mostSyncPulse;
    XL_MOST_CTRL_BUSLOAD_EV            mostCtrlBusload;
    XL_MOST_ASYNC_BUSLOAD_EV           mostAsyncBusload;
    XL_MOST_STREAM_STATE_EV            mostStreamState;
    XL_MOST_STREAM_BUFFER_EV           mostStreamBuffer;
//


typedef word    XLmostEventTag;

struct s_xl_most_event {
  Longword        size;             // 4 - overall size of the complete event
  XLmostEventTag      tag;              // 2 - type of the event
  word      channelIndex;     // 2
  Longword        userHandle;       // 4 - internal use only
  word      flagsChip;        // 2
  word      reserved;         // 2
  XLuint64            timeStamp;        // 8
  XLuint64            timeStampSync;    // 8
                                        // ---------
                                        // 32 bytes -> XL_MOST_EVENT_HEADER_SIZE
  union s_xl_most_tag_data tagData;
//

typedef struct s_xl_most_event XLmostEvent;

typedef XL_MOST_CTRL_MSG_EV                 XLmostCtrlMsg;
typedef XL_MOST_ASYNC_TX_EV                 XLmostAsyncMsg;

typedef struct s_xl_most_ctrl_busload_configuration {
  Longword        transmissionRate;
  Longword        counterType;
  Longword        counterPosition;
  XL_MOST_CTRL_MSG_EV busloadCtrlMsg;
// XL_MOST_CTRL_BUSLOAD_CONFIGURATION;


typedef struct s_xl_most_async_busload_configuration {
  Longword        transmissionRate;
  Longword        counterType;
  Longword        counterPosition;
  XL_MOST_ASYNC_TX_EV busloadAsyncMsg;
// XL_MOST_ASYNC_BUSLOAD_CONFIGURATION;

typedef XL_MOST_CTRL_BUSLOAD_CONFIGURATION  XLmostCtrlBusloadConfiguration;
typedef XL_MOST_ASYNC_BUSLOAD_CONFIGURATION XLmostAsyncBusloadConfiguration;

typedef struct s_xl_most_device_state {
  Longword  selectionMask;
  // XL_MOST_STATESEL_LIGHTLOCK
  Longword  lockState;                      // see XL_MOST_LOCK_STATUS_EV
  Longword  rxLight;                        // see XL_MOST_RX_LIGHT_EV
  Longword  txLight;                        // see XL_MOST_TX_LIGHT_EV
  Longword  txLightPower;                   // see XL_MOST_LIGHT_POWER_EV
  // XL_MOST_STATESEL_REGISTERBUNCH1
  byte registerBunch1[16];             // 16 OS8104 registers ($87...$96 -> NPR...SBC)
  // XL_MOST_STATESEL_BYPASSTIMING
  Longword  bypassState;                    // see XL_MOST_ALL_BYPASS_EV
  Longword  timingMode;                     // see XL_MOST_TIMING_MODE_EV
  Longword  frequency;                      // frame rate (if master); see XL_MOST_FREQUENCY_EV
  // XL_MOST_STATESEL_REGISTERBUNCH2
  byte registerBunch2[2];              // 2 OS8104 registers ($BE, $BF -> XTIM, XRTY)
  // XL_MOST_STATESEL_REGISTERBUNCH3
  byte registerBunch3[2];              // 2 OS8104 registers ($E8, $E9 -> APAH, APAL)
  // XL_MOST_STATESEL_VOLUMEMUTE
  Longword  volume[2];                      // volume state for DEVICE_CASE_LINE_IN, DEVICE_CASE_LINE_OUT
  Longword  mute[2];                        // mute state for DEVICE_CASE_LINE_IN, DEVICE_CASE_LINE_OUT
  // XL_MOST_STATESEL_EVENTSOURCE
  Longword  eventSource;                    // see XL_MOST_EVENT_SOURCE_EV
  // XL_MOST_STATESEL_RXBUFFERMODE
  Longword  rxBufferMode;                   // see XL_MOST_RX_BUFFER_EV
  // XL_MOST_STATESEL_ALLOCTABLE
  byte allocTable[MOST_ALLOC_TABLE_SIZE]; // see XL_MOST_SYNC_ALLOC_EV
   // XL_MOST_STATESEL_SUPERVISOR_LOCKSTATUS
  Longword supervisorLockStatus;
  // XL_MOST_STATESEL_SUPERVISOR_MESSAGE
  Longword broadcastedConfigStatus;
  Longword adrNetworkMaster;
  Longword abilityToWake;
// XL_MOST_DEVICE_STATE;

typedef XL_MOST_DEVICE_STATE                XLmostDeviceState;

typedef struct s_xl_most_stream_open {
  Longword* pStreamHandle;
  Longword  numSyncChannels;
  Longword  direction;
  Longword  options;
  Longword  latency;
// XL_MOST_STREAM_OPEN;

typedef XL_MOST_STREAM_OPEN                 XLmostStreamOpen;

typedef struct s_xl_most_stream_info {
  Longword  streamHandle;
  Longword  numSyncChannels;
  Longword  direction;
  Longword  options;
  Longword  latency;
  Longword  streamState;
  Longword  reserved;
  byte syncChannels[60];
// XL_MOST_STREAM_INFO;

typedef XL_MOST_STREAM_INFO                   XLmostStreamInfo;


/////////////////////////////////////////////////////////////////////////////////////////////////////////
// FlexRay XL API
/////////////////////////////////////////////////////////////////////////////////////////////////////////

  XL_FR_MAX_DATA_LENGTH                                 254

/////////////////////////////////////////////////////////////////////////////////////////////////////////
// event tags
/////////////////////////////////////////////////////////////////////////////////////////////////////////

  XL_FR_START_CYCLE                       ((word)$0080)
  XL_FR_RX_FRAME                          ((word)$0081)
  XL_FR_TX_FRAME                          ((word)$0082)
  XL_FR_TXACK_FRAME                       ((word)$0083)
  XL_FR_INVALID_FRAME                     ((word)$0084)
  XL_FR_WAKEUP                            ((word)$0085)
  XL_FR_SYMBOL_WINDOW                     ((word)$0086)
  XL_FR_ERROR                             ((word)$0087)
    XL_FR_ERROR_POC_MODE                  ((byte)$01)
    XL_FR_ERROR_SYNC_FRAMES_BELOWMIN      ((byte)$02)
    XL_FR_ERROR_SYNC_FRAMES_OVERLOAD      ((byte)$03)
    XL_FR_ERROR_CLOCK_CORR_FAILURE        ((byte)$04)
    XL_FR_ERROR_NIT_FAILURE               ((byte)$05)
    XL_FR_ERROR_CC_ERROR                  ((byte)$06)
  XL_FR_STATUS                            ((word)$0088)
  XL_FR_NM_VECTOR                         ((word)$008A)
  XL_FR_TRANCEIVER_STATUS                 ((word)$008B)
  XL_FR_SPY_FRAME				                  ((word)$008E)
  XL_FR_SPY_SYMBOL			                  ((word)$008F)


// Attention: The timer event type has to have the same number as CANcardXL, CANboardXL, ...

/////////////////////////////////////////////////////////////////////////////////////////////////////////
// function structures
/////////////////////////////////////////////////////////////////////////////////////////////////////////

// structure for xlFrSetConfiguration
typedef struct s_xl_fr_cluster_configuration {

  Longword      busGuardianEnable;
  Longword	    baudrate;
  Longword	    busGuardianTick;
  Longword	    externalClockCorrectionMode;
  Longword	    gColdStartAttempts;
  Longword	    gListenNoise;
  Longword	    gMacroPerCycle;
  Longword	    gMaxWithoutClockCorrectionFatal;
  Longword	    gMaxWithoutClockCorrectionPassive;
  Longword	    gNetworkManagementVectorLength;
  Longword	    gNumberOfMinislots;
  Longword	    gNumberOfStaticSlots;
  Longword	    gOffsetCorrectionStart;
  Longword	    gPayloadLengthStatic;
  Longword	    gSyncNodeMax;
  Longword	    gdActionPointOffset;
  Longword	    gdDynamicSlotIdlePhase;
  Longword	    gdMacrotick;
  Longword	    gdMinislot;
  Longword	    gdMiniSlotActionPointOffset;
  Longword	    gdNIT;
  Longword	    gdStaticSlot;
  Longword	    gdSymbolWindow;
  Longword	    gdTSSTransmitter;
  Longword	    gdWakeupSymbolRxIdle;
  Longword	    gdWakeupSymbolRxLow;
  Longword	    gdWakeupSymbolRxWindow;
  Longword	    gdWakeupSymbolTxIdle;
  Longword      gdWakeupSymbolTxLow;
  Longword	    pAllowHaltDueToClock;
  Longword	    pAllowPassiveToActive;
  Longword	    pChannels;
  Longword	    pClusterDriftDamping;
  Longword	    pDecodingCorrection;
  Longword	    pDelayCompensationA;
  Longword	    pDelayCompensationB;
  Longword	    pExternOffsetCorrection;
  Longword	    pExternRateCorrection;
  Longword	    pKeySlotUsedForStartup;
  Longword	    pKeySlotUsedForSync;
  Longword	    pLatestTx;
  Longword	    pMacroInitialOffsetA;
  Longword	    pMacroInitialOffsetB;
  Longword	    pMaxPayloadLengthDynamic;
  Longword	    pMicroInitialOffsetA;
  Longword	    pMicroInitialOffsetB;
  Longword	    pMicroPerCycle;
  Longword	    pMicroPerMacroNom;
  Longword      pOffsetCorrectionOut;
  Longword      pRateCorrectionOut;
  Longword      pSamplesPerMicrotick;
  Longword      pSingleSlotEnabled;
  Longword      pWakeupChannel;
  Longword      pWakeupPattern;
  Longword      pdAcceptedStartupRange;
  Longword      pdListenTimeout;
  Longword      pdMaxDrift;
  Longword      pdMicrotick;
  Longword      gdCASRxLowMax;
  Longword      gChannels;
  Longword      vExternOffsetControl;
  Longword      vExternRateControl;
  Longword      pChannelsMTS;

  Longword      reserved[16];
// XLfrClusterConfig;


// structure and defines for function xlFrGetChannelConfig
typedef struct s_xl_fr_channel_config {
  Longword      status;             // XL_FR_CHANNEL_CFG_STATUS_xxx
  Longword      cfgMode; 	          // XL_FR_CHANNEL_CFG_MODE_xxx
  Longword      reserved[6];
  XLfrClusterConfig xlFrClusterConfig;  // same as used in function xlFrSetConfig
// XLfrChannelConfig;

// defines for XLfrChannelConfig::status
  XL_FR_CHANNEL_CFG_STATUS_INIT_APP_PRESENT   ((Longword) $01)
  XL_FR_CHANNEL_CFG_STATUS_CHANNEL_ACTIVATED  ((Longword) $02)
  XL_FR_CHANNEL_CFG_STATUS_VALID_CLUSTER_CFG  ((Longword) $04)
  XL_FR_CHANNEL_CFG_STATUS_VALID_CFG_MODE     ((Longword) $08)

// defines for XLfrChannelConfig::cfgMode
  XL_FR_CHANNEL_CFG_MODE_SYNCHRONOUS                             1
  XL_FR_CHANNEL_CFG_MODE_COMBINED                                2
  XL_FR_CHANNEL_CFG_MODE_ASYNCHRONOUS                            3


// defines for xlFrSetMode (frModes)
  XL_FR_MODE_NORMAL                                    $00 //!< setup the VN3000 (eRay) normal operation mode. (default mode)
  XL_FR_MODE_COLD_NORMAL                               $04 //!< setup the VN3000 (Fujitsu) normal operation mode. (default mode)

// defines for xlFrSetMode (frStartupAttributes)
  XL_FR_MODE_NONE                                      $00 //!< for normal use
  XL_FR_MODE_WAKEUP                                    $01 //!< for wakeup
  XL_FR_MODE_COLDSTART_LEADING                         $02 //!< Coldstart path initiating the schedule synchronization
  XL_FR_MODE_COLDSTART_FOLLOWING                       $03 //!< Coldstart path joining other coldstart nodes
  XL_FR_MODE_WAKEUP_AND_COLDSTART_LEADING              $04 //!< Send Wakeup and Coldstart path initiating the schedule synchronization
  XL_FR_MODE_WAKEUP_AND_COLDSTART_FOLLOWING            $05 //!< Send Wakeup and Coldstart path joining other coldstart nodes

// structure for xlFrSetMode
typedef struct s_xl_fr_set_modes {
  Longword 	    frMode;
  Longword 	    frStartupAttributes;
  Longword 	    reserved[30];
// XLfrMode;

// defines for xlFrSetupSymbolWindow
  XL_FR_SYMBOL_MTS                                     $01 //!< defines a MTS (Media Access Test Symbol)
  XL_FR_SYMBOL_CAS                                     $02 //!< defines a CAS (Collision Avoidance Symbol)


// FR transceiver xlFrSetTransceiverMode modes
  XL_FR_TRANSCEIVER_MODE_SLEEP                         $01
  XL_FR_TRANSCEIVER_MODE_NORMAL                        $02
  XL_FR_TRANSCEIVER_MODE_RECEIVE_ONLY                  $03
  XL_FR_TRANSCEIVER_MODE_STANDBY                       $04

// defines for XL_FR_SYNC_PULSE_EV member triggerSource
  XL_FR_SYNC_PULSE_EXTERNAL                            $00
  XL_FR_SYNC_PULSE_OUR                                 $01
  XL_FR_SYNC_PULSE_OUR_SHARED                          $02

// defines for xlFrActivateSpy, mode
  XL_FR_SPY_MODE_ASYNCHRONOUS                          $01

/////////////////////////////////////////////////////////////////////////////////////////////////////////
// Flags for the flagsChip parameter
/////////////////////////////////////////////////////////////////////////////////////////////////////////
// pls. keep channel flag values like this (matches MBS from ERay)
  XL_FR_CHANNEL_A                               ((word)$01)
  XL_FR_CHANNEL_B                               ((word)$02)
  XL_FR_CHANNEL_AB ((word)(XL_FR_CHANNEL_A|XL_FR_CHANNEL_B))
  XL_FR_CC_COLD_A                               ((word)$04) //!< second CC channel A to initiate the coldstart
  XL_FR_CC_COLD_B                               ((word)$08) //!< second CC channel B to initiate the coldstart
  XL_FR_CC_COLD_AB ((word)(XL_FR_CC_COLD_A|XL_FR_CC_COLD_B))
  XL_FR_SPY_CHANNEL_A                           ((word)$10) //!< Spy mode flags
  XL_FR_SPY_CHANNEL_B                           ((word)$20) //!< Spy mode flags

  XL_FR_QUEUE_OVERFLOW                        ((word)$0100) //!< driver queue overflow


/////////////////////////////////////////////////////////////////////////////////////////////////////////
// T_FLEXRAY_FRAME structure flags / defines
/////////////////////////////////////////////////////////////////////////////////////////////////////////
// defines for T_FLEXRAY_FRAME member flags
  XL_FR_FRAMEFLAG_STARTUP                   ((word) $0001)
  XL_FR_FRAMEFLAG_SYNC                      ((word) $0002)
  XL_FR_FRAMEFLAG_NULLFRAME                 ((word) $0004)
  XL_FR_FRAMEFLAG_PAYLOAD_PREAMBLE          ((word) $0008)
  XL_FR_FRAMEFLAG_FR_RESERVED               ((word) $0010)

  XL_FR_FRAMEFLAG_REQ_TXACK                 ((word) $0020)   //!< used for Tx events only
  XL_FR_FRAMEFLAG_TXACK_SS                  XL_FR_FRAMEFLAG_REQ_TXACK   //!< indicates TxAck of SingleShot; used for TxAck events only
  XL_FR_FRAMEFLAG_RX_UNEXPECTED             XL_FR_FRAMEFLAG_REQ_TXACK   //!< indicates unexpected Rx frame; used for Rx events only

  XL_FR_FRAMEFLAG_NEW_DATA_TX               ((word) $0040)   //!< flag used with TxAcks to indicate first TxAck after data update
  XL_FR_FRAMEFLAG_DATA_UPDATE_LOST          ((word) $0080)   //!< flag used with TxAcks indicating that data update has been lost

  XL_FR_FRAMEFLAG_SYNTAX_ERROR              ((word) $0200)
  XL_FR_FRAMEFLAG_CONTENT_ERROR             ((word) $0400)
  XL_FR_FRAMEFLAG_SLOT_BOUNDARY_VIOLATION   ((word) $0800)
  XL_FR_FRAMEFLAG_TX_CONFLICT               ((word) $1000)
  XL_FR_FRAMEFLAG_EMPTY_SLOT                ((word) $2000)
  XL_FR_FRAMEFLAG_FRAME_TRANSMITTED         ((word) $8000)

// XL_FR_SPY_FRAME_EV event: frameError value
  XL_FR_SPY_FRAMEFLAG_FRAMING_ERROR             ((byte)$01)
  XL_FR_SPY_FRAMEFLAG_HEADER_CRC_ERROR          ((byte)$02)
  XL_FR_SPY_FRAMEFLAG_FRAME_CRC_ERROR           ((byte)$04)

// XL_FR_SPY_FRAME_EV event: frameCRC value
  XL_FR_SPY_FRAMEFLAG_FRAME_CRC_NEW_LAYOUT ((Longword)$80000000)

// XL_FR_TX_FRAME event: txMode flags
  XL_FR_TX_MODE_CYCLIC                          ((byte)$01)   //!< 'normal' cyclic mode
  XL_FR_TX_MODE_SINGLE_SHOT                     ((byte)$02)   //!< sends only a single shot
  XL_FR_TX_MODE_NONE                            ((byte)$ff)   //!< switch off TX

// XL_FR_TX_FRAME event: incrementSize values
  XL_FR_PAYLOAD_INCREMENT_8BIT                  ((byte)   8)
  XL_FR_PAYLOAD_INCREMENT_16BIT                 ((byte)  16)
  XL_FR_PAYLOAD_INCREMENT_32BIT                 ((byte)  32)

// XL_FR_STATUS event: statusType (POC status)
  XL_FR_STATUS_DEFAULT_CONFIG                          $00 //!< indicates the actual state of the POC in operation control
  XL_FR_STATUS_READY                                   $01 //!< ...
  XL_FR_STATUS_NORMAL_ACTIVE                           $02 //!< ...
  XL_FR_STATUS_NORMAL_PASSIVE                          $03 //!< ...
  XL_FR_STATUS_HALT                                    $04 //!< ...
  XL_FR_STATUS_MONITOR_MODE                            $05 //!< ...
  XL_FR_STATUS_CONFIG                                  $0f //!< ...

  XL_FR_STATUS_WAKEUP_STANDBY                          $10 //!< indicates the actual state of the POC in the wakeup path
  XL_FR_STATUS_WAKEUP_LISTEN                           $11 //!< ...
  XL_FR_STATUS_WAKEUP_SEND                             $12 //!< ...
  XL_FR_STATUS_WAKEUP_DETECT                           $13 //!< ...
                                                    
  XL_FR_STATUS_STARTUP_PREPARE                         $20 //!< indicates the actual state of the POC in the startup path 
  XL_FR_STATUS_COLDSTART_LISTEN                        $21 //!< ...
  XL_FR_STATUS_COLDSTART_COLLISION_RESOLUTION          $22 //!< ...
  XL_FR_STATUS_COLDSTART_CONSISTENCY_CHECK             $23 //!< ...
  XL_FR_STATUS_COLDSTART_GAP                           $24 //!< ...
  XL_FR_STATUS_COLDSTART_JOIN                          $25 //!< ...
  XL_FR_STATUS_INTEGRATION_COLDSTART_CHECK             $26 //!< ...
  XL_FR_STATUS_INTEGRATION_LISTEN                      $27 //!< ... 
  XL_FR_STATUS_INTEGRATION_CONSISTENCY_CHECK           $28 //!< ...
  XL_FR_STATUS_INITIALIZE_SCHEDULE                     $29 //!< ...
  XL_FR_STATUS_ABORT_STARTUP                           $2a //!< ...
  XL_FR_STATUS_STARTUP_SUCCESS                         $2b //!< ...

// XL_FR_ERROR event: XL_FR_ERROR_POC_MODE, errorMode
  XL_FR_ERROR_POC_ACTIVE                               $00 //!< Indicates the actual error mode of the POC: active (green)
  XL_FR_ERROR_POC_PASSIVE                              $01 //!< Indicates the actual error mode of the POC: passive (yellow)
  XL_FR_ERROR_POC_COMM_HALT                            $02 //!< Indicates the actual error mode of the POC: comm-halt (red)

// XL_FR_ERROR event: XL_FR_ERROR_NIT_FAILURE, flags
  XL_FR_ERROR_NIT_SENA                                $100 //!< Syntax Error during NIT Channel A
  XL_FR_ERROR_NIT_SBNA                                $200 //!< Slot Boundary Violation during NIT Channel B
  XL_FR_ERROR_NIT_SENB                                $400 //!< Syntax Error during NIT Channel A
  XL_FR_ERROR_NIT_SBNB                                $800 //!< Slot Boundary Violation during NIT Channel B

// XL_FR_ERROR event: XL_FR_ERROR_CLOCK_CORR_FAILURE, flags
  XL_FR_ERROR_MISSING_OFFSET_CORRECTION          $00000001 //!< Set if no sync frames were received. -> no offset correction possible.
  XL_FR_ERROR_MAX_OFFSET_CORRECTION_REACHED      $00000002 //!< Set if max. offset correction limit is reached.   
  XL_FR_ERROR_MISSING_RATE_CORRECTION            $00000004 //!< Set if no even/odd sync frames were received -> no rate correction possible.
  XL_FR_ERROR_MAX_RATE_CORRECTION_REACHED        $00000008 //!< Set if max. rate correction limit is reached.	
     	
// XL_FR_ERROR event: XL_FR_ERROR_CC_ERROR, erayEir
  XL_FR_ERROR_CC_PERR                            $00000040 //!< Parity Error, data from MHDS (internal ERay error)
  XL_FR_ERROR_CC_IIBA                            $00000200 //!< Illegal Input Buffer Access (internal ERay error)  
  XL_FR_ERROR_CC_IOBA                            $00000400 //!< Illegal Output Buffer Access (internal ERay error)
  XL_FR_ERROR_CC_MHF                             $00000800 //!< Message Handler Constraints Flag data from MHDF (internal ERay error)
  XL_FR_ERROR_CC_EDA                             $00010000 //!< Error Detection on channel A, data from ACS
  XL_FR_ERROR_CC_LTVA                            $00020000 //!< Latest Transmit Violation on channel A
  XL_FR_ERROR_CC_TABA                            $00040000 //!< Transmit Across Boundary on Channel A
  XL_FR_ERROR_CC_EDB                             $01000000 //!< Error Detection on channel B, data from ACS
  XL_FR_ERROR_CC_LTVB                            $02000000 //!< Latest Transmit Violation on channel B    
  XL_FR_ERROR_CC_TABB                            $04000000 //!< Transmit Across Boundary on Channel B

// XL_FR_WAKEUP event: wakeupStatus 
  XL_FR_WAKEUP_UNDEFINED                               $00 //!< No wakeup attempt since CONFIG state was left. (e.g. when a wakeup pattern A|B is received)
  XL_FR_WAKEUP_RECEIVED_HEADER                         $01 //!< Frame header without coding violation received. 
  XL_FR_WAKEUP_RECEIVED_WUP                            $02 //!< Wakeup pattern on the configured wakeup channel received.
  XL_FR_WAKEUP_COLLISION_HEADER                        $03 //!< Detected collision during wakeup pattern transmission received. 
  XL_FR_WAKEUP_COLLISION_WUP                           $04 //!< Collision during wakeup pattern transmission received.
  XL_FR_WAKEUP_COLLISION_UNKNOWN                       $05 //!< Set when the CC stops wakeup.
  XL_FR_WAKEUP_TRANSMITTED                             $06 //!< Completed the transmission of the wakeup pattern.
  XL_FR_WAKEUP_EXTERNAL_WAKEUP                         $07 //!< wakeup comes from external
  XL_FR_WAKEUP_WUP_RECEIVED_WITHOUT_WUS_TX             $10 //!< wakeupt pattern received from flexray bus
  XL_FR_WAKEUP_RESERVED                                $FF

// XL_FR_SYMBOL_WINDOW event: flags
  XL_FR_SYMBOL_STATUS_SESA                             $01 //!< Syntax Error in Symbol Window Channel A
  XL_FR_SYMBOL_STATUS_SBSA                             $02 //!< Slot Boundary Violation in Symbol Window Channel A 
  XL_FR_SYMBOL_STATUS_TCSA                             $04 //!< Transmission Conflict in Symbol Window Channel A
  XL_FR_SYMBOL_STATUS_SESB                             $08 //!< Syntax Error in Symbol Window Channel B
  XL_FR_SYMBOL_STATUS_SBSB                             $10 //!< Slot Boundary Violation in Symbol Window Channel B 
  XL_FR_SYMBOL_STATUS_TCSB                             $20 //!< Transmission Conflict in Symbol Window Channel B
  XL_FR_SYMBOL_STATUS_MTSA                             $40 //!< MTS received in Symbol Window Channel A
  XL_FR_SYMBOL_STATUS_MTSB                             $80 //!< MTS received in Symbol Window Channel B


#include <pshpack8.h>

  XL_FR_RX_EVENT_HEADER_SIZE       32 
  XL_FR_MAX_EVENT_SIZE            512  



/////////////////////////////////////////////////////////////////////////////////////////////////////////
// Structures for FlexRay events
/////////////////////////////////////////////////////////////////////////////////////////////////////////

typedef struct s_xl_fr_start_cycle {
  Longword                          cycleCount;
  int                                   vRateCorrection;
  int                                   vOffsetCorrection;
  Longword                          vClockCorrectionFailed;
  Longword                          vAllowPassivToActive;
  Longword                          reserved[3]; 
// XL_FR_START_CYCLE_EV;

typedef struct s_xl_fr_rx_frame {
  word                        flags;
  word                        headerCRC;
  word                        slotID;
  byte                         cycleCount;
  byte                         payloadLength;
  byte	                        data[XL_FR_MAX_DATA_LENGTH];
// XL_FR_RX_FRAME_EV;

typedef struct s_xl_fr_tx_frame {
  word                        flags;
  word                        slotID;
  byte                         offset;
  byte	                        repetition;
  byte                         payloadLength;
  byte	                        txMode;
  byte                         incrementSize;
  byte                         incrementOffset;
  byte                         reserved0;
  byte                         reserved1;
  byte	                        data[XL_FR_MAX_DATA_LENGTH];
// XL_FR_TX_FRAME_EV;

typedef struct s_xl_fr_wakeup {
  byte                         cycleCount;              //!< Actual cyclecount.
  byte                         wakeupStatus;            //!< XL_FR_WAKEUP_UNDEFINED, ...
  byte                         reserved[6];
// XL_FR_WAKEUP_EV;

typedef struct s_xl_fr_symbol_window {
  Longword                          symbol;                  //!< XL_FR_SYMBOL_MTS, ...
  Longword                          flags;                   //!< XL_FR_SYMBOL_STATUS_SESA, ...
  byte                         cycleCount;              //!< Actual cyclecount.
  byte                         reserved[7];
// XL_FR_SYMBOL_WINDOW_EV;

typedef struct s_xl_fr_status {
  Longword                          statusType;              //!< POC status XL_FR_STATUS_ defines like, normal, active...
  Longword                          reserved;
// XL_FR_STATUS_EV;

typedef struct s_xl_fr_nm_vector {
  byte                         nmVector[12];
  byte                         cycleCount;              //!< Actual cyclecount.
  byte                         reserved[3];
// XL_FR_NM_VECTOR_EV;

typedef struct s_xl_fr_sync_pulse {
  Longword                          triggerSource;           //!< e.g. external or internal trigger source
  XLuint64                              time;                    //!< internal generated timestamp
// XL_FR_SYNC_PULSE_EV;

typedef struct s_xl_fr_error_poc_mode {
  byte                         errorMode;               //!< error mode like: active, passive, comm_halt
  byte                         reserved[3];
//XL_FR_ERROR_POC_MODE_EV;

typedef struct s_xl_fr_error_sync_frames {
  word                        evenSyncFramesA;         //!< valid RX/TX sync frames on frCh A for even cycles
  word                        oddSyncFramesA;          //!< valid RX/TX sync frames on frCh A for odd cycles
  word                        evenSyncFramesB;         //!< valid RX/TX sync frames on frCh B for even cycles
  word                        oddSyncFramesB;          //!< valid RX/TX sync frames on frCh B for odd cycles
  Longword                          reserved;
// XL_FR_ERROR_SYNC_FRAMES_EV;

typedef struct s_xl_fr_error_clock_corr_failure {
  word                        evenSyncFramesA;         //!< valid RX/TX sync frames on frCh A for even cycles
  word                        oddSyncFramesA;          //!< valid RX/TX sync frames on frCh A for odd cycles
  word                        evenSyncFramesB;         //!< valid RX/TX sync frames on frCh B for even cycles
  word                        oddSyncFramesB;          //!< valid RX/TX sync frames on frCh B for odd cycles
  Longword                          flags;                   //!< missing/maximum rate/offset correction flags.
  Longword                          clockCorrFailedCounter;  //!< E-Ray: CCEV register (CCFC value)
  Longword                          reserved;
// XL_FR_ERROR_CLOCK_CORR_FAILURE_EV;

typedef struct s_xl_fr_error_nit_failure {
  Longword                          flags;                   //!< flags for NIT boundary, syntax error...
  Longword                          reserved;
// XL_FR_ERROR_NIT_FAILURE_EV;

typedef struct s_xl_fr_error_cc_error {
  Longword                          ccError;                 //!< internal CC errors (Transmit Across Boundary, Transmit Violation...)
  Longword                          reserved;
// XL_FR_ERROR_CC_ERROR_EV;

union s_xl_fr_error_info {
  XL_FR_ERROR_POC_MODE_EV               frPocMode;               //!< E-RAY: EIR_PEMC
  XL_FR_ERROR_SYNC_FRAMES_EV            frSyncFramesBelowMin;    //!< E-RAY: EIR_SFBM
  XL_FR_ERROR_SYNC_FRAMES_EV            frSyncFramesOverload;    //!< E-RAY: EIR_SFO
  XL_FR_ERROR_CLOCK_CORR_FAILURE_EV     frClockCorrectionFailure;//!< E-RAY: EIR_CCF
  XL_FR_ERROR_NIT_FAILURE_EV            frNitFailure;            //!< NIT part of the E_RAY: SWNIT register
  XL_FR_ERROR_CC_ERROR_EV               frCCError;               //!< internal CC error flags (E-RAY: EIR)
//;

typedef struct s_xl_fr_error {
  byte                         tag;
  byte                         cycleCount;
  byte                         reserved[6];
  union s_xl_fr_error_info              errorInfo;
// XL_FR_ERROR_EV;

typedef struct s_xl_fr_spy_frame {
  Longword                          frameLength;
  byte                         frameError;	             //!< XL_FR_SPY_FRAMEFLAG_XXX values
  byte                         tssLength;
  word                        headerFlags;
  word                        slotID;
  word                        headerCRC;
  byte                         payloadLength;
  byte                         cycleCount;
  word                        reserved;
  Longword                          frameCRC;
  byte                         data[XL_FR_MAX_DATA_LENGTH];
// XL_FR_SPY_FRAME_EV;

typedef struct s_xl_fr_spy_symbol {
  word                        lowLength;
  word                        reserved;
// XL_FR_SPY_SYMBOL_EV;


  XL_NOTIFY_REASON_CHANNEL_ACTIVATION       1
  XL_NOTIFY_REASON_CHANNEL_DEACTIVATION     2
  XL_NOTIFY_REASON_PORT_CLOSED              3

typedef struct s_xl_application_notification {
  Longword 	notifyReason; 			// XL_NOTIFY_REASON_xxx
  Longword	reserved[7];
// XL_APPLICATION_NOTIFICATION_EV;



/////////////////////////////////////////////////////////////////////////////////////////////////////////
// rx event definition
/////////////////////////////////////////////////////////////////////////////////////////////////////////

union s_xl_fr_tag_data {
  XL_FR_START_CYCLE_EV                  frStartCycle;
  XL_FR_RX_FRAME_EV                     frRxFrame;
  XL_FR_TX_FRAME_EV                     frTxFrame;
  XL_FR_WAKEUP_EV                       frWakeup;
  XL_FR_SYMBOL_WINDOW_EV                frSymbolWindow;
  XL_FR_ERROR_EV                        frError;
  XL_FR_STATUS_EV                       frStatus;
  XL_FR_NM_VECTOR_EV                    frNmVector;
  XL_FR_SYNC_PULSE_EV                   frSyncPulse;
  XL_FR_SPY_FRAME_EV                    frSpyFrame;
  XL_FR_SPY_SYMBOL_EV                   frSpySymbol;

  XL_APPLICATION_NOTIFICATION_EV        applicationNotification;

  byte                         raw[XL_FR_MAX_EVENT_SIZE - XL_FR_RX_EVENT_HEADER_SIZE];
//;

typedef word                  XLfrEventTag;

struct s_xl_fr_event {
  Longword                          size;             // 4 - overall size of the complete event
  XLfrEventTag                          tag;              // 2 - type of the event
  word                        channelIndex;     // 2
  Longword                          userHandle;       // 4 
  word                        flagsChip;        // 2 - frChannel e.g. XL_FR_CHANNEL_A (lower 8 bit), queue overflow (upper 8bit)
  word                        reserved;         // 2 
  XLuint64                              timeStamp;        // 8 - raw timestamp
  XLuint64                              timeStampSync;    // 8 - timestamp which is synchronized by the driver
                                                          // --------- 
                                                          // 32 bytes -> XL_FR_RX_EVENT_HEADER_SIZE
  union s_xl_fr_tag_data                tagData; 
//;

typedef struct s_xl_fr_event            XLfrEvent; 


#include <poppack.h>
///////////////////////////////////////////////////////////////////////////////
// Function calls
////////////////////////////////////////////////////////////////////////////////
}


// common functions
{-------------------------------------------------------------------------------
xlOpenDriver():
--------------------------------------------------------------------------------
The Application calls this function to get access to the driver.
}
function xlOpenDriver : XLStatus; stdcall;

{-------------------------------------------------------------------------------
xlCloseDriver ():
--------------------------------------------------------------------------------
The driver is closed.
This is used to unload the driver, if no more application is useing it.
Does not close the open ports !!!
}
function xlCloseDriver : XLStatus; stdcall;

{-------------------------------------------------------------------------------
xlSetApplConfig():
xlGetApplConfig():
--------------------------------------------------------------------------------
// Handle the application configuration for VCANCONF.EXE


Returns the hwIndex, hwChannel and hwType for a specific Application and application channel.
This gives the ability to register own applications into the Vector
CAN DRIVER CONFIGURATION.
AppName: Zero terminated string containing the Name of the Application.
AppChannel: Channel of the application
hwType, hwIndex, hwChannel: contains the the hardware information on success.
This values can be used in a subsequent call to xlGetChannelMask or xlGetChannelIndex.
}

function xlGetApplConfig(
                  appName        : PChar;         //<! Name of Application
                  appChannel     : Longword;     //<! 0,1
                  var pHwType    : Longword;     //<! HWTYPE_xxxx
                  var pHwIndex   : Longword;     //<! Index of the hardware (slot) (0,1,...)
                  var pHwChannel : Longword;     //<! Index of the channel (connector) (0,1,...)
                  busType        : Longword      //<! Bus type of configuration, should be BUS_TYPE_NONE when no bus type is set
  ) : XLStatus; stdcall;

function xlSetApplConfig(
                  appName        : PChar;         //<! Name of Application
                  appChannel     : Longword;     //<! 0,1
                  pHwType        : Longword;     //<! HWTYPE_xxxx
                  pHwIndex       : Longword;     //<! Index of the hardware (slot) (0,1,...)
                  pHwChannel     : Longword;     //<! Index of the channel (connector) (0,1,...)
                  busType        : Longword      //<! Bus type of configuration, should be BUS_TYPE_NONE when no bus type is set
  ) : XLStatus; stdcall;

{-------------------------------------------------------------------------------
xlGetDriverConfig():
--------------------------------------------------------------------------------
The application gets the information, which
channels are available in the system. The user
must provide the memory (pointer to XLdriverConfig structure).
}

function xlGetDriverConfig(var pDriverConfig : XLdriverConfig) : XLStatus; stdcall;

{-------------------------------------------------------------------------------
xlGetChannelIndex():
xlGetChannelMask():
--------------------------------------------------------------------------------

Get the channel index for a channel of a certain hardware.
Parameter -1 means "don't care"
Result -1 (xlGetChannelIndex) or 0 (xlGetChannelMask) means "not found"
}

{
#ifdef DYNAMIC_XLDRIVER_DLL
  typedef int (_XL_EXPORT_API *XLGETCHANNELINDEX) (
    int hwType,     // [-1,HWTYPE_CANCARDX,HWTYPE_VIRTUAL,...]
    int hwIndex,    // [-1,0,1]
    int hwChannel   // [-1,0,1]
  );

  typedef XLaccess (_XL_EXPORT_API *XLGETCHANNELMASK) (
    int hwType,     // [-1,HWTYPE_CANCARDX,HWTYPE_VIRTUAL,...]
    int hwIndex,    // [-1,0,1]
    int hwChannel   // [-1,0,1]
  );
#else
  int _XL_EXPORT_DECL xlGetChannelIndex(
    int hwType,     // [-1,HWTYPE_CANCARDX,HWTYPE_VIRTUAL,...]
    int hwIndex,    // [-1,0,1]
    int hwChannel   // [-1,0,1]
  );

  XLaccess _XL_EXPORT_DECL xlGetChannelMask(
    int hwType,     // [-1,HWTYPE_CANCARDX,HWTYPE_VIRTUAL,...]
    int hwIndex,    // [-1,0,1]
    int hwChannel   // [-1,0,1]
  );
#endif
}

{-------------------------------------------------------------------------------
xlOpenPort():
--------------------------------------------------------------------------------
The application tells the driver to which channels
it wants to get access to and which of these channels
it wants to get the permission to initialize the channel (on input must be
in variable where pPermissionMask points).
Only one port can get the permission to initialize a channel.
The port handle and permitted init access is returned.
}

function xlOpenPort(
                var pPortHandle     : XLportHandle;
                userName            : PChar;
                accessMask          : XLaccess;
                var pPermissionMask : XLaccess;
                rxQueueSize         : Longword;
                xlInterfaceVersion  : Longword;
                busType : Longword) : XLStatus; stdcall;

{-------------------------------------------------------------------------------
xlSetTimerRate():
--------------------------------------------------------------------------------
The timer of the port will be activated/deacticated and the
rate for cyclic timer events is set (10us resolution).
}

function xlSetTimerRate(
                  portHandle : XLportHandle;
                  timerRate  : Longword) : XLStatus; stdcall;

{------------------------------------------------------------------------------
xlResetClock():
--------------------------------------------------------------------------------
The clock generating timestamps for the port will be reset
}
function xlResetClock(portHandle : XLportHandle) : XLStatus; stdcall;

{-------------------------------------------------------------------------------
xlSetNotification():
--------------------------------------------------------------------------------
Setup a event to notify the application if there are messages in the
ports receive queue.
queueLevel specifies the number of messages that triggeres the event.
Note that the event is triggered only once, when the queueLevel is
reached. An application should read all available messages by xlReceive
to be sure to reenable the event. The API generates the handle by
itself. For LIN the queueLevel is fix to one.
}
function xlSetNotification(
                  portHandle : XLportHandle;
                  var handle : XLhandle;
                  queueLevel : Integer) : XLStatus; stdcall;

{-------------------------------------------------------------------------------
xlFlushReceiveQueue():
--------------------------------------------------------------------------------
The receive queue of the port will be flushed.
}
function xlFlushReceiveQueue(portHandle : XLportHandle) : XLStatus; stdcall;


{-------------------------------------------------------------------------------
xlGetReceiveQueueLevel():
--------------------------------------------------------------------------------
The count of events in the receive queue of the port will be returned.
}
function xlGetReceiveQueueLevel(
                  portHandle : XLportHandle;
                  var level : Integer) : XLStatus; stdcall;

{------------------------------------------------------------------------------
xlActivateChannel():
--------------------------------------------------------------------------------
The selected channels go 'on the bus'. Type of the bus is specified by busType parameter.
Additional parameters can be specified by flags parameter.
}
function xlActivateChannel(
                  portHandle : XLportHandle;
                  accessMask : XLaccess;
                  busType    : Longword;
                  flags      : Longword)  : XLStatus; stdcall;

{------------------------------------------------------------------------------
xlReceive():
--------------------------------------------------------------------------------
The driver is asked to retrieve burst of Events from the
application's receive queue. This function is optimized
for speed. pEventCount on start must contain size of the buffer in
messages, on return it sets number of realy received messages (messages
written to pEvents buffer).
Application must allocate pEvents buffer big enough to hold number of
messages requested by pEventCount parameter.
It returns VERR_QUEUE_IS_EMPTY and *pEventCount=0 if no event
was received.
The function only works for CAN, LIN, DAIO. For MOST there is a different
function
}
function  xlReceive(
                  portHandle : XLportHandle;
                  var pEventCount : Longword;
                  var pEvents : XLevent) : XLStatus; stdcall;

{-------------------------------------------------------------------------------
xlGetErrorString():
xlGetEventString():
--------------------------------------------------------------------------------
Utility Functions
}
function  xlGetErrorString( err : XLstatus) : XLstringType; stdcall;
function  xlGetEventString( var pEv : XLevent) : XLstringType; stdcall;


{------------------------------------------------------------------------------
xlOemContact():
--------------------------------------------------------------------------------
}
function  xlOemContact(
                  portHandle : XLportHandle;
                  Channel  : Longword;
                  context1 : XLuint64;
                  var context2 : XLuint64) : XLStatus; stdcall;

{-------------------------------------------------------------------------------
xlGetSyncTime():
--------------------------------------------------------------------------------
Function is reading high precision (1ns) card time used for time synchronization
of Party Line trigger (sync line).
}
function  xlGetSyncTime(
                  portHandle : XLportHandle;
                  var pTime : XLuint64) : XLStatus; stdcall;

{-------------------------------------------------------------------------------
xlGenerateSyncPulse():
--------------------------------------------------------------------------------
Activates short sync pulse on desired channel. Channels mask should not
define two channels of one hardware.
}

function  xlGenerateSyncPulse(
                  portHandle : XLportHandle;
                  accessMask : XLaccess) : XLStatus; stdcall;

{-------------------------------------------------------------------------------
xlPopupHwConfig():
--------------------------------------------------------------------------------
}
function xlPopupHwConfig(
                  callSign : PChar;
                  waitForFinish : Longword) : XLStatus; stdcall;

{-------------------------------------------------------------------------------
xlDeactivateChannel():
--------------------------------------------------------------------------------
The selected channels go 'off the bus'.
Its now possible to initialize
}
function xlDeactivateChannel( portHandle :XLportHandle; accessMask : XLaccess ) : XLStatus; stdcall;

{-------------------------------------------------------------------------------
xlClosePort():
--------------------------------------------------------------------------------
The port is closed, channels are deactivated.
}
function xlClosePort( portHandle :XLportHandle ) : XLStatus; stdcall;

{
////////////////////////////////////////////////////////////////////////////////
// CAN functions
////////////////////////////////////////////////////////////////////////////////
/*------------------------------------------------------------------------------
xlCanFlushTransmitQueue():
// TODO: fr MOST nutzen
--------------------------------------------------------------------------------
The transmit queue of the selected channel will be flushed.
*/

DECL_STDXL_FUNC ( xlCanFlushTransmitQueue, XLCANFLUSHTRANSMITQUEUE, (
                  XLportHandle portHandle, XLaccess    accessMask)
                  );
                 

/*------------------------------------------------------------------------------
xlCanSetChannelOutput():
--------------------------------------------------------------------------------
The output mode for the CAN chips of the channels defined by accessMask, is set
to OUTPUT_MODE_NORMAL or OUTPUT_MODE_SILENT.
The port must have init access to the channels.
*/

DECL_STDXL_FUNC ( xlCanSetChannelOutput, XLCANSETCHANNELOUTPUT,  (
                  XLportHandle portHandle,
                  XLaccess   accessMask,
                  int        mode)
                  );


/*------------------------------------------------------------------------------
xlCanSetChannelMode():
--------------------------------------------------------------------------------
For the CAN channels defined by AccessMask is set
whether the caller will get a TX and/or a TXRQ
receipt for transmitted messages.
The port must have init access to the channels.
*/

DECL_STDXL_FUNC ( xlCanSetChannelMode, XLCANSETCHANNELMODE, (
                  XLportHandle    portHandle,
                  XLaccess        accessMask,
                  int             tx,
                  int             txrq)
                 );

/*------------------------------------------------------------------------------
xlCanSetReceiveMode():
--------------------------------------------------------------------------------
*/

DECL_STDXL_FUNC (xlCanSetReceiveMode, XLCANSETRECEIVEMODE, (
                 XLportHandle    Port,        // Port Handle
                 byte   ErrorFrame,  // suppress Error Frames
                 byte   ChipState    // suppress Chip States
                 )
                 );


/*------------------------------------------------------------------------------
xlCanSetChannelTransceiver():
--------------------------------------------------------------------------------
The transceiver mode for the channels defined by accessMask, is set.
The port must have init access to the channels.
*/

DECL_STDXL_FUNC ( xlCanSetChannelTransceiver, XLCANSETCHANNELTRANSCEIVER, (
                  XLportHandle  portHandle,
                  XLaccess      accessMask,
                  int           type,
                  int           lineMode,
                  int           resNet)
                  );

//------------------------------------------------------------------------------
// xlCanSetChannelParams():
// xlCanSetChannelParamsC200():
// xlCanSetChannelBitrate():
//------------------------------------------------------------------------------
// The channels defined by accessMask will be initialized with the
// given parameters.
// The port must have init access to the channels.

}
function xlCanSetChannelParams(
                  portHandle : XLportHandle;
                  accessMask : XLaccess;
                  var pChipParams : XLchipParams
                  ) : XLStatus; stdcall;

function xlCanSetChannelParamsC200(
                  portHandle : XLportHandle;
                  accessMask : XLaccess;
                  btr0 : byte;
                  btr1 : byte) : XLStatus; stdcall;

function xlCanSetChannelBitrate(
                  portHandle : XLportHandle;
                  accessMask : XLaccess;
                  bitrate : Longword) : XLStatus; stdcall;


{-------------------------------------------------------------------------------
xlCanSetAcceptance():
--------------------------------------------------------------------------------
Set the acceptance filter
Filters for std and ext ids are handled independant in the driver.
Use mask=$FFFF,code=$FFFF or mask=$FFFFFFFF,code=$FFFFFFFF to fully close
the filter.
}
function xlCanSetChannelAcceptance(
                  portHandle : XLportHandle;
                  accessMask : XLaccess;
                  code : Longword;
                  mask : Longword;
                  idRange : Longword ) : XLStatus; stdcall;



{------------------------------------------------------------------------------
xlCanAddAcceptanceRange():
xlCanRemoveAcceptanceRange():
xlCanResetAcceptance():
-------------------------------------------------------------------------------}
function xlCanAddAcceptanceRange(
                  portHandle : XLportHandle;
                  accessMask : XLaccess;
                  first_id   : Longword;
                  last_id    : Longword) : XLStatus; stdcall;

function xlCanRemoveAcceptanceRange(
                  portHandle : XLportHandle;
                  accessMask : XLaccess;
                  first_id : Longword;
                  last_id  : Longword) : XLStatus; stdcall;

function xlCanResetAcceptance(
                  portHandle : XLportHandle;
                  accessMask : XLaccess;
                  idRange    : Longword    ) : XLStatus; stdcall;

{
/*------------------------------------------------------------------------------
xlCanRequestChipState():
--------------------------------------------------------------------------------
The state of the selected channels is requested.
The answer will be received as an event (XL_CHIP_STATE).
*/

DECL_STDXL_FUNC ( xlCanRequestChipState, XLCANREQUESTCHIPSTATE, (
                  XLportHandle portHandle,
                  XLaccess    accessMask)
                );

/*------------------------------------------------------------------------------
xlCanTransmit():                                                                            
--------------------------------------------------------------------------------
This function is designed to send different messages to supported bus.
Usualy pEvents is a pointer to XLevent array. pEvents points to variable
which contains information about how many messages should be transmitted
to desired channels. It must be less or same as pEventCount buffer size
in messages. On return function writes number of transmitted messages
(moved to device queue for transmitting). 

*/
}
function xlCanTransmit(
                  portHandle : XLportHandle;
                  accessMask : XLaccess;
                  var pEventCount : Longword;
                  pEvents : Pointer) : XLStatus; stdcall;


{-------------------------------------------------------------------------------
xlSetGlobalTimeSync():
--------------------------------------------------------------------------------
To query and change the globale time sync setting 
*/
DECL_STDXL_FUNC ( xlSetGlobalTimeSync, XLSETGLOBALTIMESYNC, (unsigned long newValue, 
                                                             unsigned long *previousValue));



/*------------------------------------------------------------------------------
xlCheckLicense():
--------------------------------------------------------------------------------
For all channels the port wants to use it is checked wether
the hardware is licensed for the type of application.
If not the application should terminate.
*/

DECL_STDXL_FUNC ( xlCheckLicense, XLCHECKLICENSE, (
                  XLportHandle    portHandle,
                  XLaccess       accessMask,
                  unsigned long  protectionCode)
                  );

////////////////////////////////////////////////////////////////////////////////
// LIN functions
////////////////////////////////////////////////////////////////////////////////
 
DECL_STDXL_FUNC( xlLinSetChannelParams, XLLINSETCHANNELPARAMS,  (XLportHandle portHandle, XLaccess accessMask, XLlinStatPar vStatPar));
DECL_STDXL_FUNC( xlLinSetDLC,           XLLINSETDLC,            (XLportHandle portHandle, XLaccess accessMask, byte dlc[64]));
DECL_STDXL_FUNC( xlLinSetSlave,         XLLINSETSLAVE,          (XLportHandle portHandle, XLaccess accessMask, byte linId, byte data[8], byte dlc, word checksum));
DECL_STDXL_FUNC( xlLinSendRequest,      XLLINSENDREQUEST,       (XLportHandle portHandle, XLaccess accessMask, byte linId, Longword flags));
DECL_STDXL_FUNC( xlLinSetSleepMode,     XLLINSETSLEEPMODE,      (XLportHandle portHandle, XLaccess accessMask, Longword flags, byte linId));
DECL_STDXL_FUNC( xlLinWakeUp,           XLLINWAKEUP,            (XLportHandle portHandle, XLaccess accessMask));
DECL_STDXL_FUNC( xlLinSetChecksum,      XLLINSETCHECKSUM,       (XLportHandle portHandle, XLaccess accessMask, byte checksum[60]));
DECL_STDXL_FUNC( xlLinSwitchSlave,      XLLINSWITCHSLAVE,       (XLportHandle portHandle, XLaccess accessMask, byte linID, byte mode));

////////////////////////////////////////////////////////////////////////////////
// DAIO Function Declarations
////////////////////////////////////////////////////////////////////////////////

DECL_STDXL_FUNC (xlDAIOSetPWMOutput             , XLDAIOSETPWMOUTPUT,             (XLportHandle portHandle, XLaccess accessMask, Longword frequency,   Longword value)); 
DECL_STDXL_FUNC (xlDAIOSetDigitalOutput         , XLDAIOSETDIGITALOUTPUT,         (XLportHandle portHandle, XLaccess accessMask, Longword outputMask,  Longword valuePattern));
DECL_STDXL_FUNC (xlDAIOSetAnalogOutput          , XLDAIOSETANALOGOUTPUT,          (XLportHandle portHandle, XLaccess accessMask, Longword analogLine1,  Longword analogLine2,  Longword analogLine3,  Longword analogLine4));
DECL_STDXL_FUNC (xlDAIORequestMeasurement       , XLDAIOREQUESTMEASUREMENT,       (XLportHandle portHandle, XLaccess accessMask));
DECL_STDXL_FUNC (xlDAIOSetDigitalParameters     , XLDAIOSETDIGITALPARAMETERS,     (XLportHandle portHandle, XLaccess accessMask, Longword inputMask,   Longword outputMask));
DECL_STDXL_FUNC (xlDAIOSetAnalogParameters      , XLDAIOSETANALOGPARAMETERS,      (XLportHandle portHandle, XLaccess accessMask, Longword inputMask,   Longword outputMask,   Longword highRangeMask));
DECL_STDXL_FUNC (xlDAIOSetAnalogTrigger         , XLDAIOSETANALOGTRIGGER,         (XLportHandle portHandle, XLaccess accessMask, Longword triggerMask, Longword triggerLevel, Longword triggerEventMode));
DECL_STDXL_FUNC (xlDAIOSetMeasurementFrequency  , XLDAIOSETMEASUREMENTFREQUENCY,  (XLportHandle portHandle, XLaccess accessMask, Longword measurementInterval)); 
DECL_STDXL_FUNC (xlDAIOSetDigitalTrigger        , XLDAIOSETDIGITALTRIGGER,        (XLportHandle portHandle, XLaccess accessMask, Longword triggerMask));

////////////////////////////////////////////////////////////////////////////////
// extern declaration for dynamically linking... for funktions without the macro
////////////////////////////////////////////////////////////////////////////////

#ifdef DYNAMIC_XLDRIVER_DLL
#  ifndef DO_NOT_DEFINE_EXTERN_DECLARATION

    XLstatus xlOpenDriver(void);
    XLstatus xlCloseDriver(void);

    extern XLGETCHANNELINDEX          xlGetChannelIndex;
    extern XLGETCHANNELMASK           xlGetChannelMask;

    extern XLGETEVENTSTRING           xlGetEventString;
    extern XLGETERRORSTRING           xlGetErrorString;
    
#  endif
#endif

////////////////////////////////////////////////////////////////////////////////
// MOST Function Declarations
////////////////////////////////////////////////////////////////////////////////

//  apiname, apitype, parameters in paranthesis

/**
 *  Common principles:
 *    If not mentioned otherwise, all APIs are asynchronous and will trigger an action in VN2600.
 *    Results are delivered in events which can be fetched by xlMostReceive.
 *    
 *  Common Parameters: DEFPARAMS
 *    XLportHandle portHandle:             was previously fetched by xlOpenPort API.
 *    XLaccess accessMask:                 determines on which channels an API should work.
 *    XLuserHandle userHandle:             used to match the response of the driver to the requests of the application
 *                                         if an event is received spontaneously, e.g. MPR changed then the userHandle == 0
 *  Common Return Value:
 *    XLstatus:                            common return value of most APIs which indicates whether a command was 
 *                                         successfully launched or e.g. whether a command queue overflow happend
 */

/** \brief fetching events from driver queue.
 *  This method is used to fetch all events, either bus events or acknowledgements 
 *  for commands from the driver queue. \n
 *  It is a synchronous mode and either delivers event data immediately, or
 *  indicates an error condition with its return value
 *  \param  XLportHandle portHandle:       was previously fetched by xlOpenPort API (TODO)
 *  \param  XLaccess accessMask:           determines on which channels an API should work (TODO)
 *  \param  pEventBuffer [IN,OUT]          This parameter must point to a buffer to which the driver can copy 
 *                                         all events of the receive queue
 */
DECL_STDXL_FUNC( xlMostReceive,            XLFP_MOSTRECEIVE,           (XLportHandle portHandle, XLmostEvent* pEventBuffer));

/** \brief Activates or deactivates the different event sources of VN2600.
 *  This method is used to select which bus events should be delivered by VN2600.
 *  Either CtrlNode, CtrlSpy, AsyncNode or AsyncSpy messages \n
 *  ResponseEvent:                         XL_MOST_EVENTSOURCES
 *  \param sourceMask                 [IN] each bit stands for an event source and can separately be set. 
 *                                         Use the definitions of the sourcemask...
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostSwitchEventSources, XLFP_MOSTSWITCHEVENTSOURCES,(DEFPARAMS, word sourceMask));

/** \brief Activates or deactivates the bypass of the OS8104.
 *  This method is used to switch the Bypass OS8104 (register TODO:) on and off \n
 *  ResponseEvent:                         XL_MOST_ALLBYPASS
 *  \param  bypassMode                [IN] bypass open/close
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostSetAllBypass,       XLFP_MOSTSETALLBYPASS,      (DEFPARAMS, byte bypassMode));

/** \brief Reads out the bypass mode of the OS8104.
 *  This method is asynchronous and requests the event used to switch the Bypass OS8104.
 *  ResponseEvent:                         XL_MOST_ALLBYPASS
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostGetAllBypass,       XLFP_MOSTGETALLBYPASS,      (DEFPARAMS));

/** \brief Switches the OS8104 into slave or master mode.
 *  This method is used to switch the OS8104 into the timing master or slave mode\n
 *  ResponseEvent:                         XL_MOST_TIMINGMODE
 *  \param  timingMode                [IN] MOST master/slave
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostSetTimingMode,      XLFP_MOSTSETTIMINGMODE,     (DEFPARAMS, byte timingMode));

/** \brief Triggers the event XL_MOST_TIMINGMODE.
 *  This method is used to trigger the event XL_MOST_TIMINGMODE, which will deliver
 *  information whether the OS8104 is configured in slave or master mode.\n
 *  ResponseEvent:                         XL_MOST_TIMINGMODE
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostGetTimingMode,      XLFP_MOSTGETTIMINGMODE,     (DEFPARAMS));

/** \brief Selects the MOST frequency either to 44.1 kHz or 48 kHz.
 *  This method is used to select either 44.1 kHz or 48 kHz as 
 *  bus clock when the OS8104 of VN2600 acts as timing master \n
 *  ResponseEvent:                         XL_MOST_FREQUENCY
 *  \param  frequency                 [IN] 44,1kHz, 48kHz
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostSetFrequency,       XLFP_MOSTSETFREQUENCY,      (DEFPARAMS, word frequency));

/** \brief Triggers the event XL_MOST_FREQUENCY.
 *  This method is used to trigger the event XL_MOST_FREQUENCY, which will deliver
 *  information whether the OS8104 of VN2600 as timing master 
 *  generates 44.1 kHz or 48 kHz as bus clock.\n
 *  ResponseEvent:                         XL_MOST_FREQUENCY
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostGetFrequency,       XLFP_MOSTGETFREQUENCY,      (DEFPARAMS));

/** \brief Allows to write up to 16 byte register in the OS8104.
 *  This method is used to write numbyte (up to 16) bytes into the registers of the OS8104 
 *  beginning from adr. \n
 *  ResponseEvent:                         XL_MOST_REGISTER_BYTES
 *  \param  adr                       [IN] address (MAP) of register to which the first byte is written
 *  \param  numBytes                  [IN] number of successive bytes to be written to the registers
 *  \param  data                      [IN] bytes to be written 
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostWriteRegister,      XLFP_MOSTWRITEREGISTER,     (DEFPARAMS, word adr, byte numBytes, byte data[16]));

/** \brief Triggers the event XL_MOST_REGISTER_BYTES.
 *  This method is used to read out registers of the OS8104.
 *  The results will be delivered in the event XL_MOST_REGISTER_BYTES\n
 *  ResponseEvent:                         XL_MOST_REGISTER_BYTES
 *  \param  adr                       [IN] address (MAP) of register from which the first byte is read
 *  \param  numBytes                  [IN] number of successive bytes to be read
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostReadRegister,       XLFP_MOSTREADREGISTER,      (DEFPARAMS, word adr, byte numBytes));

/** \brief Allows to write single or multiple bits of one byte register in the OS8104.
 *  This method is used to write bits into a register of the OS8104 \n
 *  ResponseEvent:                         XL_MOST_REGISTER_BYTES
 *  \param  adr                       [IN] address (MAP) of the register
 *  \param  mask                      [IN] each bit in mask corresponds to a bit in the register. 
 *                                         1 means this bit will be written, 0 means that the bit is not influenced
 *  \param  value                     [IN] the byte to be written respecting the parameter mask
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostWriteRegisterBit,   XLFP_MOSTWRITEREGISTERBIT,  (DEFPARAMS, word adr, byte mask, byte value));

/** \brief Sending a MOST Ctrl Message.
 *  This method is used to send a ctrl message to the MOST ring. 
 *  The members ctrlType, targetAdr, ctrlData[17], TODO: prio of pCtrlMsg will be used,
 *  all other members don't care for the transmit request. 
 *  A XL_MOST_CTRL_MSG event will be delivered with dir==Tx and txStatus set to 
 *  report success or failure of the transmission.\n
 *  ResponseEvent:                         XL_MOST_CTRL_MSG
 *  \param  pCtrlMsg                  [IN] structure with all relevant data needed for a transmit request
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostCtrlTransmit,       XLFP_MOSTCTRLTRANSMIT,      (DEFPARAMS, XLmostCtrlMsg* pCtrlMsg));

/** \brief Sending a MOST Async Message (Packet).
 *  This method is used to send an asynchronous message (packet) to the MOST ring. 
 *  The members arbitration, targetAdr, asyncData[1014], length, TODO: prio of pAsyncMsg will be used,
 *  all other members don't care for the transmit request. 
 *  TODO: arbitration has to be calculated by the sender or will be calculated by the driver/firmware?
 *  A XL_MOST_ASYNC_MSG event will be delivered with dir==Tx and txStatus set to
 *  report success or failure of the transmission.\n
 *  ResponseEvent:                         XL_MOST_ASYNC_MSG
 *  \param  pAsyncMsg                 [IN] structure with all relevant data needed for a transmit request
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostAsyncTransmit,      XLFP_MOSTASYNCTRANSMIT,     (DEFPARAMS, XLmostAsyncMsg* pAsyncMsg));

/** \brief Triggers the event XL_MOST_SYNC_ALLOCTABLE.
 *  This method is used to trigger the event XL_MOST_SYNC_ALLOCTABLE,
 *  which delivers the complete allocation table of the OS8104.\n
 *  ResponseEvent:                         XL_MOST_SYNC_ALLOCTABLE
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostSyncGetAllocTable,  XLFP_MOSTSYNCGETALLOCTABLE, (DEFPARAMS));

/** \brief Programming the routing egine (RE) for audio channels.
 *  This method is used to program the routing engine (RE) of the OS8104 in order
 *  to either stream audio data from the line in of VN2600 to certain MOST channels allocated before, 
 *  or to stream audio data from certain MOST channels to the headphone output of VN2600. \n
 *  ResponseEvent:                         XL_MOST_CTRL_SYNC_AUDIO
 *  \param  channel[4]                [IN] channel numbers to be routed
 *  \param  device                    [IN] device, e.g.: audio line in/audio line out
 *  \param  mode                      [IN] audio mode
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostCtrlSyncAudio,      XLFP_MOSTCTRLSYNCAUDIO,     (DEFPARAMS, Longword channel[4], Longword device, Longword mode));

/** \brief Programming the routing egine (RE) for audio channels.
 *  This method is used to program the routing engine (RE) of the OS8104 in order
 *  to either stream audio data from the line in of VN2600 to certain MOST channels allocated before, 
 *  or to stream audio data from certain MOST channels to the headphone output of VN2600. \n
 *  ResponseEvent:                         XL_MOST_CTRL_SYNC_AUDIO_EX
 *  \param  channel[16]               [IN] channel numbers to be routed (including SPDIF)
 *  \param  device                    [IN] device, e.g.: audio line in/audio line out, SPDIF in/out
 *  \param  mode                      [IN] audio mode
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostCtrlSyncAudioEx,      XLFP_MOSTCTRLSYNCAUDIOEX, (DEFPARAMS, Longword channel[16], Longword device, Longword mode));

/** \brief Setting the volume/attenuation for line in and line out.
 *  This method is used to set the volume/attenuation of the line in or line out of VN2600.\n
 *  ResponseEvent:                         XL_MOST_SYNC_VOLUME_STATUS
 *  \param  device                    [IN] device, e.g.: audio line in/audio line out
 *  \param  volume                    [IN] 0..255: 0..100% of volume
 *  \return XLstatus general status information
*/
DECL_STDXL_FUNC( xlMostSyncVolume,         XLFP_MOSTSYNCVOLUME,        (DEFPARAMS, Longword device, byte volume));

/** \brief Setting mute for line in and line out.
 *  This method is used to switch mute on or off for the line in or line out of VN2600.\n
 *  ResponseEvent:                         XL_MOST_SYNC_VOLUME_STATUS
 *  \param  device                    [IN] device, e.g.: audio line in/audio line out  
 *  \param  mute                      [IN] mute on/mute off
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostSyncMute,           XLFP_MOSTSYNCMUTE,          (DEFPARAMS, Longword device, byte mute));

/** \brief Triggers the event XL_MOST_SYNC_VOLUME_STATUS.
 *  This method is used to trigger the event XL_MOST_SYNC_VOLUME_STATUS,
 *  which delivers the information about volume status of line in and line out.\n
 *  ResponseEvent:                         XL_MOST_SYNC_VOLUME_STATUS
 *  \param  device                    [IN] device, e.g.: audio line in/audio line out  
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostSyncGetVolumeStatus,XLFP_MOSTSYNCGETVOLUMESTATUS,(DEFPARAMS, Longword device));

/** \brief Triggers the event XL_MOST_SYNC_MUTE_STATUS.
 *  This method is used to trigger the event XL_MOST_SYNC_MUTE_STATUS,
 *  which delivers the information about mute status of line in and line out.\n
 *  ResponseEvent:                         XL_MOST_SYNC_MUTE_STATUS
 *  \param  device                    [IN] device, e.g.: audio line in/audio line out    
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostSyncGetMuteStatus,  XLFP_MOSTSYNCGETMUTESTATUS,(DEFPARAMS, Longword device));

/** \brief Triggers the event XL_MOST_SYNC_MUTE_STATUS.
 *  This method delivers the recent light status at the Rx Pin of the OS8104.\n
 *  ResponseEvent:                         XL_MOST_SYNC_MUTE_STATUS
 *  \param  device                    [IN] device, e.g.: audio line in/audio line out    
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostGetRxLight,         XLFP_MOSTGETRXLIGHT,        (DEFPARAMS));

/** \brief Switching the Tx light of VN2600.
 *  This method is used to switch the Tx light of VN2600 off, to normal or to constant on\n
 *  ResponseEvent:                         XL_MOST_TXLIGHT
 *  \param  txLight                   [IN] tx light on, off or modulated
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostSetTxLight,         XLFP_MOSTSETTXLIGHT,        (DEFPARAMS, byte txLight));

/** \brief Triggers the event XL_MOST_TXLIGHT.
 *  This method is used to trigger the event XL_MOST_TXLIGHT,
 *  which delivers the recent light status at the Tx Pin of the OS8104.\n
 *  ResponseEvent:                         XL_MOST_TXLIGHT
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostGetTxLight,         XLFP_MOSTGETTXLIGHT,        (DEFPARAMS));

/** \brief Switching the Tx light power of the FOT.
 *  This method is used to switch the Tx light power of the FOT to normal or -3 dB\n
 *  ResponseEvent:                         XL_MOST_TXLIGHT
 *  \param  attenuation               [IN] tx power
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostSetLightPower,      XLFP_MOSTSETLIGHTPOWER,     (DEFPARAMS, byte attenuation));

// TODO: GetLightPower??

/** \brief Triggers the event XL_MOST_LOCKSTATUS.
 *  This method is used to trigger the event XL_MOST_LOCKSTATUS,
 *  which delivers the recent lock status at the Rx Pin of the OS8104.\n
 *  ResponseEvent:                         XL_MOST_LOCKSTATUS
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostGetLockStatus,      XLFP_MOSTGETLOCKSTATUS,     (DEFPARAMS));

/** \brief Starts and stops the light error generator.
 *  This method is used to start (repeat>0) or stop (repeat==0) the light error generator
 *  which switches the Tx light on and off or configured periods.\n
 *  ResponseEvent:                         XL_MOST_GENLIGHTERROR
 *  \param  lightOffTime              [IN] duration of light off in ms
 *  \param  lightOnTime               [IN] duration of modulated light on in ms
 *  \param  repeat                    [IN] repetition of light on light off sequence, or repeat==0: stop the generation
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostGenerateLightError, XLFP_MOSTGENERATELIGHTERROR,(DEFPARAMS, unsigned long lightOffTime, unsigned long lightOnTime, word repeat));

/** \brief Starts and stops the lock error generator.
 *  This method is used to start (repeat>0) or stop (repeat==0) the lock error generator
 *  which switches the Tx light between modulated on and permanent on for configured periods.\n
 *  ResponseEvent:                         XL_MOST_GENLOCKERROR 
 *  \param  unmodTime                 [IN] duration of light off in ms
 *  \param  modTime                   [IN] duration of modulated light on in ms
 *  \param  repeat                    [IN] repetition of sequence, or repeat==0: stop the generation
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostGenerateLockError,  XLFP_MOSTGENERATELOCKERROR, (DEFPARAMS, unsigned long unmodTime, unsigned long modTime, word repeat));

/** \brief prevent firmware from emptying the Rx buffer of the OS8104
 *  This method is used to Switch the stress mode on or off, where the 
 *  Rx buffer of the OS8104 is not emptied by the firmware
 *  which switches the Tx light between modulated on and permanent on for configured periods.\n
 *  ResponseEvent:                         XL_MOST_CTRL_RXBUFFER
 *  \param  bufferMode                [IN] specifies the buffer mode
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostCtrlRxBuffer,       XLFP_MOSTCTRLRXBUFFER,      (DEFPARAMS, word bufferMode));

/** \brief Twinkle the power led from the VN2600.
 *  ResponseEvent:                         none
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC( xlMostTwinklePowerLed,       XLFP_MOSTTWINKLEPOWERLED,      (DEFPARAMS)); 

/** \brief Prepares and configures busload generation with MOST control frames. 
 *  Attention: Has to be called before "xlMostCtrlGenerateBusload". 
 *  ResponseEvent:                         none 
 *  \param portHandle                 [IN] handle to port from which the information is requested 
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state 
 *  \param userHandle                 [IN] used to match the response of the driver to the requests of the application
 *                                         if an event is received spontaneously 
 *  \param pCtrlBusloadConfiguration  [IN] structure containg the ctrl msg used for busload generation and configuration,  
 *                                         it's storage has has to be supplied by the caller 
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC (xlMostCtrlConfigureBusload, XLFP_MOSTCTRLCONFIGUREBUSLOAD, (DEFPARAMS, 
                                                                             XLmostCtrlBusloadConfiguration* pCtrlBusloadConfiguration)); 

/** \brief Starts busload generation with MOST control frames. 
 *  Attention: "xlMostCtrlConfigureBusload" has to be called before. 
 *  ResponseEvent:                         XL_MOST_CTRL_BUSLOAD 
 *  \param portHandle                 [IN] handle to port from which the information is requested 
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state 
 *  \param userHandle                 [IN] used to match the response of the driver to the requests of the application
 *                                         if an event is received spontaneously 
 *  \param numberCtrlFrames           [IN] number of busload ctrl messages ($FFFFFFFF indicates infinite number of msgs) 
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC (xlMostCtrlGenerateBusload, XLFP_MOSTCTRLGENERATEBUSLOAD, (DEFPARAMS, unsigned long numberCtrlFrames)); 

/** \brief Prepares and configures busload generation of MOST asynchronous frames. 
 *  Attention: Has to be called before "xlMostAsyncGenerateBusload". 
 *  ResponseEvent:                         none 
 *  \param portHandle                 [IN] handle to port from which the information is requested
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state 
 *  \param userHandle                 [IN] used to match the response of the driver to the requests of the application
 *                                         if an event is received spontaneously 
 *  \param pAsyncBusloadConfiguration [IN] structure containg the async msg used for busload generation and configuration,  
 *                                         it's storage has has to be supplied by the caller 
 *  \return XLstatus                       general status information 
 */
DECL_STDXL_FUNC (xlMostAsyncConfigureBusload, XLFP_MOSTASYNCCONFIGUREBUSLOAD, (DEFPARAMS, 
                                                                               XLmostAsyncBusloadConfiguration* pAsyncBusloadConfiguration)); 

/** \brief Starts busload generation with MOST asynchronous frames. 
 *  Attention: "xlMostAsyncConfigureBusload" has to be called before. 
 *  ResponseEvent:                         XL_MOST_ASYNC_BUSLOAD 
 *  \param portHandle                 [IN] handle to port from which the information is requested 
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state 
 *  \param userHandle                 [IN] used to match the response of the driver to the requests of the application
 *                                         if an event is received spontaneously 
 *  \param numberAsyncFrames          [IN] number of busload async messages ($FFFFFFFF indicates infinite number of msgs) 
 *  \return XLstatus                       general status information
 */
DECL_STDXL_FUNC (xlMostAsyncGenerateBusload, XLFP_MOSTASYNCGENERATEBUSLOAD, (DEFPARAMS, unsigned long numberAsyncFrames)); 


/** \brief Opens a stream (Rx / Tx) for routing synchronous data to or from the MOST bus (synchronous channel). 
 *  Attention: Has to be called before "xlMostStreamBufferAllocate". 
 *  ResponseEvent:                         none 
 *  \param portHandle                 [IN] handle to port from which the information is requested 
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state 
 *  \param userHandle                 [IN] used to match the response of the driver to the requests of the application
 *                                         if an event is received spontaneously 
 *  \param pStreamOpen                [IN] structure containg the stream parameters - 
 *                                         it's storage has has to be supplied by the caller
 *  \return XLstatus                       general status information 
 */
DECL_STDXL_FUNC (xlMostStreamOpen,           XLFP_MOSTSTREAMOPEN,           (DEFPARAMS, XLmostStreamOpen* pStreamOpen)); 


/** \brief Closes an opened a stream (Rx / Tx) used for routing synchronous data to or from the MOST bus (synchronous channel). 
 *  ResponseEvent:                         none 
 *  \param portHandle                 [IN] handle to port from which the information is requested 
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state 
 *  \param userHandle                 [IN] used to match the response of the driver to the requests of the application
 *                                         if an event is received spontaneously 
 *  \param streamHandle               [IN] stream handle returned by xlMostStreamOpen
 *  \return XLstatus                       general status information 
 */
DECL_STDXL_FUNC (xlMostStreamClose,          XLFP_MOSTSTREAMCLOSE,           (DEFPARAMS, Longword streamHandle)); 


/** \brief Starts the streaming (Rx / Tx) of synchronous data to or from the MOST bus (synchronous channel). 
 *  Attention: Has to be called after "xlMostStreamOpen and xlMostStreamBufferAllocate" were called. 
 *  ResponseEvent:                         none
 *  \param portHandle                 [IN] handle to port from which the information is requested 
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state 
 *  \param userHandle                 [IN] used to match the response of the driver to the requests of the application
 *                                         if an event is received spontaneously 
 *  \param streamHandle               [IN] stream handle returned by xlMostStreamOpen
 *  \param syncChannels               [IN] synchronous channels (bytes) used for streaming.
 *  \return XLstatus                       general status information 
 */
DECL_STDXL_FUNC (xlMostStreamStart,          XLFP_MOSTSTREAMSTART,          (DEFPARAMS, Longword streamHandle, byte syncChannels[60])); 


/** \brief Stops the streaming (Rx / Tx) of synchronous data to or from the MOST bus (synchronous channel). 
 *  Attention: Has to be called before "xlMostStreamBufferDeallocate". 
 *  ResponseEvent:                         none 
 *  \param portHandle                 [IN] handle to port from which the information is requested 
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state
 *  \param userHandle                 [IN] used to match the response of the driver to the requests of the application
 *                                         if an event is received spontaneously 
 *  \param streamHandle               [IN] stream handle returned by xlMostStreamOpen
 *  \return XLstatus                       general status information 
 */
DECL_STDXL_FUNC (xlMostStreamStop,           XLFP_MOSTSTREAMSTOP,           (DEFPARAMS, Longword streamHandle));


/** \brief Allocates a buffer for streaming (RX / Tx) of synchronous data to or from the MOST bus (synchronous channel). 
 *  Attention: Has to be called before "xlMostStreamStart". 
 *  ResponseEvent:                         none
 *  \param portHandle                 [IN] handle to port from which the information is requested 
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state 
 *  \param userHandle                 [IN] used to match the response of the driver to the requests of the application
 *                                         if an event is received spontaneously 
 *  \param streamHandle               [IN] stream handle returned by xlMostStreamOpen
 *  \param ppBuffer                  [OUT] pointer to the buffer used for streaming
 *                                         memory allocation is done by the driver 
 *                                         has to be realeased by calling xlMostStreamBufferDeallocate
 *  \param pBufferSize               [OUT] buffer size.
 *  \return XLstatus                       general status information 
 */
DECL_STDXL_FUNC (xlMostStreamBufferAllocate, XLFP_MOSTSTREAMBUFFERALLOCATE, (DEFPARAMS, Longword streamHandle, byte** ppBuffer, Longword* pBufferSize)); 


/** \brief Deallocates any buffer allocated with "xlMostStreamBufferAllocate". 
 *  Attention: Has to be called before "xlMostStreamClose". Afterwards no buffer must be accessed!
 *  ResponseEvent:                         none 
 *  \param portHandle                 [IN] handle to port from which the information is requested
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state 
 *  \param userHandle                 [IN] used to match the response of the driver to the requests of the application
 *                                         if an event is received spontaneously 
 *  \param streamHandle               [IN] stream handle returned by xlMostStreamOpen
 *  \return XLstatus                       general status information 
 */
DECL_STDXL_FUNC (xlMostStreamBufferDeallocateAll, XLFP_MOSTSTREAMBUFFERDEALLOCATEALL, (DEFPARAMS, Longword streamHandle));


/** \brief Notifies the driver the next buffer to be used for streaming synchronous data to or from the MOST bus (synchronous channel). 
 *  ResponseEvent:                         none 
 *  \param portHandle                 [IN] handle to port from which the information is requested 
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state
 *  \param userHandle                 [IN] used to match the response of the driver to the requests of the application
 *                                         if an event is received spontaneously 
 *  \param streamHandle               [IN] stream handle returned by xlMostStreamOpen
 *  \param pBuffer                    [IN] pointer to the next buffer used for streaming
 *  \param filledBytes                [IN] size of  the next buffer to be used for streaming
 *  \return XLstatus                       general status information 
 */
DECL_STDXL_FUNC (xlMostStreamBufferSetNext, XLFP_MOSTSTREAMBUFFERSETNEXT, (DEFPARAMS, Longword streamHandle, byte* pBuffer, Longword filledBytes));


/** \brief Retrieves the stream information.
 *  This method is used to gather the recent stream state information.\n
 *  ResponseEvent:                         None 
 *  \param portHandle                 [IN] handle to port from which the information is requested
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state 
 *  \param userHandle                 [IN] used to match the response of the driver to the requests of the application
 *                                         if an event is received spontaneously 
 *  \param pStreamInfo               [OUT] Pointer to the stream information.
 *  \return XLstatus                       general status information 
 */
DECL_STDXL_FUNC (xlMostStreamGetInfo, XLFP_MOSTSTREAMGETINFO, (DEFPARAMS, XLmostStreamInfo* pStreamInfo)); 


/** \brief Clears the content of the buffer(s) which are not already sent.
 *  This method is used to clear the content of any TX streaming buffer which has not been sent yet.\n
 *  ResponseEvent:                         None
 *  \param portHandle                 [IN] handle to port from which the information is requested 
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state 
 *  \param userHandle                 [IN] used to match the response of the driver to the requests of the application
 *                                         if an event is received spontaneously
 *  \param streamHandle               [IN] stream handle returned by xlMostStreamOpen.
 *  \return XLstatus                       general status information 
 */
DECL_STDXL_FUNC (xlMostStreamBufferClearAll, XLFP_MOSTSTREAMBUFFERCLEARALL, (DEFPARAMS, Longword streamHandle)); 


////////////////////////////////////////////////////////////////////////////////
// FlexRay Function Declarations
////////////////////////////////////////////////////////////////////////////////

/** \brief Setup the FlexRay node
 *  ResponseEvent:                         
 *  \param portHandle                 [IN] handle specifying the port to be configured 
 *  \param accessMask                 [IN] mask specifying the port's channel 
 *  \param pxlClusterConfig           [IN] structure to the cluster config structure
 *  \return XLstatus                       general status information 
 */ 
 
DECL_STDXL_FUNC (xlFrSetConfiguration, XLFP_FRSETCONFIGURATION, (DEFFRPARAM, XLfrClusterConfig	*pxlClusterConfig));

/** \brief Get configuration of a FlexRay channel 
 *  ResponseEvent:                         
 *  \param portHandle                 [IN] handle to port from which the information is requested 
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the information
 *  \param XLfrChannelConfig         [OUT] pointer to the FlexRay channel configuration structure
 *  \return XLstatus                       general status information 
 */ 
 
DECL_STDXL_FUNC (xlFrGetChannelConfiguration, XLFP_FRGETCHANNELCONFIGURATION, (DEFFRPARAM, XLfrChannelConfig* pxlFrChannelConfig));

/** \brief Setup the FlexRay mode
 *  ResponseEvent:                         
 *  \param portHandle                 [IN] handle to port from which the information is requested 
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state 
 *  \param pxlFrMode                  [IN] structure to the FlexRay mode structure (e.g.: normal-, monitor-, clusterScan mode).
 *  \return XLstatus                       general status information
 */ 

DECL_STDXL_FUNC (xlFrSetMode, XLFP_FRSETMODE, (DEFFRPARAM, XLfrMode	*pxlFrMode));

/** \brief Initialize the cold start and define the sync event
 *  ResponseEvent:
 *  \param portHandle                 [IN] handle to port from which the information is requested
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state   
 *  \param pEventBuffer               [IN] pointer to the startup and sync frame
 *  \return XLstatus                       general status information 
 */ 

DECL_STDXL_FUNC (xlFrInitStartupAndSync, XLFP_FRINITSTARTUPANDSYNC, (DEFFRPARAM, XLfrEvent *pEventBuffer));

/** \brief setup the symbol window. 
 *  ResponseEvent:                         
 *  \param portHandle                 [IN] handle to port from which the information is requested
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state   
 *  \param frChannel                  [IN] FlexRay channel, like A,B, both...
 *  \param symbolWindowMask           [IN] symbol window mask like MTS.
 *  \return XLstatus                       general status information 
 */ 

DECL_STDXL_FUNC (xlFrSetupSymbolWindow, XLFP_FRSETUPSYMBOLWINDOW, (DEFFRPARAM, Longword frChannel, 
                                                                               Longword symbolWindowMask));
 
/** \brief Reads the FlexRay events
 *  ResponseEvent:                         
 *  \param portHandle                 [IN] handle to port from which the information is requested 
 *  \param pEventBuffer              [OUT] pointer to the FlexRay RX event
 *  \return XLstatus                       general status information 
 */

DECL_STDXL_FUNC (xlFrReceive, XLFP_FRRECEIVE, (XLportHandle portHandle, XLfrEvent *pEventBuffer)); 

/** \brief Transmit a FlexRay event
 *  ResponseEvent:                         
 *  \param portHandle                 [IN] handle to port from which the information is requested
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state   
 *  \param pEventBuffer               [IN] pointer to the FlexRay TX event
 *  \return XLstatus                       general status information 
 */

DECL_STDXL_FUNC (xlFrTransmit, XLFP_FRTRANSMIT, (DEFFRPARAM, XLfrEvent *pEventBuffer));

/** \brief
 *  ResponseEvent:                         
 *  \param portHandle                 [IN] handle to port from which the information is requested
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state   
 *  \param frChannel                  [IN] FlexRay channel. e.g. CHANNEL_A...
 *  \param mode                       [IN] transceiver mode. e.g. sleep
 *  \return XLstatus                       general status information 
 */ 

DECL_STDXL_FUNC (xlFrSetTransceiverMode, XLFP_FRSETTRANSCEIVERMODE, (DEFFRPARAM, Longword frChannel, Longword mode));

/** \brief 
 *  ResponseEvent:                         
 *  \param portHandle                 [IN] handle to port from which the information is requested
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state 
 *  \param symbolWindow               [IN] defines the symbol window (e.g. MTS).
 *  \return XLstatus                       general status information 
 */ 

DECL_STDXL_FUNC (xlFrSendSymbolWindow, XLFP_FRSENDSYMBOLWINDOW, (DEFFRPARAM, Longword symbolWindow));

/** \brief
 *  ResponseEvent:
 *  \param portHandle                 [IN] handle to port from which the information is requested
 *  \param accessMask                 [IN] mask specifying the port's channel from where to get the device's state
 *  \param mode                       [IN] specifies the spy mode: XL_FR_SPY_MODE_***
 *  \return XLstatus                       general status information
 */

DECL_STDXL_FUNC (xlFrActivateSpy, XLFP_FRACTIVATESPY, (DEFFRPARAM, Longword mode));

}


implementation

const
  DLL_Name = 'vxlapi.dll';

function xlOpenDriver;                external DLL_Name;
function xlCloseDriver;               external DLL_Name;
function xlGetApplConfig;             external DLL_Name;
function xlSetApplConfig;             external DLL_Name;
function xlGetDriverConfig;           external DLL_Name;

function xlOpenPort;                  external DLL_Name;
function xlPopupHwConfig;             external DLL_Name;
function xlDeactivateChannel;         external DLL_Name;

function xlSetTimerRate;              external DLL_Name;
function xlResetClock;                external DLL_Name;
function xlSetNotification;           external DLL_Name;
function xlFlushReceiveQueue;         external DLL_Name;
function xlGetReceiveQueueLevel;      external DLL_Name;
function xlActivateChannel;           external DLL_Name;
function xlClosePort;                 external DLL_Name;

function xlCanTransmit;               external DLL_Name;

function xlCanSetChannelParams;       external DLL_Name;
function xlCanSetChannelParamsC200;   external DLL_Name;
function xlCanSetChannelBitrate;      external DLL_Name;

function xlReceive;                   external DLL_Name;
function xlGetErrorString;            external DLL_Name;

function xlGetEventString;            external DLL_Name;
function xlOemContact;                external DLL_Name; 
function xlGetSyncTime;               external DLL_Name;
function xlGenerateSyncPulse;         external DLL_Name;


function xlCanAddAcceptanceRange;     external DLL_Name;
function xlCanRemoveAcceptanceRange;  external DLL_Name;
function xlCanResetAcceptance;        external DLL_Name;
function xlCanSetChannelAcceptance;   external DLL_Name;

end.
