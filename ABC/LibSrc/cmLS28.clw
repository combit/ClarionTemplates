! Clarion For Windows constants and function definitions for LS28.DLL
!  (c) combit GmbH
!  [build of 2022-08-29 20:08:43]

 SECTION('Equates')

UINT                    EQUATE(UNSIGNED)
CHAR                    EQUATE(BYTE)
BOOL                    EQUATE(SIGNED)
HANDLE                  EQUATE(UNSIGNED)
LPVOID                  EQUATE(ULONG)
HWND                    EQUATE(HANDLE)
HINSTANCE               EQUATE(HANDLE)
HDC                     EQUATE(HANDLE)
WPARAM                  EQUATE(UINT)
LPARAM                  EQUATE(LONG)
LRESULT                 EQUATE(LONG)
FARPROC                 EQUATE(LONG)
PVOID                   EQUATE(LONG)
HFONT                   EQUATE(PVOID)
DWORD                   EQUATE(ULONG)

HENHMETAFILE            EQUATE(HANDLE)
HMETAFILE               EQUATE(HANDLE)

COLORREF                EQUATE(DWORD)

!TYPE definitions only--these declarations are used only to
!define other data structures. No memory is allocated for TYPEs!
RECT    GROUP,TYPE
left      SIGNED
top       SIGNED
right     SIGNED
bottom    SIGNED
        END

