/****************************************************************************************************/
/* General Overview                                                                                 */
/****************************************************************************************************/
/* Copyright (c)      2005 KOPF GmbH, Germany (All rights reserved)                                 */
/*                                                                                                  */
/* module name:       AID.cpp                                                                       */
/*                                                                                                  */
/* version:           V1.77                                                                         */
/*                                                                                                  */
/* abstract:          Interface Layer to FTDI-AI2                                                   */
/*                                                                                                  */
/****************************************************************************************************/

/****************************************************************************************************/
/* List Of Changes                                                                                  */
/****************************************************************************************************/
/*                                                                                                  */
/* classes of changes:                                                                              */
/*                                                                                                  */
/* N: new module                                            (V1.00)                                 */
/* F: functional development                                (V+.00)                                 */
/* E: error correction                                      (Vx.+0)                                 */
/* I: change because of changed interface to other modules  (Vx.+0)                                 */
/* O: optimization without functional change                (Vx.x+)                                 */
/*                                                                                                  */
/* list of changes (last change is above):                                                          */
/*                                                                                                  */
/* Class: F    V1.78   01.02.06 C.G.                                                                */
/* descript.:  - added functions for KCCP                                                           */
/*			   - added KAIController_Id																*/
/*             - added KAIController_MemInfo														*/
/*             - added KAIHardware_Reset                                                            */
/*                                                                                                  */
/* Class: F    V1.77   19.01.06 D.S.                                                                */
/* descript.:  - added functions for KSENT                                                          */
/*                                                                                                  */
/* Class: F    V1.76   12.12.05 J.H.                                                                */
/* descript.:  - added functions for KAIPWM                                                         */
/*                                                                                                  */
/* Class: F    V1.75   09.11.05 C.G.                                                                */
/* descript.:  - added function KAISoftware_String                                                  */
/*                                                                                                  */
/* Class: F    V1.74   15.09.05 D.S.                                                                */
/* descript.:  - added missing prototypes (_index)                                                  */
/*                                                                                                  */
/* Class: F    V1.73   07.09.05 J.H.                                                                */
/* descript.:  - added missing _stdcall -Conventions                                                */
/*                                                                                                  */
/* Class: F    V1.72   25.07.05 C.G.                                                                */
/* descript.:  - added KLINE part                                                                   */
/*                                                                                                  */
/* Class: F    V1.69   23.02.05 D.S.                                                                */
/* descript.:  - add *_Index functions for multiple AI in one program                               */
/*                                                                                                  */
/* Class: F    V1.68   14.02.05 D.S.                                                                */
/* descript.:  - corrected size in SSLP_Receive														*/
/*                                                                                                  */
/* Class: F    V1.67   02.12.04 D.S.                                                                */
/* descript.:  - Correct Response Handling (Length) for KCAN_Send_Ext() & K_CAN_Receive_Config()    */
/*                                                                                                  */
/* Class: F    V1.66   18.10.04 D.S.                                                                */
/* descript.:  - Correct KCAN_Send_Ext() 2xTX                                                       */
/*                                                                                                  */
/* Class: F    V1.65   15.10.04 D.S.                                                                */
/* descript.:  - Add KCAN_Send_Ext(), KCAN_Receive_Ext(), KCAN_Receive_Config                       */
/*                                                                                                  */
/* Class: F    V1.64   08.10.04 D.S.                                                                */
/* descript.:  - Add KCAN_Init_Reg(), add more logfile text                                         */
/*                                                                                                  */
/* Class: E    V1.63   01.09.04 D.S.                                                                */
/* descript.:  - bugfix in KAI_Open function, corrected FT_Write call                               */
/*                                                                                                  */
/* Class: F    V1.62   17.08.04 D.S.                                                                */
/* descript.:  - corrected KAI_Open function, set timeouts, latencytimer, reset device              */
/*                                                                                                  */
/* Class: F    V1.61   17.08.04 D.S.                                                                */
/* descript.:  - Add new KAI_List_Device / _Open / _Close functions, multi AI support               */
/*                                                                                                  */
/* Class: I    V1.60   16.02.04 M.S.                                                                */
/* descript.:  - Merge CAN and LIN branch                                                           */
/*                                                                                                  */
/* Class: E    V1.51   16.02.04 D.S.                                                                */
/* descript.:  - add forgotten break-command in SSLP_Receive()                                      */
/*                                                                                                  */
/* Class: I    V1.50   10.02.04 D.S.                                                                */
/* descript.:  - removed ft_open/close in KHardware_Info                                            */
/*                                                                                                  */
/* Class: I    V1.48   27.01.04 M.S.                                                                */
/* descript.:  - Extented EEPROM Access with Serial Number                                          */
/*             - Change Default EEPROM Values to 94mA                                               */
/*                                                                                                  */
/* Class: I    V1.47   26.01.04 M.S.                                                                */
/* descript.:  - Add LIN Buffer for Receive()                                                       */
/*             - add templates for other LIN functions                                              */
/*                                                                                                  */
/* Class: E    V1.46   21.01.04 M.S.                                                                */
/* descript.:  - add StepMotor Functions                                                            */
/*             - add Comment for integration of LIN Functions (AID V1.45)                           */
/*                                                                                                  */
/* Class: E    V1.44   09.12.03 M.S.                                                                */
/* descript.:  - add KCAN_Receive_Status                                                            */
/*             - add Log-File Function                                                              */
/*             - rework history                                                                     */
/*                                                                                                  */
/* Class: N    V1.00   03.04.03 KOPF-M.S.                                                           */
/* descript.:  new created                                                                          */
/*                                                                                                  */
/****************************************************************************************************/
/****************************************************************************************************/
/* List of Improvements                                                                             */
/****************************************************************************************************/
/*                                                                                                  */
/* - add function which writes sslp-data in a file for debugging                                    */
/*                                                                                                  */
/****************************************************************************************************/

#include "stdafx.h"
#include "stdio.h"
#include "ftd2xx.h"

#define LOGFILE_DISABLE


#define DLL_VERSION_HIGH  1
#define DLL_VERSION_LOW   80

#define SSLP_RX_BUFFER_SIZE 5000
#define CAN_RX_BUFFER_SIZE 1000
#define LIN_RX_BUFFER_SIZE 1000

#define SENT_RX_BUFFER_SIZE 1000
#define SENT_MAX_DATA 16
#define KCCP_TableMaxEntries 20
#define AI_MAX_DEVICES 8

#define SSLP_Receive_with_Timeout(a) time = GetTickCount(); \
	                                 while ((SSLP_rx_buffer_size<=(a))&&((GetTickCount()-time)<50)) \
		                              SSLP_Receive();
#define SSLP_Receive_with_Timeout_Long(a) time = GetTickCount(); \
	                                 while ((SSLP_rx_buffer_size<=(a))&&((GetTickCount()-time)<500)) \
		                              SSLP_Receive();
#define SSLP_Receive_Timeout()      (time==50)

typedef unsigned char AI_Device_Info[16]; 

// --- External AID.DLL functions ---

unsigned int _stdcall FT_ListDevices();

unsigned int _stdcall FT_Open();
unsigned int _stdcall FT_Open_Index(unsigned char device_index);

unsigned int _stdcall FT_Close();
unsigned int _stdcall FT_Close_Index(unsigned char device_index);

