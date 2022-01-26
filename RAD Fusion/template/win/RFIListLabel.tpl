#TEMPLATE(RFIListLabel,'RADFusion Templates for List & Label (beta-2 build 8)'),FAMILY('ABC')
#HELP('LL.HLP')
#SYSTEM
#EQUATE(%ABCErrorsPresent,%False)                                               #!Declare a global symbol
#DECLARE(%MyNewMethods),MULTI
#DECLARE(%MethodTable,%MyNewMethods)
#!*****************************************************************************
#EXTENSION(GlobalListLabel,'List & Label Globals Beta-2 (Build 8)'),HLP('The Global Extension Template'),APPLICATION
#BOXED('Default prompts'),AT(0,0),WHERE(%False),HIDE
  #INSERT (%OOPHiddenPrompts(ABC))
#ENDBOXED
#!==================================================================================================
#PREPARE                                                                        #!Set class name in case developers never edits the name
  #CALL(%ReadABCFiles(ABC))                                                     #!Read ABC class headers if needed
  #CALL(%SetClassDefaults(ABC),'LL','LL','ListLabel')                           #!Set local name from libsrc class name
#ENDPREPARE                                                                     #! end #PREPARE
#!==================================================================================================
#ATSTART
  #CALL(%ReadABCFiles(ABC))                                                     #!Read ABC class headers if needed
  #CALL(%SetClassDefaults(ABC),'LL','LL','ListLabel')                           #!Set local name from libsrc class name
#ENDAT
#!==================================================================================================
#AT(%BeforeGenerateApplication)                                                 #!For exporting the class
  #CALL(%AddCategory(ABC),'RFI')                                                #!The parameter in the !ABCIncludeFile comment in the INC file
  #CALL(%SetCategoryLocation(ABC),'RFI','RFI')                                  #!Used for DLLMode_ and LinkMode_ pragmas (see defines tab in project editor)
#ENDAT                                                                          #! end #AT(%BeforeGenerateApplication)
#!==================================================================================================
#INSERT(%RADFusionLogo)
#DISPLAY('RADFusion Templates for List and Label'),AT(5,,190),PROP(PROP:FontStyle,700),PROP(PROP:Center),PROP(PROP:FontColor,880000H),PROP(PROP:Color,0FFFFFFH)
#BOXED('Global Options'),SECTION
  #DISPLAY('This dialog sets and changes the default behavior using List and Label.  The only required entries are under the global button.'),AT(10,3,180,25),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
#ENDBOXED
#BOXED(''),PROP(PROP:Bevel,1)
  #BUTTON('&Global'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400),AT(,,,15)
    #INSERT(%RADFusionLogo)
    #BOXED(''),PROP(PROP:Bevel,1)
      #DISPLAY('RADFusion Templates for List && Label - ABC'),PROP(PROP:FontColor,0FF0000H),PROP(PROP:FontStyle,400),PROP(PROP:Color,0FFFFFFH)
      #DISPLAY('Beta-2, build 8'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #DISPLAY('Release date:- May 3rd, 2010'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #DISPLAY('(c) Copyright RADFusion International, LLC.  2007-2010'),AT(,,160,17),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #DISPLAY('Which version of List && Label are you using?'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #PROMPT('Version:',DROP('Version 15|Version 14|Version 13|Version 12')),%LLVersion,DEFAULT('Version 15'),PROP(PROP:Tip,'Only version 12 thru 15 are supported'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
    #ENDBOXED
    #BOXED('Combit License'),PROP(PROP:Bevel,1)
      #DISPLAY('This can be found in the file PERSLIC.TXT in your Combit directory'),AT(,,160,17),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #DISPLAY('Remember to update this when you use a new version of List && Label'),AT(,,160,20),PROP(PROP:FontColor,4127FFH),PROP(PROP:FontStyle,400)
      #PROMPT('Personal license key (req)',@S6),%LLPerLicense,REQ,PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #PROMPT('License Type',OPTION),%LLLicenseType,REQ,PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #PROMPT('Professional',RADIO),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #PROMPT('Standard',RADIO),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
    #ENDBOXED
  #ENDBUTTON