LL_STGSYS_VERSION_LL18                   EQUATE(2)
LL_ERR_STG_NOSTORAGE                     EQUATE(-1000)
LL_ERR_STG_BADVERSION                    EQUATE(-1001)
LL_ERR_STG_READ                          EQUATE(-1002)
LL_ERR_STG_WRITE                         EQUATE(-1003)
LL_ERR_STG_UNKNOWNSYSTEM                 EQUATE(-1004)
LL_ERR_STG_BADHANDLE                     EQUATE(-1005)
LL_ERR_STG_ENDOFLIST                     EQUATE(-1006)
LL_ERR_STG_BADJOB                        EQUATE(-1007)
LL_ERR_STG_ACCESSDENIED                  EQUATE(-1008)
LL_ERR_STG_BADSTORAGE                    EQUATE(-1009)
LL_ERR_STG_CANNOTGETMETAFILE             EQUATE(-1010)
LL_ERR_STG_OUTOFMEMORY                   EQUATE(-1011)
LL_ERR_STG_SEND_FAILED                   EQUATE(-1012)
LL_ERR_STG_DOWNLOAD_PENDING              EQUATE(-1013)
LL_ERR_STG_DOWNLOAD_FAILED               EQUATE(-1014)
LL_ERR_STG_WRITE_FAILED                  EQUATE(-1015)
LL_ERR_STG_UNEXPECTED                    EQUATE(-1016)
LL_ERR_STG_CANNOTCREATEFILE              EQUATE(-1017)
LL_ERR_STG_UNKNOWN_CONVERTER             EQUATE(-1018)
LL_ERR_STG_INET_ERROR                    EQUATE(-1019)
LL_ERR_STG_NOTFOUND                      EQUATE(-1020)
LL_ERR_STG_SEND_FAILED_NEED_OAUTH2_TOKEN EQUATE(-1021)
LL_WRN_STG_UNFAXED_PAGES                 EQUATE(-1100)
LS_OPTION_HAS16BITPAGES                  EQUATE(200)
LS_OPTION_BOXTYPE                        EQUATE(201)
LS_OPTION_UNITS                          EQUATE(203)
LS_OPTION_PRINTERCOUNT                   EQUATE(204)
LS_OPTION_ISSTORAGE                      EQUATE(205)
LS_OPTION_EMFRESOLUTION                  EQUATE(206)
LS_OPTION_JOB                            EQUATE(207)
LS_OPTION_TOTALPAGES                     EQUATE(208)
LS_OPTION_PAGESWITHFAXNUMBER             EQUATE(209)
LS_OPTION_HASINPUTOBJECTS                EQUATE(210)
LS_OPTION_HASFORCEDINPUTOBJECTS          EQUATE(211)
LS_OPTION_INPUTOBJECTSFINISHED           EQUATE(212)
LS_OPTION_HASHYPERLINKS                  EQUATE(213)
LS_OPTION_USED_PRINTERCOUNT              EQUATE(214)
LS_OPTION_JOB_GTC_COUNT                  EQUATE(215)
LS_OPTION_PAGENUMBER                     EQUATE(0)
LS_OPTION_COPIES                         EQUATE(1)
LS_OPTION_PRN_ORIENTATION                EQUATE(2)
LS_OPTION_PHYSPAGE                       EQUATE(3)
LS_OPTION_PRN_PIXELSOFFSET_X             EQUATE(4)
LS_OPTION_PRN_PIXELSOFFSET_Y             EQUATE(5)
LS_OPTION_PRN_PIXELS_X                   EQUATE(6)
LS_OPTION_PRN_PIXELS_Y                   EQUATE(7)
LS_OPTION_PRN_PIXELSPHYSICAL_X           EQUATE(8)
LS_OPTION_PRN_PIXELSPHYSICAL_Y           EQUATE(9)
LS_OPTION_PRN_PIXELSPERINCH_X            EQUATE(10)
LS_OPTION_PRN_PIXELSPERINCH_Y            EQUATE(11)
LS_OPTION_PRN_INDEX                      EQUATE(12)
LS_OPTION_PRN_PAPERTYPE                  EQUATE(13)
LS_OPTION_PRN_PAPERSIZE_X                EQUATE(14)
LS_OPTION_PRN_PAPERSIZE_Y                EQUATE(15)
LS_OPTION_PRN_FORCE_PAPERSIZE            EQUATE(16)
LS_OPTION_STARTNEWSHEET                  EQUATE(17)
LS_OPTION_ISSUEINDEX                     EQUATE(18)
LS_OPTION_STARTNEWJOB                    EQUATE(19)
LS_OPTION_PAGETYPE                       EQUATE(20)
LS_OPTION_CONBINATIONPRINT_INDEX         EQUATE(21)
LS_OPTION_CONBINATIONPRINT_COUNT         EQUATE(22)
LS_OPTION_PROJECTNAME                    EQUATE(100)
LS_OPTION_JOBNAME                        EQUATE(101)
LS_OPTION_PRTNAME                        EQUATE(102)
LS_OPTION_PRTDEVICE                      EQUATE(103)
LS_OPTION_PRTPORT                        EQUATE(104)
LS_OPTION_USER                           EQUATE(105)
LS_OPTION_CREATION                       EQUATE(106)
LS_OPTION_CREATIONAPP                    EQUATE(107)
LS_OPTION_CREATIONDLL                    EQUATE(108)
LS_OPTION_CREATIONUSER                   EQUATE(109)
LS_OPTION_FAXPARA_QUEUE                  EQUATE(110)
LS_OPTION_FAXPARA_RECIPNAME              EQUATE(111)
LS_OPTION_FAXPARA_RECIPNUMBER            EQUATE(112)
LS_OPTION_FAXPARA_SENDERNAME             EQUATE(113)
LS_OPTION_FAXPARA_SENDERCOMPANY          EQUATE(114)
LS_OPTION_FAXPARA_SENDERDEPT             EQUATE(115)
LS_OPTION_FAXPARA_SENDERBILLINGCODE      EQUATE(116)
LS_OPTION_FAX_AVAILABLEQUEUES            EQUATE(118)
LS_OPTION_PRINTERALIASLIST               EQUATE(119)
LS_OPTION_PRTDEVMODE                     EQUATE(120)
LS_OPTION_USED_PRTDEVICE                 EQUATE(121)
LS_OPTION_USED_PRTDEVMODE                EQUATE(122)
LS_OPTION_REGIONNAME                     EQUATE(123)
LS_OPTION_CONBINATIONPRINT_PROJECT       EQUATE(126)
LS_OPTION_CONBINATIONPRINT_DESCRIPTION   EQUATE(127)
LS_PRINTFLAG_FIT                         EQUATE(00000001H)
LS_PRINTFLAG_STACKEDCOPIES               EQUATE(00000002H)
LS_PRINTFLAG_TRYPRINTERCOPIES            EQUATE(00000004H)
LS_PRINTFLAG_SHOWDIALOG                  EQUATE(00000008H)
LS_PRINTFLAG_METER                       EQUATE(00000010H)
LS_PRINTFLAG_ABORTABLEMETER              EQUATE(00000020H)
LS_PRINTFLAG_METERMASK                   EQUATE(00000070H)
LS_PRINTFLAG_USEDEFPRINTERIFNULL         EQUATE(00000080H)
LS_PRINTFLAG_FAX                         EQUATE(00000100H)
LS_PRINTFLAG_OVERRIDEPROJECTCOPYCOUNT    EQUATE(00000200H)
LS_PRINTFLAG_IGNORE_PROJECT_TRAY         EQUATE(00010000H)
LS_PRINTFLAG_IGNORE_PROJECT_DUPLEX       EQUATE(00020000H)
LS_PRINTFLAG_IGNORE_PROJECT_COLLATION    EQUATE(00040000H)
LS_PRINTFLAG_IGNORE_PROJECT_EXTRADATA    EQUATE(00080000H)
LS_PRINTFLAG_IGNORE_JOBMARKER            EQUATE(00100000H)
LS_VIEWERCONTROL_QUERY_CHARWIDTH         EQUATE(1)
LS_VIEWERCONTROL_CLEAR                   EQUATE(WM_USER+1)
LS_VIEWERCONTROL_SET_HANDLE_EX           EQUATE(WM_USER+2)
LS_VIEWERCONTROL_SET_HANDLE              EQUATE(WM_USER+3)
LS_VIEWERCONTROLSETHANDLEFLAG_ADD        EQUATE(0100H)
LS_VIEWERCONTROLSETHANDLEFLAG_DELETE_ON_CLOSE EQUATE(0200H)
LS_VIEWERCONTROL_GET_HANDLE              EQUATE(WM_USER+4)
LS_VIEWERCONTROL_SET_FILENAME            EQUATE(WM_USER+5)
LS_STGFILEOPEN_READONLY                  EQUATE(00000000H)
LS_STGFILEOPEN_READWRITE                 EQUATE(00000001H)
LS_STGFILEOPEN_FORCE_NO_READWRITE        EQUATE(00000002H)
LS_STGFILEOPEN_DELETE_ON_CLOSE           EQUATE(00000004H)
LS_STGFILEOPENFLAG_ADD                   EQUATE(00000100H)
LS_VIEWERCONTROL_SET_OPTION              EQUATE(WM_USER+6)
LS_OPTION_MESSAGE                        EQUATE(0)
LS_OPTION_PRINTERASSIGNMENT              EQUATE(1)
LS_PRNASSIGNMENT_USEDEFAULT              EQUATE(00000000H)
LS_PRNASSIGNMENT_ASKPRINTERIFNEEDED      EQUATE(00000001H)
LS_PRNASSIGNMENT_ASKPRINTERALWAYS        EQUATE(00000002H)
LS_PRNASSIGNMENT_ALWAYSUSEDEFAULT        EQUATE(00000003H)
LS_OPTION_TOOLBAR                        EQUATE(2)
LS_OPTION_SKETCHBAR                      EQUATE(3)
LS_OPTION_SKETCHBARWIDTH                 EQUATE(4)
LS_OPTION_TOOLBARSTYLE                   EQUATE(5)
LS_OPTION_TOOLBARSTYLE_STANDARD          EQUATE(0)
LS_OPTION_TOOLBARSTYLE_OFFICEXP          EQUATE(1)
LS_OPTION_TOOLBARSTYLE_OFFICE2003        EQUATE(2)
LS_OPTION_TOOLBARSTYLEMASK               EQUATE(0fH)
LS_OPTION_TOOLBARSTYLEFLAG_GRADIENT      EQUATE(80H)
LS_OPTION_CODEPAGE                       EQUATE(7)
LS_OPTION_SAVEASFILEPATH                 EQUATE(8)
LS_OPTION_USERDATA                       EQUATE(9)
LS_OPTION_BGCOLOR                        EQUATE(10)
LS_OPTION_ASYNC_DOWNLOAD                 EQUATE(11)
LS_OPTION_LANGUAGE                       EQUATE(12)
LS_OPTION_ASSUME_TEMPFILE                EQUATE(13)
LS_OPTION_IOLECLIENTSITE                 EQUATE(14)
LS_OPTION_TOOLTIPS                       EQUATE(15)
LS_OPTION_AUTOSAVE                       EQUATE(16)
LS_OPTION_CHANGEDFLAG                    EQUATE(17)
LS_OPTION_SHOW_UNPRINTABLE_AREA          EQUATE(18)
LS_OPTION_NOUIRESET                      EQUATE(19)
LS_OPTION_NAVIGATIONBAR                  EQUATE(20)
LS_OPTION_NAVIGATIONBARWIDTH             EQUATE(21)
LS_OPTION_IN_PREVIEWPANE                 EQUATE(22)
LS_OPTION_IN_LLVIEWER                    EQUATE(23)
LS_OPTION_TABBARSTYLE                    EQUATE(24)
LS_OPTION_TABBARSTYLE_STANDARD           EQUATE(0)
LS_OPTION_TABBARSTYLE_OFFICEXP           EQUATE(1)
LS_OPTION_TABBARSTYLE_OFFICE2003         EQUATE(2)
LS_OPTION_DESIGNERPREVIEW                EQUATE(25)
LS_OPTION_MOUSEMODE                      EQUATE(26)
LS_OPTION_MOUSEMODE_MOVE                 EQUATE(1)
LS_OPTION_MOUSEMODE_ZOOM                 EQUATE(2)
LS_OPTION_MOUSEMODE_SELECT               EQUATE(3)
LS_OPTION_MOUSEMODE_WAIT                 EQUATE(4)
LS_OPTION_ALLOW_RBUTTONUSAGE             EQUATE(27)
LS_OPTION_TOOLBGCOLOR                    EQUATE(28)
LS_OPTION_PAGEITEM_SELECTED_ITEM_FRAME_TYPE EQUATE(29)
LS_OPTION_PAGEITEM_SELECTED_ITEM_FRAME_TYPE_AREAFILL_SYSTEM EQUATE(0)
LS_OPTION_PAGEITEM_SELECTED_ITEM_FRAME_TYPE_AREAFILL_WIN7ALIKE EQUATE(1)
LS_OPTION_PAGEITEM_SELECTED_ITEM_FRAME_TYPE_AREAFILL EQUATE(2)
LS_OPTION_PAGEITEM_SELECTED_ITEM_FRAME_TYPE_FRAME EQUATE(3)
LS_OPTION_PAGEITEM_SELECTED_ITEM_FRAME_HEIGHT_PX EQUATE(30)
LS_OPTION_PAGEITEM_SELECTED_ITEM_FRAME_WIDTH_PX EQUATE(31)
LS_OPTION_PAGEITEM_SELECTED_ITEM_FRAME_FILLCOLOR_ARGB EQUATE(32)
LS_OPTION_PAGEITEM_SELECTED_ITEM_FRAME_FILLCOLORHIGHLIGHTED_ARGB EQUATE(33)
LS_OPTION_PAGEITEM_SELECTED_ITEM_FRAME_FRAMECOLOR_ARGB EQUATE(34)
LS_OPTION_PAGEITEM_SELECTED_ITEM_FRAME_FRAMECOLORHIGHLIGHTED_ARGB EQUATE(35)
LS_OPTION_PAGEITEM_SELECTED_ITEM_FRAME_ROUNDED_CORNER_PX EQUATE(36)
LS_OPTION_PAGEITEM_DROPSHADOW            EQUATE(37)
LS_OPTION_PAGEITEM_DROPSHADOW_NONE       EQUATE(0)
LS_OPTION_PAGEITEM_DROPSHADOW_ONLY_NONSELECTED EQUATE(1)
LS_OPTION_PAGEITEM_PAGENUMBER            EQUATE(38)
LS_OPTION_SKETCHBAR_BGCOLOR              EQUATE(39)
LS_VIEWERCONTROL_GET_OPTION              EQUATE(WM_USER+7)
LS_VIEWERCONTROL_QUERY_ENDSESSION        EQUATE(WM_USER+8)
LS_VIEWERCONTROL_GET_ZOOM                EQUATE(WM_USER+9)
LS_VIEWERCONTROL_SET_ZOOM                EQUATE(WM_USER+10)
LS_VIEWERCONTROL_GET_ZOOMED              EQUATE(WM_USER+11)
LS_VIEWERCONTROL_POP_ZOOM                EQUATE(WM_USER+12)
LS_VIEWERCONTROL_RESET_ZOOM              EQUATE(WM_USER+13)
LS_VIEWERCONTROL_SET_ZOOM_TWICE          EQUATE(WM_USER+14)
LS_VIEWERCONTROL_SET_PAGE                EQUATE(WM_USER+20)
LS_VIEWERCONTROL_GET_PAGE                EQUATE(WM_USER+21)
LS_VIEWERCONTROL_GET_PAGECOUNT           EQUATE(WM_USER+22)
LS_VIEWERCONTROL_GET_PAGECOUNT_FAXPAGES  EQUATE(WM_USER+23)
LS_VIEWERCONTROL_GET_JOB                 EQUATE(WM_USER+24)
LS_VIEWERCONTROL_GET_JOBPAGEINDEX        EQUATE(WM_USER+25)
LS_VIEWERCONTROL_GET_METAFILE            EQUATE(WM_USER+26)
LS_VIEWERCONTROL_GET_ENABLED             EQUATE(WM_USER+27)
LS_VCITEM_SEARCH_FIRST                   EQUATE(0)
LS_VCITEM_SEARCH_NEXT                    EQUATE(1)
LS_VCITEM_SEARCH_OPTS                    EQUATE(2)
LS_VCITEM_SEARCHACTIONMASK               EQUATE(00000fffH)
LS_VCITEM_SEARCHFLAG_CASEINSENSITIVE     EQUATE(00008000H)
LS_VCITEM_SEARCHFLAG_UTF16               EQUATE(00004000H)
LS_VCITEM_SEARCHFLAGMASK                 EQUATE(0fffff000H)
LS_VCITEM_SAVE_AS_FILE                   EQUATE(3)
LS_VCITEM_SEND_AS_MAIL                   EQUATE(4)
LS_VCITEM_SEND_AS_FAX                    EQUATE(5)
LS_VCITEM_PRINT_ONE                      EQUATE(6)
LS_VCITEM_PRINT_ALL                      EQUATE(7)
LS_VCITEM_PAGENUMBER                     EQUATE(8)
LS_VCITEM_ZOOM                           EQUATE(9)
LS_VCITEM_THEATERMODE                    EQUATE(10)
LS_VCITEM_PREVSTG                        EQUATE(11)
LS_VCITEM_NEXTSTG                        EQUATE(12)
LS_VCITEM_SEARCH_DONE                    EQUATE(13)
LS_VCITEM_FIRSTPAGE                      EQUATE(14)
LS_VCITEM_NEXTPAGE                       EQUATE(15)
LS_VCITEM_PREVIOUSPAGE                   EQUATE(16)
LS_VCITEM_LASTPAGE                       EQUATE(17)
LS_VCITEM_MOUSEMODE_MOVE                 EQUATE(18)
LS_VCITEM_MOUSEMODE_ZOOM                 EQUATE(19)
LS_VCITEM_MOUSEMODE_SELECT               EQUATE(20)
LS_VIEWERCONTROL_GET_SEARCHSTATE         EQUATE(WM_USER+28)
LS_VIEWERCONTROL_SEARCH                  EQUATE(WM_USER+29)
LS_VIEWERCONTROL_SEARCHDLGACTIVE         EQUATE(WM_USER+30)
LS_VIEWERCONTROL_PRINT_CURRENT           EQUATE(WM_USER+31)
LS_VIEWERCONTROL_PRINT_ALL               EQUATE(WM_USER+32)
LS_VIEWERCONTROL_PRINT_TO_FAX            EQUATE(WM_USER+33)
LS_VIEWERCONTROL_UPDATE_TOOLBAR          EQUATE(WM_USER+35)
LS_VIEWERCONTROL_GET_TOOLBAR             EQUATE(WM_USER+36)
LS_VIEWERCONTROL_SAVE_TO_FILE            EQUATE(WM_USER+37)
LS_VIEWERCONTROL_SEND_AS_MAIL            EQUATE(WM_USER+39)
LS_VIEWERCONTROL_SET_OPTIONSTR           EQUATE(WM_USER+40)
LS_VIEWERCONTROL_GET_OPTIONSTR           EQUATE(WM_USER+41)
LS_VIEWERCONTROL_GET_OPTIONSTRLEN        EQUATE(WM_USER+42)
LS_VIEWERCONTROL_SET_NTFYCALLBACK        EQUATE(WM_USER+43)
LS_VIEWERCONTROL_GET_NTFYCALLBACK        EQUATE(WM_USER+44)
LS_VIEWERCONTROL_GET_TOOLBARBUTTONSTATE  EQUATE(WM_USER+45)
LS_VIEWERCONTROL_SET_FOCUS               EQUATE(WM_USER+46)
LS_VCSF_PREVIEW                          EQUATE(1)
LS_VCSF_SKETCHLIST                       EQUATE(2)
LS_VCSF_TOC                              EQUATE(3)
LS_VIEWERCONTROL_ADDTOOLBARITEM          EQUATE(WM_USER+47)
LS_VIEWERCONTROL_INTERNAL_CHECKERRORLIST EQUATE(WM_USER+48)
LS_VIEWERCONTROL_SET_THEATERMODE         EQUATE(WM_USER+49)
LS_VIEWERCONTROL_SET_THEATERFLIPDELAY    EQUATE(WM_USER+50)
LS_VIEWERCONTROL_SET_THEATERFLIPMODE     EQUATE(WM_USER+51)
LS_VCTFM_NONE                            EQUATE(0)
LS_VCTFM_LINEAR                          EQUATE(1)
LS_VCTFM_FADE                            EQUATE(2)
LS_VCTFM_WHEEL                           EQUATE(3)
LS_VIEWERCONTROL_SELECT_THEATERXFORM     EQUATE(WM_USER+52)
LS_VIEWERCONTROL_NTFY_PRVFSCHANGED       EQUATE(WM_USER+53)
LS_VIEWERCONTROL_SET_PROGRESSINFO        EQUATE(WM_USER+54)
LS_VIEWERCONTROL_GET_FILENAME            EQUATE(WM_USER+55)
LS_VIEWERCONTROL_QUERY_PRVFS_COMPLETE    EQUATE(WM_USER+56)
LS_VIEWERCONTROL_ONSIZEMOVE              EQUATE(WM_USER+57)
LS_VIEWERCONTROL_NTFY_SHOW               EQUATE(WM_USER+58)
LS_VIEWERCONTROL_GET_IDEVICEINFO         EQUATE(WM_USER+59)
LS_VIEWERCONTROL_REMOVEFAILURETOOLTIPS   EQUATE(WM_USER+60)
LS_VIEWERCONTROL_SET_LLNTFYSINK          EQUATE(WM_USER+61)
LS_VIEWERCONTROL_OPEN_PREVSTG            EQUATE(WM_USER+62)
LS_VIEWERCONTROL_OPEN_NEXTSTG            EQUATE(WM_USER+63)
LS_VIEWERCONTROL_GET_THEATERSTATE        EQUATE(WM_USER+64)
LS_VIEWERCONTROL_SET_PROGRESSINFO_INTERNAL EQUATE(WM_USER+65)
LS_VIEWERCONTROL_GET_THIS                EQUATE(WM_USER+67)
LS_VIEWERCONTROL_SEARCH_LINK             EQUATE(WM_USER+68)
LS_SEARCH_LINK_HYPERLINK                 EQUATE(0)
LS_VIEWERCONTROL_QUERY_DRILLDOWN_ACTIVE  EQUATE(WM_USER+69)
LS_VIEWERCONTROL_CMND_ABORT_DRILLDOWN_JOBS EQUATE(WM_USER+70)
LS_VIEWERCONTROL_STORAGE_CONTAINS_EXPORTFILE EQUATE(WM_USER+71)
LS_VIEWERCONTROL_SELECTION_COPY          EQUATE(WM_USER+72)
LS_VIEWERCONTROL_GET_HAS_SELECTION       EQUATE(WM_USER+73)
LS_VIEWERCONTROL_SELECTION_SELECT        EQUATE(WM_USER+74)
LS_VIEWERCONTROL_GET_HASUNSAVEDINPUTOBJECTS EQUATE(WM_USER+75)
LS_VIEWERCONTROL_NTFY_PAGELOADED         EQUATE(1)
LS_VIEWERCONTROL_NTFY_UPDATETOOLBAR      EQUATE(2)
LS_VIEWERCONTROL_NTFY_PRINT_START        EQUATE(3)
LS_VIEWERCONTROL_NTFY_PRINT_PAGE         EQUATE(4)
LS_VIEWERCONTROL_NTFY_PRINT_END          EQUATE(5)
LS_VIEWERCONTROL_NTFY_TOOLBARUPDATE      EQUATE(6)
LS_VIEWERCONTROL_NTFY_EXITBTNPRESSED     EQUATE(7)
LS_VIEWERCONTROL_NTFY_BTNPRESSED         EQUATE(8)
LS_VIEWERCONTROL_QUEST_BTNSTATE          EQUATE(9)
LS_VIEWERCONTROL_NTFY_ERROR              EQUATE(10)
LS_VIEWERCONTROL_NTFY_MAIL_SENT          EQUATE(11)
LS_VIEWERCONTROL_NTFY_DOWNLOADFINISHED   EQUATE(12)
LS_VIEWERCONTROL_NTFY_KEYBOARDMESSAGE    EQUATE(13)
LS_VIEWERCONTROL_NTFY_VIEWCHANGED        EQUATE(14)
LS_VIEWERCONTROL_CMND_SAVEDATA           EQUATE(15)
LS_VIEWERCONTROL_NTFY_DATACHANGED        EQUATE(16)
LS_VIEWERCONTROL_NTFY_PROGRESS           EQUATE(17)
LS_VIEWERCONTROL_QUEST_SUPPORTCONTINUATION EQUATE(18)
LS_VIEWERCONTROL_CMND_CONTINUE           EQUATE(19)
LS_VIEWERCONTROL_NTFY_VIEWERDRILLDOWN    EQUATE(20)
LS_VIEWERCONTROL_QUEST_DRILLDOWNSUPPORT  EQUATE(21)
LS_VIEWERCONTROL_QUEST_HOST_WANTS_KEY    EQUATE(22)
LS_VIEWERCONTROL_INTERNALSYNC            EQUATE(23)
LS_VIEWERCONTROL_NTFY_RP_REALDATAJOB     EQUATE(24)
LS_VIEWERCONTROL_QUEST_RP_REALDATAJOBSUPPORT EQUATE(25)
LS_VIEWERCONTROL_QUEST_PROJECTFILENAME   EQUATE(26)
LS_VIEWERCONTROL_QUEST_ORGPROJECTFILENAME EQUATE(27)
LS_VIEWERCONTROL_NTFY_EXPANDABLEREGIONSJOB EQUATE(28)
LS_VIEWERCONTROL_NTFY_INTERACTIVESORTINGJOB EQUATE(30)
LS_VIEWERCONTROL_QUEST_ANYREALDATAJOBSUPPORT EQUATE(32)
LS_VIEWERCONTROL_NTFY_HYPERLINK          EQUATE(33)
LS_VIEWERCONTROL_NTFY_ZOOMCHANGED        EQUATE(34)
LS_VIEWERCONTROL_NTFY_ACTIONRESULT       EQUATE(35)
LS_VIEWERCONTROL_NTFY_RESETSEARCHSTATE   EQUATE(36)
LS_VIEWERCONTROL_NTFY_SELECTION_CHANGED  EQUATE(37)
LS_VIEWERCONTROL_QUEST_DYNAMICREPORTPARAMETERS EQUATE(38)
LS_MAILCONFIG_GLOBAL                     EQUATE(0001H)
LS_MAILCONFIG_USER                       EQUATE(0002H)
LS_MAILCONFIG_PROVIDER                   EQUATE(0004H)
LS_DIO_CHECKBOX                          EQUATE(0)
LS_DIO_PUSHBUTTON                        EQUATE(1)
LS_DIO_FLAG_READONLY                     EQUATE(0001H)
LSMAILVIEW_HTMLRIGHT_ALLOW_NONE          EQUATE(0000H)
LSMAILVIEW_HTMLRIGHT_ALLOW_NEW_WINDOW    EQUATE(0001H)
LSMAILVIEW_HTMLRIGHT_ALLOW_NAVIGATION    EQUATE(0002H)
LSMAILVIEW_HTMLRIGHT_ALLOW_JAVA          EQUATE(0004H)
LSMAILVIEW_HTMLRIGHT_ALLOW_SCRIPTING     EQUATE(0008H)
LSMAILVIEW_HTMLRIGHT_ALLOW_ACTIVEX       EQUATE(0010H)
LSMAILVIEW_HTMLRIGHT_ALLOW_ONLINE        EQUATE(0020H)
LSMAILVIEW_HTMLRIGHT_ALLOW_BROWSERCONTEXTMENU EQUATE(0040H)
LSMAILVIEW_HTMLRIGHT_ALLOW_PRINT         EQUATE(0080H)