unsigned int _stdcall FT_ResetDevice();
unsigned int _stdcall FT_ResetDevice_Index(unsigned char device_index);

unsigned int _stdcall FT_Read(UCHAR *data, unsigned long size);
unsigned int _stdcall FT_Read_Index(unsigned char device_index, UCHAR *data, unsigned long size);

unsigned int _stdcall FT_Write(UCHAR *data, unsigned long size);
unsigned int _stdcall FT_Write_Index(unsigned char device_index, UCHAR *data, unsigned long size);

unsigned int _stdcall FT_PurgeRX();
unsigned int _stdcall FT_PurgeRX_Index(unsigned char device_index);

unsigned int _stdcall FT_PurgeTX();
unsigned int _stdcall FT_PurgeTX_Index(unsigned char device_index);

unsigned int _stdcall FT_GetQueueStatus();
unsigned int _stdcall FT_GetQueueStatus_Index(unsigned char device_index);

unsigned int _stdcall FT_GetStatus(unsigned long *rxsize, unsigned long *txsize);
unsigned int _stdcall FT_GetStatus_Index(unsigned char device_index, unsigned long *rxsize, unsigned long *txsize);

unsigned int _stdcall FT_EE_Program(unsigned short vid, unsigned short pid, unsigned short power, UCHAR *manuf, UCHAR *descr);
unsigned int _stdcall FT_EE_Program_Index(unsigned char device_index, unsigned short vid, unsigned short pid, unsigned short power, UCHAR *manuf, UCHAR *descr);

unsigned int _stdcall FT_EE_ProgramToDefault();
unsigned int _stdcall FT_EE_ProgramToDefault_Index(unsigned char device_index);

unsigned int _stdcall FT_EE_Read(unsigned short *vid, unsigned short *pid, unsigned short *power, UCHAR *manuf, UCHAR *descr);
unsigned int _stdcall FT_EE_Read_Index(unsigned char device_index, unsigned short *vid, unsigned short *pid, unsigned short *power, UCHAR *manuf, UCHAR *descr);

unsigned int _stdcall FT_GetLatencyTimer(unsigned char *data);
unsigned int _stdcall FT_GetLatencyTimer_Index(unsigned char device_index, unsigned char *data);

unsigned int _stdcall FT_SetLatencyTimer(unsigned char data);
unsigned int _stdcall FT_SetLatencyTimer_Index(unsigned char device_index, unsigned char data);

unsigned int _stdcall FT_SetBitMode(UCHAR mask, UCHAR enable);
unsigned int _stdcall FT_SetBitMode_Index(unsigned char device_index, UCHAR mask, UCHAR enable);

unsigned int _stdcall FT_GetBitMode(unsigned char *data);
unsigned int _stdcall FT_GetBitMode_Index(unsigned char device_index, unsigned char *data);

unsigned int _stdcall FT_SetUSBParameters(unsigned long insize, unsigned long outsize);
unsigned int _stdcall FT_SetUSBParameters_Index(unsigned char device_index, unsigned long insize, unsigned long outsize);


unsigned int _stdcall KAI_List_Device(AI_Device_Info *info);

unsigned int _stdcall KAI_Open(unsigned char *serial_number);
unsigned int _stdcall KAI_Open_Index(unsigned char device_index, unsigned char *serial_number);

unsigned int _stdcall KAI_Close();
unsigned int _stdcall KAI_Close_Index(unsigned char device_index);

// die Hardware und Software Infos
unsigned int _stdcall KAIHardware_Info(unsigned char *version_high, unsigned char *version_low);
unsigned int _stdcall KAIHardware_Info_Index(unsigned char device_index, unsigned char *version_high, unsigned char *version_low);

unsigned int _stdcall KAISoftware_Info(unsigned char *version_high, unsigned char *version_low);
unsigned int _stdcall KAISoftware_Info_Index(unsigned char device_index, unsigned char *version_high, unsigned char *version_low);

unsigned int _stdcall KAISoftware_String(unsigned char *softwarestring);
unsigned int _stdcall KAISoftware_String_Index(unsigned char device_index, unsigned char *softwarestring);

unsigned int _stdcall KAIHardware_Reset(void);
unsigned int _stdcall KAIHardware_Reset_Index(unsigned char device_index);

unsigned int _stdcall KDLL_Info(unsigned char *version_high, unsigned char *version_low);

unsigned int _stdcall KHardware_Info(unsigned char *version_high, unsigned char *version_low);
unsigned int _stdcall KHardware_Info_Index(unsigned char device_index, unsigned char *version_high, unsigned char *version_low);

unsigned int _stdcall KAIController_Id(unsigned char *partid_high, unsigned char *partid_low);
unsigned int _stdcall KAIController_Id_Index(unsigned char device_index, unsigned char *partid_high, unsigned char *partid_low);

unsigned int _stdcall KAIController_MemInfo(unsigned char *register_high, unsigned char *register_low);
unsigned int _stdcall KAIController_MemInfo_Index(unsigned char device_index, unsigned char *register_high, unsigned char *register_low);


// KSENT
unsigned char _stdcall KSENT_RXInit(unsigned char len, unsigned char CRC, unsigned short timeUnit, unsigned char DiagCom, unsigned char specCom);
unsigned char _stdcall KSENT_RXInit_Index(unsigned char device_index, unsigned char len, unsigned char CRC, unsigned short timeUnit, unsigned char DiagCom, unsigned char specCom);

unsigned char _stdcall KSENT_RX(unsigned char *channel, unsigned char *typ, unsigned char *len, unsigned char *data, unsigned int *time);
unsigned char _stdcall KSENT_RX_Index(unsigned char device_index, unsigned char *channel, unsigned char *typ, unsigned char *len, unsigned char *data, unsigned int *time);

unsigned char _stdcall KSENT_RXPoll(unsigned char channel, unsigned char typ, unsigned char *len, unsigned char *data, unsigned int *ltime);
unsigned char _stdcall KSENT_RXPoll_Index(unsigned char device_index, unsigned char channel, unsigned char typ, unsigned char *len, unsigned char *data, unsigned int *ltime);

unsigned char _stdcall KSENT_TXInit(unsigned short timeUnit, unsigned short syncLow, unsigned short syncHigh, unsigned char len, unsigned char CRC, unsigned char diagCom, unsigned char specCom);
unsigned char _stdcall KSENT_TXInit_Index(unsigned char device_index, unsigned short timeUnit, unsigned short syncLow, unsigned short syncHigh, unsigned char len, unsigned char CRC, unsigned char diagCom, unsigned char specCom);

unsigned char _stdcall KSENT_TX(unsigned char channel, unsigned char *data, unsigned long cyclic);
unsigned char _stdcall KSENT_TX_Index(unsigned char channel, unsigned char device_index, unsigned char *data, unsigned long cyclic);

unsigned char _stdcall KSENT_OptionsSet(unsigned char triggerInMode, unsigned char triggerIn0, unsigned char triggerIn1, unsigned short DAMode, unsigned char DA0Bit, unsigned char DA0Len, unsigned char DA1Bit, unsigned char DA1Len, unsigned short ADMode, unsigned char AD0Bit, unsigned char AD0Len, unsigned char AD1Bit, unsigned char AD1Len);
unsigned char _stdcall KSENT_OptionsSet_Index(unsigned char device_index, unsigned char triggerInMode, unsigned char triggerIn0, unsigned char triggerIn1, unsigned short DAMode, unsigned char DA0Bit, unsigned char DA0Len, unsigned char DA1Bit, unsigned char DA1Len, unsigned short ADMode, unsigned char AD0Bit, unsigned char AD0Len, unsigned char AD1Bit, unsigned char AD1Len);