#!==================================================================================================
  #BUTTON('&Classes'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400),AT(,,,15)   #!Global class dialog
    #INSERT(%RADFusionLogo)
    #PROMPT('&Default class:',FROM(%pClassName)),%ClassName,DEFAULT('ListLabel'),REQ
    #DISPLAY()
    #BOXED(' Usage '),PROP(PROP:Bevel,1)
      #DISPLAY('If you have another class you wish to use instead, select it from the list above or use the default shown.'),AT(,,175,16),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
    #ENDBOXED
    #BUTTON('&List && Label Class'),AT(4,,186),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400) #!Display a button
      #WITH(%ClassItem,'LL')                                                      #!Show the global instance name
        #INSERT(%GlobalClassPrompts(ABC))                                         #!Add the class prompt dialog.
      #ENDWITH                                                                    #! end #WITH(%ClassItem,'LL')
    #ENDBUTTON                                                                    #! end #BUTTON('&List && Label Class')
  #ENDBUTTON                                                                      #! end #BUTTON('C&lasses')
#!==================================================================================================
  #BUTTON('&Unicode'),WHERE(%LLLicenseType='Professional'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400),AT(,,,15)
    #INSERT(%RADFusionLogo)
    #BOXED(''),PROP(PROP:Bevel,1)
      #DISPLAY('Unicode is supported on W2K and later.'),AT(10,,160,15),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #PROMPT('Use Unicode',CHECK),%LLUseUnicode,AT(10),DEFAULT(%False),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #DISPLAY('Please see your .shp file for .dlls that need to be shipped with your application.  The .dlls that you ship for Unicode support are different that ordinary character sets.'),AT(10,,175,35),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
    #ENDBOXED
  #ENDBUTTON
#!==================================================================================================
  #BUTTON('&Paths'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400),AT(,,,15)
    #INSERT(%RADFusionLogo)
    #BOXED(''),PROP(PROP:Bevel,1)
      #DISPLAY('You may specify a folder to store your List && Label files.  Leave blank for current folder. Remember to end your entry with \.'),AT(,,175,25),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #PROMPT('Designer Folder: ', OPTFIELD),%LLGloDirectory,PROP(PROP:Tip,'Enter the path here or use !Variable. The global variable LLGlobalPath holds the value.')
      #PROMPT('Preview folder: ', OPTFIELD),%LLGloPreviewDirectory,PROP(PROP:Tip,'Enter the path here or use !Variable. The global variable LLGlobalPreviewPath holds the value.')
      #PROMPT('Create folders if they do not exist',CHECK),%LLGloCreateDir,DEFAULT(%True),AT(10),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
    #ENDBOXED
  #ENDBUTTON
#!==================================================================================================
  #BUTTON('O&verride'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400),AT(,,,15)
    #INSERT(%RADFusionLogo)
    #BOXED(''),PROP(PROP:Bevel,1)
      #DISPLAY('You may use the field description in the dictionary rather than the field name if you prefer.  If a description does not exist, then it uses the field name instead.'),AT(,,170,35),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #PROMPT('Use field description',CHECK),%LLGloUseFieldDesc,AT(10),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
    #ENDBOXED
    #BUTTON('Rename fields'),AT(4,,90),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400),AT(,,,15)
      #BOXED(''),PROP(PROP:Bevel,1)
        #DISPLAY('You may use this option to rename fields and also prevent them from being available within the List and Label Designer.'),AT(10,,160,30),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #BUTTON('Fields to override'),MULTI(%LLGloOverrideFields,%LLGloOverRideField & ' - ' & %LLGloRemoveRename),INLINE,AT(,,,60)
          #PROMPT('From File:',FILE),%LLOverrideFile,REQ,PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
          #ENABLE(%LLOverrideFile)
            #PROMPT('Field to override:',FIELD(%LLGloOverRideFile)),%LLGloOverRideField,REQ,PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
            #PROMPT('Remove or Rename',OPTION),%LLGloRemoveRename,PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
            #PROMPT('Do not send to List and Label',RADIO),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
            #PROMPT('Rename',RADIO),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
            #ENABLE(%LLGloRemoveRename = 'Rename')
              #PROMPT('Rename to',@s100),%LLGloRenameTo,PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
              #DISPLAY('** NOTE ** Do not include the prefix'),PROP(PROP:FontColor,4127FFH),PROP(PROP:FontStyle,400)
            #ENDENABLE
          #ENDENABLE
        #ENDBUTTON
      #ENDBOXED
    #ENDBUTTON
    #BUTTON('Rename files'),AT(,,90),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400),AT(,,,15)
      #BOXED(''),PROP(PROP:Bevel,1)
        #DISPLAY('You may rename your files if they are not descriptive enough.  In the designer, they will appear with the renamed filename.'),AT(,,180,30),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #BUTTON('Files to override'),MULTI(%LLGloRenameFiles,%LLGloRenameFile & ' - ' & %LLGloFileRename),INLINE,AT(,,,60),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
          #PROMPT('File to override',FILE),%LLGloRenameFile,REQ,PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
          #PROMPT('Rename to',@s50),%LLGloFileRename,REQ,PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #ENDBUTTON
      #ENDBOXED
    #ENDBUTTON
    #BUTTON('ABC Error Handling'),AT(4,,90),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #BOXED(''),PROP(PROP:Bevel,1)
        #DISPLAY('In order to make translations easier, enter the label of the error block you would like to use.'),AT(,,180,30),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Enter the e&rror block label:',@S30),%LLErrorBlock,DEFAULT('ListLabelErrors'),REQ,PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #ENDBOXED
    #ENDBUTTON
  #ENDBUTTON