CMBTLANG_DEFAULT   EQUATE(-1)
CMBTLANG_GERMAN    EQUATE(0)
CMBTLANG_ENGLISH   EQUATE(1)
CMBTLANG_ARABIC    EQUATE(2)
CMBTLANG_AFRIKAANS EQUATE(3)
CMBTLANG_ALBANIAN  EQUATE(4)
CMBTLANG_BASQUE    EQUATE(5)
CMBTLANG_BULGARIAN EQUATE(6)
CMBTLANG_BYELORUSSIA EQUATE(7)
CMBTLANG_CATALAN   EQUATE(8)
CMBTLANG_CHINESE   EQUATE(9)
CMBTLANG_CROATIAN  EQUATE(10)
CMBTLANG_CZECH     EQUATE(11)
CMBTLANG_DANISH    EQUATE(12)
CMBTLANG_DUTCH     EQUATE(13)
CMBTLANG_ESTONIAN  EQUATE(14)
CMBTLANG_FAEROESE  EQUATE(15)
CMBTLANG_FARSI     EQUATE(16)
CMBTLANG_FINNISH   EQUATE(17)
CMBTLANG_FRENCH    EQUATE(18)
CMBTLANG_GREEK     EQUATE(19)
CMBTLANG_HEBREW    EQUATE(20)
CMBTLANG_HUNGARIAN EQUATE(21)
CMBTLANG_ICELANDIC EQUATE(22)
CMBTLANG_INDONESIAN EQUATE(23)
CMBTLANG_ITALIAN   EQUATE(24)
CMBTLANG_JAPANESE  EQUATE(25)
CMBTLANG_KOREAN    EQUATE(26)
CMBTLANG_LATVIAN   EQUATE(27)
CMBTLANG_LITHUANIAN EQUATE(28)
CMBTLANG_NORWEGIAN EQUATE(29)
CMBTLANG_POLISH    EQUATE(30)
CMBTLANG_PORTUGUESE EQUATE(31)
CMBTLANG_ROMANIAN  EQUATE(32)
CMBTLANG_RUSSIAN   EQUATE(33)
CMBTLANG_SLOVAK    EQUATE(34)
CMBTLANG_SLOVENIAN EQUATE(35)
CMBTLANG_SERBIAN   EQUATE(36)
CMBTLANG_SPANISH   EQUATE(37)
CMBTLANG_SWEDISH   EQUATE(38)
CMBTLANG_THAI      EQUATE(39)
CMBTLANG_TURKISH   EQUATE(40)
CMBTLANG_UKRAINIAN EQUATE(41)
CMBTLANG_SERBIAN_LATIN   EQUATE(42)


 SECTION('Prototypes')
  MODULE('CMLS28')
   LlStgsysStorageOpen                      (*CSTRING,*CSTRING,SHORT,SHORT),ULONG,PASCAL,RAW,NAME('LlStgsysStorageOpenA')
   LlStgsysStorageClose                     (ULONG),PASCAL,RAW
   LlStgsysGetAPIVersion                    (ULONG),SIGNED,PASCAL,RAW
   LlStgsysGetFileVersion                   (ULONG),SIGNED,PASCAL,RAW
   LlStgsysGetFilename                      (ULONG,SIGNED,SIGNED,*CSTRING,UNSIGNED),SIGNED,PASCAL,RAW,NAME('LlStgsysGetFilenameA')
   LlStgsysGetJobCount                      (ULONG),SIGNED,PASCAL,RAW
   LlStgsysSetJob                           (ULONG,SIGNED),SIGNED,PASCAL,RAW
   LlStgsysGetJob                           (ULONG),SIGNED,PASCAL,RAW
   LlStgsysGetPageCount                     (ULONG),SIGNED,PASCAL,RAW
   LlStgsysGetJobOptionValue                (ULONG,SIGNED),SIGNED,PASCAL,RAW
   LlStgsysGetPageOptionValue               (ULONG,SIGNED,SIGNED),SIGNED,PASCAL,RAW
   LlStgsysGetPageOptionString              (ULONG,SIGNED,SIGNED,*CSTRING,UNSIGNED),SIGNED,PASCAL,RAW,NAME('LlStgsysGetPageOptionStringA')
   LlStgsysSetPageOptionString              (ULONG,SIGNED,SIGNED,*CSTRING),SIGNED,PASCAL,RAW,NAME('LlStgsysSetPageOptionStringA')
   LlStgsysAppend                           (ULONG,ULONG),SIGNED,PASCAL,RAW
   LlStgsysDeleteJob                        (ULONG,SIGNED),SIGNED,PASCAL,RAW
   LlStgsysDeletePage                       (ULONG,SIGNED),SIGNED,PASCAL,RAW
   LlStgsysGetPageMetafile                  (ULONG,SIGNED),HANDLE,PASCAL,RAW
   LlStgsysDestroyMetafile                  (HANDLE),SIGNED,PASCAL,RAW
   LlStgsysDrawPage                         (ULONG,HDC,HDC,SHORT,*RECT,SIGNED,SHORT,PVOID),SIGNED,PASCAL,RAW
   LlStgsysGetLastError                     (ULONG),SIGNED,PASCAL,RAW
   LlStgsysDeleteFiles                      (ULONG),SIGNED,PASCAL,RAW
   LlStgsysPrint                            (ULONG,*CSTRING,*CSTRING,SIGNED,SIGNED,SIGNED,UNSIGNED,*CSTRING,HWND),SIGNED,PASCAL,RAW,NAME('LlStgsysPrintA')
   LlStgsysStoragePrint                     (*CSTRING,*CSTRING,*CSTRING,*CSTRING,SIGNED,SIGNED,SIGNED,UNSIGNED,*CSTRING,HWND),SIGNED,PASCAL,RAW,NAME('LlStgsysStoragePrintA')
   LlStgsysGetPagePrinter                   (ULONG,SIGNED,*CSTRING,UNSIGNED,*HANDLE),SIGNED,PASCAL,RAW,NAME('LlStgsysGetPagePrinterA')
   LsSetDebug                               (SHORT),PASCAL,RAW
   LsGetViewerControlClassName              (),*CSTRING,PASCAL,RAW,NAME('LsGetViewerControlClassNameA')
   LsGetViewerControlDefaultMessage         (),UNSIGNED,PASCAL,RAW
   LsCreateViewerControlOverParent          (ULONG,HWND),SIGNED,PASCAL,RAW
   LlStgsysGetJobOptionStringEx             (ULONG,*CSTRING,*CSTRING,UNSIGNED),SIGNED,PASCAL,RAW,NAME('LlStgsysGetJobOptionStringExA')
   LlStgsysSetJobOptionStringEx             (ULONG,*CSTRING,*CSTRING),SIGNED,PASCAL,RAW,NAME('LlStgsysSetJobOptionStringExA')
   LsConversionJobOpen                      (HWND,SIGNED,*CSTRING),ULONG,PASCAL,RAW,NAME('LsConversionJobOpenA')
   LsConversionJobClose                     (ULONG),SIGNED,PASCAL,RAW
   LsConversionConfigurationDlg             (ULONG,HWND),SIGNED,PASCAL,RAW
   LsConversionSetOptionString              (ULONG,*CSTRING,*CSTRING),SIGNED,PASCAL,RAW,NAME('LsConversionSetOptionStringA')
   LsConversionGetOptionString              (ULONG,*CSTRING,*CSTRING,UNSIGNED),SIGNED,PASCAL,RAW,NAME('LsConversionGetOptionStringA')
   LsConversionConvertEMFToFile             (ULONG,HENHMETAFILE,*CSTRING),SIGNED,PASCAL,RAW,NAME('LsConversionConvertEMFToFileA')
   LsConversionConvertStgToFile             (ULONG,ULONG,*CSTRING),SIGNED,PASCAL,RAW,NAME('LsConversionConvertStgToFileA')
   LlStgsysStorageConvert                   (*CSTRING,*CSTRING,*CSTRING),SIGNED,PASCAL,RAW,NAME('LlStgsysStorageConvertA')
   LlStgsysConvert                          (ULONG,*CSTRING,*CSTRING),SIGNED,PASCAL,RAW,NAME('LlStgsysConvertA')
   LsMailConfigurationDialog                (HWND,*CSTRING,UNSIGNED,SIGNED),SIGNED,PASCAL,RAW,NAME('LsMailConfigurationDialogA')
   LsMailJobOpen                            (SIGNED),ULONG,PASCAL,RAW
   LsMailJobClose                           (ULONG),SIGNED,PASCAL,RAW
   LsMailSetOptionString                    (ULONG,*CSTRING,*CSTRING),SIGNED,PASCAL,RAW,NAME('LsMailSetOptionStringA')
   LsMailGetOptionString                    (ULONG,*CSTRING,*CSTRING,UNSIGNED),SIGNED,PASCAL,RAW,NAME('LsMailGetOptionStringA')
   LsMailSendFile                           (ULONG,HWND),SIGNED,PASCAL,RAW
   LlStgsysStorageCreate                    (*CSTRING,*CSTRING,HDC,*RECT,SHORT),ULONG,PASCAL,RAW,NAME('LlStgsysStorageCreateA')
   LlStgsysAppendEMF                        (ULONG,HENHMETAFILE,HDC,*RECT,SHORT),SIGNED,PASCAL,RAW
   LsProfileStart                           (HANDLE,*CSTRING,*CSTRING,SIGNED),SIGNED,PASCAL,RAW,NAME('LsProfileStartA')
   LsProfileEnd                             (HANDLE),PASCAL,RAW
   LsMailView                               (HWND,*CSTRING,UNSIGNED,SIGNED),SIGNED,PASCAL,RAW,NAME('LsMailViewA')
   LsInternalCreateViewerControlOverParent13 (HWND,UNSIGNED),SIGNED,PASCAL,RAW
   LsInternalGetViewerControlFromParent13   (HWND),HWND,PASCAL,RAW
   LsSetDlgboxMode                          (UNSIGNED),PASCAL,RAW
   LsGetDlgboxMode                          (),UNSIGNED,PASCAL,RAW
   LsGetDebug                               (),SHORT,PASCAL,RAW
   LlStgsysSetUILanguage                    (ULONG,SIGNED),SHORT,PASCAL,RAW
 END