unsigned char _stdcall KSENT_StatusGet(unsigned char *statusRx0, unsigned char *statusRx1, unsigned char *statusTx0, unsigned char *statusTx1);
unsigned char _stdcall KSENT_StatusGet_Index(unsigned char device_index, unsigned char *statusRx0, unsigned char *statusRx1, unsigned char *statusTx0, unsigned char *statusTx1);



// DLL internal Variables
#ifdef LOGFILE_ENABLE
	FILE* logfile = NULL;
	int i;									// for LogFile
#endif 
HINSTANCE m_hmodule; 
FT_HANDLE ftHandle;
DWORD time;								// USB Timeout Check


// Buffer for 0x33 SSLP Repsonse Frames

BYTE SSLP_rx_buffer[SSLP_RX_BUFFER_SIZE];
WORD SSLP_rx_buffer_size;

// Buffer for 0x31 0x00 CAN Receive Frames

struct {
  BYTE  channel;
  DWORD id;
  BYTE  dlc;
  BYTE  data[8];
  DWORD time;
} CAN_rx_buffer[CAN_RX_BUFFER_SIZE];

WORD CAN_rx_buffer_write_pnt;			// points to the last written cell
WORD CAN_rx_buffer_read_pnt;			// points to the last read cell


struct {
  BYTE  channel;
  BYTE  typ;
  BYTE  len;
  BYTE  data[SENT_MAX_DATA];			
  DWORD time;
} SENT_rx_buffer[SENT_RX_BUFFER_SIZE];

WORD SENT_rx_buffer_write_pnt;			// points to the last written cell
WORD SENT_rx_buffer_read_pnt;			// points to the last read cell

BYTE SENT_rx_len = 2;					// store number of bytes per sent rx frame
BYTE SENT_tx_len = 2;					// store number of bytes per sent tx frame


// Buffer for 0x31 0x20 LIN Monitor Data
struct {
	DWORD	lin_frame_start_time;
	DWORD	lin_frm_cnt;
	WORD	lin_synchbrk_time;
	WORD	lin_synchdel_time;
	WORD	lin_header_time;
	WORD    lin_slv_resp_time;
	WORD	lin_frame_time;
	BYTE    lin_synchbyte;
	BYTE	lin_id;
	BYTE	lin_checksum;
	BYTE    lin_datalength;
	BYTE	lin_data[8];
	BYTE    lin_error_flags;
} LIN_monitor_buffer[LIN_RX_BUFFER_SIZE];

WORD LIN_monitor_buffer_write_pnt;			// points to the last written cell
WORD LIN_monitor_buffer_read_pnt;			// points to the last read cell

FT_HANDLE ftHandles[AI_MAX_DEVICES]; 

// DLL internal functions

unsigned int FT_RX_Size(bool &ok);
unsigned int SSLP_Receive(void);
unsigned int SSLP_Transmit(unsigned int size, unsigned char *data);

// --- FTD2XX.DLL Functions ---

typedef FT_STATUS (WINAPI *PtrToOpen)(PVOID, FT_HANDLE *); 
PtrToOpen m_pOpen; 

typedef FT_STATUS (WINAPI *PtrToOpenEx)(PVOID, DWORD, FT_HANDLE *); 
PtrToOpenEx m_pOpenEx; 

typedef FT_STATUS (WINAPI *PtrToListDevices)(PVOID, PVOID, DWORD);
PtrToListDevices m_pListDevices; 

typedef FT_STATUS (WINAPI *PtrToClose)(FT_HANDLE);
PtrToClose m_pClose;

typedef FT_STATUS (WINAPI *PtrToResetDevice)(FT_HANDLE);
PtrToResetDevice m_pResetDevice;

typedef FT_STATUS (WINAPI *PtrToRead)(FT_HANDLE, LPVOID, DWORD, LPDWORD);
PtrToRead m_pRead;

typedef FT_STATUS (WINAPI *PtrToWrite)(FT_HANDLE, LPVOID, DWORD, LPDWORD);
PtrToWrite m_pWrite;

typedef FT_STATUS (WINAPI *PtrToPurge)(FT_HANDLE, ULONG);
PtrToPurge m_pPurge;
	
typedef FT_STATUS (WINAPI *PtrToSetTimeouts)(FT_HANDLE, ULONG, ULONG);
PtrToSetTimeouts m_pSetTimeouts;

typedef FT_STATUS (WINAPI *PtrToGetQueueStatus)(FT_HANDLE, LPDWORD);
PtrToGetQueueStatus m_pGetQueueStatus;

typedef FT_STATUS (WINAPI *PtrToGetStatus)(FT_HANDLE, LPDWORD, LPDWORD, LPDWORD);
PtrToGetStatus m_pGetStatus;

typedef FT_STATUS (WINAPI *PtrToEE_Program)(FT_HANDLE, LPVOID);
PtrToEE_Program m_pEE_Program;

typedef FT_STATUS (WINAPI *PtrToEE_Read)(FT_HANDLE, LPVOID);
PtrToEE_Read m_pEE_Read;

typedef FT_STATUS (WINAPI *PtrToGetLatencyTimer)(FT_HANDLE, PUCHAR);
PtrToGetLatencyTimer m_pGetLatencyTimer;

typedef FT_STATUS (WINAPI *PtrToSetLatencyTimer)(FT_HANDLE, UCHAR);
PtrToSetLatencyTimer m_pSetLatencyTimer;

typedef FT_STATUS (WINAPI *PtrToSetBitMode)(FT_HANDLE, UCHAR, UCHAR);
PtrToSetBitMode m_pSetBitMode;

typedef FT_STATUS (WINAPI *PtrToGetBitMode)(FT_HANDLE, PUCHAR);
PtrToGetBitMode m_pGetBitMode;

typedef FT_STATUS (WINAPI *PtrToSetUSBParameters)(FT_HANDLE, DWORD, DWORD);
PtrToSetUSBParameters m_pSetUSBParameters;

#ifdef LOGFILE_ENABLE
	void DLL_Closing()
	{
		fprintf(logfile,"DLL unloaded <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n\n");
		fclose(logfile);
	}
#endif 
// DLLMain