#!==================================================================================================
  #BUTTON('Default &Options'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400),AT(,,,15)
    #INSERT(%RADFusionLogo)
    #BOXED(''),PROP(PROP:Bevel,1)
      #PROMPT('Default Type of Progress: ',DROP('Clarion Progress Bar|Abort, bar meter & text|Abort, bridge meter & text|Abort & text|Bar meter & text|Bridge meter & text|Text Only')),%GloDefaultProgressType,PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #DISPLAY('')
    #ENDBOXED
    #DISPLAY('NOTE: Not all the following are supported in this beta, but will be in final release. The class uses the default values, some of which may or may not be overridden here yet.'),AT(,,180,30),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
    #SHEET
      #TAB('Set up options 1')
        #DISPLAY('Options for the internal SetOption() virtual method'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('A&dd vars to fields ',CHECK),%GloDefAddVarsToFields,DEFAULT(%True),AT(10),PROP(PROP:Tip,'True: in list projects the formula wizard offers variable<13,10> in addition to fields in table column formula.'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Use e&xporters ',CHECK),%GloDefAllowLLXExporters,DEFAULT(%True),AT(10),PROP(PROP:Tip,'True accepts export modules'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Auto multi-page ',CHECK),%GloDefAutoMultiPage,DEFAULT(%True),AT(10),PROP(PROP:Tip,'Let L&L use its page break algorithm when true'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Calc sums on invisible lines ',CHECK),%GloDefCalcSumVarsOnInvisibleLines,DEFAULT(%False),AT(10),PROP(PROP:Tip,'When true, sum variables also calculated if data lines suppressed'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Calc sums on partial lines',CHECK),%GloDefCalcSumVarsOnPartialLines,DEFAULT(%False),AT(10),PROP(PROP:Tip,'When true, sum vars are updates as soon as one data line prints, otherwise all <13,10>data lines must print before sum vars are updated'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Compress RTF ',CHECK),%GloDefCompressRTF,DEFAULT(%True),AT(10),PROP(PROP:Tip,'Compresses text in RTF when true.  If false, text is visible in project file'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Compress storage ',CHECK),%GloDefCompressStorage,DEFAULT(%False),AT(10),PROP(PROP:Tip,'Preview data is compressed when true, its a bit slower but saves a lot of disk space.'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Convert CR/LF ',CHECK),%GloDefConvertCRLF,DEFAULT(%False),AT(10),PROP(PROP:Tip,'CR/LF combinations in fields and vars translate to LF and prevent duplicate line breaks when true'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('&Delay Table Header ',CHECK),%GloDefDelayTableHead,DEFAULT(%False),AT(10),PROP(PROP:Tip,'Prints the table header when calling Print or first printing a field.'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('&Show error when graphic not found ',CHECK),%GloDefEeOnFileNotFound,DEFAULT(%False),AT(10),PROP(PROP:Tip,'Show error if graphic file not found when printing if true'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Escape closes preview',CHECK),%GloDefEscClosesPreview,DEFAULT(%False),AT(10),PROP(PROP:Tip,'When true, Escape key closes preview window'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Force font character set ',CHECK),%GloDefForceFontCharSet,DEFAULT(%False),AT(10),PROP(PROP:Tip,'When true, all fonts in system offered in font selection <13,10>combo boxes or support charset of default LCID'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Show help buttons ',CHECK),%GloDefHelpAvailable,DEFAULT(%True),AT(10),PROP(PROP:Tip,'When true, shows the help buttons'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Immediate last page ',CHECK),%GloDefImmediateLastPage,DEFAULT(%False),AT(10),PROP(PROP:Tip,'When true a non-finished object immediately forces LastPage() resetting all appended objects'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #ENDTAB
      #TAB('Set up options 2')
        #PROMPT('Incremental preview ',CHECK),%GloDefIncrementalPreview,DEFAULT(%True),AT(10),PROP(PROP:Tip,'When true, preview displays when 1st page created, adding further pages incrementally.'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Inter-character spacing ',CHECK),%GloDefInterCharSpacing,DEFAULT(%False),AT(10),PROP(PROP:Tip,'When true, spaces between chars for block <13,10>justified text varies, otherwise only spaces are varied'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Font descent on ',CHECK),%GloDefIncludeFontDescent,DEFAULT(%True),AT(10),PROP(PROP:Tip,'The logfont member is considered when calculating line distances.  <13,10>This leads to wider line space, but prevents extreme fonts from being cut off'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Hide fax variables ',CHECK),%GloDefNoFaxVars,DEFAULT(%False),AT(10),PROP(PROP:Tip,'Fax variables are visible in Designer when false'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Do not warn of previous version',CHECK),%GloLLWarnVersion,DEFAULT(%False),AT(10),PROP(PROP:Tip,'If True, conversion takes place to the new version with no warnings.'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Wrap page footer ',CHECK),%GloDefNoFooterPageWrap,DEFAULT(%False),AT(10),PROP(PROP:Tip,'When true, footers that wont fit below the table start on the next page'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Hide mail variables ',CHECK),%GloDefNoMailVars,DEFAULT(%False),AT(10),PROP(PROP:Tip,'When false, mail variables are visible in Designer'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('No &Table Checking ',CHECK),%GloDefNoTableCheck,DEFAULT(%False),AT(10),PROP(PROP:Tip,'For list projects, no check is made to ensure at least one table is present.'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('No &Parameter Checking ',CHECK),%GloDefNoParamCheck,DEFAULT(%False),AT(10),PROP(PROP:Tip,'List && Label will not check paramets passed to its DLL, <13,10>which results is faster processing speed.'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Explorer style dialogs ',CHECK),%GloDefOFNDialogExplorer,DEFAULT(%True),AT(10),PROP(PROP:Tip,'When true, dialogs are in Explorer style, otherwise use the old dialog style'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Suppress places bar in dialogs ',CHECK),%GloDefOFNDialogNoPlacesBar,DEFAULT(%False),AT(10),PROP(PROP:Tip,'When false, the full dialog displays'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Backup project files ',CHECK),%GloDefProjectBackup,DEFAULT(%True),AT(10),PROP(PROP:Tip,'When true Designer makes backup project files'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('One table only ',CHECK),%GloDefOnlyOneTable,DEFAULT(%False),AT(10),PROP(PROP:Tip,'When true, only one table allowed, a second list object wont be allowed'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Use current time ',CHECK),%GloDefRealTime,DEFAULT(%False),AT(10),PROP(PROP:Tip,'Time() and Now() function in L&L always use current time, <13,10>otherwise set once when project loads'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('High resolution barcodes ',CHECK),%GloDefResolutionCompatibleto9X,DEFAULT(%False),AT(10),PROP(PROP:Tip,'When true can lead to display issues on Win 9x <13,10>machines when showing in preview'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #ENDTAB
      #TAB('Setup options 3')
        #PROMPT('Scalable fonts only ',CHECK),%GloDefScalableFontsOnly,DEFAULT(%True),AT(10),PROP(PROP:Tip,'Font dialogs restricted to scalable fonts like TrueType and Vector fonts when true'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Save user info in project file ',CHECK),%GloDefSetCreationInfo,DEFAULT(%True),AT(10),PROP(PROP:Tip,'L&L stores user info in the project and preview file.'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Show internal variables ',CHECK),%GloDefShowPredefVars,DEFAULT(%True),AT(10),PROP(PROP:Tip,'Show internal L&L vars  in variable selection dialog of the formula wizard'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Sketch color depth ',DROP('8|16|32')),%GloDefSketchColorDepth,DEFAULT('8'),PROP(PROP:Tip,'Sets the color depth of the sketch file file the file selection dialog'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Remove blank lines at end of RTF ',CHECK),%GloDefSkipReturnAtEndOfRTF,AT(10),PROP(PROP:Tip,'RETF text may contain blank lines at the end, when true these are removed'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('S&ort Variables ',CHECK),%GloDefSortVars,DEFAULT(%False),AT(10),PROP(PROP:Tip,'If true, variables are sorted alphabetically.'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('S&pace Optimization ',CHECK),%GloDefSpaceOptimize,DEFAULT(%True),AT(10),PROP(PROP:Tip,'Uses the space optimization feature for new paragrpahs in <13,10>text objects and new fields.'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('S&upervisor Option ',CHECK),%GloDefSupervisor,DEFAULT(%False),AT(10),PROP(PROP:Tip,'If true all menu options are allowed and objects unlocked.'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('&Show page breaks ',CHECK),%GloDefSupportTextPageBreak,DEFAULT(%False),AT(10),PROP(PROP:Tip,'The page break checkbox of the text object is shown and can be checked by the user.'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('&Case Sensitive Variables ',CHECK),%GloDefCaseSensitiveVars,DEFAULT(%False),AT(10),PROP(PROP:Tip,'Variables and field names are case sensitive.'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #ENDTAB
    #ENDSHEET
  #ENDBUTTON