BOOL APIENTRY DllMain( HANDLE hModule, 
                       DWORD  ul_reason_for_call, 
                       LPVOID lpReserved
					 )
{
	// Init of DLL internal variables
	CAN_rx_buffer_write_pnt=0;
	CAN_rx_buffer_read_pnt=0;

	SENT_rx_buffer_write_pnt=0;
	SENT_rx_buffer_read_pnt=0;


	// Init Access to FTD2XX.DLL
	m_hmodule = LoadLibrary("Ftd2xx.dll");	
	if(m_hmodule == NULL)
	{
		// Error
		return FALSE;
	}
	#ifdef LOGFILE_ENABLE
		logfile = fopen("c:\\aid-log.txt","at");
		fprintf(logfile,"DLL loaded >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n");
		
		atexit( DLL_Closing );
	#endif 

	m_pListDevices = (PtrToListDevices)GetProcAddress(m_hmodule, "FT_ListDevices");
	m_pWrite = (PtrToWrite)GetProcAddress(m_hmodule, "FT_Write");
	m_pRead = (PtrToRead)GetProcAddress(m_hmodule, "FT_Read");
	m_pOpen = (PtrToOpen)GetProcAddress(m_hmodule, "FT_Open");
	m_pResetDevice = (PtrToResetDevice)GetProcAddress(m_hmodule, "FT_ResetDevice");
	m_pOpenEx = (PtrToOpenEx)GetProcAddress(m_hmodule, "FT_OpenEx");
	m_pListDevices = (PtrToListDevices)GetProcAddress(m_hmodule, "FT_ListDevices");
	m_pClose = (PtrToClose)GetProcAddress(m_hmodule, "FT_Close");
	m_pResetDevice = (PtrToResetDevice)GetProcAddress(m_hmodule, "FT_ResetDevice");
	m_pPurge = (PtrToPurge)GetProcAddress(m_hmodule, "FT_Purge");
	m_pSetTimeouts = (PtrToSetTimeouts)GetProcAddress(m_hmodule, "FT_SetTimeouts");
	m_pGetQueueStatus = (PtrToGetQueueStatus)GetProcAddress(m_hmodule, "FT_GetQueueStatus");
	m_pGetStatus = (PtrToGetStatus)GetProcAddress(m_hmodule, "FT_GetStatus");
	m_pSetBitMode = (PtrToSetBitMode)GetProcAddress(m_hmodule, "FT_SetBitMode");
	m_pGetBitMode = (PtrToGetBitMode)GetProcAddress(m_hmodule, "FT_GetBitMode");
	m_pEE_Program = (PtrToEE_Program)GetProcAddress(m_hmodule, "FT_EE_Program");
	m_pEE_Read = (PtrToEE_Read)GetProcAddress(m_hmodule, "FT_EE_Read");
	m_pGetLatencyTimer = (PtrToGetLatencyTimer)GetProcAddress(m_hmodule, "FT_GetLatencyTimer");
	m_pSetLatencyTimer = (PtrToSetLatencyTimer)GetProcAddress(m_hmodule, "FT_SetLatencyTimer");
	m_pSetUSBParameters = (PtrToSetUSBParameters)GetProcAddress(m_hmodule, "FT_SetUSBParameters");

    return TRUE;
}

unsigned int _stdcall FT_ListDevices()
{
	DWORD i;
	(*m_pListDevices)(&i, NULL, FT_LIST_NUMBER_ONLY);
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"FT_ListDevices: %i\n",i);
	#endif 
	return i;
}

/****************************************************************************************************/
/* FT_Open                                                                                          */
/****************************************************************************************************/
/*                                                                                                  */
/* descript.: Open USB Port for AI2                                                                 */
/*                                                                                                  */
/* output parameter            remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* return code         typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* 0:                          AI2 is found and USB Port is opened                                  */
/* >0:                         AI2 isn't found or USB Port can't access                             */
/****************************************************************************************************/
unsigned int _stdcall FT_Open()
{
	#ifdef LOGFILE_ENABLE
		FT_STATUS status;
		status = (*m_pOpen)(0,&ftHandle);
		fprintf(logfile,"FT_Open: Status (0 = OK):%d\n",status);
		return status;
	#else 
		return (*m_pOpen)(0,&ftHandle);
	#endif
}
unsigned int _stdcall FT_Open_Index(unsigned char device_index)
{
	unsigned int status;

	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 

	status =FT_Open();
	ftHandles[device_index] = ftHandle;
	return status;
}

/****************************************************************************************************/
/* FT_Close                                                                                         */
/****************************************************************************************************/
/*                                                                                                  */
/* descript.: Close USB Port                                                                        */
/*                                                                                                  */
/* output parameter            remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* return code         typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* 0:                          USB Port is closed                                                   */
/* >0:                         Error during Port closing                                            */
/****************************************************************************************************/
unsigned int _stdcall FT_Close()
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"FT_Close()\n");
	#endif 
	return (*m_pClose)(ftHandle);
}
unsigned int _stdcall FT_Close_Index(unsigned char device_index)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return FT_Close();
}

unsigned int _stdcall FT_ResetDevice()
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"FT_ResetDevice()\n");
	#endif 
	return (*m_pResetDevice)(ftHandle);
}
unsigned int _stdcall FT_ResetDevice_Index(unsigned char device_index)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return FT_ResetDevice();
}

unsigned int _stdcall FT_Read(UCHAR *data, unsigned long size)
{
	unsigned long i;
	(*m_pRead)(ftHandle,data,size,&i);
	return i;
}
unsigned int _stdcall FT_Read_Index(unsigned char device_index, UCHAR *data, unsigned long size)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return FT_Read(data, size);
}

unsigned int _stdcall FT_PurgeRX()
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"FT_PurgeRX()\n");
	#endif 
	return (*m_pPurge)(ftHandle,FT_PURGE_RX);
}
unsigned int _stdcall FT_PurgeRX_Index(unsigned char device_index)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return FT_PurgeRX();
}

unsigned int _stdcall FT_PurgeTX()
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"FT_PurgeTX()\n");
	#endif 
	return (*m_pPurge)(ftHandle,FT_PURGE_TX);
}
unsigned int _stdcall FT_PurgeTX_Index(unsigned char device_index)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return FT_PurgeTX();
}

unsigned int _stdcall FT_Write(UCHAR *data, unsigned long size)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"FT_Write()\n");
	#endif 
	unsigned long i;
	return (*m_pWrite)(ftHandle,data,size,&i);
}
unsigned int _stdcall FT_Write_Index(unsigned char device_index, UCHAR *data, unsigned long size)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return FT_Write(data, size);
}

unsigned int _stdcall FT_GetQueueStatus()
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"FT_GetQueueStatus()\n");
	#endif 
	unsigned long i;
	(*m_pGetQueueStatus)(ftHandle,&i);
	return i;
}
unsigned int _stdcall FT_GetQueueStatus_Index(unsigned char device_index)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return FT_GetQueueStatus();
}

unsigned int _stdcall FT_GetStatus(unsigned long *rxsize, unsigned long *txsize)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"FT_GetStatus()\n");
	#endif 
	unsigned long i;
	return (*m_pGetStatus)(ftHandle,rxsize,txsize,&i);
}
unsigned int _stdcall FT_GetStatus_Index(unsigned char device_index, unsigned long *rxsize, unsigned long *txsize)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return FT_GetStatus(rxsize, txsize);
}

unsigned int _stdcall FT_EE_Program(unsigned short vid, unsigned short pid, unsigned short power, UCHAR *manuf, UCHAR *descr, UCHAR *sn)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"FT_EE_Program()\n");
	#endif 
    FT_PROGRAM_DATA ftdata;
	char ManufacturerBuf[32];
	char ManufacturerIdBuf[16];
	char DescriptionBuf[64];
	char SerialNumberBuf[16];

	ftdata.Manufacturer=ManufacturerBuf;
	ftdata.ManufacturerId=ManufacturerIdBuf;
	ftdata.Description=DescriptionBuf;
	ftdata.SerialNumber=SerialNumberBuf;

	(*m_pEE_Read)(ftHandle,&ftdata);
	ftdata.MaxPower=power;
	ftdata.VendorId = vid;
	ftdata.ProductId = pid;
	ftdata.MaxPower = power;
	strcpy(ftdata.Manufacturer,(char*)(manuf));
	strcpy(ftdata.Description,(char*)(descr));
	strcpy(ftdata.SerialNumber,(char*)(sn));

	(*m_pEE_Program)(ftHandle,&ftdata);
	return 0;
}
unsigned int _stdcall FT_EE_Program_Index(unsigned char device_index, unsigned short vid, unsigned short pid, unsigned short power, UCHAR *manuf, UCHAR *descr, UCHAR *sn)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return FT_EE_Program(vid, pid, power, manuf, descr, sn);
}

unsigned int _stdcall FT_EE_ProgramToDefault()
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"FT_EE_ProgramToDefault()\n");
	#endif 
	FT_PROGRAM_DATA ftdata={
		0x0403,
		0x4515,
		"KOPF GmbH",
		"KF",
		"Automotive Interface USB",
		"KFA2001071",
		94,
		1,
		0,
		1,
		FALSE,
		FALSE,
		FALSE,
		FALSE,
		FALSE,
		FALSE,
		0
	};

	(*m_pEE_Program)(ftHandle,&ftdata);
	return 0;
}
unsigned int _stdcall FT_EE_ProgramToDefault_Index(unsigned char device_index)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return FT_EE_ProgramToDefault();
}

unsigned int _stdcall FT_EE_Read(unsigned short *vid, unsigned short *pid, unsigned short *power, UCHAR *manuf, UCHAR *descr, UCHAR *sn)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"FT_EE_Read()\n");
	#endif 
    FT_PROGRAM_DATA ftdata;
	char ManufacturerBuf[32];
	char ManufacturerIdBuf[16];
	char DescriptionBuf[64];
	char SerialNumberBuf[16];

	ftdata.Manufacturer=ManufacturerBuf;
	ftdata.ManufacturerId=ManufacturerIdBuf;
	ftdata.Description=DescriptionBuf;
	ftdata.SerialNumber=SerialNumberBuf;

	(*m_pEE_Read)(ftHandle,&ftdata);
    *vid=ftdata.VendorId;
	*pid=ftdata.ProductId;
	*power=ftdata.MaxPower;
	strcpy((char*)(manuf),ftdata.Manufacturer);
	strcpy((char*)(descr),ftdata.Description);
	strcpy((char*)(sn),ftdata.SerialNumber);
	return 0;
}
unsigned int _stdcall FT_EE_Read_Index(unsigned char device_index, unsigned short *vid, unsigned short *pid, unsigned short *power, UCHAR *manuf, UCHAR *descr, UCHAR *sn)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return FT_EE_Read(vid, pid, power, manuf, descr, sn);
}

unsigned int _stdcall FT_GetLatencyTimer(unsigned char *data)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"FT_GetLatencyTimer()\n");
	#endif 
	return (*m_pGetLatencyTimer)(ftHandle,data);
}
unsigned int _stdcall FT_GetLatencyTimer_Index(unsigned char device_index, unsigned char *data)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return FT_GetLatencyTimer(data);
}

unsigned int _stdcall FT_SetLatencyTimer(unsigned char data)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"FT_SetLatencyTimer()\n");
	#endif 
	return (*m_pSetLatencyTimer)(ftHandle,data);
}
unsigned int _stdcall FT_SetLatencyTimer_Index(unsigned char device_index, unsigned char data)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return FT_SetLatencyTimer(data);
}

unsigned int _stdcall FT_SetTimeouts(DWORD readTimeout, DWORD writeTimeout)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"FT_SetTimeouts()\n");
	#endif 
	return (*m_pSetTimeouts)(ftHandle,readTimeout,writeTimeout);
}
unsigned int _stdcall FT_SetTimeouts_Index(unsigned char device_index, DWORD readTimeout, DWORD writeTimeout)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return FT_SetTimeouts(readTimeout, writeTimeout);
}

unsigned int _stdcall FT_SetBitMode(UCHAR mask, UCHAR enable)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"FT_SetBitMode()\n");
	#endif 
    return (*m_pSetBitMode)(ftHandle,mask,enable);
}
unsigned int _stdcall FT_SetBitMode_Index(unsigned char device_index, UCHAR mask, UCHAR enable)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return FT_SetBitMode(mask, enable);
}


unsigned int _stdcall FT_GetBitMode(unsigned char *data)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"FT_GetBitMode()\n");
	#endif 
    return (*m_pGetBitMode)(ftHandle,data);
}
unsigned int _stdcall FT_GetBitMode_Index(unsigned char device_index, unsigned char *data)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return FT_GetBitMode(data);
}

unsigned int _stdcall FT_SetUSBParameters(unsigned long insize, unsigned long outsize)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"FT_SetUSBParameters()\n");
	#endif 
	return (*m_pSetUSBParameters)(ftHandle,insize,outsize);
}
unsigned int _stdcall FT_SetUSBParameters_Index(unsigned char device_index, unsigned long insize, unsigned long outsize)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return FT_SetUSBParameters(insize, outsize);
}

/****************************************************************************************************/
/* KAI_List_Device                                                                                  */
/****************************************************************************************************/
/*                                                                                                  */
/* descript.: List number of devices and serial numbers of connected AIs (max. 8 devices)           */
/*                                                                                                  */
/* output parameter            remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* info     : Array of serial numbers 16 byte per device                                            */
/*                                                                                                  */
/* return parameter            remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* number of devices                                                                                */
/****************************************************************************************************/
unsigned int _stdcall KAI_List_Device(AI_Device_Info *info)
{
	DWORD index=0;
	DWORD maxDevices;
	FT_STATUS status;
	char buffer[16];
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"KAI_List_Device:\n");
	#endif 
	
	maxDevices = FT_ListDevices();

	for (DWORD i=0; i<maxDevices && i < 8; i++)
	{
		status = (*m_pListDevices)((PVOID)i, buffer,FT_LIST_BY_INDEX | FT_OPEN_BY_SERIAL_NUMBER);
		if (status == FT_OK)
		{
			memcpy(info + i, buffer, sizeof(AI_Device_Info));
			#ifdef LOGFILE_ENABLE
				fprintf(logfile,"\t%i. Device status(0=OK): %i serial_number: %s\n", i, status, buffer);
			#endif 
		}
		else
		{
			memcpy(info + i,"opened",7);
			#ifdef LOGFILE_ENABLE
				fprintf(logfile,"\t%i. Device status(0=OK): %i serial_number: (Opened)%s\n", i, status, buffer);
			#endif 
		}
	}
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tMax Devices: %i\n", maxDevices);
	#endif 
	return maxDevices;
}


unsigned int _stdcall KAI_Open_Index(unsigned char device_index, unsigned char *serial_number)
{
	unsigned int status;

	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 

	status =KAI_Open(serial_number);
	ftHandles[device_index] = ftHandle;
	return status;
}