#!==================================================================================================
  #BUTTON('&Preview Options'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400),AT(,,,15)
    #INSERT(%RADFusionLogo)
    #PROMPT('Do Not Use List && Label Previewer',CHECK),%GloDefaultNotUseLLPreviewer,AT(10),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
    #ENABLE(%GloDefaultNotUseLLPreviewer = %True)
      #PROMPT('Previewer Procedure: ',PROCEDURE),%GloDefaultLLPreviewProcedure,PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400),PROP(PROP:Tip,'This is the procedure you would rather use for previewing List and Label reports.  It is called instead of the internal List and Label Previewer')
    #ENDENABLE
    #ENABLE(%GloDefaultNotUseLLPreviewer = %False)
      #BOXED('Options'),PROP(PROP:Bevel,1)
        #PROMPT('Remove "Send &to" Button ',CHECK),%GloDefPreviewSendTo,DEFAULT(%False),AT(10),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
        #PROMPT('Remove "Save &as" Button ',CHECK),%GloDefPreviewSaveAs,DEFAULT(%False),AT(10),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #ENDBOXED
    #ENDENABLE
    #BOXED('Preview exported reports'),PROP(PROP:Bevel,1)
      #DISPLAY('If exporting reports, you may select a variable which if set'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #DISPLAY('to TRUE, will then run the exported file in the Windows'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #DISPLAY('registered program. If no variable is selected, the file'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #DISPLAY('will not be automatically viewed.'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #DISPLAY('For example PDF files will automatically run ADOBE to'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #DISPLAY('view file after printing.'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #DISPLAY('')
      #PROMPT('Variable to trigger program',@s40),%GloTriggerRun,PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
    #ENDBOXED
    #BOXED('Compress preview files'),PROP(PROP:Bevel,1)
      #DISPLAY('Do you wish to generate compressed preview files?'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #DISPLAY('This option will slow the printing down slightly but will'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #DISPLAY('produce much smaller preview files'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #PROMPT('Use compressed preview files',CHECK),%GloLLCompressPreview,AT(10),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #DISPLAY
    #ENDBOXED
  #ENDBUTTON