/****************************************************************************************************/
/* KAI_Open                                                                                         */
/****************************************************************************************************/
/*                                                                                                  */
/* descript.: open AI by serial number                                                              */
/*                                                                                                  */
/* input parameter            remark                                                                */
/* ------------------------------------------------------------------------------------------------ */
/* *serial_number   : string with serial number                                                     */
/*                                                                                                  */
/* return parameter            remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* FT_STATUS: 0 = Ok, >0 = Error                                                                    */
/****************************************************************************************************/
unsigned int _stdcall KAI_Open(unsigned char *serial_number)
{
	FT_STATUS status;

	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"KAI_Open:\n");
		fprintf(logfile,"\tserial_number: %s\n",serial_number);
		if (serial_number[0] == 0)
			fprintf(logfile,"\tOpen with FT_Open()\n");
		else
			fprintf(logfile,"\tOpen by Serialnumber\n");
	#endif 

	if (serial_number[0] == 0)
		status = FT_Open();
	else
		status = (*m_pOpenEx)(serial_number,FT_OPEN_BY_SERIAL_NUMBER,&ftHandle);

	if (status == FT_OK)
	{
		Sleep(50);
		FT_SetTimeouts(1000,1000);				//Set USB Timeout to 1s
		FT_SetLatencyTimer(1);					//Set USB Timer to 1ms
		FT_ResetDevice();						//Reset USB Chip
		UCHAR write_val = 0;
		FT_Write(&write_val,1);					//1st Byte is lost with HCS12 Debugging => TX always 0x00 normaly will be ignored by HCS12
	}
	Sleep(50);							
	return status;
}



/****************************************************************************************************/
/* KAI_Close                                                                                        */
/****************************************************************************************************/
/*                                                                                                  */
/* descript.: close AI                                                                              */
/*                                                                                                  */
/* return parameter            remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* FT_STATUS: 0 = Ok, >0 = Error                                                                    */
/****************************************************************************************************/
unsigned int _stdcall KAI_Close()
{

	FT_STATUS status;
	
	status = (*m_pClose)(ftHandle);				
	
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"KAI_Close Status (0 = OK): %d\n",status);
	#endif 
	
	Sleep(100);							// Wait until Handle is closed
	return status;
}

unsigned int _stdcall KAI_Close_Index(unsigned char device_index)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return KAI_Close();
}

/****************************************************************************************************/
/* KDLL_Info                                                                                        */
/****************************************************************************************************/
/*                                                                                                  */
/* descript.: Readout DLL Information                                                               */
/*                                                                                                  */
/* output parameter            remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* id       : Text (30 Char)                                                                        */
/****************************************************************************************************/
unsigned int _stdcall KDLL_Info(unsigned char *version_high, unsigned char *version_low)
{
	*version_high=DLL_VERSION_HIGH;												// Readout Version
	*version_low=DLL_VERSION_LOW;
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"KDLL_Info: V%i.%i\n",*version_high,*version_low);
	#endif 
	return (0);
}

/****************************************************************************************************/
/* KHardware_Info                                                                                   */
/****************************************************************************************************/
/*                                                                                                  */
/* descript.: Readout AI-HW Information                                                             */
/*                                                                                                  */
/*            Header      DIR PMT                                                                   */
/*       Req: $61 $00 $02 $32 $A2                                                                   */
/*       Res: $61 $00  34 $33 $A2 VH VL                                                             */
/*                                                                                                  */
/* output parameter            remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* id       : Text (30 Char)                                                                        */
/****************************************************************************************************/
unsigned int _stdcall KHardware_Info(unsigned char *version_high, unsigned char *version_low)
{
	unsigned char request[2]={0x32,0xA2};

    SSLP_Transmit(2,request);
    SSLP_Receive_with_Timeout(1);       // Wait till SSLP_Buffer_Size is higher than 1
	*version_high=SSLP_rx_buffer[0];	// Readout Version
	*version_low=SSLP_rx_buffer[1];
	SSLP_rx_buffer_size=0;				// Clear SSLP-Buffer

	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"KHardware_Info: V%i.%i\n",*version_high,*version_low);
	#endif 

	return (0);
}

unsigned int _stdcall KHardware_Info_Index(unsigned char device_index, unsigned char *version_high, unsigned char *version_low)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return KHardware_Info(version_high,version_low);
}



/****************************************************************************************************/
/* KSENT_RXInit      																		        */
/****************************************************************************************************/
/*                                                                                                  */
/* descript.: Initialisiert und aktiviert beide SENT-Receive-Channels auf dem AI.       			*/
/*                                                                                                  */
/*            Header      DIR PMT LEN  CRC  TUNIT   DIAG  SPEC      							    */
/*            $61 $00 $08 $65 $00 $len $crc	$tu $tu $diag $spec	                                    */
/*                                                                                                  */
/* input parameter     typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* len                 byte    Number of nibbles per frame    										*/
/* CRC                 byte    255: Disable; 0-15: Nibble Number with CRC                           */
/* diagCom             byte    0: Diagnosetic Communication disable;								*/
/*                             1: Diagnosetic Communication enable                                  */
/* specCom             byte    0: Standard Communication; X: Reserved                               */
/*                                                                                                  */
/* output parameter    typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* return code         typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/****************************************************************************************************/
unsigned char _stdcall KSENT_RXInit(unsigned char len, unsigned char CRC, unsigned short timeUnit, unsigned char diagCom
									, unsigned char specCom)
{
	unsigned char request[8]={0x65,0x00};
	unsigned char result;
    request[2] = len;
	request[3] = CRC;
	request[4] = timeUnit>>8;
	request[5] = timeUnit&0xFF;
	request[6] = diagCom;
	request[7] = specCom;
	SSLP_Transmit(8,request);
    SSLP_Receive_with_Timeout(0);       // Wait till SSLP_Buffer_Size is higher than 0

	SENT_rx_len = len;
	
	SENT_rx_buffer_write_pnt = 0;
	SENT_rx_buffer_read_pnt = 0;
	
	if(SSLP_rx_buffer_size>0)
	{
		result=(unsigned char)SSLP_rx_buffer[0];
	}
	else
	{
		result = 1;						// No Response from AI
	}
	SSLP_rx_buffer_size=0;				// Clear SSLP-Buffer

	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"KSENT_RXInit(%2d, %2d, %5d, %2d, %2d) return:%2d\r\n", len, CRC, timeUnit, diagCom, specCom, result);
	#endif 

	return (result);
}
unsigned char _stdcall KSENT_RXInit_Index(unsigned char device_index, unsigned char len, unsigned char CRC
										  , unsigned short timeUnit, unsigned char DiagCom, unsigned char specCom)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return KSENT_RXInit(len, CRC, timeUnit, DiagCom, specCom);
}

/****************************************************************************************************/
/* KSENT_RX           																		        */
/****************************************************************************************************/
/*                                                                                                  */
/* descript.: Receive a SENT frame out of the DLL-Buffer       	            						*/
/*                                                                                                  */
/*                                                                                                  */
/* input parameter     typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* output parameter    typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* channel             byte*   SENT Channel (0..1)                                                  */
/* typ                 byte*   0:	Standard SENT-Frame												*/
/*	                           128:	Standard SENT-Frame with failed CRC								*/
/*	                           1:	Diagnostic SENT-Frame                                           */
/* len                 byte*   Number of nibbles per frame                                          */
/* data                byte*   SENT Data (max. 16 Bytes)                                            */
/* time                byte*   Time Stamp [unit 40ns]                                               */
/*                                                                                                  */
/* return code         typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/****************************************************************************************************/
unsigned char _stdcall KSENT_RX(unsigned char *channel, unsigned char *typ, unsigned char *len, unsigned char *data
								, unsigned int *time)
{
	unsigned char result = SSLP_Receive();

	if (result != 0) return result;

	if (SENT_rx_buffer_read_pnt!=SENT_rx_buffer_write_pnt) {
		SENT_rx_buffer_read_pnt++;
		if (SENT_rx_buffer_read_pnt>=SENT_RX_BUFFER_SIZE)
			SENT_rx_buffer_read_pnt=0;
		*channel  = SENT_rx_buffer[SENT_rx_buffer_read_pnt].channel;
		*typ       = SENT_rx_buffer[SENT_rx_buffer_read_pnt].typ;
		*len      = SENT_rx_buffer[SENT_rx_buffer_read_pnt].len;
		memcpy(data,&SENT_rx_buffer[SENT_rx_buffer_read_pnt].data,SENT_rx_len);
		*time     =SENT_rx_buffer[SENT_rx_buffer_read_pnt].time;			// Unit 40us
		
		#ifdef LOGFILE_ENABLE
			fprintf(logfile,"KSENT_RX %2d %2d %2d ",*channel,*typ,*len);
			for (i=0;i<SENT_rx_len;i++){
				fprintf(logfile,"%02X ",SENT_rx_buffer[SENT_rx_buffer_read_pnt].data[i]);
			}
			fprintf(logfile,"%8d\n",*time);
		#endif 
		
		return 0;						// No Error - Frame available
	}
	else {
		return 1;						// Error
	}
}
unsigned char _stdcall KSENT_RX_Index(unsigned char device_index, unsigned char *channel, unsigned char *typ
									  , unsigned char *len, unsigned char *data, unsigned int *time)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return KSENT_RX(channel, typ, len, data, time);
}

/****************************************************************************************************/
/* KSENT_RXPoll       																		        */
/****************************************************************************************************/
/*                                                                                                  */
/* descript.: Receive the last SENT frame out of the AI-Buffer                						*/
/*                                                                                                  */
/*            Header      DIR PMT CH  TYP    		            								    */
/*            $61 $00 $06 $65 $05 $ch $typ	         	    		                                */
/*                                                                                                  */
/* input parameter     typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* output parameter    typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* channel             byte    SENT Channel (0..1)                                                  */
/* typ                 byte    0:	Get Data of last received frame 								*/
/* len                 byte*   Number of nibbles per frame                                          */
/* data                byte*   SENT Data (max. 16 Bytes)                                            */
/* time                byte*   Time Stamp [unit 40ns]                                               */
/*                                                                                                  */
/* return code         typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/****************************************************************************************************/
unsigned char _stdcall KSENT_RXPoll(unsigned char channel, unsigned char typ, unsigned char *len, unsigned char *data
								, unsigned int *ltime)
{
	unsigned char request[4]={0x65,0x05};
	unsigned char result;
	request[2] = channel;
    request[3] = typ;
	SSLP_Transmit(4, request);

	SSLP_Receive_with_Timeout(22);       // Wait till SSLP_Buffer_Size is higher than 22

	if(SSLP_rx_buffer_size>0)
	{
		*len = SSLP_rx_buffer[0];
		*ltime = SSLP_rx_buffer[1]<<24 |
			    SSLP_rx_buffer[2]<<16 |
				SSLP_rx_buffer[3]<<8  |
				SSLP_rx_buffer[4];
		memcpy(data,&SSLP_rx_buffer[5],16);
		result = 0;								//Data available
	}
	else
	{
		result = 1;						// No Response from AI
	}
	SSLP_rx_buffer_size=0;				// Clear SSLP-Buffer

	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"KSENT_RXPoll(..)");
	#endif 

	return (result);
}

unsigned char _stdcall KSENT_RXPoll_Index(unsigned char device_index, unsigned char channel, unsigned char typ, unsigned char *len, unsigned char *data, unsigned int *ltime)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return KSENT_RXPoll(channel, typ, len, data, ltime);
}

/****************************************************************************************************/
/* KSENT_StatusGet    																		        */
/****************************************************************************************************/
/*                                                                                                  */
/* descript.: Receive the status of the SENT receiver and transmitter          						*/
/*                                                                                                  */
/*            Header      DIR PMT           		            								    */
/*            $61 $00 $02 $65 $04	                	    		                                */
/*                                                                                                  */
/* input parameter     typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* output parameter    typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* statusRx0           byte*   bit0: 1: Sent_Frame received in last 100ms                           */
/*                             bit2: 1: Sent-Receiver-Overflow since last RXInit                    */
/* statusRx1           byte*   bit0: 1: Sent_Frame received in last 100ms                           */
/*                             bit2: 1: Sent-Receiver-Overflow since last RXInit                    */
/* statusTx0           byte*   Reserved                                                             */
/* statusTx1           byte*   Reserved                                                             */
/*                                                                                                  */
/* return code         typ     remark                                                               */
/* 0                   byte*   no error                                                             */      
/* ------------------------------------------------------------------------------------------------ */
/****************************************************************************************************/
unsigned char _stdcall KSENT_StatusGet(unsigned char *statusRx0, unsigned char *statusRx1, unsigned char *statusTx0, unsigned char *statusTx1)
{
	unsigned char request[2]={0x65,0x04};
	unsigned char result;
	SSLP_Transmit(2, request);

	SSLP_Receive_with_Timeout(3);							// Wait till SSLP_Buffer_Size is higher than 3

	if(SSLP_rx_buffer_size>0)
	{
		*statusRx0 = SSLP_rx_buffer[0];
		*statusRx1 = SSLP_rx_buffer[1];
		*statusTx0 = SSLP_rx_buffer[2];
		*statusTx1 = SSLP_rx_buffer[3];
		result = 0;											//Data available
	}
	else
	{
		result = 1;											// No Response from AI
	}
	SSLP_rx_buffer_size=0;									// Clear SSLP-Buffer

	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"KSENT_StatusGet(..)");
	#endif 

	return (result);
}

unsigned char _stdcall KSENT_StatusGet_Index(unsigned char device_index, unsigned char *statusRx0, unsigned char *statusRx1, unsigned char *statusTx0, unsigned char *statusTx1)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return KSENT_StatusGet(statusRx0, statusRx1, statusTx0, statusTx1);
}