#!==================================================================================================
  #BUTTON('User &Interface'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400),AT(,,,15)
    #INSERT(%RADFusionLogo)
    #DISPLAY('Please note that you must supply the correct'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
    #DISPLAY('language kit to your end-user.  See the .SHP file'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
    #DISPLAY('for the complete list.'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
    #DISPLAY('')
    #PROMPT('Language to Use: ',DROP('Catalan|Danish|Dutch|English|French|German|Greek|Hungarian|Italian|Norwegian|Portuguese|Russian|Spanish|Swedish')),%Language,DEFAULT('English'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
    #PROMPT('Dialog Design: ',DROP('Standard Windows Style|Win95 Button Style|Flat Buttons')),%ButtonStyle,Default('Win95 Button Style'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
    #PROMPT('Button Text has 3D style', CHECK),%ButtonThreeDee,AT(10),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
    #PROMPT('Enable 98 Style Tooltips', CHECK),%ToolTips,AT(10),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
    #PROMPT('No Icons on Message Buttons', CHECK),%NoBitMaps,AT(10),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
    #BOXED('Manual Variables Group'),PROP(PROP:Bevel,1)
      #DISPLAY('By default, Manual variables appear in the designer'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #DISPLAY('under the group of OTHER. You may override this'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #DISPLAY('group name if you so wish'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
      #PROMPT('Group name: ',@s30),%ManualGroupName,DEFAULT('OTHER'),PROP(PROP:FontColor,7B0012H),PROP(PROP:FontStyle,400)
    #ENDBOXED
  #ENDBUTTON