/****************************************************************************************************/
/* KSENT_TXInit      																		        */
/****************************************************************************************************/
/*                                                                                                  */
/* descript.: Initialisiert und aktiviert beide SENT-Transmit-Channels auf dem AI.       			*/
/*                                                                                                  */
/*            Header      DIR PMT TIME    SYNCLLOW  SYNCHIGH  LEN  CRC  DIAG  SPEC       		    */
/*            $61 $00 $0C $65 $01 $tm $tm $snl $snl $snh $snh $len $crc	$diag $spec	                */
/*                                                                                                  */
/* input parameter     typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* timeUnit            ushort  Time for one SENT-Tick in 40ns StepsDefault: 75 (3us)                */
/* syncLow             ushort  Low-Time of the Sync Pulse in 40ns Steps, Default 375 (15us)         */
/* syncHigh            ushort  High-Time of the Sync Pulse in 40ns Steps, Default 3825 (153us)      */
/* len                 byte    Number of nibbles per frame    										*/
/* CRC                 byte    255: Disable; 0-15: Nibble Number with CRC                           */
/* diagCom             byte    0: Diagnosetic Communication disable;								*/
/*                             1: Diagnosetic Communication enable                                  */
/* specCom             byte    0: Standard Communication; X: Reserved                               */
/*                                                                                                  */
/* output parameter    typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* return code         typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/****************************************************************************************************/
unsigned char _stdcall KSENT_TXInit(unsigned short timeUnit, unsigned short syncLow, unsigned short syncHigh
					, unsigned char len, unsigned char CRC, unsigned char diagCom
					, unsigned char specCom)
{
	unsigned char request[12]={0x65,0x01};
	unsigned char result;
    request[2] = timeUnit>>8;
	request[3] = timeUnit&0xFF;
    request[4] = syncLow>>8;
	request[5] = syncLow&0xFF;
    request[6] = syncHigh>>8;
	request[7] = syncHigh&0xFF;
    request[8] = len;
	request[9] = CRC;
    request[10] = diagCom;
	request[11] = specCom;
	SSLP_Transmit(12,request);
    SSLP_Receive_with_Timeout(0);       // Wait till SSLP_Buffer_Size is higher than 0

	SENT_tx_len = len;

	if(SSLP_rx_buffer_size>0)
	{
		result=(unsigned char)SSLP_rx_buffer[0];
	}
	else
	{
		result = 1;						// No Response from AI
	}
	SSLP_rx_buffer_size=0;				// Clear SSLP-Buffer

	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"KSENT_TXInit(..)");
	#endif 

	return (result);
}
unsigned char _stdcall KSENT_TXInit_Index(unsigned char device_index, unsigned short timeUnit
										  , unsigned short syncLow, unsigned short syncHigh, unsigned char len
										  , unsigned char CRC, unsigned char diagCom, unsigned char specCom)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return KSENT_TXInit(timeUnit, syncLow, syncHigh, len, CRC, diagCom, specCom);
}

/****************************************************************************************************/
/* KSENT_TX          																		        */
/****************************************************************************************************/
/*                                                                                                  */
/* descript.: Send a SENT frame cyclic or number of times                               			*/
/*                                                                                                  */
/*            Header      DIR PMT CH  CYCLIC              DATA        				    		    */
/*            $61 $00 $0x $65 $02 $ch $cyc $cyc $cyc $cyc $DB0 .. $DBx  		                    */
/*                                                                                                  */
/* input parameter     typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* channel             byte    Transmit Channel 0..1                                                */
/* data                byte*   Pointer to SENT data frame                                           */
/* cyclic              byte    0: Send once                                                         */
/*                             0xFFFF: Send cyclic without time space                               */
/*                             1-50000: Send cyclic every x us                                      */
/*                                                                                                  */
/* output parameter    typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* return code         typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/****************************************************************************************************/
unsigned char _stdcall KSENT_TX(unsigned char channel, unsigned char *data, unsigned long cyclic)
{
	unsigned char request[7+SENT_MAX_DATA]={0x65,0x02};
	unsigned char result;
	request[2] = channel;

    request[3] = cyclic>>24 & 0xFF;
    request[4] = cyclic>>16 & 0xFF;
    request[5] = cyclic>>8  & 0xFF;
	request[6] = cyclic     & 0xFF;
	memcpy(&request[7], data, SENT_tx_len);
	SSLP_Transmit(7 + SENT_tx_len, request);
    SSLP_Receive_with_Timeout(0);       // Wait till SSLP_Buffer_Size is higher than 0

	if(SSLP_rx_buffer_size>0)
	{
		result=(unsigned char)SSLP_rx_buffer[0];
	}
	else
	{
		result = 1;						// No Response from AI
	}
	SSLP_rx_buffer_size=0;				// Clear SSLP-Buffer

	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"KSENT_TX(..)");
	#endif 

	return (result);
}

unsigned char _stdcall KSENT_TX_Index(unsigned char device_index, unsigned char channel, unsigned char *data, unsigned long cyclic)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return KSENT_TX(channel, data, cyclic);
}

/****************************************************************************************************/
/* KSENT_OptionsSet 																		        */
/****************************************************************************************************/
/*                                                                                                  */
/* descript.: Set the SENT-AI options												       			*/
/*                                                                                                  */
/*            Header      DIR PMT                                                        		    */
/*            $61 $00 $11 $65 $03 $TIM $TI0 $TI1 $DAM $DAM $D0B $D0L $D1B $D1L $ADM $ADM            */
/*                                $A0B $A0L $A1B $A1L                                               */
/*                                                                                                  */
/* input parameter     typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* triggerInMode       byte    0: Next SENT-Frame is send via USB                                   */
/*                             1: Last received SENT-Frame is send via USB                          */
/* Rest                xxx     Reserved                                                             */
/*                                                                                                  */
/* output parameter    typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/* return code         typ     remark                                                               */
/* ------------------------------------------------------------------------------------------------ */
/****************************************************************************************************/
unsigned char _stdcall KSENT_OptionsSet(unsigned char triggerInMode, unsigned char triggerIn0, unsigned char triggerIn1
										, unsigned short DAMode, unsigned char DA0Bit, unsigned char DA0Len
										, unsigned char DA1Bit, unsigned char DA1Len, unsigned short ADMode
										, unsigned char AD0Bit, unsigned char AD0Len, unsigned char AD1Bit
										, unsigned char AD1Len)
{
	unsigned char request[17]={0x65,0x03};
	unsigned char result;
    request[2] = triggerInMode;
	request[3] = triggerIn0;
    request[4] = triggerIn1;
	request[5] = DAMode>>8;
	request[6] = DAMode&0xFF;
    request[7] = DA0Bit;
	request[8] = DA0Len;
    request[9] = DA1Bit;
	request[10] = DA1Len;
    request[11] = ADMode>>8;
	request[12] = ADMode&0xFF;
	request[13] = AD0Bit;
	request[14] = AD0Len;
	request[15] = AD1Bit;
	request[16] = AD1Len;

	SSLP_Transmit(17,request);
    SSLP_Receive_with_Timeout(0);       // Wait till SSLP_Buffer_Size is higher than 0
	if(SSLP_rx_buffer_size>0)
	{
		result=(unsigned char)SSLP_rx_buffer[0];
	}
	else
	{
		result = 1;						// No Response from AI
	}
	SSLP_rx_buffer_size=0;				// Clear SSLP-Buffer

	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"KSENT_OptionsSet(..)");
	#endif 

	return (result);
}
unsigned char _stdcall KSENT_OptionsSet_Index(unsigned char device_index, unsigned char triggerInMode
											  , unsigned char triggerIn0, unsigned char triggerIn1
											  , unsigned short DAMode, unsigned char DA0Bit, unsigned char DA0Len
											  , unsigned char DA1Bit, unsigned char DA1Len, unsigned short ADMode
											  , unsigned char AD0Bit, unsigned char AD0Len, unsigned char AD1Bit
											  , unsigned char AD1Len)
{
	#ifdef LOGFILE_ENABLE
		fprintf(logfile,"\tDevice Index: %i\n",device_index);
	#endif 
	ftHandle = ftHandles[device_index];
	return KSENT_OptionsSet(triggerInMode, triggerIn0, triggerIn1, DAMode, DA0Bit, DA0Len, DA1Bit, DA1Len, ADMode, AD0Bit, AD0Len, AD1Bit, AD1Len);
}