#!#ENDSHEET
#ENDBOXED
#!==================================================================================================
#AT(%GatherObjects)                                                             #!Ensure objects are known and loaded in memory
  #CALL(%ReadABCFiles(ABC))                                                     #!Read ABC class headers if needed
  #CALL(%AddObjectList(ABC),'LL')                                               #!Add the template object to object list 
  #ADD(%ObjectList,%ThisObjectName)                                             #!Add the object to the list of all objects
  #SET(%ObjectListType,'ListLabel')                                             #!Set the base class name
#ENDAT                                                                          #! end #AT(%GatherObjects)
#!==================================================================================================
#AT(%GlobalDataClasses)                                                         #!At global class embed point
  #CALL(%SetClassItem(ABC), 'LL')                                               #!Set the current instance
  #INSERT(%GenerateClass(ABC), 'LL','Global instance and definition'),NOINDENT  #!and generate class instance into column 1, but preserve indent of template code
#ENDAT                                                                          #! end #AT(%GloballDataClasses)
#!==================================================================================================
#AT(%ListLabelMethodCodeSection),PRIORITY(5000),DESCRIPTION('Parent Call'),WHERE(%ParentCallValid())  #!Add parent call embed point
  #CALL(%GenerateParentCall(ABC))                                               #!Generate the parent call
#ENDAT                                                                          #! end #AT(%DebugerClassMethodCodeSection,%ApplicationTemplateInstance)
#!==================================================================================================
#IF(%BaseClassToUse())                                                          #!If there is a base class
  #CALL(%FixClassName(ABC),%BaseClassToUse())                                   #!Assign the base class, cleaning up any errors
  #FOR(%pClassMethod)                                                           #!For every method in this class
    #FOR(%pClassMethodPrototype),WHERE(%MethodEmbedPointValid())                #!and the prototype is not private  
      #CALL(%SetupMethodCheck(ABC))                                             #!ensure the proper instance, any overrides, etc are generated
      #EMBED(%ListLabelMethodDataSection,'ListLabel Method Data Section'),%pClassMethod,%pClassMethodPrototype,LABEL,DATA,PREPARE(,%FixClassName(%FixBaseClassToUse('ListLabel'))),TREE(%GetEmbedTreeDesc('RFI','DATA'))
      #?CODE                                                                    #<!Add CODE statement for method
        #EMBED(%ListLabelMethodCodeSection,'ListLabel Method Code Section'),%pClassMethod,%pClassMethodPrototype,PREPARE(,%FixClassName(%FixBaseClassToUse('ListLabel'))),TREE(%GetEmbedTreeDesc('RFI','CODE'))
      #CALL(%CheckAddMethodPrototype(ABC),%ClassLines)                          #!Generate the prototype and structure for each method
    #ENDFOR                                                                     #! end #FOR(%pClassMethodPrototype),WHERE(%MethodEmbedPointValid())
  #ENDFOR                                                                       #! end #FOR(%pClassMethod)
  #CALL(%GenerateNewLocalMethods(ABC),'RFI',%True)                               #!Generate any new methods code from class dialog, if present
#ENDIF                                                                          #! end #IF(%BaseClassToUse())
#!==================================================================================================
#AT(%ProgramProcedures), WHERE(%ProgramExtension<>'DLL' OR ~%GlobalExternal)
  #CALL(%GenerateVirtuals(ABC), 'LL', 'Global Objects|List and Label', '%GlobalEmbedVirtuals(RFIListLabel)', %TRUE)
#ENDAT
#!================================================================================
#AT(%ShipList)
  #INSERT(%LLShipList),NOINDENT
#ENDAT
#!================================================================================
#AT(%AfterGlobalIncludes)
  #IF(%LLGloCreateDir=%True)

LLSecurityAttributes    GROUP               #<!List and Label security group definition for create dir API
nLength                   ULONG
lpSecurityDescriptor      ULONG
bInheritHandle            SIGNED
                        END
                        
  #ENDIF
#ENDAT
#!================================================================================
#AT(%GlobalMap)
  #IF(%LLGloCreateDir=%True)
  MODULE('WINDOWS.DLL')
    RFICreateDirectory(*CSTRING, *LLSecurityAttributes), SIGNED, PASCAL, RAW,NAME('CreateDirectoryA')
  END
  #ENDIF
#ENDAT
#!================================================================================
#AT(%GlobalData)
#INSERT(%GenerateClass(ABC),'LL'),NOINDENT
#DECLARE(%UseGloFilePath,STRING)
#DECLARE(%UseGloPreviewPath,STRING)

LLAppWin             LONG,THREAD              #<! May not be used in beta-2. Deprecated?
LLCompressPreview    BYTE,THREAD              #<! May not be used in beta-2. Deprecated?
#IF(%LLGloDirectory)
  #IF(SUB(%LLGloDirectory,1,1) = '!')
    #SET(%UseGloFilePath,CLIP(SUB(%LLGloDirectory,2,254)))
LLGlobalPath         LIKE(%UseGloFilePath),OVER(%UseGloFilePath)
  #ELSE                                                                           
    #SET(%UseGloFilePath,%LLGloDirectory)
LLGlobalPath         CSTRING('%LLGloDirectory')
  #ENDIF
#ELSE
LLGlobalPath         CSTRING(FILE:MaxFilePath),THREAD
#ENDIF
#IF(%LLGloPreviewDirectory)
  #IF(SUB(%LLGloPreviewDirectory,1,1) = '!')
    #SET(%UseGloPreviewPath,CLIP(SUB(%LLGloPreviewDirectory,2,254)))
 LLGlobalPreviewPath    LIKE(%UseGloPreviewPath),OVER(%UseGloPreviewPath)
  #ELSE
    #SET(%UseGloPreviewPath,%LLGloPreviewDirectory)
 LLGlobalPreviewPath    CSTRING('%LLGloPreviewDirectory')
  #ENDIF
#ELSE
LLGlobalPreviewPath     CSTRING(FILE:MaxFilePath),THREAD
#ENDIF

#ENDAT
#!================================================================================
#AT(%CustomGlobalDeclarations)
  #IF(%LLVersion = 'Version 12')           #!Version 12
    #IF(%LLUseUnicode=%True)
      #PROJECT('CULL12.LIB')
    #ELSE
      #PROJECT('CMLL12.LIB')
    #ENDIF
  #ENDIF
  #IF(%LLVersion = 'Version 13')           #!Version 13
    #IF(%LLUseUnicode=%True)
      #PROJECT('CULL13.LIB')
    #ELSE
      #PROJECT('CMLL13.LIB')
    #ENDIF
  #ENDIF
  #IF(%LLVersion = 'Version 14')           #!Version 14
    #IF(%LLUseUnicode=%True)
      #PROJECT('CULL14.LIB')
    #ELSE
      #PROJECT('CMLL14.LIB')
    #ENDIF
  #ENDIF
  #IF(%LLVersion = 'Version 15')           #!Version 15
    #IF(%LLUseUnicode=%True)
      #PROJECT('CULL15.LIB')
    #ELSE
      #PROJECT('CMLL15.LIB')
    #ENDIF
  #ENDIF
#ENDAT
#!================================================================================
#AT (%ProgramSetup,)
GlobalErrors.AddErrors(%LLErrorBlock)
#ENDAT
#AT (%ProgramEnd,)
GlobalErrors.RemoveErrors(%LLErrorBlock)
#ENDAT
#! Commented templates are for future releases
#!#INCLUDE('RFIHandCodeLL.tpw')       #!Include the hand code procedure extension
#!#INCLUDE('RFIBrowseLL.tpw')         #!Include the browse procedure extension.
#!#INCLUDE('RFIPrintQueLL.tpw')       #!Include the print queue extension
#INCLUDE('RFIDesignerLL.tpw')         #!Include the Designer button control template
#INCLUDE('RFIPrintLL.tpw')            #!Include the print existing L&L project button
#!#INCLUDE('RFICodeLL.tpw')           #!Include the code templates
#!#INCLUDE('RFIProcessLL.tpw')        #!Include the process extension template
#!#INCLUDE('RFIReportLL.tpw')         #!Include the report extension template
#INCLUDE('RFIGroupsLL.tpw')         #!Include the local groups
