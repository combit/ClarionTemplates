#! This template extends a Report or Process template with the functionality to print
#! via combit List & Label Modified by David Swindon 07/10/2022 (dd/mm/ccyy)
#TEMPLATE(ListAndLabel,'List & Label Templates'),FAMILY('ABC')
#HELP('LL.HLP')
#!*****************************************************************************
#EXTENSION(LL_GlobalIncludes,'List & Label Globals'),hlp('The Global Extension Template')
#SHEET,HSCROLL,ADJUST
 #TAB('Global')
  #IMAGE('Solace.bmp')
  #DISPLAY('')
  #BOXED('')
  #DISPLAY('Modified Solace List && Label Templates - ABC')
  #DISPLAY('')
  #DISPLAY('This Template configures the List && Label includes')
  #DISPLAY('and prototypes.')
  #DISPLAY('')
  #DISPLAY('Version 29.00')
  #DISPLAY('Release date:- 4th October 2023')
  #DISPLAY('(c) Copyright  Software.  2000 - 2024')
  #DISPLAY('')
  #DISPLAY('Which version of List && Label are you using?')
  #PROMPT('Version:',DROP('Version 29|Version 28|Version 27|Version 26|Version 25|Version 24|Version 23|Version 22|Version 21|Version 20|Version 19|Version 18|Version 17|Version 16|Version 15|Version 14|Version 13|Version 12|Version 11|Version 10|Version 9|Version 8|Version 7|Version 6')),%LLVersion
  #ENDBOXED
  #BOXED('')
  #DISPLAY('Leave this checkbox unchecked if:-')
  #DISPLAY('  1) this is your data .dll of a multi .dll application')
  #DISPLAY('  2) this is a single .exe application.')
  #DISPLAY('')
  #PROMPT ('L&&L Data External (defined in another DLL)',Check),%LLExternal,at(10)
  #ENDBOXED
  #BOXED('All Versions from 9 up to 29 License'),WHERE(%LLVersion = 'Version 9' or %LLVersion = 'Version 10' or %LLVersion = 'Version 11' or %LLVersion = 'Version 12' or %LLVersion = 'Version 13' or %LLVersion = 'Version 14' or %LLVersion = 'Version 15' or %LLVersion = 'Version 16' or %LLVersion = 'Version 17' or %LLVersion = 'Version 18' or %LLVersion = 'Version 19' or %LLVersion = 'Version 20' or %LLVersion = 'Version 21' or %LLVersion = 'Version 22' or %LLVersion = 'Version 23' or %LLVersion = 'Version 24' or %LLVersion = 'Version 25' or %LLVersion = 'Version 26' or %LLVersion = 'Version 27' or %LLVersion = 'Version 28' or %LLVersion = 'Version 29')
   #DISPLAY
   #DISPLAY('This can be found in the file PersonalLicense.txt in your combit directory'),at(,,160,17)
   #DISPLAY('** Remember to update this if you use a new version of List & Label')
   #Prompt('Personal license key',@S6),%LLPerLicense,REQ
  #ENDBOXED
  #PROMPT('This is a NON-MDI application',Check),%LLNonMDI,at(10)
 #ENDTAB
 #TAB('Unicode')
  #DISPLAY
  #DISPLAY('Please note that if you need to use Unicode, this will not run on Win 9x machines.  This is a restriction by Windows and not List && Label'),at(10,,175,30)
  #PROMPT('Use Unicode',CHECK),%LLUseUnicode,at(10)
  #DISPLAY
  #DISPLAY('Please see your .shp file for .dlls that need to be shipped with your application.  The .dlls that you ship for Unicode support are different that ordinary character sets'),At(10,,175,40)
 #ENDTAB
 #TAB('Directories')
  #BOXED('')
  #DISPLAY('You may specify a directory where your List && Label')
  #DISPLAY('files will be stored.  Leave blank for current directory')
  #DISPLAY('Remember to include the \ on the end!')
  #DISPLAY('This will be held in the global variable LL_GlobalPath')
  #PROMPT('Directory: ', @s225),%LLDirectory
  #DISPLAY('')
  #DISPLAY('You may specify a directory where your List && Label')
  #DISPLAY('print preview files will be stored.  Leave blank for')
  #DISPLAY('current directory')
  #DISPLAY('Remember to include the \ on the end!')
  #PROMPT('Directory: ', @s225),%LLPreviewDirectory
  #DISPLAY
  #PROMPT('Create Directories if they do not exist',Check),%LLCreateDir,Default(1),at(10)
  #DISPLAY
  #ENDBOXED
 #ENDTAB
 #TAB('Override')
   #BOXED('')
   #DISPLAY('You may use the field description in the dictionary rather than the field name if you prefer.  If a description does not exist, then the field name will be used.'),at(,,170,35)
   #PROMPT('Use field description',check),%LLUseFieldDesc,at(10)
   #ENDBOXED
   #DISPLAY('You may use this option to rename fields and also prevent them from being available within the List and Label Designer.'),At(10,,160,40)
   #BUTTON('Fields to override'),MULTI(%LLOverrideFields,%LLOverrideField & ' - ' & %LLRemoveRename),Inline,at(,,,60)
    #DISPLAY('Unfortunately, the template language does not allow fields to be selected directly on global templates.  Therefore you will need to select the file that it will come from as well.'),At(,,170,35)
    #Prompt('From File',File),%LLOverrideFile,Req
    #ENABLE(%LLOverrideFile)
      #PROMPT('Field to override',Field(%LLOverrideFile)),%LLOverrideField,Req
      #PROMPT('Remove or Rename',Option),%LLRemoveRename
      #PROMPT('Do not send to List and Label',Radio)
      #PROMPT('Rename',Radio)
      #ENABLE(%LLRemoveRename = 'Rename')
        #PROMPT('Rename to',@s100),%LLRenameTo
        #DISPLAY('** NOTE ** Do not include the prefix')
      #ENDENABLE
    #ENDENABLE
   #ENDBUTTON
   #DISPLAY('')
   #DISPLAY('You may rename your files if they are not descriptive enough.  In the designer, they will appear with the renamed filename'),at(,,180,30)
   #BUTTON('Files to override'),MULTI(%LLRenameFiles,%LLRenameFile & ' - ' & %LLFileRename),Inline,at(,,,60)
     #PROMPT('File to override',File),%LLRenameFile,Req
     #PROMPT('Rename to',@s50),%LLFileRename,REQ
   #ENDBUTTON
 #ENDTAB
 #TAB('Default Options')
  #BOXED('')
   #DISPLAY('')
   #DISPLAY('HINT:- The usual Layout Selector is ReportOptions')
   #PROMPT('Default Layout Selector: ',PROCEDURE),%DefaultProc
   #DISPLAY('')
   #PROMPT('Default Type of Progress: ',DROP('Clarion Progress Bar|Abort, bar meter & text|Abort, bridge meter & text|Abort & text|Bar meter & text|Bridge meter & text|Text Only')),%DefaultProgressType
   #DISPLAY('')
  #ENDBOXED
  #BOXED('General')
   #DISPLAY('The function in brackets refers to the List && Label')
   #DISPLAY('function call that the option is a parameter of.')
   #DISPLAY('')
   #PROMPT('Support Text Page Breaks (LlSetOption)',CHECK),%DefSupportTextPageBreak,Default(%False),at(10)
   #PROMPT('Case Sensitive Variables (LlSetOption)',CHECK),%DefCaseSensitiveVars,Default(%False),at(10)
   #PROMPT('Multiple Table lines (LlSetOption)',CHECK),%DefMultiTableLines,Default(%True),at(10)
   #PROMPT('Sort Variables (LlSetOption)',CHECK),%DefSortVars,Default(%False),at(10)
   #PROMPT('Convert CF/LF to LF (LlSetOption)',CHECK),%DefConvertCRLF,Default(%True),at(10)
   #PROMPT('List && Label Help Available (LlSetOption)',CHECK),%DefLLHelpAvailable,Default(%True),at(10)
   #PROMPT('No Parameter Checking (LlSetOption)',CHECK),%DefNoParamCheck,Default(%False),at(10)
   #PROMPT('No Table Checking (LlSetOption)',CHECK),%DefNoTableCheck,Default(%False),at(10)
   #PROMPT('Space Optimization (LlSetOption)',CHECK),%DefSpaceOptimize,Default(%True),at(10)
   #PROMPT('Delay Table Header (LlSetOption)',CHECK),%DefDelayTableHead,Default(%False),at(10)
   #PROMPT('Supervisor Option (LlSetOption)',CHECK),%DefSupervisor,Default(%False),at(10)
   #PROMPT('Combine Collection of Data for Collection Controls (LlSetOption)',CHECK),%DefCombineCollection,Default(%False),at(10)
  #ENDBOXED
  #BOXED('Updates'),Where(%LLVersion='Version 9' or %LLVersion = 'Version 10' or %LLVersion = 'Version 11' or %LLVersion = 'Version 12' or %LLVersion = 'Version 13' or %LLVersion = 'Version 14' or %LLVersion = 'Version 15' or %LLVersion = 'Version 16' or %LLVersion = 'Version 17' or %LLVersion = 'Version 18' or %LLVersion = 'Version 19' or %LLVersion = 'Version 20' or %LLVersion = 'Version 21' or %LLVersion = 'Version 22' or %LLVersion = 'Version 23' or %LLVersion = 'Version 24' or %LLVersion = 'Version 25' or %LLVersion = 'Version 26' or %LLVersion = 'Version 27' or %LLVersion = 'Version 28' or %LLVersion = 'Version 29')
   #DISPLAY('By default, L&&L warns when a layout is opened with a new major release of L&&L which can be annoying.  It is recommended that this facility is switched on'),at(,,168,25)
   #PROMPT('Do not warn of previous version',check),%LLWarnVersion,Default(%True),at(10)
  #ENDBOXED
 #ENDTAB
 #TAB('Preview Options')
   #PROMPT('This app uses ClarioNet',CHECK),%UseClarioNet,at(10)
   #DISPLAY
   #PROMPT('Do NOT Use List && Label Previewer',CHECK),%DefaultNotUseLLPreviewer,at(10)
   #ENABLE(%DefaultNotUseLLPreviewer = %True)
   #PROMPT('Previewer Procedure: ',Procedure),%DefaultLLPreviewProcedure
   #ENDENABLE
   #ENABLE(%DefaultNotUseLLPreviewer = %False)
   #DISPLAY('')
   #BOXED('Options')
   #PROMPT('Remove "Send to" Button (LlViewerProhibitAction)',CHECK),%DefPreviewSendTo,Default(%False),at(10)
   #PROMPT('Remove "Save As" Button (LlViewerProhibitAction)',CHECK),%DefPreviewSaveAs,Default(%False),at(10)
   #DISPLAY
   #ENDBOXED
   #ENDENABLE
   #BOXED('Preview exported reports')
   #DISPLAY('')
   #DISPLAY('If exporting report, you may select a variable which if set')
   #DISPLAY('to TRUE, will then run the exported file in the Windows')
   #DISPLAY('registered program. If no variable is selected, the file')
   #DISPLAY('will not be automatically viewed')
   #DISPLAY('For example PDF files will automatically run ADOBE to')
   #DISPLAY('view file after printing.')
   #DISPLAY('')
   #PROMPT('Variable to trigger program',@s40),%TriggerRun
   #DISPLAY('')
   #ENDBOXED
   #DISPLAY
   #BOXED('Compress preview files')
   #DISPLAY('Do you wish to generate compressed preview files?')
   #DISPLAY('This option will slow the printing down slightly but will')
   #DISPLAY('produce much smaller preview files')
   #DISPLAY('')
   #PROMPT('Use compressed preview files',Check),%LLCompressPreview,At(10)
   #DISPLAY
   #ENDBOXED
 #ENDTAB
 #TAB('User Interface')
  #DISPLAY('Please note that you must supply the correct')
  #DISPLAY('language kit to your end-user.  This will be added into')
  #DISPLAY('your .shp file')
  #DISPLAY('')
  #PROMPT('Language to Use: ',DROP('Catalan|Danish|Dutch|English|French|German|Greek|Hungarian|Italian|Norwegian|Portuguese|Russian|Spanish|Swedish')),%Language,Default('English')
  #PROMPT('Dialog Design: ',DROP('Standard Windows Style|Win95 Button Style|Flat Buttons')),%ButtonStyle,Default('Win95 Button Style')
  #PROMPT('Button Text has 3D style', Check),%ButtonThreeDee,at(10)
  #PROMPT('Enable 98 Style Tooltips', Check),%ToolTips,at(10)
  #PROMPT('No Icons on Message Buttons', Check),%NoBitMaps,at(10)
  #DISPLAY('')
  #DISPLAY('')
  #BOXED('Manual Variables Group')
  #DISPLAY('By default, Manual variables appear in the designer')
  #DISPLAY('under the group of OTHER. You may override this')
  #DISPLAY('group name if you so wish')
  #PROMPT('Group name: ',@s30),%ManualGroupName,Default('OTHER')
  #ENDBOXED
 #ENDTAB
#ENDSHEET



#AT(%ShipList)
 #IF(%LLVersion='Version 7')
     combit List & Label files:-
     ---------------------------
     CM32L7.DLL
     CM32PR3.DLL
     CM32UT5.DLL
     CM32CT7.DLL
     CM32CR4.DLL
     CM32DW5.DLL
     CM32L7EX.LLX
   #CASE(%Language)
   #OF('English')
     CM32L701.LNG       !English language file
     CMBTL701.INF (contains label formats; has to be in the same path of CM32L7.DLL) 
     CMBTL701.HLP (Designer help; has to be in the same path of CM32L7.DLL)
   #OF('German')
     CM32L700.LNG       !German language file
     CMBTL700.INF (contains label formats; has to be in the same path of CM32L7.DLL)
     CMBTL700.HLP (Designer help; has to be in the same path of CM32L7.DLL)
   #OF('Greek')
     CM32L719.LNG       !Greek language file
     CMBTL719.INF (contains label formats; has to be in the same path of CM32L7.DLL)
     CMBTL719.HLP (Designer help; has to be in the same path of CM32L7.DLL)
   #OF('French')
     CM32L718.LNG       !French language file
     CMBTL718.INF (contains label formats; has to be in the same path of CM32L7.DLL)
     CMBTL718.HLP (Designer help; has to be in the same path of CM32L7.DLL)
   #OF('Catalan')
     CM32L708.LNG       !Catalan language file
     CMBTL708.INF (contains label formats; has to be in the same path of CM32L7.DLL)
     CMBTL708.HLP (Designer help; has to be in the same path of CM32L7.DLL)
   #OF('Danish')
     CM32L712.LNG       !Danish language file
     CMBTL712.INF (contains label formats; has to be in the same path of CM32L7.DLL)
     CMBTL712.HLP (Designer help; has to be in the same path of CM32L7.DLL)
   #OF('Dutch')
     CM32L713.LNG       !Dutch language file
     CMBTL713.INF (contains label formats; has to be in the same path of CM32L7.DLL)
     CMBTL713.HLP (Designer help; has to be in the same path of CM32L7.DLL)
   #OF('Hungarian')
     CM32L721.LNG       !Hungarian language file
     CMBTL721.INF (contains label formats; has to be in the same path of CM32L7.DLL)
     CMBTL721.HLP (Designer help; has to be in the same path of CM32L7.DLL)
   #OF('Italian')
     CM32L724.LNG       !Italian language file
     CMBTL724.INF (contains label formats; has to be in the same path of CM32L7.DLL)
     CMBTL724.HLP (Designer help; has to be in the same path of CM32L7.DLL)
   #OF('Norwegian')
     CM32L729.LNG       !Norwegian language file
     CMBTL729.INF (contains label formats; has to be in the same path of CM32L7.DLL)
     CMBTL729.HLP (Designer help; has to be in the same path of CM32L7.DLL)
   #OF('Portuguese')
     CM32L731.LNG       !Potuguese language file
     CMBTL731.INF (contains label formats; has to be in the same path of CM32L7.DLL)
     CMBTL731.HLP (Designer help; has to be in the same path of CM32L7.DLL)
   #OF('Russian')
     CM32L733.LNG       !Russian language file
     CMBTL733.INF (contains label formats; has to be in the same path of CM32L7.DLL)
     CMBTL733.HLP (Designer help; has to be in the same path of CM32L7.DLL)
   #OF('Spanish')
     CM32L737.LNG       !Spanish language file
     CMBTL737.INF (contains label formats; has to be in the same path of CM32L7.DLL)
     CMBTL737.HLP (Designer help; has to be in the same path of CM32L7.DLL)
   #OF('Swedish')
     CM32L738.LNG       !Swedish language file
     CMBTL738.INF (contains label formats; has to be in the same path of CM32L7.DLL)
     CMBTL738.HLP (Designer help; has to be in the same path of CM32L7.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CM32L7S.DLL
     CM32L7V.OCX  This must be registered on your end user's system
  #ENDIF


  #!***************************************** Version 8 Ship List ****************
  #IF(%LLVersion='Version 8')
     combit List & Label files:-
     ---------------------------
     CM32L8.DLL
     CM32PR8.DLL
     CM32UT8.DLL
     CM32CT8.DLL
     CM32CR8.DLL
     CM32DW8.DLL
     CM32L8EX.LLX
     CM32MM8.DLL      Optional; if this DLL is distributed, icons appear in the menus.
     CM32L8OB.LLX     Charting-Object
     CM32L8HT.LLX     HTML-Object
     CM32L8PW.LLX     Project Wizard

   #CASE(%Language)
   #OF('English')
     CM32L801.LNG       !English language file
     CMBTL801.INF (contains label formats; has to be in the same path of CM32L8.DLL) 
     CMBTL801.HLP (Designer help; has to be in the same path of CM32L8.DLL)
   #OF('German')
     CM32L800.LNG       !German language file
     CMBTL800.INF (contains label formats; has to be in the same path of CM32L8.DLL)
     CMBTL800.HLP (Designer help; has to be in the same path of CM32L8.DLL)
   #OF('Greek')
     CM32L819.LNG       !Greek language file
     CMBTL819.INF (contains label formats; has to be in the same path of CM32L8.DLL)
     CMBTL819.HLP (Designer help; has to be in the same path of CM32L8.DLL)
   #OF('French')
     CM32L818.LNG       !French language file
     CMBTL818.INF (contains label formats; has to be in the same path of CM32L8.DLL)
     CMBTL818.HLP (Designer help; has to be in the same path of CM32L8.DLL)
   #OF('Catalan')
     CM32L808.LNG       !Catalan language file
     CMBTL808.INF (contains label formats; has to be in the same path of CM32L8.DLL)
     CMBTL808.HLP (Designer help; has to be in the same path of CM32L8.DLL)
   #OF('Danish')
     CM32L812.LNG       !Danish language file
     CMBTL812.INF (contains label formats; has to be in the same path of CM32L8.DLL)
     CMBTL812.HLP (Designer help; has to be in the same path of CM32L8.DLL)
   #OF('Dutch')
     CM32L813.LNG       !Dutch language file
     CMBTL813.INF (contains label formats; has to be in the same path of CM32L8.DLL)
     CMBTL813.HLP (Designer help; has to be in the same path of CM32L8.DLL)
   #OF('Hungarian')
     CM32L821.LNG       !Hungarian language file
     CMBTL821.INF (contains label formats; has to be in the same path of CM32L8.DLL)
     CMBTL821.HLP (Designer help; has to be in the same path of CM32L8.DLL)
   #OF('Italian')
     CM32L824.LNG       !Italian language file
     CMBTL824.INF (contains label formats; has to be in the same path of CM32L8.DLL)
     CMBTL824.HLP (Designer help; has to be in the same path of CM32L8.DLL)
   #OF('Norwegian')
     CM32L829.LNG       !Norwegian language file
     CMBTL829.INF (contains label formats; has to be in the same path of CM32L7.DLL)
     CMBTL829.HLP (Designer help; has to be in the same path of CM32L7.DLL)
   #OF('Portuguese')
     CM32L831.LNG       !Potuguese language file
     CMBTL831.INF (contains label formats; has to be in the same path of CM32L8.DLL)
     CMBTL831.HLP (Designer help; has to be in the same path of CM32L8.DLL)
   #OF('Russian')
     CM32L833.LNG       !Russian language file
     CMBTL833.INF (contains label formats; has to be in the same path of CM32L8.DLL)
     CMBTL833.HLP (Designer help; has to be in the same path of CM32L8.DLL)
   #OF('Spanish')
     CM32L837.LNG       !Spanish language file
     CMBTL837.INF (contains label formats; has to be in the same path of CM32L8.DLL)
     CMBTL837.HLP (Designer help; has to be in the same path of CM32L8.DLL)
   #OF('Swedish')
     CM32L838.LNG       !Swedish language file
     CMBTL838.INF (contains label formats; has to be in the same path of CM32L8.DLL)
     CMBTL838.HLP (Designer help; has to be in the same path of CM32L8.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CM32L8S.DLL
     CM32L8V.OCX  This must be registered on your end user's system
 #ENDIF


  #!***************************************** Version 9 Ship List ****************
  #IF(%LLVersion='Version 9')
     combit List & Label files:-
     ---------------------------
    #IF(%LLUseUnicode=%False)
     CM32L9.DLL
     CM32B9.DLL
     CM32PR9.DLL
     CM32UT9.DLL
     CM32CT9.DLL
     CM32CR9.DLL
     CM32DW9.DLL
    #ELSE
     CM32PR9.DLL
     CM32UT9.DLL
     CM32CT9.DLL
     CM32CR9.DLL
     CM32DW9.DLL
     CM3UUT9.DLL
     CM3UPR9.DLL
     CM3UCT9.DLL
     CM3UB9.DLL
     CM3UCR9.DLL
     CM3UDW9.DLL
     CM3UL9.DLL
    #ENDIF
     CM32L9EX.LLX     Export Modules (HTML, RTF etc)
     CM32L9XL.DLL     Excel export
     CM32L9OB.LLX     Charting-Object
     CM32L9OC.LLX     OLE-Object
     CM32L9HT.LLX     HTML-Object
     CM32L9PW.LLX     Project Wizard
     CM32L9BC.LLX     2D barcodes (Professional/Enterprise Edition only)

   #CASE(%Language)
   #OF('English')
     #IF(%LLUseUnicode=%True)
     CM3UL901.LNG       !English language file
     #ELSE
     CM32L901.LNG       !English language file
     #ENDIF
     CMBTL901.INF (contains label formats; has to be in the same path of CM32L9.DLL)
     CMBTL901.CHM (Designer help; has to be in the same path of CM32L9.DLL)
     CM3UL901.LNG (Optional Unicode modules language file)
   #OF('German')
     #IF(%LLUseUnicode=%True)
     CM3UL900.LNG       !German language file
     #ELSE
     CM32L900.LNG       !German language file
     #ENDIF
     CMBTL900.INF (contains label formats; has to be in the same path of CM32L9.DLL)
     CMBTL900.CHM (Designer help; has to be in the same path of CM32L9.DLL)
     CM3UL900.LNG (Optional Unicode modules language file)
   #OF('Greek')
     #IF(%LLUseUnicode=%True)
     CM3UL919.LNG       !Greek language file
     #ELSE
     CM32L919.LNG       !Greek language file
     #ENDIF
     CMBTL919.INF (contains label formats; has to be in the same path of CM32L9.DLL)
     CMBTL919.CHM (Designer help; has to be in the same path of CM32L9.DLL)
     CM3UL919.LNG (Optional Unicode modules language file)
   #OF('French')
     #IF(%LLUseUnicode=%True)
     CM3UL918.LNG       !French language file
     #ELSE
     CM32L918.LNG       !French language file
     #ENDIF
     CMBTL918.INF (contains label formats; has to be in the same path of CM32L9.DLL)
     CMBTL918.CHM (Designer help; has to be in the same path of CM32L9.DLL)
     CM3UL918.LNG (Optional Unicode modules language file)
   #OF('Catalan')
     #IF(%LLUseUnicode=%True)
     CM3UL908.LNG       !Catalan language file
     #ELSE
     CM32L908.LNG       !Catalan language file
     #ENDIF
     CMBTL908.INF (contains label formats; has to be in the same path of CM32L9.DLL)
     CMBTL908.CHM (Designer help; has to be in the same path of CM32L9.DLL)
     CM3UL908.LNG (Optional Unicode modules language file)
   #OF('Danish')
     #IF(%LLUseUnicode=%True)
     CM3UL912.LNG       !Danish language file
     #ELSE
     CM32L912.LNG       !Danish language file
     #ENDIF
     CMBTL912.INF (contains label formats; has to be in the same path of CM32L9.DLL)
     CMBTL912.CHM (Designer help; has to be in the same path of CM32L9.DLL)
     CM3UL912.LNG (Optional Unicode modules language file)
   #OF('Dutch')
     #IF(%LLUseUnicode=%True)
     CM3UL913.LNG       !Dutch language file
     #ELSE
     CM32L913.LNG       !Dutch language file
     #ENDIF
     CMBTL913.INF (contains label formats; has to be in the same path of CM32L9.DLL)
     CMBTL913.CHM (Designer help; has to be in the same path of CM32L9.DLL)
     CM3UL913.LNG (Optional Unicode modules language file)
   #OF('Hungarian')
     #IF(%LLUseUnicode=%True)
     CM3UL921.LNG       !Hungarian language file
     #ELSE
     CM32L921.LNG       !Hungarian language file
     #ENDIF
     CMBTL921.INF (contains label formats; has to be in the same path of CM32L9.DLL)
     CMBTL921.CHM (Designer help; has to be in the same path of CM32L9.DLL)
     CM3UL921.LNG (Optional Unicode modules language file)
   #OF('Italian')
     #IF(%LLUseUnicode=%True)
     CM3UL924.LNG       !Italian language file
     #ELSE
     CM32L924.LNG       !Italian language file
     #ENDIF
     CMBTL924.INF (contains label formats; has to be in the same path of CM32L9.DLL)
     CMBTL924.CHM (Designer help; has to be in the same path of CM32L9.DLL)
     CM3UL924.LNG (Optional Unicode modules language file)
   #OF('Norwegian')
     #IF(%LLUseUnicode=%True)
     CM3UL929.LNG       !Norwegian language file
     #ELSE
     CM32L929.LNG       !Norwegian language file
     #ENDIF
     CMBTL929.INF (contains label formats; has to be in the same path of CM32L9.DLL)
     CMBTL929.CHM (Designer help; has to be in the same path of CM32L9.DLL)
     CM3UL929.LNG (Optional Unicode modules language file)
   #OF('Portuguese')
     #IF(%LLUseUnicode=%True)
     CM3UL931.LNG       !Portugese language file
     #ELSE
     CM32L931.LNG       !Portugese language file
     #ENDIF
     CMBTL931.INF (contains label formats; has to be in the same path of CM32L9.DLL)
     CMBTL931.CHM (Designer help; has to be in the same path of CM32L9.DLL)
     CM3UL931.LNG (Optional Unicode modules language file)
   #OF('Russian')
     #IF(%LLUseUnicode=%True)
     CM3UL933.LNG       !Russian language file
     #ELSE
     CM32L933.LNG       !Russian language file
     #ENDIF
     CMBTL933.INF (contains label formats; has to be in the same path of CM32L9.DLL)
     CMBTL933.CHM (Designer help; has to be in the same path of CM32L9.DLL)
     CM3UL933.LNG (Optional Unicode modules language file)
   #OF('Spanish')
     #IF(%LLUseUnicode=%True)
     CM3UL937.LNG       !Spanish language file
     #ELSE
     CM32L937.LNG       !Spanish language file
     #ENDIF
     CMBTL937.INF (contains label formats; has to be in the same path of CM32L9.DLL)
     CMBTL937.CHM (Designer help; has to be in the same path of CM32L9.DLL)
     CM3UL937.LNG (Optional Unicode modules language file)
   #OF('Swedish')
     #IF(%LLUseUnicode=%True)
     CM3UL938.LNG       !Swedish language file
     #ELSE
     CM32L938.LNG       !Swidish language file
     #ENDIF
     CMBTL938.INF (contains label formats; has to be in the same path of CM32L9.DLL)
     CMBTL938.CHM (Designer help; has to be in the same path of CM32L9.DLL)
     CM3UL938.LNG (Optional Unicode modules language file)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CM32L9S.DLL
     CM32L9V.OCX  This must be registered on your end user's system


  #!***************************************** Version 10 Ship List ****************
  #IF(%LLVersion = 'Version 10')
     combit List & Label files:-
     ---------------------------
    #IF(%LLUseUnicode=%False)
     CMLL10.DLL
     CMLL10XL.DLL
     CMLS10.DLL
     CMBR10.DLL
     CMPR10.DLL
     CMUT10.DLL
     CMCT10.DLL
     CMDW10.DLL
    #ELSE
     CMPR10.DLL
     CMUT10.DLL
     CMCT10.DLL
     CMDW10.DLL
     CMLL10XL.DLL
     CUUT10.DLL
     CUPR10.DLL
     CUCT10.DLL
     CUCR10.DLL
     CUDW10.DLL
     CULL10.DLL
    #ENDIF
     CMLL10EX.LLX     Export Modules (HTML, RTF etc)
     CMLL10OB.LLX     Charting-Object
     CMLL10OC.LLX     OLE-Object
     CMLL10HT.LLX     HTML-Object
     CMLL10PW.LLX     Project Wizard
     CMLL10BC.LLX     2D barcodes (Professional/Enterprise Edition only)

   #CASE(%Language)
   #OF('English')
     #IF(%LLUseUnicode=%True)
     CULL1001.LNG       !English language file
     #ELSE
     CMLL1001.LNG       !English language file
     #ENDIF
     CMLL1001.INF (contains label formats; has to be in the same path of CMLL10.DLL)
     CMLL1001.CHM (Designer help; has to be in the same path of CMLL10.DLL)
   #OF('German')
     #IF(%LLUseUnicode=%True)
     CULL1000.LNG       !German language file
     #ELSE
     CMLL1000.LNG       !German language file
     #ENDIF
     CMLL1000.INF (contains label formats; has to be in the same path of CMLL10.DLL)
     CMLL1000.CHM (Designer help; has to be in the same path of CMLL10.DLL)
   #OF('Greek')
     #IF(%LLUseUnicode=%True)
     CULL1019.LNG       !Greek language file
     CMLS1019.LNG
     #ELSE
     CMLL1019.LNG       !Greek language file
     CMLS1019.LNG
     #ENDIF
     CMLL1019.INF (contains label formats; has to be in the same path of CMLL10.DLL)
     CMLL1019.CHM (Designer help; has to be in the same path of CMLL10.DLL)
   #OF('French')
     #IF(%LLUseUnicode=%True)
     CULL1018.LNG       !French language file
     CMLS1018.LNG
     #ELSE
     CMLL1018.LNG       !French language file
     CMLS1018.LNG
     #ENDIF
     CMLL1018.INF (contains label formats; has to be in the same path of CMLL10.DLL)
     CMLL1018.CHM (Designer help; has to be in the same path of CMLL10.DLL)
   #OF('Catalan')
     #IF(%LLUseUnicode=%True)
     CULL1008.LNG       !Catalan language file
     CMLS1008.LNG
     #ELSE
     CMLL1008.LNG       !Catalan language file
     CMLS1008.LNG
     #ENDIF
     CMLL1008.INF (contains label formats; has to be in the same path of CMLL10.DLL)
     CMLL1008.CHM (Designer help; has to be in the same path of CMLL10.DLL)
   #OF('Danish')
     #IF(%LLUseUnicode=%True)
     CULL1012.LNG       !Danish language file
     CMLS1012.LNG
     #ELSE
     CMLL1012.LNG       !Danish language file
     CMLS1012.LNG
     #ENDIF
     CMLL1012.INF (contains label formats; has to be in the same path of CMLL10.DLL)
     CMLL1012.CHM (Designer help; has to be in the same path of CMLL10.DLL)
   #OF('Dutch')
     #IF(%LLUseUnicode=%True)
     CULL1013.LNG       !Dutch language file
     CMLS1013.LNG
     #ELSE
     CMLL1013.LNG       !Dutch language file
     CMLS1013.LNG
     #ENDIF
     CMLL1013.INF (contains label formats; has to be in the same path of CMLL10.DLL)
     CMLL1013.CHM (Designer help; has to be in the same path of CMLL10.DLL)
   #OF('Hungarian')
     #IF(%LLUseUnicode=%True)
     CULL1021.LNG       !Hungarian language file
     CMLS1021.LNG
     #ELSE
     CMLL1021.LNG       !Hungarian language file
     CMLS1021.LNG
     #ENDIF
     CMLL1021.INF (contains label formats; has to be in the same path of CMLL10.DLL)
     CMLL1021.CHM (Designer help; has to be in the same path of CMLL10.DLL)
   #OF('Italian')
     #IF(%LLUseUnicode=%True)
     CULL1024.LNG       !Italian language file
     CMLS1024.LNG
     #ELSE
     CMLL1024.LNG       !Italian language file
     CMLS1024.LNG
     #ENDIF
     CMLL1024.INF (contains label formats; has to be in the same path of CMLL10.DLL)
     CMLL1024.CHM (Designer help; has to be in the same path of CMLL10.DLL)
   #OF('Norwegian')
     #IF(%LLUseUnicode=%True)
     CULL1029.LNG       !Norwegian language file
     CMLS1029.LNG
     #ELSE
     CMLL1029.LNG       !Norwegian language file
     CMLS1029.LNG
     #ENDIF
     CMLL1029.INF (contains label formats; has to be in the same path of CMLL10.DLL)
     CMLL1029.CHM (Designer help; has to be in the same path of CMLL10.DLL)
   #OF('Portuguese')
     #IF(%LLUseUnicode=%True)
     CULL1031.LNG       !Portugese language file
     CMLS1031.LNG
     #ELSE
     CMLL1031.LNG       !Portugese language file
     CMLS1031.LNG
     #ENDIF
     CMLL1031.INF (contains label formats; has to be in the same path of CMLL10.DLL)
     CMLL1031.CHM (Designer help; has to be in the same path of CMLL10.DLL)
   #OF('Russian')
     #IF(%LLUseUnicode=%True)
     CULL1033.LNG       !Russian language file
     CMLS1033.LNG
     #ELSE
     CMLL1033.LNG       !Russian language file
     CMLS1033.LNG
     #ENDIF
     CMLL1033.INF (contains label formats; has to be in the same path of CMLL10.DLL)
     CMLL1033.CHM (Designer help; has to be in the same path of CMLL10.DLL)
   #OF('Spanish')
     #IF(%LLUseUnicode=%True)
     CULL1037.LNG       !Spanish language file
     CMLS1037.LNG
     #ELSE
     CMLL1037.LNG       !Spanish language file
     CMLS1037.LNG
     #ENDIF
     CMLL1037.INF (contains label formats; has to be in the same path of CMLL10.DLL)
     CMLL1037.CHM (Designer help; has to be in the same path of CMLL10.DLL)
   #OF('Swedish')
     #IF(%LLUseUnicode=%True)
     CULL1038.LNG       !Swedish language file
     CMLS1038.LNG
     #ELSE
     CMLL1038.LNG       !Swidish language file
     CMLS1038.LNG
     #ENDIF
     CMLL1038.INF (contains label formats; has to be in the same path of CMLL10.DLL)
     CMLL1038.CHM (Designer help; has to be in the same path of CMLL10.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL10O.OCX  This must be registered on your end user's system

  #END


  #!***************************************** Version 11 Ship List ****************
  #IF(%LLVersion = 'Version 11')
     combit List & Label files:-
     ---------------------------
    #IF(%LLUseUnicode=%False)
     CMLL11.DLL
     CMLL11XL.DLL
     CMLS11.DLL
     CMBR11.DLL
     CMPR11.DLL
     CMUT11.DLL
     CMCT11.DLL
     CMDW11.DLL
     CMMX01.DLL
    #ELSE
     CULL11.DLL
     CMLL11XL.DLL
     CULS11.DLL
     CUBR11.DLL
     CUPR11.DLL
     CUUT11.DLL
     CUCT11.DLL
     CUDW11.DLL
     CMLS11.DLL
     CMMX01.DLL
     CMPR11.DLL
     CMUT11.DLL
     CMCT11.DLL
     CMBR11.DLL
     CMDW11.DLL
    #ENDIF
     CMLL11EX.LLX     Export Modules (HTML, PDF, RTF, XML, MHTML,...)
     CMLL11OB.LLX     Charting-Object
     CMLL11OC.LLX     OLE-Object
     CMLL11HT.LLX     HTML-Object
     CMLL11PW.LLX     Project Wizard
     CMLL11BC.LLX     2D barcodes (Professional/Enterprise Edition only)
     CMMX01.CPL       combit mail settings control panel applet
     CMLL11SX.DLL     shell extension for preview files

   #CASE(%Language)
   #OF('English')
     #IF(%LLUseUnicode=%True)
     CULL1101.LNG       !English language file
     #ELSE
     CMLL1101.LNG       !English language file
     CMMX0101.LNG
     #ENDIF
     CMLL1101.INF (contains label formats; has to be in the same path of CMLL11.DLL)
     CMLL1101.CHM (Designer help; has to be in the same path of CMLL11.DLL)
   #OF('German')
     #IF(%LLUseUnicode=%True)
     CULL1100.LNG       !German language file
     #ELSE
     CMLL1100.LNG       !German language file
     #ENDIF
     CMLL1100.INF (contains label formats; has to be in the same path of CMLL11.DLL)
     CMLL1100.CHM (Designer help; has to be in the same path of CMLL11.DLL)
   #OF('Greek')
     #IF(%LLUseUnicode=%True)
     CULL1119.LNG       !Greek language file
     CMLS1119.LNG
     #ELSE
     CMLL1119.LNG       !Greek language file
     CMLS1119.LNG
     #ENDIF
     CMLL1119.INF (contains label formats; has to be in the same path of CMLL11.DLL)
     CMLL1119.CHM (Designer help; has to be in the same path of CMLL11.DLL)
   #OF('French')
     #IF(%LLUseUnicode=%True)
     CULL1118.LNG       !French language file
     CMLS1118.LNG
     #ELSE
     CMLL1118.LNG       !French language file
     CMLS1118.LNG
     #ENDIF
     CMLL1118.INF (contains label formats; has to be in the same path of CMLL11.DLL)
     CMLL1118.CHM (Designer help; has to be in the same path of CMLL11.DLL)
   #OF('Catalan')
     #IF(%LLUseUnicode=%True)
     CULL1108.LNG       !Catalan language file
     CMLS1108.LNG
     #ELSE
     CMLL1108.LNG       !Catalan language file
     CMLS1108.LNG
     #ENDIF
     CMLL1108.INF (contains label formats; has to be in the same path of CMLL11.DLL)
     CMLL1108.CHM (Designer help; has to be in the same path of CMLL11.DLL)
   #OF('Danish')
     #IF(%LLUseUnicode=%True)
     CULL1112.LNG       !Danish language file
     CMLS1112.LNG
     #ELSE
     CMLL1112.LNG       !Danish language file
     CMLS1112.LNG
     #ENDIF
     CMLL1112.INF (contains label formats; has to be in the same path of CMLL11.DLL)
     CMLL1112.CHM (Designer help; has to be in the same path of CMLL11.DLL)
   #OF('Dutch')
     #IF(%LLUseUnicode=%True)
     CULL1113.LNG       !Dutch language file
     CMLS1113.LNG
     #ELSE
     CMLL1113.LNG       !Dutch language file
     CMLS1113.LNG
     #ENDIF
     CMLL1113.INF (contains label formats; has to be in the same path of CMLL11.DLL)
     CMLL1113.CHM (Designer help; has to be in the same path of CMLL11.DLL)
   #OF('Hungarian')
     #IF(%LLUseUnicode=%True)
     CULL1121.LNG       !Hungarian language file
     CMLS1121.LNG
     #ELSE
     CMLL1121.LNG       !Hungarian language file
     CMLS1121.LNG
     #ENDIF
     CMLL1121.INF (contains label formats; has to be in the same path of CMLL11.DLL)
     CMLL1121.CHM (Designer help; has to be in the same path of CMLL11.DLL)
   #OF('Italian')
     #IF(%LLUseUnicode=%True)
     CULL1124.LNG       !Italian language file
     CMLS1124.LNG
     #ELSE
     CMLL1124.LNG       !Italian language file
     CMLS1124.LNG
     #ENDIF
     CMLL1124.INF (contains label formats; has to be in the same path of CMLL11.DLL)
     CMLL1124.CHM (Designer help; has to be in the same path of CMLL11.DLL)
   #OF('Norwegian')
     #IF(%LLUseUnicode=%True)
     CULL1129.LNG       !Norwegian language file
     CMLS1129.LNG
     #ELSE
     CMLL1129.LNG       !Norwegian language file
     CMLS1129.LNG
     #ENDIF
     CMLL1129.INF (contains label formats; has to be in the same path of CMLL11.DLL)
     CMLL1129.CHM (Designer help; has to be in the same path of CMLL11.DLL)
   #OF('Portuguese')
     #IF(%LLUseUnicode=%True)
     CULL1131.LNG       !Portugese language file
     CMLS1131.LNG
     #ELSE
     CMLL1131.LNG       !Portugese language file
     CMLS1131.LNG
     #ENDIF
     CMLL1131.INF (contains label formats; has to be in the same path of CMLL11.DLL)
     CMLL1131.CHM (Designer help; has to be in the same path of CMLL11.DLL)
   #OF('Russian')
     #IF(%LLUseUnicode=%True)
     CULL1133.LNG       !Russian language file
     CMLS1133.LNG
     #ELSE
     CMLL1133.LNG       !Russian language file
     CMLS1133.LNG
     #ENDIF
     CMLL1133.INF (contains label formats; has to be in the same path of CMLL11.DLL)
     CMLL1133.CHM (Designer help; has to be in the same path of CMLL11.DLL)
   #OF('Spanish')
     #IF(%LLUseUnicode=%True)
     CULL1137.LNG       !Spanish language file
     CMLS1137.LNG
     #ELSE
     CMLL1137.LNG       !Spanish language file
     CMLS1137.LNG
     #ENDIF
     CMLL1137.INF (contains label formats; has to be in the same path of CMLL11.DLL)
     CMLL1137.CHM (Designer help; has to be in the same path of CMLL11.DLL)
   #OF('Swedish')
     #IF(%LLUseUnicode=%True)
     CULL1138.LNG       !Swedish language file
     CMLS1138.LNG
     #ELSE
     CMLL1138.LNG       !Swedish language file
     CMLS1138.LNG
     #ENDIF
     CMLL1138.INF (contains label formats; has to be in the same path of CMLL11.DLL)
     CMLL1138.CHM (Designer help; has to be in the same path of CMLL11.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL11O.OCX  This must be registered on your end user's system

  #END


  #!***************************************** Version 12 Ship List ****************
  #IF(%LLVersion = 'Version 12')
     combit List & Label files:-
     ---------------------------
    #IF(%LLUseUnicode=%False)
     CMLL12.DLL
     CMLL12XL.DLL
     CMLS12.DLL
     CMBR12.DLL
     CMPR12.DLL
     CMUT12.DLL
     CMCT12.DLL
     CMDW12.DLL
     CMMX01.DLL
    #ELSE
     CULL12.DLL
     CMLL12XL.DLL
     CULS12.DLL
     CUBR12.DLL
     CUPR12.DLL
     CUUT12.DLL
     CUCT12.DLL
     CUDW12.DLL
     CMLS12.DLL
     CMMX01.DLL
     CMPR12.DLL
     CMUT12.DLL
     CMCT12.DLL
     CMBR12.DLL
     CMDW12.DLL
    #ENDIF
     CMLL12EX.LLX     Export Modules (HTML, PDF, RTF, XML, MHTML,...)
     CMLL12OB.LLX     Charting-Object
     CMLL12OC.LLX     OLE-Object
     CMLL12HT.LLX     HTML-Object
     CMLL12PW.LLX     Project Wizard
     CMLL12BC.LLX     2D barcodes (Professional/Enterprise Edition only)
     CMMX01.CPL       combit mail settings control panel applet
     CMLL12SX.DLL     shell extension for preview files

   #CASE(%Language)
   #OF('English')
     #IF(%LLUseUnicode=%True)
     CULL1201.LNG       !English language file
     #ELSE
     CMLL1201.LNG       !English language file
     CMMX0101.LNG
     #ENDIF
     CMLL1201.INF (contains label formats; has to be in the same path of CMLL12.DLL)
     CMLL1201.CHM (Designer help; has to be in the same path of CMLL12.DLL)
   #OF('German')
     #IF(%LLUseUnicode=%True)
     CULL1200.LNG       !German language file
     #ELSE
     CMLL1200.LNG       !German language file
     #ENDIF
     CMLL1200.INF (contains label formats; has to be in the same path of CMLL12.DLL)
     CMLL1200.CHM (Designer help; has to be in the same path of CMLL12.DLL)
   #OF('Greek')
     #IF(%LLUseUnicode=%True)
     CULL1219.LNG       !Greek language file
     CMLS1219.LNG
     #ELSE
     CMLL1219.LNG       !Greek language file
     CMLS1219.LNG
     #ENDIF
     CMLL1219.INF (contains label formats; has to be in the same path of CMLL12.DLL)
     CMLL1219.CHM (Designer help; has to be in the same path of CMLL12.DLL)
   #OF('French')
     #IF(%LLUseUnicode=%True)
     CULL1218.LNG       !French language file
     CMLS1218.LNG
     #ELSE
     CMLL1218.LNG       !French language file
     CMLS1218.LNG
     #ENDIF
     CMLL1218.INF (contains label formats; has to be in the same path of CMLL12.DLL)
     CMLL1218.CHM (Designer help; has to be in the same path of CMLL12.DLL)
   #OF('Catalan')
     #IF(%LLUseUnicode=%True)
     CULL1208.LNG       !Catalan language file
     CMLS1208.LNG
     #ELSE
     CMLL1208.LNG       !Catalan language file
     CMLS1208.LNG
     #ENDIF
     CMLL1208.INF (contains label formats; has to be in the same path of CMLL12.DLL)
     CMLL1208.CHM (Designer help; has to be in the same path of CMLL12.DLL)
   #OF('Danish')
     #IF(%LLUseUnicode=%True)
     CULL1212.LNG       !Danish language file
     CMLS1212.LNG
     #ELSE
     CMLL1212.LNG       !Danish language file
     CMLS1212.LNG
     #ENDIF
     CMLL1212.INF (contains label formats; has to be in the same path of CMLL12.DLL)
     CMLL1212.CHM (Designer help; has to be in the same path of CMLL12.DLL)
   #OF('Dutch')
     #IF(%LLUseUnicode=%True)
     CULL1213.LNG       !Dutch language file
     CMLS1213.LNG
     #ELSE
     CMLL1213.LNG       !Dutch language file
     CMLS1213.LNG
     #ENDIF
     CMLL1213.INF (contains label formats; has to be in the same path of CMLL12.DLL)
     CMLL1213.CHM (Designer help; has to be in the same path of CMLL12.DLL)
   #OF('Hungarian')
     #IF(%LLUseUnicode=%True)
     CULL1221.LNG       !Hungarian language file
     CMLS1221.LNG
     #ELSE
     CMLL1221.LNG       !Hungarian language file
     CMLS1221.LNG
     #ENDIF
     CMLL1221.INF (contains label formats; has to be in the same path of CMLL12.DLL)
     CMLL1221.CHM (Designer help; has to be in the same path of CMLL12.DLL)
   #OF('Italian')
     #IF(%LLUseUnicode=%True)
     CULL1224.LNG       !Italian language file
     CMLS1224.LNG
     #ELSE
     CMLL1224.LNG       !Italian language file
     CMLS1224.LNG
     #ENDIF
     CMLL1224.INF (contains label formats; has to be in the same path of CMLL12.DLL)
     CMLL1224.CHM (Designer help; has to be in the same path of CMLL12.DLL)
   #OF('Norwegian')
     #IF(%LLUseUnicode=%True)
     CULL1229.LNG       !Norwegian language file
     CMLS1229.LNG
     #ELSE
     CMLL1229.LNG       !Norwegian language file
     CMLS1229.LNG
     #ENDIF
     CMLL1229.INF (contains label formats; has to be in the same path of CMLL12.DLL)
     CMLL1229.CHM (Designer help; has to be in the same path of CMLL12.DLL)
   #OF('Portuguese')
     #IF(%LLUseUnicode=%True)
     CULL1231.LNG       !Portugese language file
     CMLS1231.LNG
     #ELSE
     CMLL1231.LNG       !Portugese language file
     CMLS1231.LNG
     #ENDIF
     CMLL1231.INF (contains label formats; has to be in the same path of CMLL12.DLL)
     CMLL1231.CHM (Designer help; has to be in the same path of CMLL12.DLL)
   #OF('Russian')
     #IF(%LLUseUnicode=%True)
     CULL1233.LNG       !Russian language file
     CMLS1233.LNG
     #ELSE
     CMLL1233.LNG       !Russian language file
     CMLS1233.LNG
     #ENDIF
     CMLL1233.INF (contains label formats; has to be in the same path of CMLL12.DLL)
     CMLL1233.CHM (Designer help; has to be in the same path of CMLL12.DLL)
   #OF('Spanish')
     #IF(%LLUseUnicode=%True)
     CULL1237.LNG       !Spanish language file
     CMLS1237.LNG
     #ELSE
     CMLL1237.LNG       !Spanish language file
     CMLS1237.LNG
     #ENDIF
     CMLL1237.INF (contains label formats; has to be in the same path of CMLL12.DLL)
     CMLL1237.CHM (Designer help; has to be in the same path of CMLL12.DLL)
   #OF('Swedish')
     #IF(%LLUseUnicode=%True)
     CULL1238.LNG       !Swedish language file
     CMLS1238.LNG
     #ELSE
     CMLL1238.LNG       !Swedish language file
     CMLS1238.LNG
     #ENDIF
     CMLL1238.INF (contains label formats; has to be in the same path of CMLL12.DLL)
     CMLL1238.CHM (Designer help; has to be in the same path of CMLL12.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL12O.OCX  This must be registered on your end user's system

  #END


  #!***************************************** Version 13 Ship List ****************
  #IF(%LLVersion = 'Version 13')
     combit List & Label files:-
     ---------------------------
    #IF(%LLUseUnicode=%False)
     CMLL13.DLL
     CMLL13XL.DLL
     CMLS13.DLL
     CMBR13.DLL
     CMPR13.DLL
     CMUT13.DLL
     CMCT13.DLL
     CMDW13.DLL
     CMMX01.DLL
    #ELSE
     CULL13.DLL
     CMLL13XL.DLL
     CULS13.DLL
     CUBR13.DLL
     CUPR13.DLL
     CUUT13.DLL
     CUCT13.DLL
     CUDW13.DLL
     CMLS13.DLL
     CMMX01.DLL
     CMPR13.DLL
     CMUT13.DLL
     CMCT13.DLL
     CMBR13.DLL
     CMDW13.DLL
    #ENDIF
     CMLL13EX.LLX     Export Modules (HTML, PDF, RTF, XML, MHTML,...)
     CMLL13OC.LLX     OLE-Object
     CMLL13HT.LLX     HTML-Object
     CMLL13PW.LLX     Project Wizard
     CMLL13BC.LLX     2D barcodes (Professional/Enterprise Edition only)
     CMMX01.CPL       combit mail settings control panel applet
     CMLL13SX.DLL     shell extension for preview files

   #CASE(%Language)
   #OF('English')
     #IF(%LLUseUnicode=%True)
     CULL1301.LNG       !English language file
     #ELSE
     CMLL1301.LNG       !English language file
     CMMX0101.LNG
     #ENDIF
     CMLL1301.INF (contains label formats; has to be in the same path of CMLL13.DLL)
     CMLL1301.CHM (Designer help; has to be in the same path of CMLL13.DLL)
   #OF('German')
     #IF(%LLUseUnicode=%True)
     CULL1300.LNG       !German language file
     #ELSE
     CMLL1300.LNG       !German language file
     #ENDIF
     CMLL1300.INF (contains label formats; has to be in the same path of CMLL13.DLL)
     CMLL1300.CHM (Designer help; has to be in the same path of CMLL13.DLL)
   #OF('Greek')
     #IF(%LLUseUnicode=%True)
     CULL1319.LNG       !Greek language file
     CMLS1319.LNG
     #ELSE
     CMLL1319.LNG       !Greek language file
     CMLS1319.LNG
     #ENDIF
     CMLL1319.INF (contains label formats; has to be in the same path of CMLL13.DLL)
     CMLL1319.CHM (Designer help; has to be in the same path of CMLL13.DLL)
   #OF('French')
     #IF(%LLUseUnicode=%True)
     CULL1318.LNG       !French language file
     CMLS1318.LNG
     #ELSE
     CMLL1318.LNG       !French language file
     CMLS1318.LNG
     #ENDIF
     CMLL1318.INF (contains label formats; has to be in the same path of CMLL13.DLL)
     CMLL1318.CHM (Designer help; has to be in the same path of CMLL13.DLL)
   #OF('Catalan')
     #IF(%LLUseUnicode=%True)
     CULL1308.LNG       !Catalan language file
     CMLS1308.LNG
     #ELSE
     CMLL1308.LNG       !Catalan language file
     CMLS1308.LNG
     #ENDIF
     CMLL1308.INF (contains label formats; has to be in the same path of CMLL13.DLL)
     CMLL1308.CHM (Designer help; has to be in the same path of CMLL13.DLL)
   #OF('Danish')
     #IF(%LLUseUnicode=%True)
     CULL1313.LNG       !Danish language file
     CMLS1313.LNG
     #ELSE
     CMLL1313.LNG       !Danish language file
     CMLS1313.LNG
     #ENDIF
     CMLL1313.INF (contains label formats; has to be in the same path of CMLL13.DLL)
     CMLL1313.CHM (Designer help; has to be in the same path of CMLL13.DLL)
   #OF('Dutch')
     #IF(%LLUseUnicode=%True)
     CULL1313.LNG       !Dutch language file
     CMLS1313.LNG
     #ELSE
     CMLL1313.LNG       !Dutch language file
     CMLS1313.LNG
     #ENDIF
     CMLL1313.INF (contains label formats; has to be in the same path of CMLL13.DLL)
     CMLL1313.CHM (Designer help; has to be in the same path of CMLL13.DLL)
   #OF('Hungarian')
     #IF(%LLUseUnicode=%True)
     CULL1321.LNG       !Hungarian language file
     CMLS1321.LNG
     #ELSE
     CMLL1321.LNG       !Hungarian language file
     CMLS1321.LNG
     #ENDIF
     CMLL1321.INF (contains label formats; has to be in the same path of CMLL13.DLL)
     CMLL1321.CHM (Designer help; has to be in the same path of CMLL13.DLL)
   #OF('Italian')
     #IF(%LLUseUnicode=%True)
     CULL1324.LNG       !Italian language file
     CMLS1324.LNG
     #ELSE
     CMLL1324.LNG       !Italian language file
     CMLS1324.LNG
     #ENDIF
     CMLL1324.INF (contains label formats; has to be in the same path of CMLL13.DLL)
     CMLL1324.CHM (Designer help; has to be in the same path of CMLL13.DLL)
   #OF('Norwegian')
     #IF(%LLUseUnicode=%True)
     CULL1329.LNG       !Norwegian language file
     CMLS1329.LNG
     #ELSE
     CMLL1329.LNG       !Norwegian language file
     CMLS1329.LNG
     #ENDIF
     CMLL1329.INF (contains label formats; has to be in the same path of CMLL13.DLL)
     CMLL1329.CHM (Designer help; has to be in the same path of CMLL13.DLL)
   #OF('Portuguese')
     #IF(%LLUseUnicode=%True)
     CULL1331.LNG       !Portugese language file
     CMLS1331.LNG
     #ELSE
     CMLL1331.LNG       !Portugese language file
     CMLS1331.LNG
     #ENDIF
     CMLL1331.INF (contains label formats; has to be in the same path of CMLL13.DLL)
     CMLL1331.CHM (Designer help; has to be in the same path of CMLL13.DLL)
   #OF('Russian')
     #IF(%LLUseUnicode=%True)
     CULL1333.LNG       !Russian language file
     CMLS1333.LNG
     #ELSE
     CMLL1333.LNG       !Russian language file
     CMLS1333.LNG
     #ENDIF
     CMLL1333.INF (contains label formats; has to be in the same path of CMLL13.DLL)
     CMLL1333.CHM (Designer help; has to be in the same path of CMLL13.DLL)
   #OF('Spanish')
     #IF(%LLUseUnicode=%True)
     CULL1337.LNG       !Spanish language file
     CMLS1337.LNG
     #ELSE
     CMLL1337.LNG       !Spanish language file
     CMLS1337.LNG
     #ENDIF
     CMLL1337.INF (contains label formats; has to be in the same path of CMLL13.DLL)
     CMLL1337.CHM (Designer help; has to be in the same path of CMLL13.DLL)
   #OF('Swedish')
     #IF(%LLUseUnicode=%True)
     CULL1338.LNG       !Swedish language file
     CMLS1338.LNG
     #ELSE
     CMLL1338.LNG       !Swedish language file
     CMLS1338.LNG
     #ENDIF
     CMLL1338.INF (contains label formats; has to be in the same path of CMLL13.DLL)
     CMLL1338.CHM (Designer help; has to be in the same path of CMLL13.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL13O.OCX  This must be registered on your end user's system

  #END


  #!***************************************** Version 14 Ship List ****************
  #IF(%LLVersion = 'Version 14')
     combit List & Label files:-
     ---------------------------
    #IF(%LLUseUnicode=%False)
     CMLL14.DLL
     CMLL14XL.DLL
     CMLS14.DLL
     CMBR14.DLL
     CMPR14.DLL
     CMUT14.DLL
     CMCT14.DLL
     CMDW14.DLL
     CMMX01.DLL
    #ELSE
     CULL14.DLL
     CMLL14XL.DLL
     CULS14.DLL
     CUBR14.DLL
     CUPR14.DLL
     CUUT14.DLL
     CUCT14.DLL
     CUDW14.DLL
     CMLS14.DLL
     CMMX01.DLL
     CMPR14.DLL
     CMUT14.DLL
     CMCT14.DLL
     CMBR14.DLL
     CMDW14.DLL
    #ENDIF
     CMLL14EX.LLX     Export Modules (HTML, PDF, RTF, XML, MHTML,...)
     CMLL14OC.LLX     OLE-Object
     CMLL14HT.LLX     HTML-Object
     CMLL14PW.LLX     Project Wizard
     CMLL14BC.LLX     2D barcodes (Professional/Enterprise Edition only)
     CMMX14.CPL       combit mail settings control panel applet
     CMLL14SX.DLL     shell extension for preview files

   #CASE(%Language)
   #OF('English')
     #IF(%LLUseUnicode=%True)
     CULL1401.LNG       !English language file
     #ELSE
     CMLL1401.LNG       !English language file
     CMMX1401.LNG
     #ENDIF
     CMLL1401.INF (contains label formats; has to be in the same path of CMLL14.DLL)
     CMLL1401.CHM (Designer help; has to be in the same path of CMLL14.DLL)
   #OF('German')
     #IF(%LLUseUnicode=%True)
     CULL1400.LNG       !German language file
     #ELSE
     CMLL1400.LNG       !German language file
     #ENDIF
     CMLL1400.INF (contains label formats; has to be in the same path of CMLL14.DLL)
     CMLL1400.CHM (Designer help; has to be in the same path of CMLL14.DLL)
   #OF('Greek')
     #IF(%LLUseUnicode=%True)
     CULL1419.LNG       !Greek language file
     CMLS1419.LNG
     #ELSE
     CMLL1419.LNG       !Greek language file
     CMLS1419.LNG
     #ENDIF
     CMLL1419.INF (contains label formats; has to be in the same path of CMLL14.DLL)
     CMLL1419.CHM (Designer help; has to be in the same path of CMLL14.DLL)
   #OF('French')
     #IF(%LLUseUnicode=%True)
     CULL1418.LNG       !French language file
     CMLS1418.LNG
     #ELSE
     CMLL1418.LNG       !French language file
     CMLS1418.LNG
     #ENDIF
     CMLL1418.INF (contains label formats; has to be in the same path of CMLL14.DLL)
     CMLL1418.CHM (Designer help; has to be in the same path of CMLL14.DLL)
   #OF('Catalan')
     #IF(%LLUseUnicode=%True)
     CULL1408.LNG       !Catalan language file
     CMLS1408.LNG
     #ELSE
     CMLL1408.LNG       !Catalan language file
     CMLS1408.LNG
     #ENDIF
     CMLL1408.INF (contains label formats; has to be in the same path of CMLL14.DLL)
     CMLL1408.CHM (Designer help; has to be in the same path of CMLL14.DLL)
   #OF('Danish')
     #IF(%LLUseUnicode=%True)
     CULL1414.LNG       !Danish language file
     CMLS1414.LNG
     #ELSE
     CMLL1414.LNG       !Danish language file
     CMLS1414.LNG
     #ENDIF
     CMLL1414.INF (contains label formats; has to be in the same path of CMLL14.DLL)
     CMLL1414.CHM (Designer help; has to be in the same path of CMLL14.DLL)
   #OF('Dutch')
     #IF(%LLUseUnicode=%True)
     CULL1414.LNG       !Dutch language file
     CMLS1414.LNG
     #ELSE
     CMLL1414.LNG       !Dutch language file
     CMLS1414.LNG
     #ENDIF
     CMLL1414.INF (contains label formats; has to be in the same path of CMLL14.DLL)
     CMLL1414.CHM (Designer help; has to be in the same path of CMLL14.DLL)
   #OF('Hungarian')
     #IF(%LLUseUnicode=%True)
     CULL1421.LNG       !Hungarian language file
     CMLS1421.LNG
     #ELSE
     CMLL1421.LNG       !Hungarian language file
     CMLS1421.LNG
     #ENDIF
     CMLL1421.INF (contains label formats; has to be in the same path of CMLL14.DLL)
     CMLL1421.CHM (Designer help; has to be in the same path of CMLL14.DLL)
   #OF('Italian')
     #IF(%LLUseUnicode=%True)
     CULL1424.LNG       !Italian language file
     CMLS1424.LNG
     #ELSE
     CMLL1424.LNG       !Italian language file
     CMLS1424.LNG
     #ENDIF
     CMLL1424.INF (contains label formats; has to be in the same path of CMLL14.DLL)
     CMLL1424.CHM (Designer help; has to be in the same path of CMLL14.DLL)
   #OF('Norwegian')
     #IF(%LLUseUnicode=%True)
     CULL1429.LNG       !Norwegian language file
     CMLS1429.LNG
     #ELSE
     CMLL1429.LNG       !Norwegian language file
     CMLS1429.LNG
     #ENDIF
     CMLL1429.INF (contains label formats; has to be in the same path of CMLL14.DLL)
     CMLL1429.CHM (Designer help; has to be in the same path of CMLL14.DLL)
   #OF('Portuguese')
     #IF(%LLUseUnicode=%True)
     CULL1431.LNG       !Portugese language file
     CMLS1431.LNG
     #ELSE
     CMLL1431.LNG       !Portugese language file
     CMLS1431.LNG
     #ENDIF
     CMLL1431.INF (contains label formats; has to be in the same path of CMLL14.DLL)
     CMLL1431.CHM (Designer help; has to be in the same path of CMLL14.DLL)
   #OF('Russian')
     #IF(%LLUseUnicode=%True)
     CULL1433.LNG       !Russian language file
     CMLS1433.LNG
     #ELSE
     CMLL1433.LNG       !Russian language file
     CMLS1433.LNG
     #ENDIF
     CMLL1433.INF (contains label formats; has to be in the same path of CMLL14.DLL)
     CMLL1433.CHM (Designer help; has to be in the same path of CMLL14.DLL)
   #OF('Spanish')
     #IF(%LLUseUnicode=%True)
     CULL1437.LNG       !Spanish language file
     CMLS1437.LNG
     #ELSE
     CMLL1437.LNG       !Spanish language file
     CMLS1437.LNG
     #ENDIF
     CMLL1437.INF (contains label formats; has to be in the same path of CMLL14.DLL)
     CMLL1437.CHM (Designer help; has to be in the same path of CMLL14.DLL)
   #OF('Swedish')
     #IF(%LLUseUnicode=%True)
     CULL1438.LNG       !Swedish language file
     CMLS1438.LNG
     #ELSE
     CMLL1438.LNG       !Swedish language file
     CMLS1438.LNG
     #ENDIF
     CMLL1438.INF (contains label formats; has to be in the same path of CMLL14.DLL)
     CMLL1438.CHM (Designer help; has to be in the same path of CMLL14.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL14O.OCX  This must be registered on your end user's system

  #END


  #!***************************************** Version 15 Ship List ****************
  #IF(%LLVersion = 'Version 15')
     combit List & Label files:-
     ---------------------------
     CMLL15.DLL
     CMLL15XL.DLL
     CMLS15.DLL
     CMBR15.DLL
     CMPR15.DLL
     CMUT15.DLL
     CMCT15.DLL
     CMDW15.DLL
     CMMX15.DLL
     CMLL15EX.LLX     Export Modules (HTML, PDF, RTF, XML, MHTML,...)
     CMLL15OC.LLX     OLE-Object
     CMLL15HT.LLX     HTML-Object
     CMLL15PW.LLX     Project Wizard
     CMLL15BC.LLX     2D barcodes (Professional/Enterprise Edition only)
   #CASE(%Language)
   #OF('English')
     CMLL1501.LNG       !English language file
     CMLL1501.INF (contains label formats; has to be in the same path of CMLL15.DLL)
     CMLL1501.CHM (Designer help; has to be in the same path of CMLL15.DLL)
   #OF('German')
     CMLL1500.LNG       !German language file
     CMLL1500.INF (contains label formats; has to be in the same path of CMLL15.DLL)
     CMLL1500.CHM (Designer help; has to be in the same path of CMLL15.DLL)
   #OF('Greek')
     CMLL1513.LNG       !Greek language file
     CMLS1513.LNG
     CMLL1501.INF (contains label formats; has to be in the same path of CMLL15.DLL)
     CMLL1501.CHM (Designer help; has to be in the same path of CMLL15.DLL)
   #OF('French')
     CMLL1512.LNG       !French language file
     CMLS1512.LNG
     CMLL1501.INF (contains label formats; has to be in the same path of CMLL15.DLL)
     CMLL1501.CHM (Designer help; has to be in the same path of CMLL15.DLL)
   #OF('Catalan')
     CMLL1508.LNG       !Catalan language file
     CMLS1508.LNG
     CMLL1501.INF (contains label formats; has to be in the same path of CMLL15.DLL)
     CMLL1501.CHM (Designer help; has to be in the same path of CMLL15.DLL)
   #OF('Danish')
     CMLL150C.LNG       !Danish language file
     CMLS150C.LNG
     CMLL1501.INF (contains label formats; has to be in the same path of CMLL15.DLL)
     CMLL1501.CHM (Designer help; has to be in the same path of CMLL15.DLL)
   #OF('Dutch')
     CMLL150D.LNG       !Dutch language file
     CMLS150D.LNG
     CMLL1501.INF (contains label formats; has to be in the same path of CMLL15.DLL)
     CMLL1501.CHM (Designer help; has to be in the same path of CMLL15.DLL)
   #OF('Hungarian')
     CMLL1515.LNG       !Hungarian language file
     CMLS1515.LNG
     CMLL1501.INF (contains label formats; has to be in the same path of CMLL15.DLL)
     CMLL1501.CHM (Designer help; has to be in the same path of CMLL15.DLL)
   #OF('Italian')
     CMLL1518.LNG       !Italian language file
     CMLS1518.LNG
     CMLL1501.INF (contains label formats; has to be in the same path of CMLL15.DLL)
     CMLL1501.CHM (Designer help; has to be in the same path of CMLL15.DLL)
   #OF('Norwegian')
     CMLL151D.LNG       !Norwegian language file
     CMLS151D.LNG
     CMLL1501.INF (contains label formats; has to be in the same path of CMLL15.DLL)
     CMLL1501.CHM (Designer help; has to be in the same path of CMLL15.DLL)
   #OF('Portuguese')
     CMLL151F.LNG       !Portugese language file
     CMLS151F.LNG
     CMLL1501.INF (contains label formats; has to be in the same path of CMLL15.DLL)
     CMLL1501.CHM (Designer help; has to be in the same path of CMLL15.DLL)
   #OF('Russian')
     CMLL1521.LNG       !Russian language file
     CMLS1521.LNG
     CMLL1501.INF (contains label formats; has to be in the same path of CMLL15.DLL)
     CMLL1501.CHM (Designer help; has to be in the same path of CMLL15.DLL)
   #OF('Spanish')
     CULL1525.LNG       !Spanish language file
     CMLS1525.LNG
     CMLL1501.INF (contains label formats; has to be in the same path of CMLL15.DLL)
     CMLL1501.CHM (Designer help; has to be in the same path of CMLL15.DLL)
   #OF('Swedish')
     CMLL1526.LNG       !Swedish language file
     CMLS1526.LNG
     CMLL1501.INF (contains label formats; has to be in the same path of CMLL15.DLL)
     CMLL1501.CHM (Designer help; has to be in the same path of CMLL15.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL15O.OCX  This must be registered on your end user's system

  #END


  #!***************************************** Version 16 Ship List ****************
  #IF(%LLVersion = 'Version 16')
     combit List & Label files:-
     ---------------------------
     CMLL16.DLL
     CMLL16XL.DLL
     CMLS16.DLL
     CMBR16.DLL
     CMPR16.DLL
     CMUT16.DLL
     CMCT16.DLL
     CMDW16.DLL
     CMMX16.DLL
     CMLL16EX.LLX     Export Modules (HTML, PDF, RTF, XML, MHTML,...)
     CMLL16OC.LLX     OLE-Object
     CMLL16HT.LLX     HTML-Object
     CMLL16PW.LLX     Project Wizard
     CMLL16BC.LLX     2D barcodes (Professional/Enterprise Edition only)
   #CASE(%Language)
   #OF('English')
     CMLL1601.LNG       !English language file
     CMLL1601.INF (contains label formats; has to be in the same path of CMLL16.DLL)
     CMLL1601.CHM (Designer help; has to be in the same path of CMLL16.DLL)
   #OF('German')
     CMLL1600.LNG       !German language file
     CMLL1600.INF (contains label formats; has to be in the same path of CMLL16.DLL)
     CMLL1600.CHM (Designer help; has to be in the same path of CMLL16.DLL)
   #OF('Greek')
     CMLL1613.LNG       !Greek language file
     CMLS1613.LNG
     CMLL1601.INF (contains label formats; has to be in the same path of CMLL16.DLL)
     CMLL1601.CHM (Designer help; has to be in the same path of CMLL16.DLL)
   #OF('French')
     CMLL1612.LNG       !French language file
     CMLS1612.LNG
     CMLL1601.INF (contains label formats; has to be in the same path of CMLL16.DLL)
     CMLL1601.CHM (Designer help; has to be in the same path of CMLL16.DLL)
   #OF('Catalan')
     CMLL1608.LNG       !Catalan language file
     CMLS1608.LNG
     CMLL1601.INF (contains label formats; has to be in the same path of CMLL16.DLL)
     CMLL1601.CHM (Designer help; has to be in the same path of CMLL16.DLL)
   #OF('Danish')
     CMLL160C.LNG       !Danish language file
     CMLS160C.LNG
     CMLL1601.INF (contains label formats; has to be in the same path of CMLL16.DLL)
     CMLL1601.CHM (Designer help; has to be in the same path of CMLL16.DLL)
   #OF('Dutch')
     CMLL160D.LNG       !Dutch language file
     CMLS160D.LNG
     CMLL1601.INF (contains label formats; has to be in the same path of CMLL16.DLL)
     CMLL1601.CHM (Designer help; has to be in the same path of CMLL16.DLL)
   #OF('Hungarian')
     CMLL1615.LNG       !Hungarian language file
     CMLS1615.LNG
     CMLL1601.INF (contains label formats; has to be in the same path of CMLL16.DLL)
     CMLL1601.CHM (Designer help; has to be in the same path of CMLL16.DLL)
   #OF('Italian')
     CMLL1618.LNG       !Italian language file
     CMLS1618.LNG
     CMLL1601.INF (contains label formats; has to be in the same path of CMLL16.DLL)
     CMLL1601.CHM (Designer help; has to be in the same path of CMLL16.DLL)
   #OF('Norwegian')
     CMLL161D.LNG       !Norwegian language file
     CMLS161D.LNG
     CMLL1601.INF (contains label formats; has to be in the same path of CMLL16.DLL)
     CMLL1601.CHM (Designer help; has to be in the same path of CMLL16.DLL)
   #OF('Portuguese')
     CMLL161F.LNG       !Portugese language file
     CMLS161F.LNG
     CMLL1601.INF (contains label formats; has to be in the same path of CMLL16.DLL)
     CMLL1601.CHM (Designer help; has to be in the same path of CMLL16.DLL)
   #OF('Russian')
     CMLL1621.LNG       !Russian language file
     CMLS1621.LNG
     CMLL1601.INF (contains label formats; has to be in the same path of CMLL16.DLL)
     CMLL1601.CHM (Designer help; has to be in the same path of CMLL16.DLL)
   #OF('Spanish')
     CULL1625.LNG       !Spanish language file
     CMLS1625.LNG
     CMLL1601.INF (contains label formats; has to be in the same path of CMLL16.DLL)
     CMLL1601.CHM (Designer help; has to be in the same path of CMLL16.DLL)
   #OF('Swedish')
     CMLL1626.LNG       !Swedish language file
     CMLS1626.LNG
     CMLL1601.INF (contains label formats; has to be in the same path of CMLL16.DLL)
     CMLL1601.CHM (Designer help; has to be in the same path of CMLL16.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL16O.OCX  This must be registered on your end user's system

  #END


  #!***************************************** Version 17 Ship List ****************
  #IF(%LLVersion = 'Version 17')
     combit List & Label files:-
     ---------------------------
     CMLL17.DLL
     CMLL17XL.DLL
     CMLS17.DLL
     CMBR17.DLL
     CMPR17.DLL
     CMUT17.DLL
     CMCT17.DLL
     CMDW17.DLL
     CMMX17.DLL
     CMLL17EX.LLX     Export Modules (HTML, PDF, RTF, XML, MHTML,...)
     CMLL17OC.LLX     OLE-Object
     CMLL17HT.LLX     HTML-Object
     CMLL17PW.LLX     Project Wizard
     CMLL17BC.LLX     2D barcodes (Professional/Enterprise Edition only)
   #CASE(%Language)
   #OF('English')
     CMLL1701.LNG       !English language file
     CMLL1701.INF (contains label formats; has to be in the same path of CMLL17.DLL)
     CMLL1701.CHM (Designer help; has to be in the same path of CMLL17.DLL)
   #OF('German')
     CMLL1700.LNG       !German language file
     CMLL1700.INF (contains label formats; has to be in the same path of CMLL17.DLL)
     CMLL1700.CHM (Designer help; has to be in the same path of CMLL17.DLL)
   #OF('Greek')
     CMLL1713.LNG       !Greek language file
     CMLS1713.LNG
     CMLL1701.INF (contains label formats; has to be in the same path of CMLL17.DLL)
     CMLL1701.CHM (Designer help; has to be in the same path of CMLL17.DLL)
   #OF('French')
     CMLL1712.LNG       !French language file
     CMLS1712.LNG
     CMLL1701.INF (contains label formats; has to be in the same path of CMLL17.DLL)
     CMLL1701.CHM (Designer help; has to be in the same path of CMLL17.DLL)
   #OF('Catalan')
     CMLL1708.LNG       !Catalan language file
     CMLS1708.LNG
     CMLL1701.INF (contains label formats; has to be in the same path of CMLL17.DLL)
     CMLL1701.CHM (Designer help; has to be in the same path of CMLL17.DLL)
   #OF('Danish')
     CMLL170C.LNG       !Danish language file
     CMLS170C.LNG
     CMLL1701.INF (contains label formats; has to be in the same path of CMLL17.DLL)
     CMLL1701.CHM (Designer help; has to be in the same path of CMLL17.DLL)
   #OF('Dutch')
     CMLL170D.LNG       !Dutch language file
     CMLS170D.LNG
     CMLL1701.INF (contains label formats; has to be in the same path of CMLL17.DLL)
     CMLL1701.CHM (Designer help; has to be in the same path of CMLL17.DLL)
   #OF('Hungarian')
     CMLL1715.LNG       !Hungarian language file
     CMLS1715.LNG
     CMLL1701.INF (contains label formats; has to be in the same path of CMLL17.DLL)
     CMLL1701.CHM (Designer help; has to be in the same path of CMLL17.DLL)
   #OF('Italian')
     CMLL1718.LNG       !Italian language file
     CMLS1718.LNG
     CMLL1701.INF (contains label formats; has to be in the same path of CMLL17.DLL)
     CMLL1701.CHM (Designer help; has to be in the same path of CMLL17.DLL)
   #OF('Norwegian')
     CMLL171D.LNG       !Norwegian language file
     CMLS171D.LNG
     CMLL1701.INF (contains label formats; has to be in the same path of CMLL17.DLL)
     CMLL1701.CHM (Designer help; has to be in the same path of CMLL17.DLL)
   #OF('Portuguese')
     CMLL171F.LNG       !Portugese language file
     CMLS171F.LNG
     CMLL1701.INF (contains label formats; has to be in the same path of CMLL17.DLL)
     CMLL1701.CHM (Designer help; has to be in the same path of CMLL17.DLL)
   #OF('Russian')
     CMLL1721.LNG       !Russian language file
     CMLS1721.LNG
     CMLL1701.INF (contains label formats; has to be in the same path of CMLL17.DLL)
     CMLL1701.CHM (Designer help; has to be in the same path of CMLL17.DLL)
   #OF('Spanish')
     CULL1725.LNG       !Spanish language file
     CMLS1725.LNG
     CMLL1701.INF (contains label formats; has to be in the same path of CMLL17.DLL)
     CMLL1701.CHM (Designer help; has to be in the same path of CMLL17.DLL)
   #OF('Swedish')
     CMLL1726.LNG       !Swedish language file
     CMLS1726.LNG
     CMLL1701.INF (contains label formats; has to be in the same path of CMLL17.DLL)
     CMLL1701.CHM (Designer help; has to be in the same path of CMLL17.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL17O.OCX  This must be registered on your end user's system

  #END


  #!***************************************** Version 18 Ship List ****************
  #IF(%LLVersion = 'Version 18')
     combit List & Label files:-
     ---------------------------
     CMLL18.DLL
     CMLL18XL.DLL
     CMLS18.DLL
     CMBR18.DLL
     CMPR18.DLL
     CMUT18.DLL
     CMCT18.DLL
     CMDW18.DLL
     CMMX18.DLL
     CMLL18EX.LLX     Export Modules (HTML, PDF, RTF, XML, MHTML,...)
     CMLL18OC.LLX     OLE-Object
     CMLL18HT.LLX     HTML-Object
     CMLL18PW.LLX     Project Wizard
     CMLL18BC.LLX     2D barcodes (Professional/Enterprise Edition only)
   #CASE(%Language)
   #OF('English')
     CMLL1801.LNG       !English language file
     CMLL1801.LTPL (contains label formats; has to be in the same path of CMLL18.DLL)
     CMLL1801.CHM (Designer help; has to be in the same path of CMLL18.DLL)
   #OF('German')
     CMLL1800.LNG       !German language file
     CMLL1800.LTPL (contains label formats; has to be in the same path of CMLL18.DLL)
     CMLL1800.CHM (Designer help; has to be in the same path of CMLL18.DLL)
   #OF('Greek')
     CMLL1813.LNG       !Greek language file
     CMLS1813.LNG
     CMLL1801.LTPL (contains label formats; has to be in the same path of CMLL18.DLL)
     CMLL1801.CHM (Designer help; has to be in the same path of CMLL18.DLL)
   #OF('French')
     CMLL1812.LNG       !French language file
     CMLS1812.LNG
     CMLL1801.LTPL (contains label formats; has to be in the same path of CMLL18.DLL)
     CMLL1801.CHM (Designer help; has to be in the same path of CMLL18.DLL)
   #OF('Catalan')
     CMLL1808.LNG       !Catalan language file
     CMLS1808.LNG
     CMLL1801.LTPL (contains label formats; has to be in the same path of CMLL18.DLL)
     CMLL1801.CHM (Designer help; has to be in the same path of CMLL18.DLL)
   #OF('Danish')
     CMLL180C.LNG       !Danish language file
     CMLS180C.LNG
     CMLL1801.LTPL (contains label formats; has to be in the same path of CMLL18.DLL)
     CMLL1801.CHM (Designer help; has to be in the same path of CMLL18.DLL)
   #OF('Dutch')
     CMLL180D.LNG       !Dutch language file
     CMLS180D.LNG
     CMLL1801.LTPL (contains label formats; has to be in the same path of CMLL18.DLL)
     CMLL1801.CHM (Designer help; has to be in the same path of CMLL18.DLL)
   #OF('Hungarian')
     CMLL1815.LNG       !Hungarian language file
     CMLS1815.LNG
     CMLL1801.LTPL (contains label formats; has to be in the same path of CMLL18.DLL)
     CMLL1801.CHM (Designer help; has to be in the same path of CMLL18.DLL)
   #OF('Italian')
     CMLL1818.LNG       !Italian language file
     CMLS1818.LNG
     CMLL1801.LTPL (contains label formats; has to be in the same path of CMLL18.DLL)
     CMLL1801.CHM (Designer help; has to be in the same path of CMLL18.DLL)
   #OF('Norwegian')
     CMLL181D.LNG       !Norwegian language file
     CMLS181D.LNG
     CMLL1801.LTPL (contains label formats; has to be in the same path of CMLL18.DLL)
     CMLL1801.CHM (Designer help; has to be in the same path of CMLL18.DLL)
   #OF('Portuguese')
     CMLL181F.LNG       !Portugese language file
     CMLS181F.LNG
     CMLL1801.LTPL (contains label formats; has to be in the same path of CMLL18.DLL)
     CMLL1801.CHM (Designer help; has to be in the same path of CMLL18.DLL)
   #OF('Russian')
     CMLL1821.LNG       !Russian language file
     CMLS1821.LNG
     CMLL1801.LTPL (contains label formats; has to be in the same path of CMLL18.DLL)
     CMLL1801.CHM (Designer help; has to be in the same path of CMLL18.DLL)
   #OF('Spanish')
     CULL1825.LNG       !Spanish language file
     CMLS1825.LNG
     CMLL1801.LTPL (contains label formats; has to be in the same path of CMLL18.DLL)
     CMLL1801.CHM (Designer help; has to be in the same path of CMLL18.DLL)
   #OF('Swedish')
     CMLL1826.LNG       !Swedish language file
     CMLS1826.LNG
     CMLL1801.LTPL (contains label formats; has to be in the same path of CMLL18.DLL)
     CMLL1801.CHM (Designer help; has to be in the same path of CMLL18.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL18O.OCX  This must be registered on your end user's system

  #END


  #!***************************************** Version 19 Ship List ****************
  #IF(%LLVersion = 'Version 19')
     combit List & Label files:-
     ---------------------------
     CMLL19.DLL
     CMLL19XL.DLL
     CMLS19.DLL
     CMBR19.DLL
     CMPR19.DLL
     CMUT19.DLL
     CMCT19.DLL
     CMDW19.DLL
     CMMX19.DLL
     CMLL19EX.LLX     Export Modules (HTML, PDF, RTF, XML, MHTML,...)
     CMLL19OC.LLX     OLE-Object
     CMLL19HT.LLX     HTML-Object
     CMLL19PW.LLX     Project Wizard
     CMLL19BC.LLX     2D barcodes (Professional/Enterprise Edition only)
   #CASE(%Language)
   #OF('English')
     CMLL1901.LNG       !English language file
     CMLL1901.LTPL (contains label formats; has to be in the same path of CMLL19.DLL)
     CMLL1901.CHM (Designer help; has to be in the same path of CMLL19.DLL)
   #OF('German')
     CMLL1900.LNG       !German language file
     CMLL1900.LTPL (contains label formats; has to be in the same path of CMLL19.DLL)
     CMLL1900.CHM (Designer help; has to be in the same path of CMLL19.DLL)
   #OF('Greek')
     CMLL1913.LNG       !Greek language file
     CMLS1913.LNG
     CMLL1901.LTPL (contains label formats; has to be in the same path of CMLL19.DLL)
     CMLL1901.CHM (Designer help; has to be in the same path of CMLL19.DLL)
   #OF('French')
     CMLL1912.LNG       !French language file
     CMLS1912.LNG
     CMLL1901.LTPL (contains label formats; has to be in the same path of CMLL19.DLL)
     CMLL1901.CHM (Designer help; has to be in the same path of CMLL19.DLL)
   #OF('Catalan')
     CMLL1908.LNG       !Catalan language file
     CMLS1908.LNG
     CMLL1901.LTPL (contains label formats; has to be in the same path of CMLL19.DLL)
     CMLL1901.CHM (Designer help; has to be in the same path of CMLL19.DLL)
   #OF('Danish')
     CMLL190C.LNG       !Danish language file
     CMLS190C.LNG
     CMLL1901.LTPL (contains label formats; has to be in the same path of CMLL19.DLL)
     CMLL1901.CHM (Designer help; has to be in the same path of CMLL19.DLL)
   #OF('Dutch')
     CMLL190D.LNG       !Dutch language file
     CMLS190D.LNG
     CMLL1901.LTPL (contains label formats; has to be in the same path of CMLL19.DLL)
     CMLL1901.CHM (Designer help; has to be in the same path of CMLL19.DLL)
   #OF('Hungarian')
     CMLL1915.LNG       !Hungarian language file
     CMLS1915.LNG
     CMLL1901.LTPL (contains label formats; has to be in the same path of CMLL19.DLL)
     CMLL1901.CHM (Designer help; has to be in the same path of CMLL19.DLL)
   #OF('Italian')
     CMLL1918.LNG       !Italian language file
     CMLS1918.LNG
     CMLL1901.LTPL (contains label formats; has to be in the same path of CMLL19.DLL)
     CMLL1901.CHM (Designer help; has to be in the same path of CMLL19.DLL)
   #OF('Norwegian')
     CMLL191D.LNG       !Norwegian language file
     CMLS191D.LNG
     CMLL1901.LTPL (contains label formats; has to be in the same path of CMLL19.DLL)
     CMLL1901.CHM (Designer help; has to be in the same path of CMLL19.DLL)
   #OF('Portuguese')
     CMLL191F.LNG       !Portugese language file
     CMLS191F.LNG
     CMLL1901.LTPL (contains label formats; has to be in the same path of CMLL19.DLL)
     CMLL1901.CHM (Designer help; has to be in the same path of CMLL19.DLL)
   #OF('Russian')
     CMLL1921.LNG       !Russian language file
     CMLS1921.LNG
     CMLL1901.LTPL (contains label formats; has to be in the same path of CMLL19.DLL)
     CMLL1901.CHM (Designer help; has to be in the same path of CMLL19.DLL)
   #OF('Spanish')
     CULL1925.LNG       !Spanish language file
     CMLS1925.LNG
     CMLL1901.LTPL (contains label formats; has to be in the same path of CMLL19.DLL)
     CMLL1901.CHM (Designer help; has to be in the same path of CMLL19.DLL)
   #OF('Swedish')
     CMLL1926.LNG       !Swedish language file
     CMLS1926.LNG
     CMLL1901.LTPL (contains label formats; has to be in the same path of CMLL19.DLL)
     CMLL1901.CHM (Designer help; has to be in the same path of CMLL19.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL19O.OCX  This must be registered on your end user's system

  #END

  
  #!***************************************** Version 20 Ship List ****************
  #IF(%LLVersion = 'Version 20')
     combit List & Label files:-
     ---------------------------
     CMLL20.DLL
     CMLL20XL.DLL
     CMLS20.DLL
     CMBR20.DLL
     CMPR20.DLL
     CMUT20.DLL
     CMCT20.DLL
     CMDW20.DLL
     CMMX20.DLL
     CMLL20EX.LLX     Export Modules (HTML, PDF, RTF, XML, MHTML,...)
     CMLL20OC.LLX     OLE-Object
     CMLL20HT.LLX     HTML-Object
     CMLL20PW.LLX     Project Wizard
     CMLL20BC.LLX     2D barcodes (Professional/Enterprise Edition only)
   #CASE(%Language)
   #OF('English')
     CMLL2001.LNG       !English language file
     CMLL2001.LTPL (contains label formats; has to be in the same path of CMLL20.DLL)
     CMLL2001.CHM (Designer help; has to be in the same path of CMLL20.DLL)
   #OF('German')
     CMLL2000.LNG       !German language file
     CMLL2000.LTPL (contains label formats; has to be in the same path of CMLL20.DLL)
     CMLL2000.CHM (Designer help; has to be in the same path of CMLL20.DLL)
   #OF('Greek')
     CMLL2013.LNG       !Greek language file
     CMLS2013.LNG
     CMLL2001.LTPL (contains label formats; has to be in the same path of CMLL20.DLL)
     CMLL2001.CHM (Designer help; has to be in the same path of CMLL20.DLL)
   #OF('French')
     CMLL2012.LNG       !French language file
     CMLS2012.LNG
     CMLL2001.LTPL (contains label formats; has to be in the same path of CMLL20.DLL)
     CMLL2001.CHM (Designer help; has to be in the same path of CMLL20.DLL)
   #OF('Catalan')
     CMLL2008.LNG       !Catalan language file
     CMLS2008.LNG
     CMLL2001.LTPL (contains label formats; has to be in the same path of CMLL20.DLL)
     CMLL2001.CHM (Designer help; has to be in the same path of CMLL20.DLL)
   #OF('Danish')
     CMLL200C.LNG       !Danish language file
     CMLS200C.LNG
     CMLL2001.LTPL (contains label formats; has to be in the same path of CMLL20.DLL)
     CMLL2001.CHM (Designer help; has to be in the same path of CMLL20.DLL)
   #OF('Dutch')
     CMLL200D.LNG       !Dutch language file
     CMLS200D.LNG
     CMLL2001.LTPL (contains label formats; has to be in the same path of CMLL20.DLL)
     CMLL2001.CHM (Designer help; has to be in the same path of CMLL20.DLL)
   #OF('Hungarian')
     CMLL2015.LNG       !Hungarian language file
     CMLS2015.LNG
     CMLL2001.LTPL (contains label formats; has to be in the same path of CMLL20.DLL)
     CMLL2001.CHM (Designer help; has to be in the same path of CMLL20.DLL)
   #OF('Italian')
     CMLL2018.LNG       !Italian language file
     CMLS2018.LNG
     CMLL2001.LTPL (contains label formats; has to be in the same path of CMLL20.DLL)
     CMLL2001.CHM (Designer help; has to be in the same path of CMLL20.DLL)
   #OF('Norwegian')
     CMLL201D.LNG       !Norwegian language file
     CMLS201D.LNG
     CMLL2001.LTPL (contains label formats; has to be in the same path of CMLL20.DLL)
     CMLL2001.CHM (Designer help; has to be in the same path of CMLL20.DLL)
   #OF('Portuguese')
     CMLL201F.LNG       !Portugese language file
     CMLS201F.LNG
     CMLL2001.LTPL (contains label formats; has to be in the same path of CMLL20.DLL)
     CMLL2001.CHM (Designer help; has to be in the same path of CMLL20.DLL)
   #OF('Russian')
     CMLL2021.LNG       !Russian language file
     CMLS2021.LNG
     CMLL2001.LTPL (contains label formats; has to be in the same path of CMLL20.DLL)
     CMLL2001.CHM (Designer help; has to be in the same path of CMLL20.DLL)
   #OF('Spanish')
     CULL2025.LNG       !Spanish language file
     CMLS2025.LNG
     CMLL2001.LTPL (contains label formats; has to be in the same path of CMLL20.DLL)
     CMLL2001.CHM (Designer help; has to be in the same path of CMLL20.DLL)
   #OF('Swedish')
     CMLL2026.LNG       !Swedish language file
     CMLS2026.LNG
     CMLL2001.LTPL (contains label formats; has to be in the same path of CMLL20.DLL)
     CMLL2001.CHM (Designer help; has to be in the same path of CMLL20.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL20O.OCX  This must be registered on your end user's system

  #END

  
  #!***************************************** Version 21 Ship List ****************
  #IF(%LLVersion = 'Version 21')
     combit List & Label files:-
     ---------------------------
     CMLL21.DLL
     CMLL21XL.DLL
     CMLS21.DLL
     CMBR21.DLL
     CMPR21.DLL
     CMUT21.DLL
     CMCT21.DLL
     CMDW21.DLL
     CMMX21.DLL
     CMLL21EX.LLX     Export Modules (HTML, PDF, RTF, XML, MHTML,...)
     CMLL21OC.LLX     OLE-Object
     CMLL21HT.LLX     HTML-Object
     CMLL21PW.LLX     Project Wizard
     CMLL21BC.LLX     2D barcodes (Professional/Enterprise Edition only)
   #CASE(%Language)
   #OF('English')
     CMLL2101.LNG       !English language file
     CMLS2101.LNG
     CMLL2101.LTPL (contains label formats; has to be in the same path of CMLL21.DLL)
     CMLL2101.CHM (Designer help; has to be in the same path of CMLL21.DLL)
   #OF('German')
     CMLL2100.LNG       !German language file
     CMLS2100.LNG
     CMLL2100.LTPL (contains label formats; has to be in the same path of CMLL21.DLL)
     CMLL2100.CHM (Designer help; has to be in the same path of CMLL21.DLL)
   #OF('Chinese')
     CMLL2109.LNG       !Chinese language file
     CMLS2109.LNG
     CMLL2101.LTPL (contains label formats; has to be in the same path of CMLL21.DLL)
     CMLL2101.CHM (Designer help; has to be in the same path of CMLL21.DLL)
   #OF('Dutch')
     CMLL210D.LNG       !Dutch language file
     CMLS210D.LNG
     CMLL2101.LTPL (contains label formats; has to be in the same path of CMLL21.DLL)
     CMLL2101.CHM (Designer help; has to be in the same path of CMLL21.DLL)   
   #OF('French')
     CMLL2112.LNG       !French language file
     CMLS2112.LNG
     CMLL2101.LTPL (contains label formats; has to be in the same path of CMLL21.DLL)
     CMLL2101.CHM (Designer help; has to be in the same path of CMLL21.DLL)
   #OF('Italian')
     CMLL2118.LNG       !Italian language file
     CMLS2118.LNG
     CMLL2101.LTPL (contains label formats; has to be in the same path of CMLL21.DLL)
     CMLL2101.CHM (Designer help; has to be in the same path of CMLL21.DLL)
   #OF('Polish')
     CMLL211E.LNG       !Polish language file
     CMLS211E.LNG
     CMLL2101.LTPL (contains label formats; has to be in the same path of CMLL21.DLL)
     CMLL2101.CHM (Designer help; has to be in the same path of CMLL21.DLL)
   #OF('Portuguese')
     CMLL211F.LNG       !Portuguese language file
     CMLS211F.LNG
     CMLL2101.LTPL (contains label formats; has to be in the same path of CMLL21.DLL)
     CMLL2101.CHM (Designer help; has to be in the same path of CMLL21.DLL)
   #OF('Russian')
     CMLL2121.LNG       !Russian language file
     CMLS2121.LNG
     CMLL2101.LTPL (contains label formats; has to be in the same path of CMLL21.DLL)
     CMLL2101.CHM (Designer help; has to be in the same path of CMLL21.DLL)
   #OF('Slovak')
     CMLL2122.LNG       !Slovak language file
     CMLS2122.LNG
     CMLL2101.LTPL (contains label formats; has to be in the same path of CMLL21.DLL)
     CMLL2101.CHM (Designer help; has to be in the same path of CMLL21.DLL)
   #OF('Spanish')
     CMLL2125.LNG       !Spanish language file
     CMLS2125.LNG
     CMLL2101.LTPL (contains label formats; has to be in the same path of CMLL21.DLL)
     CMLL2101.CHM (Designer help; has to be in the same path of CMLL21.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL21O.OCX  This must be registered on your end user's system

  #END

    #!***************************************** Version 22 Ship List ****************
  #IF(%LLVersion = 'Version 22')
     combit List & Label files:-
     ---------------------------
     CMLL22.DLL
     CMLL22XL.DLL
     CMLS22.DLL
     CMBR22.DLL
     CMPR22.DLL
     CMUT22.DLL
     CMCT22.DLL
     CMDW22.DLL
     CMMX22.DLL
     CMLL22EX.LLX     Export Modules (HTML, PDF, RTF, XML, MHTML,...)
     CMLL22OC.LLX     OLE-Object
     CMLL22HT.LLX     HTML-Object
     CMLL22PW.LLX     Project Wizard
     CMLL22BC.LLX     2D barcodes (Professional/Enterprise Edition only)
   #CASE(%Language)
   #OF('English')
     CMLL2201.LNG       !English language file
     CMLS2201.LNG
     CMLL2201.LTPL (contains label formats; has to be in the same path of CMLL22.DLL)
     CMLL2201.CHM (Designer help; has to be in the same path of CMLL22.DLL)
   #OF('German')
     CMLL2200.LNG       !German language file
     CMLS2200.LNG
     CMLL2200.LTPL (contains label formats; has to be in the same path of CMLL22.DLL)
     CMLL2200.CHM (Designer help; has to be in the same path of CMLL22.DLL)
   #OF('Chinese')
     CMLL2209.LNG       !Chinese language file
     CMLS2209.LNG
     CMLL2201.LTPL (contains label formats; has to be in the same path of CMLL22.DLL)
     CMLL2201.CHM (Designer help; has to be in the same path of CMLL22.DLL)
   #OF('Dutch')
     CMLL220D.LNG       !Dutch language file
     CMLS220D.LNG
     CMLL2201.LTPL (contains label formats; has to be in the same path of CMLL22.DLL)
     CMLL2201.CHM (Designer help; has to be in the same path of CMLL22.DLL)   
   #OF('French')
     CMLL2212.LNG       !French language file
     CMLS2212.LNG
     CMLL2201.LTPL (contains label formats; has to be in the same path of CMLL22.DLL)
     CMLL2201.CHM (Designer help; has to be in the same path of CMLL22.DLL)
   #OF('Italian')
     CMLL2218.LNG       !Italian language file
     CMLS2218.LNG
     CMLL2201.LTPL (contains label formats; has to be in the same path of CMLL22.DLL)
     CMLL2201.CHM (Designer help; has to be in the same path of CMLL22.DLL)
   #OF('Japanese')
     CMLL2219.LNG       !Japanese language file
     CMLS2219.LNG
     CMLL2201.LTPL (contains label formats; has to be in the same path of CMLL22.DLL)
     CMLL2201.CHM (Designer help; has to be in the same path of CMLL22.DLL)
   #OF('Polish')
     CMLL221E.LNG       !Polish language file
     CMLS221E.LNG
     CMLL2201.LTPL (contains label formats; has to be in the same path of CMLL22.DLL)
     CMLL2201.CHM (Designer help; has to be in the same path of CMLL22.DLL)
   #OF('Portuguese')
     CMLL221F.LNG       !Portuguese language file
     CMLS221F.LNG
     CMLL2201.LTPL (contains label formats; has to be in the same path of CMLL22.DLL)
     CMLL2201.CHM (Designer help; has to be in the same path of CMLL22.DLL)
   #OF('Russian')
     CMLL2221.LNG       !Russian language file
     CMLS2221.LNG
     CMLL2201.LTPL (contains label formats; has to be in the same path of CMLL22.DLL)
     CMLL2201.CHM (Designer help; has to be in the same path of CMLL22.DLL)
   #OF('Slovak')
     CMLL2222.LNG       !Slovak language file
     CMLS2222.LNG
     CMLL2201.LTPL (contains label formats; has to be in the same path of CMLL22.DLL)
     CMLL2201.CHM (Designer help; has to be in the same path of CMLL22.DLL)
   #OF('Spanish')
     CMLL2225.LNG       !Spanish language file
     CMLS2225.LNG
     CMLL2201.LTPL (contains label formats; has to be in the same path of CMLL22.DLL)
     CMLL2201.CHM (Designer help; has to be in the same path of CMLL22.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL22O.OCX  This must be registered on your end user's system

  #END
  
  #!***************************************** Version 23 Ship List ****************
  #IF(%LLVersion = 'Version 23')
     combit List & Label files:-
     ---------------------------
     CMLL23.DLL
     CMLL23XL.DLL
     CMLS23.DLL
     CMBR23.DLL
     CMPR23.DLL
     CMUT23.DLL
     CMCT23.DLL
     CMDW23.DLL
     CMMX23.DLL
     CMLL23EX.LLX     Export Modules (HTML, PDF, RTF, XML, MHTML,...)
     CMLL23OC.LLX     OLE-Object
     CMLL23HT.LLX     HTML-Object
     CMLL23PW.LLX     Project Wizard
     CMLL23BC.LLX     2D barcodes (Professional/Enterprise Edition only)
   #CASE(%Language)
   #OF('English')
     CMLL2301.LNG       !English language file
     CMLS2301.LNG
     CMLL2301.LTPL (contains label formats; has to be in the same path of CMLL23.DLL)
     CMLL2301.CHM (Designer help; has to be in the same path of CMLL23.DLL)
   #OF('German')
     CMLL2300.LNG       !German language file
     CMLS2300.LNG
     CMLL2300.LTPL (contains label formats; has to be in the same path of CMLL23.DLL)
     CMLL2300.CHM (Designer help; has to be in the same path of CMLL23.DLL)
   #OF('Chinese')
     CMLL2309.LNG       !Chinese language file
     CMLS2309.LNG
     CMLL2301.LTPL (contains label formats; has to be in the same path of CMLL23.DLL)
     CMLL2301.CHM (Designer help; has to be in the same path of CMLL23.DLL)
   #OF('Dutch')
     CMLL230D.LNG       !Dutch language file
     CMLS230D.LNG
     CMLL2301.LTPL (contains label formats; has to be in the same path of CMLL23.DLL)
     CMLL2301.CHM (Designer help; has to be in the same path of CMLL23.DLL)   
   #OF('French')
     CMLL2312.LNG       !French language file
     CMLS2312.LNG
     CMLL2301.LTPL (contains label formats; has to be in the same path of CMLL23.DLL)
     CMLL2301.CHM (Designer help; has to be in the same path of CMLL23.DLL)
   #OF('Italian')
     CMLL2318.LNG       !Italian language file
     CMLS2318.LNG
     CMLL2301.LTPL (contains label formats; has to be in the same path of CMLL23.DLL)
     CMLL2301.CHM (Designer help; has to be in the same path of CMLL23.DLL)
   #OF('Japanese')
     CMLL2319.LNG       !Japanese language file
     CMLS2319.LNG
     CMLL2301.LTPL (contains label formats; has to be in the same path of CMLL23.DLL)
     CMLL2301.CHM (Designer help; has to be in the same path of CMLL23.DLL)
   #OF('Polish')
     CMLL231E.LNG       !Polish language file
     CMLS231E.LNG
     CMLL2301.LTPL (contains label formats; has to be in the same path of CMLL23.DLL)
     CMLL2301.CHM (Designer help; has to be in the same path of CMLL23.DLL)
   #OF('Portuguese')
     CMLL231F.LNG       !Portuguese language file
     CMLS231F.LNG
     CMLL2301.LTPL (contains label formats; has to be in the same path of CMLL23.DLL)
     CMLL2301.CHM (Designer help; has to be in the same path of CMLL23.DLL)
   #OF('Russian')
     CMLL2321.LNG       !Russian language file
     CMLS2321.LNG
     CMLL2301.LTPL (contains label formats; has to be in the same path of CMLL23.DLL)
     CMLL2301.CHM (Designer help; has to be in the same path of CMLL23.DLL)
   #OF('Slovak')
     CMLL2322.LNG       !Slovak language file
     CMLS2322.LNG
     CMLL2301.LTPL (contains label formats; has to be in the same path of CMLL23.DLL)
     CMLL2301.CHM (Designer help; has to be in the same path of CMLL23.DLL)
   #OF('Spanish')
     CMLL2325.LNG       !Spanish language file
     CMLS2325.LNG
     CMLL2301.LTPL (contains label formats; has to be in the same path of CMLL23.DLL)
     CMLL2301.CHM (Designer help; has to be in the same path of CMLL23.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL23O.OCX  This must be registered on your end user's system

  #END

  #!***************************************** Version 24 Ship List ****************
  #IF(%LLVersion = 'Version 24')
     combit List & Label files:-
     ---------------------------
     CMLL24.DLL
     CMLL24XL.DLL
     CMLS24.DLL
     CMBR24.DLL
     CMPR24.DLL
     CMUT24.DLL
     CMCT24.DLL
     CMDW24.DLL
     CMMX24.DLL
     CMLL24EX.LLX     Export Modules (HTML, PDF, RTF, XML, MHTML,...)
     CMLL24OC.LLX     OLE-Object
     CMLL24HT.LLX     HTML-Object
     CMLL24PW.LLX     Project Wizard
     CMLL24BC.LLX     2D barcodes (Professional/Enterprise Edition only)
   #CASE(%Language)
   #OF('English')
     CMLL2401.LNG       !English language file
     CMLS2401.LNG
     CMLL2401.LTPL (contains label formats; has to be in the same path of CMLL24.DLL)
     CMLL2401.CHM (Designer help; has to be in the same path of CMLL24.DLL)
   #OF('German')
     CMLL2400.LNG       !German language file
     CMLS2400.LNG
     CMLL2400.LTPL (contains label formats; has to be in the same path of CMLL24.DLL)
     CMLL2400.CHM (Designer help; has to be in the same path of CMLL24.DLL)
   #OF('Chinese')
     CMLL2409.LNG       !Chinese language file
     CMLS2409.LNG
     CMLL2401.LTPL (contains label formats; has to be in the same path of CMLL24.DLL)
     CMLL2401.CHM (Designer help; has to be in the same path of CMLL24.DLL)
   #OF('Dutch')
     CMLL240D.LNG       !Dutch language file
     CMLS240D.LNG
     CMLL2401.LTPL (contains label formats; has to be in the same path of CMLL24.DLL)
     CMLL2401.CHM (Designer help; has to be in the same path of CMLL24.DLL)   
   #OF('French')
     CMLL2412.LNG       !French language file
     CMLS2412.LNG
     CMLL2401.LTPL (contains label formats; has to be in the same path of CMLL24.DLL)
     CMLL2401.CHM (Designer help; has to be in the same path of CMLL24.DLL)
   #OF('Italian')
     CMLL2418.LNG       !Italian language file
     CMLS2418.LNG
     CMLL2401.LTPL (contains label formats; has to be in the same path of CMLL24.DLL)
     CMLL2401.CHM (Designer help; has to be in the same path of CMLL24.DLL)
   #OF('Japanese')
     CMLL2419.LNG       !Japanese language file
     CMLS2419.LNG
     CMLL2401.LTPL (contains label formats; has to be in the same path of CMLL24.DLL)
     CMLL2401.CHM (Designer help; has to be in the same path of CMLL24.DLL)
   #OF('Polish')
     CMLL241E.LNG       !Polish language file
     CMLS241E.LNG
     CMLL2401.LTPL (contains label formats; has to be in the same path of CMLL24.DLL)
     CMLL2401.CHM (Designer help; has to be in the same path of CMLL24.DLL)
   #OF('Portuguese')
     CMLL241F.LNG       !Portuguese language file
     CMLS241F.LNG
     CMLL2401.LTPL (contains label formats; has to be in the same path of CMLL24.DLL)
     CMLL2401.CHM (Designer help; has to be in the same path of CMLL24.DLL)
   #OF('Russian')
     CMLL2421.LNG       !Russian language file
     CMLS2421.LNG
     CMLL2401.LTPL (contains label formats; has to be in the same path of CMLL24.DLL)
     CMLL2401.CHM (Designer help; has to be in the same path of CMLL24.DLL)
   #OF('Slovak')
     CMLL2422.LNG       !Slovak language file
     CMLS2422.LNG
     CMLL2401.LTPL (contains label formats; has to be in the same path of CMLL24.DLL)
     CMLL2401.CHM (Designer help; has to be in the same path of CMLL24.DLL)
   #OF('Spanish')
     CMLL2425.LNG       !Spanish language file
     CMLS2425.LNG
     CMLL2401.LTPL (contains label formats; has to be in the same path of CMLL24.DLL)
     CMLL2401.CHM (Designer help; has to be in the same path of CMLL24.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL24O.OCX  This must be registered on your end user's system

  #END

  #!***************************************** Version 25 Ship List ****************
  #IF(%LLVersion = 'Version 25')
     combit List & Label files:-
     ---------------------------
     CMLL25.DLL
     CMLL25XL.DLL
     CMLS25.DLL
     CMBR25.DLL
     CMPR25.DLL
     CMUT25.DLL
     CMCT25.DLL
     CMDW25.DLL
     CMMX25.DLL
     CMLL25EX.LLX     Export Modules (HTML, PDF, RTF, XML, MHTML,...)
     CMLL25OC.LLX     OLE-Object
     CMLL25HT.LLX     HTML-Object
     CMLL25PW.LLX     Project Wizard
     CMLL25BC.LLX     2D barcodes (Professional/Enterprise Edition only)
   #CASE(%Language)
   #OF('English')
     CMLL2501.LNG       !English language file
     CMLS2501.LNG
     CMLL2501.LTPL (contains label formats; has to be in the same path of CMLL25.DLL)
     CMLL2501.CHM (Designer help; has to be in the same path of CMLL25.DLL)
   #OF('German')
     CMLL2500.LNG       !German language file
     CMLS2500.LNG
     CMLL2500.LTPL (contains label formats; has to be in the same path of CMLL25.DLL)
     CMLL2500.CHM (Designer help; has to be in the same path of CMLL25.DLL)
   #OF('Chinese')
     CMLL2509.LNG       !Chinese language file
     CMLS2509.LNG
     CMLL2501.LTPL (contains label formats; has to be in the same path of CMLL25.DLL)
     CMLL2501.CHM (Designer help; has to be in the same path of CMLL25.DLL)
   #OF('Dutch')
     CMLL250D.LNG       !Dutch language file
     CMLS250D.LNG
     CMLL2501.LTPL (contains label formats; has to be in the same path of CMLL25.DLL)
     CMLL2501.CHM (Designer help; has to be in the same path of CMLL25.DLL)   
   #OF('French')
     CMLL2512.LNG       !French language file
     CMLS2512.LNG
     CMLL2501.LTPL (contains label formats; has to be in the same path of CMLL25.DLL)
     CMLL2501.CHM (Designer help; has to be in the same path of CMLL25.DLL)
   #OF('Italian')
     CMLL2518.LNG       !Italian language file
     CMLS2518.LNG
     CMLL2501.LTPL (contains label formats; has to be in the same path of CMLL25.DLL)
     CMLL2501.CHM (Designer help; has to be in the same path of CMLL25.DLL)
   #OF('Japanese')
     CMLL2519.LNG       !Japanese language file
     CMLS2519.LNG
     CMLL2501.LTPL (contains label formats; has to be in the same path of CMLL25.DLL)
     CMLL2501.CHM (Designer help; has to be in the same path of CMLL25.DLL)
   #OF('Polish')
     CMLL251E.LNG       !Polish language file
     CMLS251E.LNG
     CMLL2501.LTPL (contains label formats; has to be in the same path of CMLL25.DLL)
     CMLL2501.CHM (Designer help; has to be in the same path of CMLL25.DLL)
   #OF('Portuguese')
     CMLL251F.LNG       !Portuguese language file
     CMLS251F.LNG
     CMLL2501.LTPL (contains label formats; has to be in the same path of CMLL25.DLL)
     CMLL2501.CHM (Designer help; has to be in the same path of CMLL25.DLL)
   #OF('Russian')
     CMLL2521.LNG       !Russian language file
     CMLS2521.LNG
     CMLL2501.LTPL (contains label formats; has to be in the same path of CMLL25.DLL)
     CMLL2501.CHM (Designer help; has to be in the same path of CMLL25.DLL)
   #OF('Slovak')
     CMLL2522.LNG       !Slovak language file
     CMLS2522.LNG
     CMLL2501.LTPL (contains label formats; has to be in the same path of CMLL25.DLL)
     CMLL2501.CHM (Designer help; has to be in the same path of CMLL25.DLL)
   #OF('Spanish')
     CMLL2525.LNG       !Spanish language file
     CMLS2525.LNG
     CMLL2501.LTPL (contains label formats; has to be in the same path of CMLL25.DLL)
     CMLL2501.CHM (Designer help; has to be in the same path of CMLL25.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL25O.OCX  This must be registered on your end user's system

  #END

  #!***************************************** Version 26 Ship List ****************
  #IF(%LLVersion = 'Version 26')
     combit List & Label files:-
     ---------------------------
     CMLL26.DLL
     CMLL26XL.DLL
     CMLS26.DLL
     CMBR26.DLL
     CMPR26.DLL
     CMUT26.DLL
     CMCT26.DLL
     CMDW26.DLL
     CMMX26.DLL
     CMLL26EX.LLX     Export Modules (HTML, PDF, RTF, XML, MHTML,...)
     CMLL26OC.LLX     OLE-Object
     CMLL26HT.LLX     HTML-Object
     CMLL26PW.LLX     Project Wizard
     CMLL26BC.LLX     2D barcodes (Professional/Enterprise Edition only)
   #CASE(%Language)
   #OF('English')
     CMLL2601.LNG       !English language file
     CMLS2601.LNG
     CMLL2601.LTPL (contains label formats; has to be in the same path of CMLL26.DLL)
     CMLL2601.CHM (Designer help; has to be in the same path of CMLL26.DLL)
   #OF('German')
     CMLL2600.LNG       !German language file
     CMLS2600.LNG
     CMLL2600.LTPL (contains label formats; has to be in the same path of CMLL26.DLL)
     CMLL2600.CHM (Designer help; has to be in the same path of CMLL26.DLL)
   #OF('Chinese')
     CMLL2609.LNG       !Chinese language file
     CMLS2609.LNG
     CMLL2601.LTPL (contains label formats; has to be in the same path of CMLL26.DLL)
     CMLL2601.CHM (Designer help; has to be in the same path of CMLL26.DLL)
   #OF('Dutch')
     CMLL260D.LNG       !Dutch language file
     CMLS260D.LNG
     CMLL2601.LTPL (contains label formats; has to be in the same path of CMLL26.DLL)
     CMLL2601.CHM (Designer help; has to be in the same path of CMLL26.DLL)   
   #OF('French')
     CMLL2612.LNG       !French language file
     CMLS2612.LNG
     CMLL2601.LTPL (contains label formats; has to be in the same path of CMLL26.DLL)
     CMLL2601.CHM (Designer help; has to be in the same path of CMLL26.DLL)
   #OF('Italian')
     CMLL2618.LNG       !Italian language file
     CMLS2618.LNG
     CMLL2601.LTPL (contains label formats; has to be in the same path of CMLL26.DLL)
     CMLL2601.CHM (Designer help; has to be in the same path of CMLL26.DLL)
   #OF('Japanese')
     CMLL2619.LNG       !Japanese language file
     CMLS2619.LNG
     CMLL2601.LTPL (contains label formats; has to be in the same path of CMLL26.DLL)
     CMLL2601.CHM (Designer help; has to be in the same path of CMLL26.DLL)
   #OF('Polish')
     CMLL261E.LNG       !Polish language file
     CMLS261E.LNG
     CMLL2601.LTPL (contains label formats; has to be in the same path of CMLL26.DLL)
     CMLL2601.CHM (Designer help; has to be in the same path of CMLL26.DLL)
   #OF('Portuguese')
     CMLL261F.LNG       !Portuguese language file
     CMLS261F.LNG
     CMLL2601.LTPL (contains label formats; has to be in the same path of CMLL26.DLL)
     CMLL2601.CHM (Designer help; has to be in the same path of CMLL26.DLL)
   #OF('Russian')
     CMLL2621.LNG       !Russian language file
     CMLS2621.LNG
     CMLL2601.LTPL (contains label formats; has to be in the same path of CMLL26.DLL)
     CMLL2601.CHM (Designer help; has to be in the same path of CMLL26.DLL)
   #OF('Slovak')
     CMLL2622.LNG       !Slovak language file
     CMLS2622.LNG
     CMLL2601.LTPL (contains label formats; has to be in the same path of CMLL26.DLL)
     CMLL2601.CHM (Designer help; has to be in the same path of CMLL26.DLL)
   #OF('Spanish')
     CMLL2625.LNG       !Spanish language file
     CMLS2625.LNG
     CMLL2601.LTPL (contains label formats; has to be in the same path of CMLL26.DLL)
     CMLL2601.CHM (Designer help; has to be in the same path of CMLL26.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL26O.OCX  This must be registered on your end user's system

  #END
  
  #!***************************************** Version 27 Ship List ****************
  #IF(%LLVersion = 'Version 27')
     combit List & Label files:-
     ---------------------------
     CMLL27.DLL
     CMLL27XL.DLL
     CMLS27.DLL
     CMBR27.DLL
     CMPR27.DLL
     CMUT27.DLL
     CMCT27.DLL
     CMDW27.DLL
     CMMX27.DLL
     CMLL27EX.LLX     Export Modules (HTML, PDF, RTF, XML, MHTML,...)
     CMLL27OC.LLX     OLE-Object
     CMLL27HT.LLX     HTML-Object
     CMLL27PW.LLX     Project Wizard
     CMLL27BC.LLX     2D barcodes (Professional/Enterprise Edition only)
   #CASE(%Language)
   #OF('English')
     CMLL2701.LNG       !English language file
     CMLS2701.LNG
     CMLL2701.LTPL (contains label formats; has to be in the same path of CMLL27.DLL)
     CMLL2701.CHM (Designer help; has to be in the same path of CMLL27.DLL)
   #OF('German')
     CMLL2700.LNG       !German language file
     CMLS2700.LNG
     CMLL2700.LTPL (contains label formats; has to be in the same path of CMLL27.DLL)
     CMLL2700.CHM (Designer help; has to be in the same path of CMLL27.DLL)
   #OF('Chinese')
     CMLL2709.LNG       !Chinese language file
     CMLS2709.LNG
     CMLL2701.LTPL (contains label formats; has to be in the same path of CMLL27.DLL)
     CMLL2701.CHM (Designer help; has to be in the same path of CMLL27.DLL)
   #OF('Dutch')
     CMLL270D.LNG       !Dutch language file
     CMLS270D.LNG
     CMLL2701.LTPL (contains label formats; has to be in the same path of CMLL27.DLL)
     CMLL2701.CHM (Designer help; has to be in the same path of CMLL27.DLL)   
   #OF('French')
     CMLL2712.LNG       !French language file
     CMLS2712.LNG
     CMLL2701.LTPL (contains label formats; has to be in the same path of CMLL27.DLL)
     CMLL2701.CHM (Designer help; has to be in the same path of CMLL27.DLL)
   #OF('Italian')
     CMLL2718.LNG       !Italian language file
     CMLS2718.LNG
     CMLL2701.LTPL (contains label formats; has to be in the same path of CMLL27.DLL)
     CMLL2701.CHM (Designer help; has to be in the same path of CMLL27.DLL)
   #OF('Japanese')
     CMLL2719.LNG       !Japanese language file
     CMLS2719.LNG
     CMLL2701.LTPL (contains label formats; has to be in the same path of CMLL27.DLL)
     CMLL2701.CHM (Designer help; has to be in the same path of CMLL27.DLL)
   #OF('Polish')
     CMLL271E.LNG       !Polish language file
     CMLS271E.LNG
     CMLL2701.LTPL (contains label formats; has to be in the same path of CMLL27.DLL)
     CMLL2701.CHM (Designer help; has to be in the same path of CMLL27.DLL)
   #OF('Portuguese')
     CMLL271F.LNG       !Portuguese language file
     CMLS271F.LNG
     CMLL2701.LTPL (contains label formats; has to be in the same path of CMLL27.DLL)
     CMLL2701.CHM (Designer help; has to be in the same path of CMLL27.DLL)
   #OF('Russian')
     CMLL2721.LNG       !Russian language file
     CMLS2721.LNG
     CMLL2701.LTPL (contains label formats; has to be in the same path of CMLL27.DLL)
     CMLL2701.CHM (Designer help; has to be in the same path of CMLL27.DLL)
   #OF('Slovak')
     CMLL2722.LNG       !Slovak language file
     CMLS2722.LNG
     CMLL2701.LTPL (contains label formats; has to be in the same path of CMLL27.DLL)
     CMLL2701.CHM (Designer help; has to be in the same path of CMLL27.DLL)
   #OF('Spanish')
     CMLL2725.LNG       !Spanish language file
     CMLS2725.LNG
     CMLL2701.LTPL (contains label formats; has to be in the same path of CMLL27.DLL)
     CMLL2701.CHM (Designer help; has to be in the same path of CMLL27.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL27.OCX  This must be registered on your end user's system

  #END
  
  #!***************************************** Version 28 Ship List ****************
  #IF(%LLVersion = 'Version 28')
     combit List & Label files:-
     ---------------------------
     CMLL28.DLL
     CMLL28XL.DLL
     CMLS28.DLL
     CMBR28.DLL
     CMPR28.DLL
     CMUT28.DLL
     CMCT28.DLL
     CMDW28.DLL
     CMMX28.DLL
     CMLL28EX.LLX     Export Modules (HTML, PDF, RTF, XML, MHTML,...)
     CMLL28OC.LLX     OLE-Object
     CMLL28HT.LLX     HTML-Object
     CMLL28PW.LLX     Project Wizard
     CMLL28BC.LLX     2D barcodes (Professional/Enterprise Edition only)
   #CASE(%Language)
   #OF('English')
     CMLL2801.LNG       !English language file
     CMLS2801.LNG
     CMLL2801.LTPL (contains label formats; has to be in the same path of CMLL28.DLL)
     CMLL2801.CHM (Designer help; has to be in the same path of CMLL28.DLL)
   #OF('German')
     CMLL2800.LNG       !German language file
     CMLS2800.LNG
     CMLL2800.LTPL (contains label formats; has to be in the same path of CMLL28.DLL)
     CMLL2800.CHM (Designer help; has to be in the same path of CMLL28.DLL)
   #OF('Chinese')
     CMLL2809.LNG       !Chinese language file
     CMLS2809.LNG
     CMLL2801.LTPL (contains label formats; has to be in the same path of CMLL28.DLL)
     CMLL2801.CHM (Designer help; has to be in the same path of CMLL28.DLL)
   #OF('Dutch')
     CMLL280D.LNG       !Dutch language file
     CMLS280D.LNG
     CMLL2801.LTPL (contains label formats; has to be in the same path of CMLL28.DLL)
     CMLL2801.CHM (Designer help; has to be in the same path of CMLL28.DLL)   
   #OF('French')
     CMLL2812.LNG       !French language file
     CMLS2812.LNG
     CMLL2801.LTPL (contains label formats; has to be in the same path of CMLL28.DLL)
     CMLL2801.CHM (Designer help; has to be in the same path of CMLL28.DLL)
   #OF('Italian')
     CMLL2818.LNG       !Italian language file
     CMLS2818.LNG
     CMLL2801.LTPL (contains label formats; has to be in the same path of CMLL28.DLL)
     CMLL2801.CHM (Designer help; has to be in the same path of CMLL28.DLL)
   #OF('Japanese')
     CMLL2819.LNG       !Japanese language file
     CMLS2819.LNG
     CMLL2801.LTPL (contains label formats; has to be in the same path of CMLL28.DLL)
     CMLL2801.CHM (Designer help; has to be in the same path of CMLL28.DLL)
   #OF('Polish')
     CMLL281E.LNG       !Polish language file
     CMLS281E.LNG
     CMLL2801.LTPL (contains label formats; has to be in the same path of CMLL28.DLL)
     CMLL2801.CHM (Designer help; has to be in the same path of CMLL28.DLL)
   #OF('Portuguese')
     CMLL281F.LNG       !Portuguese language file
     CMLS281F.LNG
     CMLL2801.LTPL (contains label formats; has to be in the same path of CMLL28.DLL)
     CMLL2801.CHM (Designer help; has to be in the same path of CMLL28.DLL)
   #OF('Slovak')
     CMLL2822.LNG       !Slovak language file
     CMLS2822.LNG
     CMLL2801.LTPL (contains label formats; has to be in the same path of CMLL28.DLL)
     CMLL2801.CHM (Designer help; has to be in the same path of CMLL28.DLL)
   #OF('Spanish')
     CMLL2825.LNG       !Spanish language file
     CMLS2825.LNG
     CMLL2801.LTPL (contains label formats; has to be in the same path of CMLL28.DLL)
     CMLL2801.CHM (Designer help; has to be in the same path of CMLL28.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL28.OCX  This must be registered on your end user's system

  #END
  
  
  #!***************************************** Version 29 Ship List ****************
  #IF(%LLVersion = 'Version 29')
     combit List & Label files:-
     ---------------------------
     CMLL29.DLL
     CMLL29XL.DLL
     CMLS29.DLL
     CMBR29.DLL
     CMPR29.DLL
     CMUT29.DLL
     CMCT29.DLL
     CMDW29.DLL
     CMMX29.DLL
     CMLL29EX.LLX     Export Modules (HTML, PDF, RTF, XML, MHTML,...)
     CMLL29OC.LLX     OLE-Object
     CMLL29HT.LLX     HTML-Object
     CMLL29PW.LLX     Project Wizard
     CMLL29BC.LLX     2D barcodes (Professional/Enterprise Edition only)
   #CASE(%Language)
   #OF('English')
     CMLL2901.LNG       !English language file
     CMLS2901.LNG
     CMLL2901.LTPL (contains label formats; has to be in the same path of CMLL29.DLL)
     CMLL2901.CHM (Designer help; has to be in the same path of CMLL29.DLL)
   #OF('German')
     CMLL2900.LNG       !German language file
     CMLS2900.LNG
     CMLL2900.LTPL (contains label formats; has to be in the same path of CMLL29.DLL)
     CMLL2900.CHM (Designer help; has to be in the same path of CMLL29.DLL)
   #OF('Chinese')
     CMLL2909.LNG       !Chinese language file
     CMLS2909.LNG
     CMLL2901.LTPL (contains label formats; has to be in the same path of CMLL29.DLL)
     CMLL2901.CHM (Designer help; has to be in the same path of CMLL29.DLL)
   #OF('Dutch')
     CMLL290D.LNG       !Dutch language file
     CMLS290D.LNG
     CMLL2901.LTPL (contains label formats; has to be in the same path of CMLL29.DLL)
     CMLL2901.CHM (Designer help; has to be in the same path of CMLL29.DLL)   
   #OF('French')
     CMLL2912.LNG       !French language file
     CMLS2912.LNG
     CMLL2901.LTPL (contains label formats; has to be in the same path of CMLL29.DLL)
     CMLL2901.CHM (Designer help; has to be in the same path of CMLL29.DLL)
   #OF('Italian')
     CMLL2918.LNG       !Italian language file
     CMLS2918.LNG
     CMLL2901.LTPL (contains label formats; has to be in the same path of CMLL29.DLL)
     CMLL2901.CHM (Designer help; has to be in the same path of CMLL29.DLL)
   #OF('Japanese')
     CMLL2919.LNG       !Japanese language file
     CMLS2919.LNG
     CMLL2901.LTPL (contains label formats; has to be in the same path of CMLL29.DLL)
     CMLL2901.CHM (Designer help; has to be in the same path of CMLL29.DLL)
   #OF('Portuguese')
     CMLL291F.LNG       !Portuguese language file
     CMLS291F.LNG
     CMLL2901.LTPL (contains label formats; has to be in the same path of CMLL29.DLL)
     CMLL2901.CHM (Designer help; has to be in the same path of CMLL29.DLL)
   #OF('Slovak')
     CMLL2922.LNG       !Slovak language file
     CMLS2922.LNG
     CMLL2901.LTPL (contains label formats; has to be in the same path of CMLL29.DLL)
     CMLL2901.CHM (Designer help; has to be in the same path of CMLL29.DLL)
   #OF('Spanish')
     CMLL2925.LNG       !Spanish language file
     CMLS2925.LNG
     CMLL2901.LTPL (contains label formats; has to be in the same path of CMLL29.DLL)
     CMLL2901.CHM (Designer help; has to be in the same path of CMLL29.DLL)
   #ENDCASE

   If you are using the procedure SolaceLLPreview then you will also need:-
     CMLL29.OCX  This must be registered on your end user's system

  #END

 #ENDIF
#ENDAT


#AT(%AfterGlobalIncludes)
 OMIT('ENDOMIT***',_WIDTH32_)                  !Do not include if 32 bit (i.e. 16 bit only)
   #IF(%LLVersion = 'Version 6')
   INCLUDE('CMBTL6.clw','Equates')
   #ENDIF
 ENDOMIT***
 COMPILE('ENDCOMPILE***',_WIDTH32_)            !Include if 32 bit
   #IF(%LLVersion = 'Version 6')               #!Version 6
   INCLUDE('CM32L6.clw','Equates')             
   #ENDIF
   #IF(%LLVersion = 'Version 7')               #!Version 7
   INCLUDE('CM32L7.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 8')               #!Version 8
   INCLUDE('CM32L8.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 9')               #!Version 9
   INCLUDE('CM32L9.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 10')              #!Version 10
   INCLUDE('CMLL10.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 11')              #!Version 11
   INCLUDE('CMLL11.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 12')              #!Version 12
   INCLUDE('CMLL12.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 13')              #!Version 13
   INCLUDE('CMLL13.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 14')              #!Version 14
   INCLUDE('CMLL14.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 15')              #!Version 15
   INCLUDE('CMLL15.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 16')              #!Version 16
   INCLUDE('CMLL16.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 17')              #!Version 17
   INCLUDE('CMLL17.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 18')              #!Version 18
   INCLUDE('CMLL18.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 19')              #!Version 19
   INCLUDE('CMLL19.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 20')              #!Version 20
   INCLUDE('CMLL20.clw','Equates')
   #ENDIF   
   #IF(%LLVersion = 'Version 21')              #!Version 21
   INCLUDE('CMLL21.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 22')              #!Version 22
   INCLUDE('CMLL22.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 23')              #!Version 23
   INCLUDE('CMLL23.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 24')              #!Version 24
   INCLUDE('CMLL24.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 25')              #!Version 25
   INCLUDE('CMLL25.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 26')              #!Version 26
   INCLUDE('CMLL26.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 27')              #!Version 27
   INCLUDE('CMLL27.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 28')              #!Version 28
   INCLUDE('CMLL28.clw','Equates')
   #ENDIF
   #IF(%LLVersion = 'Version 29')              #!Version 29
   INCLUDE('CMLL29.clw','Equates')
   #ENDIF
   ENDCOMPILE***
 #IF(%LLCreateDir=%True)
LL_SECURITY_ATTRIBUTES GROUP
nLength ULONG
lpSecurityDescriptor ULONG
bInheritHandle SIGNED
END
 #ENDIF
#ENDAT

#AT(%GlobalMap)
 OMIT('ENDOMIT***',_WIDTH32_)                  !Do not include if 32 bit (i.e. 16 bit only)
   #IF(%LLVersion = 'Version 6')               #!Version 6  (No 16 bit in version 7)
   INCLUDE('CMBTL6.CLW','Prototypes')
   #ENDIF
 ENDOMIT***
 COMPILE('ENDCOMPILE***',_WIDTH32_)            !Include if 32 bit
   #IF(%LLVersion = 'Version 6')               #!Version 6
   INCLUDE('CM32L6.clw','Prototypes')
   #ENDIF
   #IF(%LLVersion = 'Version 7')               #!Version 7
   INCLUDE('CM32L7.clw','Prototypes')
   #ENDIF
   #IF(%LLVersion = 'Version 8')               #!Version 8
   INCLUDE('CM32L8.clw','Prototypes')
   #ENDIF
   #IF(%LLVersion = 'Version 9')               #!Version 9
   #IF(%LLUseUnicode=%True)
   INCLUDE('CM3UL9.clw','Prototypes')
   #ELSE
   INCLUDE('CM32L9.clw','Prototypes')
   #ENDIF
   #ENDIF
   #IF(%LLVersion = 'Version 10')               #!Version 10
   #IF(%LLUseUnicode=%True)
   INCLUDE('CULL10.clw','Prototypes')
   #ELSE
   INCLUDE('CMLL10.clw','Prototypes')
   #ENDIF
   #ENDIF
   #IF(%LLVersion = 'Version 11')               #!Version 11
   #IF(%LLUseUnicode=%True)
   INCLUDE('CULL11.clw','Prototypes')
   #ELSE
   INCLUDE('CMLL11.clw','Prototypes')
   #ENDIF
   #ENDIF
   #IF(%LLVersion = 'Version 12')               #!Version 12
   #IF(%LLUseUnicode=%True)
   INCLUDE('CULL12.clw','Prototypes')
   #ELSE
   INCLUDE('CMLL12.clw','Prototypes')
   #ENDIF
   #ENDIF
   #IF(%LLVersion = 'Version 13')               #!Version 13
   #IF(%LLUseUnicode=%True)
   INCLUDE('CULL13.clw','Prototypes')
   #ELSE
   INCLUDE('CMLL13.clw','Prototypes')
   #ENDIF
   #ENDIF
   #IF(%LLVersion = 'Version 14')               #!Version 14
   #IF(%LLUseUnicode=%True)
   INCLUDE('CULL14.clw','Prototypes')
   #ELSE
   INCLUDE('CMLL14.clw','Prototypes')
   #ENDIF
   #ENDIF
   #IF(%LLVersion = 'Version 15')               #!Version 15
   INCLUDE('CMLL15.clw','Prototypes')
   #ENDIF
   #IF(%LLVersion = 'Version 16')               #!Version 16
   INCLUDE('CMLL16.clw','Prototypes')
   #ENDIF
   #IF(%LLVersion = 'Version 17')               #!Version 17
   INCLUDE('CMLL17.clw','Prototypes')
   #ENDIF
   #IF(%LLVersion = 'Version 18')               #!Version 18
   INCLUDE('CMLL18.clw','Prototypes')
   #ENDIF
   #IF(%LLVersion = 'Version 19')               #!Version 19
   INCLUDE('CMLL19.clw','Prototypes')
   #ENDIF   
   #IF(%LLVersion = 'Version 20')               #!Version 20
   INCLUDE('CMLL20.clw','Prototypes')
   #ENDIF 
   #IF(%LLVersion = 'Version 21')               #!Version 21
   INCLUDE('CMLL21.clw','Prototypes')
   #ENDIF    
   #IF(%LLVersion = 'Version 22')               #!Version 22
   INCLUDE('CMLL22.clw','Prototypes')
   #ENDIF    
   #IF(%LLVersion = 'Version 23')               #!Version 23
   INCLUDE('CMLL23.clw','Prototypes')
   #ENDIF    
   #IF(%LLVersion = 'Version 24')               #!Version 24
   INCLUDE('CMLL24.clw','Prototypes')
   #ENDIF    
   #IF(%LLVersion = 'Version 25')               #!Version 25
   INCLUDE('CMLL25.clw','Prototypes')
   #ENDIF    
   #IF(%LLVersion = 'Version 26')               #!Version 26
   INCLUDE('CMLL26.clw','Prototypes')
   #ENDIF    
   #IF(%LLVersion = 'Version 27')               #!Version 27
   INCLUDE('CMLL27.clw','Prototypes')
   #ENDIF    
   #IF(%LLVersion = 'Version 28')               #!Version 28
   INCLUDE('CMLL28.clw','Prototypes')
   #ENDIF    
   #IF(%LLVersion = 'Version 29')               #!Version 29
   INCLUDE('CMLL29.clw','Prototypes')
   #ENDIF    
   ENDCOMPILE***
 #IF(%LLCreateDir=%True)
 MODULE('WINDOWS.DLL')
    LL_CreateDirectoryA(*CSTRING, *LL_SECURITY_ATTRIBUTES), SIGNED, PASCAL, RAW,NAME('CreateDirectoryA')
 END
 #ENDIF
#ENDAT

#AT(%DLLExportList),WHERE(NOT %LLExternal AND %ProgramExtension='DLL')
  TYPE$LLEmailQueue                                         @?
  TCB$LLEmailQueue                                          @?
  $LLEmailQueue                                             @?
  $LLEmailReport             @?
  $LLSubject                 @?
  $LLBody                    @?
  $LLFullMailTo              @?
  $LLFullMailCC              @?
  $LLFullMailBCC             @?
  $LLLicense                 @?
#ENDAT


#AT(%GlobalData)
#DECLARE(%UseFilePath,String)
  #IF(NOT %LLExternal)
LLEMailQueue      QUEUE,PRE(LLQ_),Thread
LLMailTo            CString(225)
LLMailCC            CString(255)
LLMailBCC           CString(255)
                  END
LLEmailReport     Byte,Thread
LLSubject         CString(255),Thread
LLBody            CString(4096),Thread
LLFullMailTo      CString(4096),Thread
LLFullMailCC      CString(4096),Thread
LLFullMailBCC     CString(4096),Thread
LLLicense         CString('%LLPerLicense')
  #ELSE
LLEMailQueue      QUEUE,PRE(LLQ_),external,dll(dll_mode),Thread
LLMailTo            CString(225)
LLMailCC            CString(255)
LLMailBCC           CString(255)
                  END
LLEmailReport     Byte,external,dll(dll_mode),Thread
LLSubject         CString(255),external,dll(dll_mode),Thread
LLBody            CString(4096),external,dll(dll_mode),Thread
LLFullMailTo      CString(4096),external,dll(dll_mode),Thread
LLFullMailCC      CString(4096),external,dll(dll_mode),Thread
LLFullMailBCC     CString(4096),external,dll(dll_mode),Thread
LLLicense         CString('%LLPerLicense'),external,dll(dll_mode)
  #ENDIF

LL_AppWin       LONG,Thread
LL_CompressPreview  Byte,Thread
SOL_Pages           Byte,Thread
#IF(%LLDirectory)
 #IF(Sub(%LLDirectory,1,1) = '!')
  #SET(%UseFilePath,clip(Sub(%LLDirectory,2,254)))
LL_GlobalPath   Like(%UseFilePath),Over(%UseFilePath)
 #ELSE                                                                           
  #SET(%UseFilePath,%LLDirectory)
LL_GlobalPath   CString('%LLDirectory')
 #ENDIF
#ELSE
LL_GlobalPath   CString(255),Thread
#ENDIF

#ENDAT
#AT(%CustomGlobalDeclarations)
 #IF(%LLVersion = 'Version 6')               #!Version 6
   #IF(%Target32)                                #!Add to project if 32bit or 16 bit
     #PROJECT('CM32L6.LIB')
   #ELSE
     #PROJECT('CMBTL6.LIB')                  
   #ENDIF
 #ELSE
   #IF(%Target32)
     #IF(%LLVersion = 'Version 7')           #!Version 7
       #PROJECT('CM32L7.LIB')
     #ENDIF
     #IF(%LLVersion = 'Version 8')           #!Version 8
       #PROJECT('CM32L8.LIB')
     #ENDIF
     #IF(%LLVersion = 'Version 9')           #!Version 9
      #IF(%LLUseUnicode=%True)
       #PROJECT('CM3UL9.LIB')
      #ELSE
       #PROJECT('CM32L9.LIB')
      #ENDIF
     #ENDIF
     #IF(%LLVersion = 'Version 10')          #!Version 10
      #IF(%LLUseUnicode=%True)
       #PROJECT('CULL10.LIB')
      #ELSE
       #PROJECT('CMLL10.LIB')
      #ENDIF
     #ENDIF
     #IF(%LLVersion = 'Version 11')          #!Version 11
      #IF(%LLUseUnicode=%True)
       #PROJECT('CULL11.LIB')
      #ELSE
       #PROJECT('CMLL11.LIB')
      #ENDIF
     #ENDIF
     #IF(%LLVersion = 'Version 12')          #!Version 12
      #IF(%LLUseUnicode=%True)
       #PROJECT('CULL12.LIB')
      #ELSE
       #PROJECT('CMLL12.LIB')
      #ENDIF
     #ENDIF
     #IF(%LLVersion = 'Version 13')          #!Version 13
      #IF(%LLUseUnicode=%True)
       #PROJECT('CULL13.LIB')
      #ELSE
       #PROJECT('CMLL13.LIB')
      #ENDIF
     #ENDIF
     #IF(%LLVersion = 'Version 14')          #!Version 14
      #IF(%LLUseUnicode=%True)
       #PROJECT('CULL14.LIB')
      #ELSE
       #PROJECT('CMLL14.LIB')
      #ENDIF
     #ENDIF
     #IF(%LLVersion = 'Version 15')          #!Version 15
       #PROJECT('CMLL15.LIB')
     #ENDIF
     #IF(%LLVersion = 'Version 16')          #!Version 16
       #PROJECT('CMLL16.LIB')
     #ENDIF
     #IF(%LLVersion = 'Version 17')          #!Version 17
       #PROJECT('CMLL17.LIB')
     #ENDIF
     #IF(%LLVersion = 'Version 18')          #!Version 18
       #PROJECT('CMLL18.LIB')
     #ENDIF
     #IF(%LLVersion = 'Version 19')          #!Version 19
       #PROJECT('CMLL19.LIB')
     #ENDIF
     #IF(%LLVersion = 'Version 20')          #!Version 20
       #PROJECT('CMLL20.LIB')
     #ENDIF
     #IF(%LLVersion = 'Version 21')          #!Version 21
       #PROJECT('CMLL21.LIB')
     #ENDIF
     #IF(%LLVersion = 'Version 22')          #!Version 22
       #PROJECT('CMLL22.LIB')
     #ENDIF
     #IF(%LLVersion = 'Version 23')          #!Version 23
       #PROJECT('CMLL23.LIB')
     #ENDIF
     #IF(%LLVersion = 'Version 24')          #!Version 24
       #PROJECT('CMLL24.LIB')
     #ENDIF
     #IF(%LLVersion = 'Version 25')          #!Version 25
       #PROJECT('CMLL25.LIB')
     #ENDIF
     #IF(%LLVersion = 'Version 26')          #!Version 26
       #PROJECT('CMLL26.LIB')
     #ENDIF
     #IF(%LLVersion = 'Version 27')          #!Version 27
       #PROJECT('CMLL27.LIB')
     #ENDIF
     #IF(%LLVersion = 'Version 28')          #!Version 28
       #PROJECT('CMLL28.LIB')
     #ENDIF
     #IF(%LLVersion = 'Version 29')          #!Version 29
       #PROJECT('CMLL29.LIB')
     #ENDIF
   #ENDIF
 #ENDIF
#ENDAT

#!*****************************************************************************
#!                  Hand Code Entension
#!*****************************************************************************
#EXTENSION(LL_HandCode, 'List and Label Hand Code Extension'),PROCEDURE,Req(LL_GlobalIncludes),hlp('List & Label Hand Code Extension')
 #SHEET,HSCROLL,ADJUST
 #INSERT(%StandardTabs)
 #ENDSHEET

#LocalData
LLExportFilesQ      Queue,Pre(LLExpf)
Filename              CString(255)
                    end
#ENDLOCALDATA


#!  Legacy  #AT(%DataSectionBeforeWindow)
#AT(%LocalDataClassData)
#INSERT(%LLDATA)
#IF(%InvoiceStyle=%TRUE)
LL_InvoiceBreak         LIKE(%BreakField)
#ENDIF
#FOR(%LLOtherBreakFields)
#SET(%LLDeclareLocBreakField,'LL_Break_' & %LLOtherBreakField)
%LLDeclareLocBreakField    Like(%LLOtherBreakField)
#ENDFOR
#ENDAT

#AT(%ProcedureRoutines)
#INSERT(%LLRoutines,'')
#INSERT(%FieldGen,%RepFiles,%TRUE,%True)
#INSERT(%Printing,%False)
#IF(%LLVersion <> 'Version 6')
#INSERT(%ExportFunctions)
#ENDIF
#INSERT(%SendVarsLL,%False)
#INSERT(%ManualVariables)
#INSERT(%Flags)
#INSERT(%LLDefineVars)
#INSERT(%PrintOutToLL)
#ENDAT

#!*************************

#!Legacy   #AT(%ProcedureSetup)
#AT( %WindowManagerMethodCodeSection, 'Init', '(),BYTE'),LAST
#DECLARE(%ReturnVals,String)
#SET(%ReturnVals,'(' & %Params)
#IF(%RunDirect <> 'Use Variable to Determine Default')
 GlobalRequest = SelectRecord                   
 if %RepLayProc%ReturnVals,LL_Action,LL_Report_Name,LL_Report_Title,LL_ReportType,LL_PrinterOptions,LL_OutputFile,LL_OutPutDir) = false then
   #EMBED(%LLCancelSelectLayout,'LL Cancel selecting Layout')
   Post(Event:CloseWindow)
   Return(Level:Fatal)               #<!Legacy
   #!Do ProcedureReturn              #<!Legacy
 else
   LL_Report_Name = Clip(LL_Report_Name)
   LL_NameNoPath = LL_Report_Name
   #EMBED(%LLAfterSelectLayout,'LL After selecting Layout')
   DO LL_InitReport
   if LL_PrinterOptions = true then
     #IF(%LLNonMDI=%False)
     Unlockthread
     #ENDIF
     LL_Result = LLPrintOptionsDialog(LL_hJob,LL_HWind,LL_Report_Title)
     #IF(%LLNonMDI=%False)
     LockThread
     #ENDIF
     if LL_Result <> 0 then
       #EMBED(%LLAfterPrinterOptions,'LL After Displaying printer options')
       LL_Result = llPrintEnd(LL_hJob,0)
       LLJobClose(LL_hJob)
       Post(Event:CloseWindow)
       Return(Level:Fatal)            #<!Legacy
     end
   end
   LL_Result = LlPrintGetOption(LL_hJob,LL_Option_Copies_Supported)
 end
#ELSE
   LLL_:Ref = %PrimaryValue
   #!Legacy
   Access:LL_RepLay.TryFetch(LLL_:RefKey)
   LL_Report_Name = clip(LLL_:FileName)
   LL_Report_Title = LLL_:Description
   Case clip(LLL_:Type)
   of 'Label'
     LL_ReportType = 1
   of 'List'
     LL_ReportType = 2
   of 'Card'
     LL_ReportType = 3
   end
   LL_Action = %PreviewOpt
   #!If %PreviewOpt = 2 then
   #!  LL_Action = 2
   #!else
   #!  LL_Action = 3
   #!end
   LL_PrinterOptions = %PrinterOpt
   SOL_Pages = LLL_:Pages

   #EMBED(%LLAfterSelectLayout,'LL After selecting Layout')
   DO LL_InitReport
   if LL_PrinterOptions = true then
     #IF(%LLNonMDI=%False)
     Unlockthread
     #ENDIF
     LL_Result = LLPrintOptionsDialog(LL_hJob,LL_HWind,LL_Report_Title)
     #IF(%LLNonMDI=%False)
     LockThread
     #ENDIF
     if LL_Result <> 0 then
       #EMBED(%LLAfterPrinterOptions,'LL After Displaying printer options')
       Post(Event:CloseWindow)
       Return(Level:Fatal)           #<!Legacy
     end
   end
   LL_Result = LlPrintGetOption(LL_hJob,LL_Option_Copies_Supported)
#ENDIF
#ENDAT


#!  Legacy  #AT(%ProcessActivity)
#AT( %ProcessManagerMethodCodeSection, 'TakeRecord', '(),BYTE'),PRIORITY(5500)
do PrintOutToLL
   #IF(%ProgressType <> 'Clarion Progress Bar' and %ProgressType <> 'No Progress Window')
#IF(%ProgressTextType='Static Text')
LL_PrintText = '%PrintText'
#ELSE
LL_PrintText = %DynamicText
#ENDIF
LL_Result = LLPrintSetBoxText(LL_hJob, LL_PrintText, Progress:Thermometer)
   #ENDIF
If LL_Result = LL_Err_User_Aborted then
  LL_Abort = true
  Return Level:Fatal                #<!Legacy
end
RETURN ReturnValue
#ENDAT


#!  Legacy   #AT(%AfterOpeningWindow)
#AT(%WindowManagerMethodCodeSection,'Run','(),BYTE'),PRIORITY(1000)
#INSERT(%LLWindowRun)
#ENDAT

#!  Legacy   #AT(%EndOfProcedure)
#AT(%WindowManagerMethodCodeSection,'Kill','(),BYTE'),PRIORITY(1000)
#Insert(%LLKillWindow)
#ENDAT






#!*****************************************************************************
#!                  Report Extension
#!*****************************************************************************
#EXTENSION(LL_Report, 'List and Label Report Extension'),PROCEDURE,Req(LL_GlobalIncludes),hlp('List & Label Report Extension')
 #SHEET,HSCROLL,ADJUST
 #INSERT(%StandardTabs)
 #ENDSHEET

#LocalData
LLExportFilesQ      Queue,Pre(LLExpf)
Filename              CString(255)
                    end
#ENDLOCALDATA

#!  Legacy  #AT(%DeclarationSection)
#AT(%LocalDataClassData)
#INSERT(%LLDATA)
#IF(%InvoiceStyle=%TRUE)
LL_InvoiceBreak         LIKE(%BreakField)
#ENDIF
#FOR(%LLOtherBreakFields)
#SET(%LLDeclareLocBreakField,'LL_Break_' & %LLOtherBreakField)
%LLDeclareLocBreakField    Like(%LLOtherBreakField)
#ENDFOR
#ENDAT



#AT(%ProcedureRoutines)
#INSERT(%LLRoutines,'')
#INSERT(%FieldGen,%RepFiles,%TRUE,%True)
#INSERT(%Printing,%InvoiceStyle)
#IF(%LLVersion <> 'Version 6')
#INSERT(%ExportFunctions)
#ENDIF
#INSERT(%SendVarsLL,%False)
#INSERT(%ManualVariables)
#INSERT(%Flags)
#ENDAT

#!*************************

#!Legacy   #AT(%ProcedureSetup)
#AT( %WindowManagerMethodCodeSection, 'Init', '(),BYTE'),PRIORITY(9500)    #!PRIORITY(7800)
#DECLARE(%ReturnVals,String)
#SET(%ReturnVals,'(' & %Params)
#IF(%RunDirect <> 'Use Variable to Determine Default')
 GlobalRequest = SelectRecord
 if %RepLayProc%ReturnVals,LL_Action,LL_Report_Name,LL_Report_Title,LL_ReportType,LL_PrinterOptions,LL_OutputFile,LL_OutputDir) = false then
   #EMBED(%LLCancelSelectLayout,'LL Cancel selecting Layout')
   Post(Event:CloseWindow)
   Return(Level:Fatal)               #<!Legacy
   #!Do ProcedureReturn              #<!Legacy
 else
   LL_Report_Name = clip(LL_Report_Name)
   #EMBED(%LLAfterSelectLayout,'LL After selecting Layout')
   LL_NameNoPath = LL_Report_Name
   DO LL_InitReport
   if LL_PrinterOptions = true then
     #IF(%LLNonMDI=%False)
     Unlockthread
     #ENDIF
     LL_Result = LLPrintOptionsDialog(LL_hJob,LL_HWind,LL_Report_Title)
     #IF(%LLNonMDI=%False)
     LockThread
     #ENDIF
     if LL_Result <> 0 then
       #EMBED(%LLAfterPrinterOptions,'LL After Displaying printer options')
       LL_Result = llPrintEnd(LL_hJob,0)
       LLJobClose(LL_hJob)
       Post(Event:CloseWindow)
       Return(Level:Fatal)             #<!Legacy
     end
   end
   LL_Result = LlPrintGetOption(LL_hJob,LL_Option_Copies_Supported)
 end
#ELSE
   LLL_:Ref = %PrimaryValue
   #!Legacy
   Access:LL_RepLay.TryFetch(LLL_:RefKey)
   LL_Report_Name = clip(LLL_:FileName)
   LL_NameNoPath = clip(LL_Report_Name)
   LL_Report_Title = LLL_:Description
   Case clip(LLL_:Type)
   of 'Label'
     LL_ReportType = 1
   of 'List'
     LL_ReportType = 2
   of 'Card'
     LL_ReportType = 3
   end
   LL_Action = %PreviewOpt
   #!If %PreviewOpt = 2 then
   #!  LL_Action = 2
   #!else
   #!  LL_Action = 3
   #!end
   LL_PrinterOptions = %PrinterOpt
   SOL_Pages = LLL_:Pages

   #EMBED(%LLAfterSelectLayout,'LL After selecting Layout')
   DO LL_InitReport
   if LL_PrinterOptions = true then
     #IF(%LLNonMDI=%False)
     Unlockthread
     #ENDIF
     LL_Result = LLPrintOptionsDialog(LL_hJob,LL_HWind,LL_Report_Title)
     #IF(%LLNonMDI=%False)
     LockThread
     #ENDIF
     if LL_Result <> 0 then
       #EMBED(%LLAfterPrinterOptions,'LL After Displaying printer options')
       Post(Event:CloseWindow)
       Return(Level:Fatal)               #<!Legacy
     end
   end
   LL_Result = LlPrintGetOption(LL_hJob,LL_Option_Copies_Supported)
#ENDIF
#ENDAT



#!  Legacy  #AT(%AfterOpeningWindow)
#AT( %WindowManagerMethodCodeSection, 'Init', '(),BYTE'),PRIORITY(8030)
#if(%ProgressType <> 'Clarion Progress Bar')
  %Window{Prop:Text} = ''
  %Window{Prop:Height} = 0
  %Window{Prop:Width} = 0
#ENDIF
#ENDAT

#!  Legacy  #AT(%BeforePrint)
#AT( %ProcessManagerMethodCodeSection, 'TakeRecord', '(),BYTE'),PRIORITY(5500)
do PrintOutToLL
#EMBED(%LLRefreshProgress,'Before Refreshing Progress Window')
   #IF(%ProgressType <> 'Clarion Progress Bar' and %ProgressType <> 'No Progress Window')
#IF(%ProgressTextType='Static Text')
LL_PrintText = '%PrintText'
#ELSE
LL_PrintText = %DynamicText
#ENDIF
LL_Result = LLPrintSetBoxText(LL_hJob, LL_PrintText, Progress:Thermometer)
   #ENDIF
If LL_Result = LL_Err_User_Aborted then
  LL_Abort = true
  Return Level:Fatal                                    #<!Legacy
end
#IF(SUB(%CWTemplateVersion,1,2)<>'v2')                  #!Legacy
RETURN ReturnValue
#ELSE       #!  Legacy
#!OMIT('**SolaceLL**')
#! #IF(%ProgressType<>'Clarion Progress Bar')
#! IF LocalResponse = RequestCompleted
#!   ENDPAGE(Report)
#!   CLOSE(ProgressWindow)
#!   FREE(PrintPreviewQueue)
#!   CLOSE(Report)
#!   DO ProcedureReturn
#! end
#! #ENDIF
#ENDIF
#ENDAT

#!  Legacy      all of this bit is legacy only
#AT(%AfterPrint)
#IF(SUB(%CWTemplateVersion,1,2)='v2')                    #!Legacy
**SolaceLL**
#ENDIF
#ENDAT


#!  Legacy   #AT(%AfterOpeningWindow)
#AT(%WindowManagerMethodCodeSection,'Run','(),BYTE'),PRIORITY(1000)
#INSERT(%LLWindowRun)
#ENDAT

#!  Legacy   #AT(%EndOfProcedure)
#AT(%WindowManagerMethodCodeSection,'Kill','(),BYTE'),PRIORITY(1000)
#Insert(%LLKillWindow)
#ENDAT

#AT(%ProcedureRoutines)
#INSERT(%LLDefineVars)
#INSERT(%PrintOutToLL)
#ENDAT


#!*****************************************************************************
#!                  Process Entension
#!*****************************************************************************
#EXTENSION(LL_Process, 'List and Label Process Extension'),PROCEDURE,Req(LL_GlobalIncludes),hlp('List & Label Process Extension')
 #SHEET,HSCROLL,ADJUST
 #INSERT(%StandardTabs)
 #ENDSHEET

#!  Legacy  #AT(%DeclarationSection)
#AT(%LocalDataClassData)
#INSERT(%LLDATA)
#IF(%InvoiceStyle=%TRUE)
LL_InvoiceBreak         LIKE(%BreakField)
#ENDIF
#FOR(%LLOtherBreakFields)
#SET(%LLDeclareLocBreakField,'LL_Break_' & %LLOtherBreakField)
%LLDeclareLocBreakField    Like(%LLOtherBreakField)
#ENDFOR
#ENDAT

#LocalData
LLExportFilesQ      Queue,Pre(LLExpf)
Filename              CString(255)
                    end
#ENDLOCALDATA

#AT(%ProcedureRoutines)
#INSERT(%LLRoutines,'')
#INSERT(%FieldGen,%RepFiles,%TRUE,%True)
#INSERT(%Printing,%InvoiceStyle)
#IF(%LLVersion <> 'Version 6')
#INSERT(%ExportFunctions)
#ENDIF
#INSERT(%SendVarsLL,%False)
#INSERT(%ManualVariables)
#INSERT(%Flags)
#ENDAT

#!*************************
#!Legacy   #AT(%AfterFileOpen)
#AT(%WindowManagerMethodCodeSection, 'Init', '(),BYTE'),PRIORITY(9850)    #!Priority(8010)
#IF(%RunDirect = 'Runtime Selection')
#DECLARE(%ReturnVals,String)
#SET(%ReturnVals,'(' & %Params)
 GlobalRequest = SelectRecord
 if %RepLayProc%ReturnVals,LL_Action,LL_Report_Name,LL_Report_Title,LL_ReportType,LL_PrinterOptions,LL_OutputFile,LL_OutputDir) = false then
   #EMBED(%LLCancelSelectLayout,'LL Cancel selecting Layout')
   Return(Level:Notify)                 
 else
   LL_Report_Name = clip(LL_Report_Name)
   #EMBED(%LLAfterSelectLayout,'LL After selecting Layout')
   LL_NameNoPath = LL_Report_Name
   DO LL_InitReport
   if LL_PrinterOptions = true then
     #IF(%LLNonMDI=%False)
     Unlockthread
     #ENDIF
     LL_Result = LLPrintOptionsDialog(LL_hJob,LL_HWind,LL_Report_Title)
     #IF(%LLNonMDI=%False)
     LockThread
     #ENDIF
     if LL_Result <> 0 then
       #EMBED(%LLAfterPrinterOptions,'LL After Displaying printer options')
       LL_Result = llPrintEnd(LL_hJob,0)
       LLJobClose(LL_hJob)
       Post(Event:CloseWindow)
       Return(Level:Fatal)                     #<!Legacy
     end
   end
   LL_Result = LlPrintGetOption(LL_hJob,LL_Option_Copies_Supported)
 end
#ELSE
  LLL_:Ref = %PrimaryValue
  #!Legacy - needs old get
  Access:LL_Replay.Tryfetch(LLL_:RefKey)
  LL_Report_Name = clip(LLL_:FileName)
  LL_NameNoPath = clip(LL_Report_Name)
  LL_Report_Title = LLL_:Description
  Case clip(LLL_:Type)
  of 'List'
    LL_ReportType = LL_Project_List
  of 'Card'
    LL_ReportType = LL_Project_Card
  of 'Label'
    LL_ReportType = LL_Project_Label
  end
  LL_Action = %PreviewOpt
   #!If %PreviewOpt = 2 then
   #!  LL_Action = 2
   #!else
   #!  LL_Action = 3
   #!end
  LL_PrinterOptions = %PrinterOpt
  SOL_Pages = LLL_:Pages
  DO LL_InitReport
  If LL_PrinterOptions = true then
    #IF(%LLNonMDI=%False)
    Unlockthread
    #ENDIF
    LL_Result = LLPrintOptionsDialog(LL_hJob,LL_HWind,LL_Report_Title)
    #IF(%LLNonMDI=%False)
    LockThread
    #ENDIF
    if LL_Result <> 0 then
       #EMBED(%LLAfterPrinterOptions,'LL After Displaying printer options')
       Post(Event:CloseWindow)
       Return(Level:Fatal)                           #<!Legacy
     end
  end
  LL_Result = LlPrintGetOption(LL_hJob,LL_Option_Copies_Supported)
#ENDIF
#ENDAT


#!Legacy   #AT(%AfterOpeningWindow)
#AT( %WindowManagerMethodCodeSection, 'Init', '(),BYTE'),PRIORITY(8030)
#if(%ProgressType <> 'Clarion Progress Bar')
  %Window{Prop:Text} = ''
  %Window{Prop:Height} = 0
  %Window{Prop:Width} = 0
#ENDIF
#ENDAT

#!Legacy   #AT(%ProcessActivity)
#AT(%ProcessManagerMethodCodeSection,'TakeRecord','(),BYTE'),PRIORITY(5600)
do PrintOutToLL
   #IF(%ProgressType <> 'Clarion Progress Bar' and %ProgressType <> 'No Progress Window')
#IF(%ProgressTextType='Static Text')
LL_PrintText = '%PrintText'
#ELSE
LL_PrintText = %DynamicText
#ENDIF
#! Legacy = PercentProgress
LL_Result = LLPrintSetBoxText(LL_hJob, LL_PrintText, ThisProcess.Percentile)            
   #ENDIF
If LL_Result = LL_Err_User_Aborted then
  LL_Abort = true
  Return Level:Fatal                                     #<!Legacy
end
#ENDAT


#!Legacy   #AT(%AfterOpeningWindow)
#AT(%WindowManagerMethodCodeSection,'Run','(),BYTE'),PRIORITY(1000)
#INSERT(%LLWindowRun)
#ENDAT


#!Legacy   #AT(%EndOfProcedure),Where(SUB(%CWTemplateVersion,1,2)='v2')             !Legacy
#AT(%WindowManagerMethodCodeSection,'Kill','(),BYTE'),PRIORITY(1000)
#Insert(%LLKillWindow)
#ENDAT

#AT(%ProcedureRoutines)
#INSERT(%LLDefineVars)
#INSERT(%PrintOutToLL)
#ENDAT

#!*****************************************************************************
#!                  Browse List Extension
#!*****************************************************************************
#!Legacy                Need to change the REQ(BrowseBox(ABC)) at end of next line
#CONTROL(LL_PrintButton,'List and Label Print button to call layout selection or print from View'),MULTI,WINDOW,Req(LL_GlobalIncludes),hlp('List & Label Print Button'),REQ(BrowseBox(ABC))
 #BUTTON('List && Label Print Browse Options'),at(10,,175,15)
 #PROMPT('Print View, Queue or Call a procedure?',OPTION),%ViewProcedure
 #PROMPT('Print View',RADIO)
 #PROMPT('Call Procedure',RADIO)
 #ENABLE(%ViewProcedure='Call Procedure'),CLEAR
  #PROMPT('Procedure to Call: ',PROCEDURE),%CallProc,REQ                     #!Prompt for procedure name
 #ENDENABLE
 #SHEET,HSCROLL,ADJUST
  #TAB('General'),WHERE(%ActiveTemplateParentInstance=0 and %ViewProcedure = 'Print View')                   #!For backward compatibility
   #BOXED('')
    #DISPLAY('This tab is for backward compatibility only.  If you can see this tab, the extension template is not properly linked to a parent browse template.  Ideally, delete this template and add it back, at which time it will ask you for the parent browse to attach it to.'),at(,,175,45)
    #DISPLAY('As the template is not attached to a browse, you will need to call any validate or filtering methods yourself.  This is done automatically when the template is attached to a browse'),at(,,175,35)
    #DISPLAY('Once this tab is property attached to a browse, this tab will disappear'),at(,,175,17)
    #PROMPT('View to Print: ',@S30),%PrintView                                  #!Prompt for view name
    #DISPLAY('')
   #ENDBOXED
  #ENDTAB
  #INSERT(%StandardTabs)
 #ENDSHEET
 #ENDBUTTON
 #DISPLAY('')
 CONTROLS
  BUTTON('Print'),AT(,,64,14),USE(?LL_PrintBtn),#ORIG(?LL_PrintBtn)
 END

#ATSTART
 #DECLARE(%PrintControlButton)
 #FOR(%Control), WHERE(%ControlInstance = %ActiveTemplateInstance)
  #SET(%PrintControlButton, %Control)
 #ENDFOR
#ENDAT

#LocalData
LLExportFilesQ      Queue,Pre(LLExpf)
Filename              CString(255)
                    end
#ENDLOCALDATA

#!   Legacy #AT(%DataSectionBeforeWindow)
#AT(%LocalDataClassData)
#INSERT(%LLDATA)
#IF(%InvoiceStyle=%TRUE)
LL_InvoiceBreak         LIKE(%BreakField)
#ENDIF
#FOR(%LLOtherBreakFields)
#SET(%LLDeclareLocBreakField,'LL_Break_' & %LLOtherBreakField)
%LLDeclareLocBreakField    Like(%LLOtherBreakField)
#ENDFOR
LL_ViewPercentage       Long
LL_TotalRecordsInView   Long
LL_RecordPrinted        Long
#ENDAT



#AT(%ProcedureRoutines)
#!********************* Start Print from view only ***********
#IF(%ViewProcedure <> 'Call Procedure')
#INSERT(%LLRoutines,'')
#INSERT(%Printing,%False)
#IF(%LLVersion <> 'Version 6')
#INSERT(%ExportFunctions)
#ENDIF
#INSERT(%SendVarsLL,%false)
#INSERT(%FieldGen,%RepFiles,%True,%TRUE)
#INSERT(%ManualVariables)
#INSERT(%Flags)
#INSERT(%LLDefineVars)
#INSERT(%PrintOutToLL)
#ENDIF
#!********************* End Print from view only ***********
#ENDAT

#!   Legacy  (Is same)
#AT( %ControlEventHandling, %PrintControlButton, 'Accepted'),PRIORITY(4499)
#IF(%ViewProcedure <> 'Call Procedure')
#DECLARE(%ReturnVals,String)
#DECLARE(%VaribleQty,String)
#DECLARE(%TotalToPrint)
#DECLARE(%IsQtyVariable)
#IF(%ActiveTemplateParentInstance=0)
#DECLARE(%ManagerName)
#ENDIF


#SET(%ReturnVals,'(' & %Params)
#IF(%RunDirect <> 'Use Variable to Determine Default')
 GlobalRequest = SelectRecord                   
 if %RepLayProc%ReturnVals,LL_Action,LL_Report_Name,LL_Report_Title,LL_ReportType,LL_PrinterOptions,LL_OutputFile,LL_OutPutDir) = false then
   #EMBED(%LLCancelSelectLayout,'LL Cancel selecting Layout')
   cycle
   #!Do ProcedureReturn              !Legacy
 else
   LL_Report_Name = clip(LL_Report_Name)
   LL_NameNoPath = LL_Report_Name
   #EMBED(%LLAfterSelectLayout,'LL After selecting Layout')
   DO LL_InitReport
   if LL_PrinterOptions = true then
     #IF(%LLNonMDI=%False)
     Unlockthread
     #ENDIF
     LL_Result = LLPrintOptionsDialog(LL_hJob,LL_HWind,LL_Report_Title)
     #IF(%LLNonMDI=%False)
     LockThread
     #ENDIF
     if LL_Result <> 0 then
       #EMBED(%LLAfterPrinterOptions,'LL After Displaying printer options')
       LL_Result = llPrintEnd(LL_hJob,0)
       LLJobClose(LL_hJob)
       Post(Event:CloseWindow)
       Return(Level:Fatal)                             #<!Legacy
     end
   end
   LL_Result = LlPrintGetOption(LL_hJob,LL_Option_Copies_Supported)
 end
#ELSE
   LLL_:Ref = %PrimaryValue
   #!Legacy
   Access:LL_RepLay.TryFetch(LLL_:RefKey)
   LL_Report_Name = clip(LLL_:FileName)
   LL_Report_Title = LLL_:Description
   Case clip(LLL_:Type)
   of 'Label'
     LL_ReportType = 1
   of 'List'
     LL_ReportType = 2
   of 'Card'
     LL_ReportType = 3
   end
   LL_Action = %PreviewOpt
   #!If %PreviewOpt = 2 then
   #!  LL_Action = 2
   #!else
   #!  LL_Action = 3
   #!end
   LL_PrinterOptions = %PrinterOpt
   SOL_Pages = LLL_:Pages

   #EMBED(%LLAfterSelectLayout,'LL After selecting Layout')
   DO LL_InitReport
   if LL_PrinterOptions = true then
     #IF(%LLNonMDI=%False)
     Unlockthread
     #ENDIF
     LL_Result = LLPrintOptionsDialog(LL_hJob,LL_HWind,LL_Report_Title)
     #IF(%LLNonMDI=%False)
     LockThread
     #ENDIF
     if LL_Result <> 0 then
       #EMBED(%LLAfterPrinterOptions,'LL After Displaying printer options')
       Post(Event:CloseWindow)
       Return(Level:Fatal)                        #<!Legacy
     end
   end
   #EMBED(%LLAfterInit,'LL After Initialisation BLA')
   LL_Result = LlPrintGetOption(LL_hJob,LL_Option_Copies_Supported)
#ENDIF
#IF(%ViewProcedure='Print View')
  Setcursor(Cursor:Wait)
 #IF(%ActiveTemplateParentInstance>0)
   #Set(%PrintView,%ManagerName & '::View:Browse')
 #ENDIF
 #IF(Sub(%ApproxToPrint,1,1) ='!')
  #SET(%IsQtyVariable,%True)
 #ELSE
  #SET(%IsQtyVariable,%False)
 #ENDIF
 #IF(%IsQtyVariable=%False and %ApproxToPrint=0)
  #INSERT(%FindQtyToPrint)
 #END
 #IF(%IsQtyVariable = %True)
  #SET(%VaribleQty,Sub(%ApproxToPrint,2,Len(%ApproxToPrint)-1))
  LL_TotalRecordsInView = %VaribleQty
 #ENDIF
 #IF(%IsQtyVariable=%False and %ApproxToPrint>0)
  LL_TotalRecordsInView = %ApproxToPrint
 #END
 #EMBED(%LLAfterSetView,'L&L After Set View')
  #EMBED(%LLAfterCalcTotRecords,'L&L After Setting LL_TotalRecordsInView')
  Set(%PrintView)
  LL_RecordPrinted = 0
  Loop
    Next(%PrintView)
    If error() then
      Break
    end
    #IF(%ActiveTemplateParentInstance>0)
    If %ManagerName.ValidateRecord() = Record:Filtered then
      cycle
    end
    #ENDIF
    #EMBED(%LLBeforeSendintoToPrint,'Before Sending Print to List & Label')
    do PrintoutToLL
    #EMBED(%LLAfterPrint,'After Sending Print to List & Label')
    #IF(%ProgressType <> 'Clarion Progress Bar' and %ProgressType <> 'No Progress Window')
    LL_RecordPrinted += 1
    #EMBED(%LLFreshProgress,'Before Refresh Progress Window')
    LL_ViewPercentage = (LL_RecordPrinted / LL_TotalRecordsInView) * 100
    #IF(%ProgressTextType='Static Text')
    LL_PrintText = '%PrintText'
    #ELSE
    LL_PrintText = %DynamicText
    #ENDIF
    LL_Result = LLPrintSetBoxText(LL_hJob, LL_PrintText, LL_ViewPercentage)
    #ENDIF
  end
  Setcursor(Cursor:Arrow)
#ENDIF
 #EMBED(%LLBeforeReportEnd,'LL Before Report End BLA')

  CASE LL_ReportType
  OF LL_Project_List
    LL_Result = llPrintFieldsEnd(LL_hJob)
  END

  LL_Result = llPrintEnd(LL_hJob,0)
  LL_SavePath = LongPath()
  IF LL_Action = 2 and LL_RecordPrinted > 0 and LL_Abort = false              !Preview
    #EMBED(%LLBeforePreviewDisplay,'LL Before Preview Call')
    #IF(%NotUseLLPreviewer = %True)
      %LLPreviewProcedure(Clip(LL_Path) & clip(LL_NameNoPath) & '.ll')
    #ELSE
#INSERT(%PreviewOptions)
    #IF(%LLNonMDI=%False)
    UNLOCKTHREAD
    #ENDIF
    LL_Report_Name = clip(LL_Report_Name)
    #IF(%UseClarioNet=%False)
    LL_Result = llPreviewDisplay(LL_hJob,LL_Report_Name,LL_Path,LL_hWind)
    #else
#INSERT(%ClarioNetPreview)
    #ENDIF
    #IF(%LLNonMDI=%False)
    LOCKTHREAD
    #ENDIF
    #ENDIF
    LL_Report_Name = clip(LL_Report_Name)
    LL_Result = llPreviewDeleteFiles(LL_hJob,LL_Report_Name,LL_Path)
  #EMBED(%AfterDeletePreviewFiles,'LL After deleting preview files')
  END
  #EMBED(%BeforeCloseLLJob,'LL Before Closing LL Print job')
  #INSERT(%PopulateExportedFiles)
  LLJobClose(LL_hJob)
  SetPath(LL_SavePath)
#ELSE         
  %CallProc                                                                     
#ENDIF
#ENDAT

#!*****************************************************************************
#!                  Print Queue Extension
#!*****************************************************************************
#!Legacy                Need to change the REQ(BrowseBox(ABC)) at end of next line
#CONTROL(LL_PrintQueueButton,'List and Label Print Queue button - print from Queue'),MULTI,WINDOW,Req(LL_GlobalIncludes),hlp('List & Label Print Button')
 #BUTTON('List && Label Print from Queue Options'),at(10,,175,15)
 #PROMPT('Name of Queue: ',Field),%LLPrintQueue,REQ                           #!Prompt for Queue name
 #SHEET,HSCROLL,ADJUST
  #INSERT(%StandardTabs)
 #ENDSHEET
 #ENDBUTTON
 #DISPLAY('')
 CONTROLS
  BUTTON('Print'),AT(,,64,14),USE(?LL_PrintBtn),#ORIG(?LL_PrintBtn)
 END

#ATSTART
 #DECLARE(%PrintControlButton)
 #FOR(%Control), WHERE(%ControlInstance = %ActiveTemplateInstance)
  #SET(%PrintControlButton, %Control)
 #ENDFOR
#ENDAT

#LocalData
LLExportFilesQ      Queue,Pre(LLExpf)
Filename              CString(255)
                    end
#ENDLOCALDATA

#!   Legacy #AT(%DataSectionBeforeWindow)
#AT(%LocalDataClassData)
#INSERT(%LLDATA)
#IF(%InvoiceStyle=%TRUE)
LL_InvoiceBreak         LIKE(%BreakField)
#ENDIF
#FOR(%LLOtherBreakFields)
#SET(%LLDeclareLocBreakField,'LL_Break_' & %LLOtherBreakField)
%LLDeclareLocBreakField    Like(%LLOtherBreakField)
#ENDFOR
LL_ViewPercentage       Long
LL_TotalRecordsInView   Long
LL_RecordPrinted        Long
#ENDAT



#AT(%ProcedureRoutines)
#!********************* Start Print from view only ***********
#INSERT(%LLRoutines,'')
#INSERT(%Printing,%False)
#IF(%LLVersion <> 'Version 6')
#INSERT(%ExportFunctions)
#ENDIF
#INSERT(%SendVarsLL,%false)
#INSERT(%FieldGen,%RepFiles,%True,%TRUE)
#INSERT(%ManualVariables)
#INSERT(%Flags)
#INSERT(%LLDefineVars)
#INSERT(%PrintOutToLL)
#!********************* End Print from view only ***********
#ENDAT

#!   Legacy  (Is same)
#AT( %ControlEventHandling, %PrintControlButton, 'Accepted'),PRIORITY(4499)
#DECLARE(%ReturnVals,String)
#DECLARE(%VaribleQty,String)
#DECLARE(%TotalToPrint)
#DECLARE(%IsQtyVariable)



#SET(%ReturnVals,'(' & %Params)
#IF(%RunDirect <> 'Use Variable to Determine Default')
 GlobalRequest = SelectRecord                   
 if %RepLayProc%ReturnVals,LL_Action,LL_Report_Name,LL_Report_Title,LL_ReportType,LL_PrinterOptions,LL_OutputFile,LL_OutPutDir) = false then
   #EMBED(%LLCancelSelectLayout,'LL Cancel selecting Layout')
   cycle
   #!Do ProcedureReturn              !Legacy
 else
   LL_Report_Name = clip(LL_Report_Name)
   LL_NameNoPath = LL_Report_Name
   #EMBED(%LLAfterSelectLayout,'LL After selecting Layout')
   DO LL_InitReport
   if LL_PrinterOptions = true then
     #IF(%LLNonMDI=%False)
     Unlockthread
     #ENDIF
     LL_Result = LLPrintOptionsDialog(LL_hJob,LL_HWind,LL_Report_Title)
     #IF(%LLNonMDI=%False)
     LockThread
     #ENDIF
     if LL_Result <> 0 then
       #EMBED(%LLAfterPrinterOptions,'LL After Displaying printer options')
       LL_Result = llPrintEnd(LL_hJob,0)
       LLJobClose(LL_hJob)
       Post(Event:CloseWindow)
       Return(Level:Fatal)                        #<!Legacy
     end
   end
   LL_Result = LlPrintGetOption(LL_hJob,LL_Option_Copies_Supported)
 end
#ELSE
   LLL_:Ref = %PrimaryValue
   #!Legacy
   Access:LL_RepLay.TryFetch(LLL_:RefKey)
   LL_Report_Name = clip(LLL_:FileName)
   LL_Report_Title = LLL_:Description
   Case clip(LLL_:Type)
   of 'Label'
     LL_ReportType = 1
   of 'List'
     LL_ReportType = 2
   of 'Card'
     LL_ReportType = 3
   end
   LL_Action = %PreviewOpt
   #!If %PreviewOpt = 2 then
   #!  LL_Action = 2
   #!else
   #!  LL_Action = 3
   #!end
   LL_PrinterOptions = %PrinterOpt
   SOL_Pages = LLL_:Pages

   #EMBED(%LLAfterSelectLayout,'LL After selecting Layout')
   DO LL_InitReport
   if LL_PrinterOptions = true then
     #IF(%LLNonMDI=%False)
     Unlockthread
     #ENDIF
     LL_Result = LLPrintOptionsDialog(LL_hJob,LL_HWind,LL_Report_Title)
     #IF(%LLNonMDI=%False)
     LockThread
     #ENDIF
     if LL_Result <> 0 then
       #EMBED(%LLAfterPrinterOptions,'LL After Displaying printer options')
       Post(Event:CloseWindow)
       Return(Level:Fatal)                       #<!Legacy
     end
   end
   LL_Result = LlPrintGetOption(LL_hJob,LL_Option_Copies_Supported)
#ENDIF

  Setcursor(Cursor:Wait)
  LL_RecordPrinted = 0
  LL_TotalRecordsInView = Records(%LLPrintQueue)
  Loop LLPrintQueuePointer# = 1 to Records(%LLPrintQueue)
    Get(%LLPrintQueue,LLPrintQueuePointer#)
    #EMBED(%InLLPrintAfterGettingQueue,'LL Print Queue, After retrieving Queue record')
    do PrintoutToLL
    #EMBED(%InLLPrintAfterPrintingQueue,'LL Print Queue, After Printing Queue record')
    #IF(%ProgressType <> 'Clarion Progress Bar' and %ProgressType <> 'No Progress Window')
    LL_RecordPrinted += 1
    #EMBED(%LLFreshProgress,'Before Refresh Progress Window')
    LL_ViewPercentage = (LL_RecordPrinted / LL_TotalRecordsInView) * 100
    #IF(%ProgressTextType='Static Text')
    LL_PrintText = '%PrintText'
    #ELSE
    LL_PrintText = %DynamicText
    #ENDIF
    LL_Result = LLPrintSetBoxText(LL_hJob, LL_PrintText, LL_ViewPercentage)
    #ENDIF
  end
  Setcursor(Cursor:Arrow)



  CASE LL_ReportType
  OF LL_Project_List
    LL_Result = llPrintFieldsEnd(LL_hJob)
  END

  LL_Result = llPrintEnd(LL_hJob,0)
  LL_SavePath = LongPath()
  IF LL_Action = 2 and LL_RecordPrinted > 0 and LL_Abort = false              !Preview
    #EMBED(%LLBeforePreviewDisplay,'LL Before Preview Call')
    #IF(%NotUseLLPreviewer = %True)
      %LLPreviewProcedure(Clip(LL_Path) & clip(LL_NameNoPath) & '.ll')
    #ELSE
#INSERT(%PreviewOptions)
    #IF(%LLNonMDI=%False)
    UNLOCKTHREAD
    #ENDIF
    LL_Report_Name = clip(LL_Report_Name)
    LL_Result = llPreviewDisplay(LL_hJob,LL_Report_Name,LL_Path,LL_hWind)
    #IF(%LLNonMDI=%False)
    LOCKTHREAD
    #ENDIF
    #ENDIF
    LL_Report_Name = clip(LL_Report_Name)
    LL_Result = llPreviewDeleteFiles(LL_hJob,LL_Report_Name,LL_Path)
  #EMBED(%AfterDeletePreviewFiles,'LL After deleting preview files')
  END
  #EMBED(%BeforeCloseLLJob,'LL Before Closing LL Print job')
  #INSERT(%PopulateExportedFiles)
  LLJobClose(LL_hJob)
  SetPath(LL_SavePath)

#ENDAT


#!*****************************************************************************
#!                  Report Layout Manager Extension
#!*****************************************************************************
#CONTROL(LL_LayoutManager,'Layout Manager button to call end user designer'),MULTI,WINDOW,Req(LL_GlobalIncludes),hlp('Layout Manager Button')
 #BUTTON('List && Label Options'),at(,,175,15)
 #SHEET,HSCROLL,ADJUST
  #TAB('&Files')
   #DISPLAY('')
   #BOXED('NOTE:-')
    #DISPLAY('Add NO_LL=1 to User Option for each field in Dictionary')
    #DISPLAY('which is not to be sent to List and Label.')
   #ENDBOXED
   #BOXED('')
   #PROMPT('Send Demo Data',CHECK),%DemoData,at(10),Default(%True)
   #PROMPT('Allow User to Modify/Delete Factory Default Layouts',Check),%ModifyFactory,at(10),Default(%true)
   #ENABLE(%ModifyFactory=%False)
   #DISPLAY('Message if user trys to change Factory default.'),at(10)
   #DISPLAY('(Text must be enclosed in quotes)'),at(10)
   #PROMPT('Message',@s255),%FactoryMessage,at(60,,120),Default('''You may not alter or delete factory default layouts'''),Req
   #ENDENABLE
   #ENDBOXED
   #BOXED('Conditional Report fields')
    #PROMPT('Conditional Use of Files?',Check),%CondUse,at(10),Default(%true)
    #BOXED(''),where(%CondUse=1)
     #PROMPT('Generate a STOP(Error()) if expression is invalid',CHECK),%StopEval,DEFAULT('1'),at(10)
     #DISPLAY('')
     #BUTTON('Files to &Conditionally Send to List && Label'),MULTI(%RepFiles,%Condition & ' - ' & %RepNote),Inline
      #DISPLAY('Enter the condition that you wish to evaluate.')
      #DISPLAY('Normally this condition will be the value of the field')
      #DISPLAY('LLL_:AreaRef')
      #DISPLAY('')
      #DISPLAY('e.g.   LLL_:AreaRef = 3     !Only include this field')
      #DISPLAY('                                          !when the area is 3')
      #DISPLAY('')
      #PROMPT('Condition: ',@S255),%Condition,REQ,at(50,,140)
      #DISPLAY()
      #DISPLAY('You may enter a note to remind you what this condition is for! This note does not serve any other purpose than a reminder.'),At(10,,170,25)
      #PROMPT('Note:',@s20),%RepNote,at(50,,140)
      #DISPLAY('')
      #DISPLAY('Then select the files that may be used with that condition')
      #BUTTON('Files to include'),MULTI(%FileCond,%RepFileName & '  -  ' & %RepUsage),REQ,INLINE
      #PROMPT('FIle:',File),%RepFileName,REQ
      #PROMPT('Usage:',DROP('Variables|Fields|Both')),%RepUsage,Default('Both')
      #ENDBUTTON
     #ENDBUTTON
    #ENDBOXED
    #BOXED(''),where(%CondUse=0)
     #DISPLAY('All files in your OTHER FILES section of the File')
     #DISPLAY('Schematic will be sent to List && Label')
     #DISPLAY()
     #DISPLAY('By default, the two control files LL_Replay and LL_RepArea are not made available to users for reporting. You may however, override this'),At(10,,160,30)
     #PROMPT('Make file LL_Replay available',Check),%LLSendReplay,at(10)
     #PROMPT('Make file LL_RepArea available',Check),%LLSendRepArea,at(10)
    #ENDBOXED
   #ENDBOXED
   #ENDTAB
   #TAB('Related Files'),Where(%LLVersion='Version 11' or %LLVersion='Version 12' or %LLVersion='Version 13' or %LLVersion = 'Version 14' or %LLVersion = 'Version 15' or %LLVersion = 'Version 16' or %LLVersion = 'Version 17' or %LLVersion = 'Version 18' or %LLVersion = 'Version 19' or %LLVersion = 'Version 20' or %LLVersion = 'Version 21' or %LLVersion = 'Version 22' or %LLVersion = 'Version 23' or %LLVersion = 'Version 24' or %LLVersion = 'Version 25' or %LLVersion = 'Version 26' or %LLVersion = 'Version 27' or %LLVersion = 'Version 28' or %LLVersion = 'Version 29')
     #BUTTON('Related Files'),MULTI(%AllRelatedFiles,%LLRelateParent & ' <->> ' & %LLRelateChild),Inline
       #PROMPT('Parent File:',File),%LLRelateParent,REQ
       #PROMPT('Child File:',File),%LLRelateChild,REQ
       #PROMPT('Name of Relationship:',@s40),%LLRelateName,REQ
     #ENDBUTTON
   #ENDTAB
   #TAB('Define Manual Fields')
    #DISPLAY('')
    #DISPLAY('')
    #DISPLAY('In this section you may define a variable which you wish to include in List && Label.  These fields may be functions such as Today() or Clock() or any valid Clarion expression')
    #DISPLAY('')
    #BUTTON('Manual &fields'),MULTI(%RepManFields,%RepManFieldName & ' (' & %RepManFieldType & ') - ' & %RepManFileField),Inline
     #PROMPT('Field &name:',@S60),%RepManFieldName,REQ
     #PROMPT('Field &type:',DROP('String|Numeric|Boolean|Date|TIME|RTF|HTML|Drawing|Barcode')),%RepManFieldType
     #PROMPT('&Expression/Field:',EXPR),%RepManFileField
     #PROMPT('Field &format:',@S60),%RepManFieldFormat
     #DISPLAY('')
     #DISPLAY('You may also add a condition under which the manual fields will be available to your end user in the designer.')
     #DISPLAY('Normally this condition will be the value of the field')
     #DISPLAY('LLL_:AreaRef')
     #DISPLAY('')
     #DISPLAY('e.g.   LLL_:AreaRef = 3     !Only include this field')
     #DISPLAY('                                          !when the area is 3')
     #DISPLAY('')
     #PROMPT('Condition (Opt): ',@S255),%ManCondition
    #ENDBUTTON
   #ENDTAB
   #TAB('Binding Fields')
    #DISPLAY('')
    #DISPLAY('')
    #DISPLAY('Any fields that are used in Clarion expressions must be BINDed.  You can do this yourself in the embedded')
    #DISPLAY('code or add the fields here')
    #DISPLAY('')
    #BUTTON('Fields/Procs to BIND'),MULTI(%Binds,%Binder),Inline
     #DISPLAY('')
     #PROMPT('Fields/Procs to BIND',@s30),%Binder,REQ
    #ENDBUTTON
   #ENDTAB
  #TAB('Error Message')
   #DISPLAY('')
   #DISPLAY('')
   #PROMPT('Process Errors from List && Label on open ',CHECK),%OpenError,at(10)
   #ENABLE(%OpenError = %True),CLEAR
    #DISPLAY('')
    #PROMPT('Processing the List && Label error',OPTION),%ProcessError
    #PROMPT('Call a procedure ',RADIO)
    #PROMPT('Display message',RADIO)
    #DISPLAY('')
    #DISPLAY('Please note:-  The local variable LL_Result holds any')
    #DISPLAY('error codes generated by List && Label')
    #DISPLAY('')
    #ENABLE(%ProcessError = 'Call a procedure'),CLEAR
     #PROMPT('Procedure to call:',PROCEDURE),%ErrorProc,REQ
     #PROMPT('Parameters:',@S80),%ErrorParams
    #ENDENABLE
    #DISPLAY('')
    #ENABLE(%ProcessError = 'Display message')
    #DISPLAY('Please remember to enclose text in quotes')
    #PROMPT('Text for Error: ',@S255),%ErrorText,REQ,Default('LL_Result'),at(60,,125)
    #ENDENABLE
   #ENDENABLE
  #ENDTAB
  #TAB('Options')
   #DISPLAY('')
   #DISPLAY('The function in brackets refers to the List && Label')
   #DISPLAY('function call that the option is a parameter of.')
   #DISPLAY('')
   #BOXED('General')
    #PROMPT('Support Text Page Breaks (LlSetOption)',CHECK),%SupportTextPageBreak,Default(%DefSupportTextPageBreak),at(10)
    #PROMPT('Case Sensitive Variables (LlSetOption)',CHECK),%CaseSensitiveVars,Default(%DefCaseSensitiveVars),at(10)
    #PROMPT('Multiple Table lines (LlSetOption)',CHECK),%MultiTableLines,Default(%DefMultiTableLines),at(10)
    #PROMPT('Sort Variables (LlSetOption)',CHECK),%SortVars,Default(%DefSortVars),at(10)
    #PROMPT('Convert CF/LF to LF (LlSetOption)',CHECK),%ConvertCRLF,Default(%DefConvertCRLF),at(10)
    #PROMPT('List && Label Help Available (LlSetOption)',CHECK),%LLHelpAvailable,Default(%DefLLHelpAvailable),at(10)
    #PROMPT('No Parameter Checking (LlSetOption)',CHECK),%NoParamCheck,Default(%DefNoParamCheck),at(10)
    #PROMPT('No Table Checking (LlSetOption)',CHECK),%NoTableCheck,Default(%DefNoTableCheck),at(10)
    #PROMPT('Space Optimization (LlSetOption)',CHECK),%SpaceOptimize,Default(%DefSpaceOptimize),at(10)
    #PROMPT('Delay Table Header (LlSetOption)',CHECK),%DelayTableHead,Default(%DefDelayTableHead),at(10)
    #PROMPT('Supervisor Option (LlSetOption)',CHECK),%Supervisor,Default(%DefSupervisor),at(10)
    #PROMPT('Combine Collection of Data for Collection Controls (LlSetOption)',CHECK),%CombineCollection,Default(%DefCombineCollection),at(10)
   #ENDBOXED
   #BOXED('Menu Options')
    #PROMPT('Remove "New" option (LlDesignerProhibitAction)',CHECK),%DesignNew,Default(%True),at(10)
    #PROMPT('Remove "Open" option (LlDesignerProhibitAction)',CHECK),%DesignOpen,Default(%True),at(10)
    #PROMPT('Remove "Save As" option (LlDesignerProhibitAction)',CHECK),%DesignSaveAs,Default(%True),at(10)
    #PROMPT('Remove Recent files list (LlDesignerProhibitAction)',CHECK),%DesignRecentFiles,Default(%True),at(10)
    #PROMPT('Do not allow maximize (LlDesignerProhibitAction)',CHECK),%DesignMax,Default(%True),at(10)
    #PROMPT('Do not allow minimize (LlDesignerProhibitAction)',CHECK),%DesignMin,Default(%True),at(10)
   #ENDBOXED
   #BOXED('Debug')
    #PROMPT('List && Label Debug (LlSetDebug)',CHECK),%Debugmode,AT(10)
   #ENDBOXED
  #ENDTAB
  #ENDSHEET
 #ENDBUTTON
 CONTROLS
   BUTTON('Layout Designer'),AT(,,64,14),USE(?LL_LayoutBtn),#ORIG(?LL_LayoutBtn)
 END



#!   Legacy #AT(%DataSectionBeforeWindow)
#AT(%LocalDataClassData)
#DECLARE(%SupressChild,Long)
#INSERT(%LLDATA)
SavePath        String(255)
#ENDAT
#!  Legacy  #AT(%DataSectionAfterWindow)
#AT(%DataSection)
#INSERT(%DummyWindow)                     
#ENDAT

#!   Legacy #AT(%ProcedureSetup)
#AT(%WindowManagerMethodCodeSection, 'Init', '(),BYTE',5101)
#FOR(%Binds)
Bind('%Binder',%Binder)
#ENDFOR
#ENDAT

#!  Legacy #AT(%EndOfProcedure)
#AT(%WindowManagerMethodCodeSection, 'Kill', '(),BYTE',5600)
#FOR(%Binds)
Unbind('%Binder')
#ENDFOR
#ENDAT


#AT(%ProcedureRoutines)
#DECLARE(%CallRoutine)
#IF(%CondUse)
LL_Condition       Routine
 #FOR(%RepFiles)                     #! %Repfile holds the condition i.e   Rep:Ref = 1
#EMBED(%LLBeforeEvaluate,'L&L Before Evaluating Condition')
 If Evaluate('%Condition') = '1' then
#EMBED(%LLAfterEvaluate,'L&L After Evaluating Condition'),%RepFiles
   #FOR(%FileCond)
   #FIX(%FILE,%FileCond)
   LL_FileType = '%RepUsage'
   #SET(%CallRoutine,'Send_' & %RepFileName & '_To_LL')
   do %CallRoutine
   #ENDFOR
 Else
   If Error() then
     Stop('The error ' & Error() & ' was generated when Evaluating condition ' & '%Condition')
   end
 End
 #ENDFOR
#ELSE
LL_DefineVariables         ROUTINE
 #FOR(%OTHERFILES)
  #SET(%CallRoutine,'Send_' & %OTHERFILES & '_To_LL')
  LL_FileType = 'Both'
  do %CallRoutine
 #ENDFOR
#ENDIF

#INSERT(%LLRoutines,%CondUse)
#INSERT(%DefineLayout)
#INSERT(%SendVarsLL,%DemoData)
#INSERT(%FieldGen,%OTHERFILES,%False,%FALSE)
#INSERT(%ManualVariables)
#INSERT(%Relationships)
#INSERT(%Flags)

#ENDAT

#!*******************************************************************************************
#! CODE TEMPLATES          CODE TEMPLATES              CODE TEMPLATES          CODE TEMPLATES
#!*******************************************************************************************
#CODE(IssuePageBreak,'Issue a Page Break')
#DISPLAY('')
#DISPLAY('This will send a page break instruction to List and Label')

  LL_Result = LLPrint(LL_hJob)                      !Send a page break to List & Label

#!*************************************** LLWindowRun ***************************************
#GROUP(%LLWindowRun)
  CASE Clip(LLL_:Type)
  OF 'List'
    LL_ReportType = LL_Project_List
  OF 'Label'
    LL_ReportType = LL_Project_Label
  OF 'Card'
    LL_ReportType = LL_Project_Card
  END

#!*************************************** LLKillWindow ***************************************
#Group(%LLKillWindow)
if LL_Printed > 0 and LL_Abort = false then
  #EMBED(%LLInKillWindow,'LL About to Kill procedure')
  CASE LL_ReportType
  OF LL_Project_List
    LL_Result = llPrintFieldsEnd(LL_hJob)
  END
  LL_Result = llPrintEnd(LL_hJob,0)
  IF LL_Action = 2
    #EMBED(%LLBeforePreviewDisplay,'LL Before Preview Call')
    #IF(%NotUseLLPreviewer = %True)
      %LLPreviewProcedure(Clip(LL_Path) & clip(LL_NameNoPath) & '.ll')
    #ELSE
#INSERT(%PreviewOptions)
    #IF(%LLNonMDI=%False)
    UNLOCKTHREAD
    #ENDIF
    LL_Report_Name = clip(LL_Report_Name)
    LL_Result = llPreviewDisplay(LL_hJob,LL_Report_Name,LL_Path,LL_hWind)
    #IF(%LLNonMDI=%False)
    LOCKTHREAD
    #ENDIF
    #ENDIF
    #EMBED(%LLAfterPreviewDisplay,'LL After Preview Call')
    LL_Result = llPreviewDeleteFiles(LL_hJob,LL_Report_Name,LL_Path)
    #EMBED(%LLAfterPreviewDelete,'LL After Preview Delete Temporary Files')
  END
else
  #EMBED(%LLProcessAbortedKillWindow,'LL Process Aborted')
  LL_Result = llPrintEnd(LL_hJob,0)
  IF LL_Action = 2
    LL_Result = llPreviewDeleteFiles(LL_hJob,LL_Report_Name,LL_Path)
  end
end
#EMBED(%BeforeCloseLLJob,'LL Before Closing LL Print job')
#INSERT(%PopulateExportedFiles)
LLJobClose(LL_hJob)


#!****************************************************** LLRoutines ***********************
#GROUP(%LLRoutines,%Conditional)
#DECLARE(%FinalButtonStyle,Long)
#DECLARE(%WhichLanguage,Long)
#DECLARE(%UseFilePath,String)
LL_StandardInit         ROUTINE
    #IF(%DebugMode = %TRUE)
    LLSetDebug(LL_DEBUG_CMBTLL)
    #ENDIF
    LL_Printed          = 0
    LL_Abort            = False
   #IF(%LLPreviewDirectory='')
    LL_Path             = ''
   #ELSE
    #IF(Sub(%LLPreviewDirectory,1,1) = '!')
     #SET(%UseFilePath,clip(Sub(%LLPreviewDirectory,2,19)))
    LL_Path             = %UseFilePath
    #ELSE
    LL_Path             = '%LLPreviewDirectory'
    #ENDIF
   #ENDIF
    If Len(LL_Path) > 0 then
      If Sub(LL_Path,Len(clip(LL_Path)),1) <> '\' then
        LL_Path = clip(LL_Path) & '\'
      end
    end
#INSERT(%SetLanguage)
    LL_hJob             = LLJobOpen(%WhichLanguage)
   #IF(%LLVersion='Version 9' or %LLVersion='Version 10' or %LLVersion = 'Version 11' or %LLVersion = 'Version 12' or %LLVersion = 'Version 13' or %LLVersion = 'Version 14' or %LLVersion = 'Version 15' or %LLVersion = 'Version 16' or %LLVersion = 'Version 17' or %LLVersion = 'Version 18' or %LLVersion = 'Version 19' or %LLVersion = 'Version 20' or %LLVersion = 'Version 21' or %LLVersion = 'Version 22' or %LLVersion = 'Version 23' or %LLVersion = 'Version 24' or %LLVersion = 'Version 25' or %LLVersion = 'Version 26' or %LLVersion = 'Version 27' or %LLVersion = 'Version 28' or %LLVersion = 'Version 29')
    LL_Result = LLSetOptionString(LL_hJob,LL_OPTIONSTR_LICENSINGINFO,LLLicense)
   #ENDIF
    if LL_hJob < 0 then
      Message('Error was ' & LL_hJob)
    end
    !!!!LL_HWind            = 0{PROP:HANDLE}
    !LL_HWind = 0
#EMBED(%LLSendOptions,'Before Sending Options to List & Label')
#Insert(%SendOptions)
#EMBED(%LLStandardInit,'Manual define List and Label Report Parameters')
#INSERT(%DialogStyle)
    LL_SendingData = false
    llSetDlgboxMode(%FinalButtonStyle)                 ! Office 97 style

    LLDefineVariableStart(LL_hJob)                     !Empty any remaining definition in Variable buffer
    LLDefineFieldStart(LL_hJob)                         !Empty any remaining definition in Field buffer
    #IF(%Conditional)
    DO LL_Condition
    #ELSE
    DO LL_DefineVariables
    #END
    DO LL_DefineManualVariables
    LL_SendingData = true


#!****************************************************** Define Layout ***********************
#GROUP(%DefineLayout)
LL_DefineLayout         ROUTINE
  #IF(%ModifyFactory=%False)
    If GetIni('List and Label','Developer','','Solace.ini') <> 'Yes' then
      #!  Legacy
      If (ThisWindow.Request = ChangeRecord or ThisWindow.Request = DeleteRecord) and LLL_:FactoryDefault = true then
        Beep
        Message(%FactoryMessage,'Cannot Change/Delete Factory Default',icon:Hand,button:Ok,,1)
        Exit
      end
    end
  #ENDIF
    DO LL_StandardInit

#DECLARE(%UseFilePath)
#IF(%LLDirectory)
 #IF(Sub(%LLDirectory,1,1) = '!')
  #SET(%UseFilePath,clip(Sub(%LLDirectory,2,254)))
 #ELSE
  #SET(%UseFilePath,%LLDirectory)
 #ENDIF
#ENDIF

    LL_SavePath = LongPath()
   #IF(%LLDirectory<> '')
    #IF(Sub(%LLDirectory,1,1) = '!')
    LL_Report_Name = Clip(%UseFilePath) & clip(LL_Report_Name)
    LL_PreviewPath = %UseFilePath
    #ELSE
    LL_Report_Name = '%UseFilePath' & clip(LL_Report_Name)
    LL_PreviewPath = '%UseFilePath'
    #END
   #END
   #IF(%LLDirectory)
    Setpath(LL_PreviewPath)
    if error() then
      SolaceResult# = LL_CreateDirectoryA(LL_PreviewPath,LL_SECURITY_ATTRIBUTES)
    end
    Setpath(LL_SavePath)

   #ENDIF
    #EMBED(%LLBeforeDesign,'L&L - Before calling List & Label Designer ')
    SavePath = LongPath()
    Display
  #IF(%DesignNew = %True)
    LL_Result = LLDesignerProhibitAction(LL_hJob,524)      !Remove 'New' from files menu
  #ENDIF
  #IF(%DesignOpen = %True)
    LL_Result = LLDesignerProhibitAction(LL_hJob,519)      !Remove 'Open' from files menu
  #ENDIF
  #IF(%DesignSaveAs = %True)
    LL_Result = LLDesignerProhibitAction(LL_hJob,515)      !Remove 'Save As' from files menu
  #ENDIF
  #IF(%DesignRecentFiles = %True)
    LL_Result = LLDesignerProhibitAction(LL_hJob,990)      !Remove Recent Files list from files menu
  #ENDIF
  #IF(%DesignMax = %True)
    LL_Result = LLDesignerProhibitAction(LL_hJob,LL_SYSCOMMAND_MAXIMIZE)  !Do not allow designer to be maximised
  #ENDIF
  #IF(%DesignMin = %True)
    LL_Result = LLDesignerProhibitAction(LL_hJob,LL_SYSCOMMAND_MINIMIZE)   !Do not allow designer to be minimised
  #ENDIF
    Setcursor(Cursor:Wait)
    #IF(%LLNonMDI=%False)
    UnlockThread
    #ENDIF
    LL_Result = llDefineLayout(LL_hJob, LL_hWind, LL_Report_Title, LL_ReportType, LL_Report_Name)
    #IF(%LLNonMDI=%False)
    LockThread
    #ENDIF
    Setcursor(Cursor:Arrow)
    SetPath(SavePath)

    #EMBED(%BeforeCloseLLJob,'LL Before Closing LL Print job')
    LLJobClose(LL_hJob)
    #EMBED(%LLEndDefineVar,'End List and Label Define Variables Routine')

#!****************************************************** Send Vars to L&L ***********************
#GROUP(%SendVarsLL,%DemoData)
SendVarsToListAndLabel  Routine
    #IF(%DemoData)
    CASE LL_FieldType
    OF LL_DATE
      LL_String2 = Today() + 2378857
    OF LL_TEXT
      LL_String2 = LL_String1
    OF LL_Numeric
      LL_String2 = 999999
    OF LL_Boolean
      LL_String2 = 1
    End
    #ENDIF
    #EMBED(%BeforeWorkoutData,'List & Label - Before Work out Field Data type')
    if clip(LL_ReportType) = LL_Project_List then
      if clip(LL_FileType) = 'Variables' or clip(LL_FileType) = 'Both' then
        LL_Result=lldefinevariableExt(LL_hJob,LL_String1,LL_String2,LL_FieldType,0)
      end
      if clip(LL_FileType) = 'Fields' or clip(LL_FileType) = 'Both' then
        LL_Result = lldefineFieldExt(LL_hJob,LL_String1,LL_String2,LL_FieldType,0)
      end
    else
      LL_Result=lldefinevariableExt(LL_hJob,LL_String1,LL_String2,LL_FieldType,0)
    END
    #EMBED(%AfterWorkoutData,'List & Label - After Work out Field Data type')



#!****************************************************** Conditional Call ***********************

#GROUP(%CondRoutine)
LL_Conditional         ROUTINE
#DECLARE(%ConString1)
#EMBED(%LLStartDefineVar,'Begin List and Label Define Variables Routine')
  #DECLARE(%ConRoutineName)
  #FOR(%FileCond)
   #IF(%FileCond = 'LL_RepLay')
     #CYCLE
   #ENDIF
   #IF(%FileCond = 'LL_RepArea')
     #CYCLE
   #ENDIF
   #Fix(%File,%FileCond)
   #SET(%ConRoutineName,'Send_' & %FileCond & '_To_LL')
   do %ConRoutineName
  #ENDFOR


#!****************************************************** Manual Variables ***********************
#Group(%ManualVariables)

LL_DefineManualVariables         ROUTINE
#! Defines manual report variables
#FOR(%RepManFields)
  #IF(%ManCondition<>'')
   #INDENT(2)
   If Evaluate('%ManCondition') = '1' then
  #ENDIF
    #IF(%ManualGroupName <> '')
     LL_String1 = '%ManualGroupName.%RepManFieldName'
    #ELSE
     LL_String1 = '%RepManFieldName'
    #ENDIF
     #IF(%RepManFieldType='RTF' or %RepManFieldType='String'or %RepManFieldType='HTML')
       LL_String2_Size = SIZE(%RepManFileField)
     #ELSE
       LL_String2_Size = 256
     #END
     LL_String2 &= NEW(CSTRING(LL_String2_Size+1))
     LL_String2 = ''
#IF(%RepManFieldFormat)
   #IF(%RepManFieldType = 'Date')
     if %RepManFileField > 0 then
       LL_String2 = %RepManFileField + 2378857
     else
       LL_String2 = '1e1000'
     end
   #ELSE
     LL_String2 = FORMAT(%RepManFileField,@%RepManFieldFormat)         !Processed second choice
   #END
#ELSE
   #IF(%RepManFieldType = 'Date')
     if %RepManFileField > 0 then
       LL_String2 = %RepManFileField + 2378857
     else
       LL_String2 = '1e1000'
     end
   #ELSIF(%RepManFieldType = 'TIME')
     if %RepManFileField > 0 then
       LL_String2 = %RepManFileField / 8640000
     else
       LL_String2 = '1e1000'
     end
   #ELSE
     LL_String2 = %RepManFileField
   #END
#ENDIF
#CASE(%RepManFieldType)
#OF('String')
     LL_FieldType = LL_Text
#OF('Numeric')
     LL_FieldType = LL_Numeric
#OF('Boolean')
     LL_FieldType = LL_Boolean
#OF('Date')
     LL_FieldType = LL_Date
#OF('RTF')
     LL_FieldType = LL_RTF
#OF('Drawing')
     LL_FieldType = LL_Drawing
#OF('Barcode')
     LL_FieldType = LL_Barcode
#OF('HTML')
     LL_FieldType = LL_HTML
#ENDCASE
     LL_FileType = 'Both'
     Do SendVarsToListAndLabel
     DISPOSE(LL_String2)
 #IF(%ManCondition<>'')
   End
   #INDENT(-2)
 #ENDIF
#ENDFOR
#EMBED(%LLEndManDefine,'After Defining List and Label Manual Variables Routine')

#!****************************************************** Relations **********************

#Group(%Relationships)

  #FOR(%AllRelatedFiles)
   LL_RelateParent = '%LLRelateParent'
   LL_RelateChild = '%LLRelateChild'
   LL_Result = LlDbAddTable(LL_hJob,LL_RelateParent,LL_RelateParent)
   LL_Result = LlDbAddTable(LL_hJob,LL_RelateChild,LL_RelateChild)
  #ENDFOR

  #FOR(%AllRelatedFiles)
   LL_RelateName = '%LLRelateName'
   LL_Result = LlDbAddTableRelation(LL_hJob,LL_RelateParent,LL_RelateChild,LL_RelateName,LL_RelateName)
  #ENDFOR


#!****************************************************** Printing ***********************
#Group(%Printing,%InvoiceStyle)

LL_InitReport         ROUTINE
    #EMBED(%TopOfInitReport,'LL Top of LL_InitReport')

    LL_HWind            = 0{PROP:HANDLE}
    DO LL_StandardInit

    #CASE(%ProgressType)
    #OF('Abort, bar meter & text')
    LL_ProgressType = 0
    #OF('Abort, bridge meter & text')
    LL_ProgressType = 1
    #OF('Abort & text')
    LL_ProgressType = 5                                       
    #OF('Bar meter & text')
    LL_ProgressType = 2
    #OF('Bridge meter & text')
    LL_ProgressType = 3
    #OF('Text Only')
    LL_ProgressType = 4
    #OF('No Progress Window')
    LL_ProgressType = 6
    #ENDCASE

#DECLARE(%UseFilePath)
#DECLARE(%UseProgressWindow,Long)
#IF(%LLDirectory)
 #IF(Sub(%LLDirectory,1,1) = '!')
  #SET(%UseFilePath,clip(Sub(%LLDirectory,2,254)))
 #ELSE
  #SET(%UseFilePath,%LLDirectory)
 #ENDIF
#ENDIF

     LL_SavePath = LongPath()
   #IF(%LLDirectory<> '')
    #IF(Sub(%LLDirectory,1,1) = '!')
     LL_Report_Name = Clip(%UseFilePath) & clip(LL_Report_Name)
     LL_PreviewPath = %UseFilePath
    #ELSE
     LL_Report_Name = '%UseFilePath' & clip(LL_Report_Name)
     LL_PreviewPath = '%UseFilePath'
    #END
   #END
   #IF(%LLDirectory)
    Setpath(LL_PreviewPath)
    if error() then
      SolaceResult# = LL_CreateDirectoryA(LL_PreviewPath,LL_SECURITY_ATTRIBUTES)
    end
    Setpath(LL_SavePath)

   #ENDIF
   #IF(%ProgressType <> 'Clarion Progress Bar' and %ProgressType <> 'No Progress Window')
     #SET(%UseProgressWindow,%True)
   #Else
     #SET(%UseProgressWindow,%False)
   #END
    LL_PrintText = '%PrintText'
#EMBED(%LLBeforeOpening,'LL Before Opening With Box Start')
 #IF(%LLVersion='Version 9' or %LLVersion='Version 10' or %LLVersion = 'Version 11' or %LLVersion = 'Version 12' or %LLVersion = 'Version 13' or %LLVersion = 'Version 14' or %LLVersion = 'Version 15' or %LLVersion = 'Version 16' or %LLVersion = 'Version 17' or %LLVersion = 'Version 18' or %LLVersion = 'Version 19' or %LLVersion = 'Version 20' or %LLVersion = 'Version 21' or %LLVersion = 'Version 22' or %LLVersion = 'Version 23' or %LLVersion = 'Version 24' or %LLVersion = 'Version 25' or %LLVersion = 'Version 26' or %LLVersion = 'Version 27' or %LLVersion = 'Version 28' or %LLVersion = 'Version 29')
  #IF(%AllowFaxing=%True)
    #IF(%FaxRecipNumber<> '')
    if clip(%FaxRecipNumber) <> '' then
      LL_Option = '"' & %FaxRecipNumber & '"'
      LL_Result = LLSetOptionString(LL_hJob,LL_OptionStr_Fax_Recipnumber,LL_Option)
    end
    #ENDIF
    #IF(%FaxRecipName<> '')
    if clip(%FaxRecipName) <> '' then
      LL_Option = %FaxRecipName
      LL_Result = LLSetOptionString(LL_hJob,LL_OptionStr_Fax_Recipname,LL_Option)
    end
    #ENDIF
    #IF(%FaxSenderName<> '')
    if clip(%FaxSenderName) <> '' then
      LL_Option = %FaxSenderName
      LL_Result = LLSetOptionString(LL_hJob,LL_OptionStr_Fax_Sendername,LL_Option)
    end
    #ENDIF
    #IF(%FaxSenderCompany<> '')
    if clip(%FaxSenderCompany) <> '' then
      LL_Option = %FaxSenderCompany
      LL_Result = LLSetOptionString(LL_hJob,LL_OptionStr_Fax_Sendercompany,LL_Option)
    end
    #ENDIF
    #IF(%FaxSenderDept<> '')
    if clip(%FaxSenderDept) <> '' then
      LL_Option = %FaxSenderDept
      LL_Result = LLSetOptionString(LL_hJob,LL_OptionStr_Fax_Senderdept,LL_Option)
    end
    #ENDIF
    #IF(%FaxSenderBillingCode<> '')
    if clip(%FaxSenderBillingCode) <> '' then
      LL_Option = %FaxSenderBillingCode
      LL_Result = LLSetOptionString(LL_hJob,LL_OptionStr_Fax_Senderbillingcode,LL_Option)
    end
    #ENDIF
  #ENDIF
 #ENDIF
   #IF(%LLPrinterName<>'')
    If clip(%LLPrinterName) <> '' then
      LL_Result = LlSetPrinterInPrinterFile(LL_hJob,LL_ReportType,LL_Report_Name,-1,%LLPrinterName,LL_NullString)
    #IF(%RecreateDriver=%True)
    else
      LL_Result = LLSetPrinterToDefault(LL_hJob,LL_ReportType,LL_Report_Name)
    #ENDIF
    End
   #ELSE
    #IF(%RecreateDriver=%True)
    LL_Result = LLSetPrinterToDefault(LL_hJob,LL_ReportType,LL_Report_Name)
    #ENDIF
   #ENDIF
    If LL_PrinterOptions = true then
      #IF(%WrapCallsLockThread=%TRUE)
      #IF(%LLNonMDI=%False)
      UnlockThread()
      #ENDIF
      #ENDIF
      #IF(%UseProgressWindow=%True)
      LL_Result = llPrintWithBoxStart(LL_hJob, LL_ReportType, LL_Report_Name, LL_PRINT_USERSELECT, LL_ProgressType, LL_HWind, LL_PrintText)
      #ELSE
      LL_Result = llPrintStart(LL_hJob, LL_ReportType, LL_Report_Name, LL_PRINT_USERSELECT,0)
      #END
      #IF(%WrapCallsLockThread=%TRUE)
      #IF(%LLNonMDI=%False)
      LockThread()
      #ENDIF
      #ENDIF
      #IF(%OpenError = %True)
      #INSERT(%ErrorHandle)
      #ENDIF
      Execute(LL_Action)
        LL_Dest = 'FILE'
        LL_Dest = 'PRV'
        LL_Dest = 'PRN'
        LL_Dest = 'RTF'
        LL_Dest = 'HTML'
        LL_Dest = 'JPG'
        LL_Dest = 'EMF'
        LL_Dest = 'BMP'
        LL_Dest = 'PDF'
        LL_Dest = 'MHTML'
        LL_Dest = 'XML'
        LL_Dest = 'XLS'
        LL_Dest = 'TXT'
        LL_Dest = 'MSFAX'
        LL_Dest = 'TTY'
      End
      LL_Result = LLPrintSetOptionString(LL_hJob,LL_PRNOPTSTR_EXPORT,LL_Dest)
    else
      CASE LL_Action
      of 0                !User Select
        #IF(%WrapCallsLockThread=%TRUE)
        #IF(%LLNonMDI=%False)
        UnlockThread()
        #ENDIF
        #ENDIF
        #IF(%UseProgressWindow=%True)
        LL_Result = llPrintWithBoxStart(LL_hJob, LL_ReportType, LL_Report_Name, LL_PRINT_USERSELECT, LL_ProgressType, LL_HWind, LL_PrintText)
        #ELSE
        LL_Result = llPrintStart(LL_hJob, LL_ReportType, LL_Report_Name, LL_PRINT_USERSELECT,0)
        #END
        #IF(%WrapCallsLockThread=%TRUE)
        #IF(%LLNonMDI=%False)
        LockThread()
        #ENDIF
        #ENDIF
        #IF(%OpenError = %True)
        #INSERT(%ErrorHandle)
        #ENDIF
      OF 1                ! to File
        #IF(%WrapCallsLockThread=%TRUE)
        #IF(%LLNonMDI=%False)
        UnlockThread()
        #ENDIF
        #ENDIF
        #IF(%UseProgressWindow=%True)
        LL_Result = llPrintWithBoxStart(LL_hJob, LL_ReportType, LL_Report_Name, LL_PRINT_FILE, LL_ProgressType, LL_HWind, LL_PrintText)
        #ELSE
        LL_Result = llPrintStart(LL_hJob, LL_ReportType, LL_Report_Name, LL_PRINT_FILE,0)
        #END
        #IF(%WrapCallsLockThread=%TRUE)
        #IF(%LLNonMDI=%False)
        LockThread()
        #ENDIF
        #ENDIF
        #IF(%OpenError = %True)
        #INSERT(%ErrorHandle)
        #ENDIF
      OF 2                ! Preview
        #IF(%WrapCallsLockThread=%TRUE)
        #IF(%LLNonMDI=%False)
        UnlockThread()
        #ENDIF
        #ENDIF
        #IF(%UseProgressWindow=%True)
        LL_Result = llPrintWithBoxStart(LL_hJob, LL_ReportType, LL_Report_Name, LL_PRINT_PREVIEW, LL_ProgressType, LL_HWind, LL_PrintText)
        #ELSE
        LL_Result = llPrintStart(LL_hJob, LL_ReportType, LL_Report_Name, LL_PRINT_PREVIEW,0)
        #END
        #IF(%WrapCallsLockThread=%TRUE)
        #IF(%LLNonMDI=%False)
        LockThread()
        #ENDIF
        #ENDIF
        #IF(%OpenError = %True)
        #INSERT(%ErrorHandle)
        #ENDIF
  #EMBED(%LLAfterOpeningPre,'LL After Opening With Box Start - Preview')
      OF 3                ! Print to printer
        #IF(%WrapCallsLockThread=%TRUE)
        #IF(%LLNonMDI=%False)
        UnlockThread()
        #ENDIF
        #ENDIF
        #IF(%UseProgressWindow=%True)
        LL_Result = llPrintWithBoxStart(LL_hJob, LL_ReportType, LL_Report_Name, LL_PRINT_NORMAL, LL_ProgressType, LL_HWind, LL_PrintText)
        #ELSE
        LL_Result = llPrintStart(LL_hJob, LL_ReportType, LL_Report_Name, LL_PRINT_NORMAL,0)
        #END
        #IF(%WrapCallsLockThread=%TRUE)
        #IF(%LLNonMDI=%False)
        LockThread()
        #ENDIF
        #ENDIF
        #IF(%OpenError = %True)
        #INSERT(%ErrorHandle)
        #ENDIF
   #EMBED(%LLAfterOpeningPrint,'LL After Opening With Box Start - Print')
      #IF(%LLVersion <> 'Version 6')
      Of 4
   #EMBED(%LLBeforeOpeningPrintRTF,'LL Before Opening - With Box Start - RTF EXPORT')
        LL_Exporttype = 'RTF'
        do SetLLExportOptions
   #EMBED(%LLAfterOpeningPrintRTF,'LL After Opening - With Box Start - RTF EXPORT')
        #IF(%OpenError = %True)
        #INSERT(%ErrorHandle)
        #ENDIF
      Of 5
   #EMBED(%LLBeforeOpeningPrintHTML,'LL Before Opening - With Box Start - HTML EXPORT')
        LL_Exporttype = 'HTML'
        do SetLLExportOptions
   #EMBED(%LLAfterOpeningPrintHTML,'LL After Opening - With Box Start - HTML EXPORT')
        #IF(%OpenError = %True)
        #INSERT(%ErrorHandle)
        #ENDIF
      of 6
   #EMBED(%LLBeforeOpeningPrintJPG,'LL Before Opening - With Box Start - JPG EXPORT')
        LL_ExportType = 'PICTURE_JPEG'
        do SetLLExportOptions
   #EMBED(%LLAfterOpeningPrintJPG,'LL After Opening - With Box Start - JPG EXPORT')
        #IF(%OpenError = %True)
        #INSERT(%ErrorHandle)
        #ENDIF
      of 7
   #EMBED(%LLBeforeOpeningPrintEMF,'LL Before Opening - With Box Start - EMF EXPORT')
        LL_ExportType = 'PICTURE_EMF'
        do SetLLExportOptions
   #EMBED(%LLAfterOpeningPrintEMF,'LL After Opening - With Box Start - EMF EXPORT')
        #IF(%OpenError = %True)
        #INSERT(%ErrorHandle)
        #ENDIF
      of 8
   #EMBED(%LLBeforeOpeningPrintEMF,'LL Before Opening - With Box Start - BMP EXPORT')
        LL_ExportType = 'PICTURE_BMP'
        do SetLLExportOptions
   #EMBED(%LLAfterOpeningPrintEMF,'LL After Opening - With Box Start - BMP EXPORT')
        #IF(%OpenError = %True)
        #INSERT(%ErrorHandle)
        #ENDIF
      of 9
   #EMBED(%LLBeforeOpeningPrintPDF,'LL Before Opening - With Box Start - PDF EXPORT')
        LL_Exporttype = 'PDF'
        do SetLLExportOptions
   #EMBED(%LLAfterOpeningPrintPDF,'LL After Opening - With Box Start - PDF EXPORT')
        #IF(%OpenError = %True)
        #INSERT(%ErrorHandle)
        #ENDIF
      of 10
   #EMBED(%LLBeforeOpeningPrintMHTML,'LL Before Opening - With Box Start - MHTML EXPORT')
        LL_Exporttype = 'MHTML'
        do SetLLExportOptions
   #EMBED(%LLAfterOpeningPrintMHTML,'LL After Opening - With Box Start - MHTML EXPORT')
        #IF(%OpenError = %True)
        #INSERT(%ErrorHandle)
        #ENDIF
      of 11
   #EMBED(%LLBeforeOpeningPrintXML,'LL Before Opening - With Box Start - XML EXPORT')
        LL_Exporttype = 'XML'
        do SetLLExportOptions
   #EMBED(%LLAfterOpeningPrintXTML,'LL After Opening - With Box Start - XML EXPORT')
        #IF(%OpenError = %True)
        #INSERT(%ErrorHandle)
        #ENDIF
      of 12
   #EMBED(%LLBeforeOpeningPrintXLS,'LL Before Opening - With Box Start - XLS EXPORT')
        LL_Exporttype = 'XLS'
        do SetLLExportOptions
   #EMBED(%LLAfterOpeningPrintXLS,'LL After Opening - With Box Start - XLS EXPORT')
        #IF(%OpenError = %True)
        #INSERT(%ErrorHandle)
        #ENDIF
      of 13
   #EMBED(%LLBeforeOpeningPrintTXT,'LL Before Opening - With Box Start - TXT EXPORT')
        LL_Exporttype = 'TXT'
        do SetLLExportOptions
   #EMBED(%LLAfterOpeningPrintXTXT,'LL After Opening - With Box Start - TXT EXPORT')
        #IF(%OpenError = %True)
        #INSERT(%ErrorHandle)
        #ENDIF
      of 14
   #EMBED(%LLBeforeOpeningPrintFAX,'LL Before Opening - With Box Start - FAX EXPORT')
        LL_Exporttype = 'MSFAX'
        do SetLLExportOptions
   #EMBED(%LLAfterOpeningPrintFAX,'LL After Opening - With Box Start - FAX EXPORT')
        #IF(%OpenError = %True)
        #INSERT(%ErrorHandle)
        #ENDIF
      of 15
   #EMBED(%LLBeforeOpeningTTY,'LL Before Opening - With Box Start - TTY Export')
        LL_Exporttype = 'TTY'
        do SetLLExportOptions
   #EMBED(%LLAfterOpeningTTY,'LL After Opening - With Box Start - TTY EXPORT')
        #IF(%OpenError = %True)
        #INSERT(%ErrorHandle)
        #ENDIF
      End
    end
    #ENDIF
  #IF(%LLPreviewDirectory)
   #IF(Sub(%LLPreviewDirectory,1,1) = '!')
    #SET(%UseFilePath,clip(Sub(%LLPreviewDirectory,2,19)))
   #ELSE
    #SET(%UseFilePath,%LLPreviewDirectory)
   #ENDIF
  #ENDIF

  #IF(%LLPreviewDirectory<>'')
    LL_SavePath = LongPath()
   #IF(%LLPreviewDirectory<> '')
    #IF(Sub(%LLPreviewDirectory,1,1) = '!')
    LL_PreviewPath = %UseFilePath
    #ELSE
    LL_PreviewPath = '%UseFilePath'
    #END
   #END
    Setpath(LL_PreviewPath)
    if error() then
      SolaceResult# = LL_CreateDirectoryA(LL_PreviewPath,LL_SECURITY_ATTRIBUTES)
    end
    Setpath(LL_SavePath)

   #EMBED(%LLBeforeSetPreviewPath,'LL Before Setting Path for Preview file')
    LL_Result = LLPreviewSetTempPath(LL_hJob, LL_PreviewPath)
  #EMBED(%LLAfterSetPreviewPath,'LL After Setting Path for Preview file')
  #ENDIF
  If LL_Copies > 1 then
    #EMBED(%LLBeforeSetCopies,'LL Before setting copies')
    LL_Result = LlPrintSetOption(LL_hjob,LL_OPTION_COPIES,LL_Copies)
    LL_Result = LlPrintGetOption(LL_hjob,LL_PRNOPT_COPIES_SUPPORTED)
    #EMBED(%LLAfterSetCopies,'LL After setting copies')
  end
 #IF(%InvoiceStyle=%False)
  #EMBED(%LLINITREPORT,'After Start List and Label - InitReport Routine')
    if LL_ReportType = LL_Project_List then
      #IF(%WrapCallsLockThread=%TRUE)
      #IF(%LLNonMDI=%False)
      UnlockThread()
      #ENDIF
      #ENDIF
      LL_Result = llPrint(LL_hJob)
      #IF(%WrapCallsLockThread=%TRUE)
      #IF(%LLNonMDI=%False)
      LockThread()
      #ENDIF
      #ENDIF
    END
 #EMBED(%LLENDINITREPORT,'End List and Label - InitReport Routine')
 #ENDIF

#GROUP(%ExportFunctions)
SetLLExportOptions    Routine
      #EMBED(%LLBeforeExportOptions,'Before List and Label Export options')
      #IF(%LLVersion = 'Version 7')
      LL_Option = 'cm32l7ex.llx'
      #ENDIF
      #IF(%LLVersion = 'Version 8')
      LL_Option = 'cm32l8ex.llx'
      #ENDIF
      #IF(%LLVersion = 'Version 9')
      LL_Option = 'cm32l9ex.llx'
      #ENDIF
      LL_Result = LLSetOptionString(LL_hJob,LL_OptionStr_LLXPathList,LL_Option)

      LL_ExportSetting = 'Export.File'
      LL_Result = LLXSetParameter(LL_hJob, LL_LLX_Extensiontype_Export,LL_Exporttype,LL_ExportSetting,LL_OutputFile)

      LL_ExportSetting = 'Export.Path'
      LL_Result = LLXSetParameter(LL_hJob, LL_LLX_Extensiontype_Export,LL_Exporttype,LL_ExportSetting,LL_OutputDir)

      LL_ExportSetting = 'Export.Quiet'
      LL_Option = '1'
      LL_Result = LLXSetParameter(LL_hJob, LL_LLX_Extensiontype_Export,LL_Exporttype,LL_ExportSetting,LL_Option)

      LL_ExportSetting = 'Export.ShowResult'
    #IF(%TriggerRun<>'')
      LL_Option = %TriggerRun
    #ELSE
      LL_Option = False
    #END
      #EMBED(%LLAfterShowResult,'LL After Setting Export.ShowResult')
      LL_Result = LLXSetParameter(LL_hJob, LL_LLX_Extensiontype_Export,LL_Exporttype,LL_ExportSetting,LL_Option)
     #IF(%RTFPlainInPDF=%True)
      If clip(LL_Exporttype) = 'PDF' then
        LL_ExportSetting = 'Verbosity.RTF'
        LL_Option = '1'
        LL_Result = LLXSetParameter(LL_hJob, LL_LLX_Extensiontype_Export,LL_Exporttype,LL_ExportSetting,LL_Option)
      end
     #ENDIF
      #IF(%WrapCallsLockThread=%TRUE)
      #IF(%LLNonMDI=%False)
      UnlockThread()
      #ENDIF
      #ENDIF
      #IF(%ProgressType <> 'No Progress Window')
      LL_Result = llPrintWithBoxStart(LL_hJob, LL_ReportType, LL_Report_Name, LL_PRINT_EXPORT, LL_ProgressType, LL_HWind, LL_PrintText)
      #EMBED(%LLAfterPrintBoxStartExport,'LL After Print Box Start for Export')
      #ELSE
      LL_Result = llPrintStart(LL_hJob, LL_ReportType, LL_Report_Name, LL_PRINT_EXPORT,0)
      #END
      #IF(%WrapCallsLockThread=%TRUE)
      #IF(%LLNonMDI=%False)
      LockThread()
      #ENDIF
      #ENDIF
      LL_Result = LLPrintSetOptionString(LL_hJob,LL_PrnOptStr_Export,LL_Exporttype)

      if LLEmailReport = true and Records(LLEMailQueue) > 0 then
        #EMBED(%LLBeforeEmail,'LL Before setting email options')
        #INSERT(%PopulateEmail)
        LL_ExportSetting = 'Export.SendAsMail'
        LL_Option = True
        LL_Result = LLXSetParameter(LL_hJob, LL_LLX_Extensiontype_Export,LL_Exporttype,LL_ExportSetting,LL_Option)

        LL_ExportSetting = 'Export.Mail.To'
        LL_Option = LLFullMailTo
        LL_Result = LLXSetParameter(LL_hJob, LL_LLX_Extensiontype_Export,LL_Exporttype,LL_ExportSetting,LL_Option)

        LL_ExportSetting = 'Export.Mail.CC'
        LL_Option = LLFullMailCC
        LL_Result = LLXSetParameter(LL_hJob, LL_LLX_Extensiontype_Export,LL_Exporttype,LL_ExportSetting,LL_Option)

        LL_ExportSetting = 'Export.Mail.BCC'
        LL_Option = LLFullMailBCC
        LL_Result = LLXSetParameter(LL_hJob, LL_LLX_Extensiontype_Export,LL_Exporttype,LL_ExportSetting,LL_Option)

        LL_ExportSetting = 'Export.Mail.Subject'
        LL_Option = LLSubject
        LL_Result = LLXSetParameter(LL_hJob, LL_LLX_Extensiontype_Export,LL_Exporttype,LL_ExportSetting,LL_Option)

        LL_ExportSetting = 'Export.Mail.Body'
        LL_Option = LLBody
        LL_Result = LLXSetParameter(LL_hJob, LL_LLX_Extensiontype_Export,LL_Exporttype,LL_ExportSetting,LL_Option)
       #IF(%HTMLOneFilePerPage=%True)
        If clip(LL_Exporttype) = 'HTML' then
          LL_ExportSetting = 'Export.AllInOneFile'
          LL_Option = '0'
          LL_Result = LLXSetParameter(LL_hJob, LL_LLX_Extensiontype_Export,LL_Exporttype,LL_ExportSetting,LL_Option)
        end
       #ENDIF
       #EMBED(%LLAfterEmail,'LL After setting email options')
      end





#!****************************************************** Local Data ***********************
#GROUP(%LLDATA)
#DECLARE(%LLDeclareLocBreakField)
LL_Action               BYTE
LL_String1              CSTRING(121)
LL_String2              &CSTRING
LL_String2_Size         LONG
LL_RelateParent         CString(40)
LL_RelateChild          CString(40)
LL_RelateName           CString(40)
LL_FieldType            LONG
LL_Path                 CSTRING(181)
LL_Result               LONG
LL_Report_Name          CSTRING(181)
LL_NameNoPath           CString(20)
LL_Report_Title         CSTRING(181)
LL_hJob                 LONG                          ! Print job handle
LL_hWind                LONG                          ! Window handle
LL_ReportType           LONG
LL_QtyLabels            LONG(1)                       ! Number of repeat labels
LL_PrintText            CString(1024)
LL_ProgressType         Long
LL_PrinterOptions       Long
LL_GroupDefine          CString(30)
LL_Printed              Long
LL_Abort                Byte
LL_FileType             String(10)
LL_HeaderPrinted        Byte
LL_BLOB                 &Handle
LL_SendingData          Byte
LL_OutputFile           CString(255)
LL_OutputDir            CString(255)
LL_ExportType           CString(60)
LL_ExportSetting        CString(60)
LL_Option               CString(225)
LL_PageOverflow         Long
LL_SavePath             CString(255)
LL_PreviewPath          CString(255)
LL_PageBreak            Byte
LL_FilesCreated         CString(10240)
LL_Copies               UShort
LL_NullString           CString(20)
LL_Dest                 CString(10)
#IF(%SupressChild=%True)
LL_SavedParent          Like(%LLParentID)
#ENDIF


#GROUP(%FieldTypes)
#DECLARE(%LLBlobType)
     #IF(Instring(clip(%FieldType),'STRING CSTRING PSTRING MEMO PICTURE ANY PSTRING',1,1))
      LL_FieldType = LL_Text
      #IF(EXTRACT(%FieldUserOptions,'LL_RTF'))
      LL_FieldType = LL_RTF
      #ENDIF
      #IF(EXTRACT(%FieldUserOptions,'LL_HTML'))
      LL_FieldType = LL_HTML
      #ENDIF
      #IF(EXTRACT(%FieldUserOptions,'LL_DRAWING'))
      LL_FieldType = LL_DRAWING
      #ENDIF
     #ENDIF
     #IF(Instring(clip(%FieldType),'Numeric BFLOAT4 BFLOAT8 BYTE DECIMAL PDECIMAL UNSIGNED USHORT SHORT SREAL REAL',1,1))
      LL_FieldType = LL_Numeric
     #ENDIF
     #IF(%FieldType='BLOB')
       #SET(%LLBlobType,EXTRACT(%FieldUserOptions,'BlobType_LL',1))
       #IF(%LLBlobType='RTF')
      LL_FieldType = LL_RTF
       #ELSIF(%LLBlobType='LL_HTML')
      LL_FieldType = LL_HTML
       #ELSIF(%LLBlobType='Drawing')
      LL_FieldType = LL_DRAWING
       #ELSE
      LL_FieldType = LL_Text
       #ENDIF
     #ENDIF
     #IF(%FieldType='Boolean')
      LL_FieldType = LL_Boolean
     #ENDIF
     #IF(%FieldType='DATE')
      LL_FieldType = LL_Date
     #ENDIF                                                  
     #IF(%FieldType='RTF')
      LL_FieldType = LL_RTF
     #ENDIF
     #IF(%FieldType='HTML')
      LL_FieldType = LL_HTML
     #ENDIF
     #IF(%FieldType='Drawing')
      LL_FieldType = LL_Drawing
     #ENDIF
     #IF(%FieldType='Barcode')
      LL_FieldType = LL_Barcode
     #ENDIF
     #IF(%FieldType='TIME')
      LL_FieldType = LL_Date
     #ENDIF
     #IF(Instring(clip(%FieldType),'LONG ULONG'))
      #IF(Sub(Upper(%FieldDisplayPicture),2,1) = 'D' or Sub(Upper(%FieldDisplayPicture),2,1) = 'T')
      LL_FieldType = LL_Date
      #ELSE
      LL_FieldType = LL_Numeric     
      #END
     #ENDIF
     #IF(Instring(clip(%FieldType),'CLASS FILE GROUP KEY LIKE TYPE WINDOW QUEUE',1,1))
      LL_FieldType = 'Invalid field type ' & %FieldType & ' - ignored'
     #ENDIF
#!********************************************* Error handling ****************************
#GROUP(%ErrorHandle)
  #IF(%OpenError = %True)
If LL_Result <> 0 then
   #IF(%ProcessError = 'Call a procedure')
  %ErrorProc%ErrorParams
   #ELSE
  Message(%ErrorText,'Error ' & LL_Result & ' opening layout',icon:Hand,button:Ok,,1)
   #ENDIF
End
  #ENDIF


#!********************************************* Extract Files ****************************
#GROUP(%FieldGen,*%FileSource,%Multi,%AddType),PRESERVE

#DECLARE(%RoutineName)
#DECLARE(%String1)
#DECLARE(%PrefixLen)
#DECLARE(%LenField)
#DECLARE(%LLFileName)
#DECLARE(%Ignore,LONG)
#DECLARE(%ArrayCount)
#DECLARE(%ArrayCount2)
#DECLARE(%ArrayCount3)
#DECLARE(%ArrayCount4)
#FOR(%FileSource)
  #IF(%FileSource = 'LL_Reparea')
   #CYCLE
  #ENDIF
  #IF(%FileSource = 'LL_RepLay')
   #CYCLE
  #ENDIF
    #IF(%MULTI)
     #FIX(%File,%RepFileName)
    #ELSE
     #FIX(%File,%FileSource)
    #ENDIF
    #SET(%LLFileName,EXTRACT(%FileUserOptions,'Name_LL',1))

    #FOR(%LLRenameFiles)
     #IF(%LLRenameFile = %File)
       #SET(%LLFileName,%LLFileRename)
     #ENDIF
    #ENDFOR

    #IF(%LLFileName='')
     #IF(%MULTI)
      #SET(%LLFileName,%RepFileName)
     #ELSE
      #SET(%LLFileName,%FileSource)
     #ENDIF
    #ENDIF
    #IF(%MULTI)
      #SET(%RoutineName,'Send_' & %RepFileName & '_To_LL')
    #ELSE
      #SET(%RoutineName,'Send_' & %FileSource & '_To_LL')
    #ENDIF

%RoutineName        Routine
    #IF(%AddType=%TRUE)
    LL_FileType = '%RepUsage'
    #ENDIF
    #SET(%PrefixLen,Len(%FilePrefix) + 2)
    #FOR(%Field)
     #IF(EXTRACT(%FieldUserOptions,'NO_LL'))
      #CYCLE
     #ENDIF
     #SET(%Ignore,%False)
     #FOR(%LLOverrideFields)
       #IF(%LLOverrideField = %Field)
        #IF(%LLRemoveRename = 'Do not send to List and Label')
         #SET(%Ignore,%True)
        #ENDIF
       #ENDIF
     #ENDFOR
     #IF(%Ignore)
      #Cycle
     #ENDIF
     #IF(%FieldType='GROUP' or %FieldType='END')
      #CYCLE
     #ENDIF
     #IF(%FieldDimension1 > 0)
      #LOOP,For(%ArrayCount,1,%FieldDimension1)
       #IF(%FieldDimension2 > 0)
        #LOOP,For(%ArrayCount2,1,%FieldDimension2)
         #INSERT(%FieldDec,%ArrayCount,%ArrayCount2,0,0)
        #ENDLOOP
       #ELSE
        #INSERT(%FieldDec,%ArrayCount,0,0,0)
       #ENDIF
      #ENDLOOP
     #ELSE
       #INSERT(%FieldDec,0,0,0,0)
     #ENDIF
    #ENDFOR
#ENDFOR



#GROUP(%FieldDec,%ArrayCount,%ArrayCount2,%ArrayCount3,%ArrayCount4)
#DECLARE(%OffSet,Long)
#DECLARE(%FoundQuote,LONG)
     #IF(NOT EXTRACT(%FieldUserOptions,'Name_LL'))
      #SET(%LenField,Len(%Field) - %PrefixLen)
      #SET(%String1,Sub(%Field,%PrefixLen,%LenField + 1))
     #ELSE
      #SET(%String1,Sub(EXTRACT(%FieldUserOptions,'Name_LL'),9,30))
     #ENDIF
     #IF(%LLUseFieldDesc=%True and %FieldDescription)
      #SET(%String1,%FieldDescription)
      #LOOP
       #SET(%FoundQuote,Instring('''',%String1))
       #IF(%FoundQuote)
        #SET(%String1,Sub(%String1,1,%FoundQuote - 1) & Sub(%String1,%FoundQuote+1,Len(%String1) - %FoundQuote))
       #ELSE
        #BREAK
       #ENDIF
      #ENDLOOP
     #ENDIF
     #FOR(%LLOverrideFields)
       #IF(%LLOverrideField = %Field)
        #IF(%LLRemoveRename = 'Rename')
         #SET(%String1,%LLRenameTo)
        #ENDIF
       #ENDIF
     #ENDFOR
     #IF(SUB(%String1,Len(Clip(%String1)),1) = ')')
      #SET(%String1,SUB(%String1,1,Len(Clip(%String1)) - 1))
     #ENDIF
     #IF(%Target32)
      #IF(%ArrayCount2 > 0)
          LL_String1 = '%LLFileName' & '.' & '%String1' & '.' & '%String1_%ArrayCount_%ArrayCount2'
      #ELSIF(%ArrayCount > 0)
          LL_String1 = '%LLFileName' & '.' & '%String1' & '.' & '%String1_%ArrayCount'
      #ELSE
          LL_String1 = '%LLFileName' & '.' & '%String1'
      #ENDIF
     #ELSE
      #IF(%ArrayCount2 > 0)
          LL_String1 = '%String1' & '.' & '%String1_%ArrayCount_%ArrayCount2'
      #ELSIF(%ArrayCount > 0)
          LL_String1 = '%String1' & '.' & '%String1_%ArrayCount'
      #ELSE
          LL_String1 = '%String1'
      #ENDIF
     #ENDIF
     #IF(%FieldType='BLOB')
          LL_Blob &= %Field{Prop:Handle}
          LL_String2_Size = %Field{Prop:Size}
          LL_String2 &= NEW(CSTRING(LL_String2_Size+1))
          LL_String2 = ''
          LL_String2[1:LL_String2_Size] = %Field[0:LL_String2_Size-1]
     #ELSE
        #IF(%FieldType='STRING' or %FieldType='CSTRING' or %FieldType='PSTRING' or %FieldType='MEMO')
          LL_String2_Size = SIZE(%Field)
        #ELSE
          LL_String2_Size = 128
        #ENDIF
          LL_String2 &= NEW(CSTRING(LL_String2_Size+1))
          LL_String2 = ''
       #IF(Sub(Upper(%FieldDisplayPicture),2,1) = 'D' or %FieldType='DATE')
         #IF(%ArrayCount > 0 or %ArrayCount2 > 0 or %ArrayCount3 > 0 or %ArrayCount4 > 0)   #!If it is a date and an array
            #IF(EXTRACT(%FieldUserOptions,'DateOffSet_LL',1))
              #SET(%OffSet,EXTRACT(%FieldUserOptions,'DateOffSet_LL',1))
            #ELSE
              #SET(%OffSet,2378857)
            #ENDIF
        #IF(%ArrayCount > 0 and %ArrayCount2 = 0)
          If %Field[%ArrayCount] > 0 then
            LL_String2 = %Field[%ArrayCount] + %OffSet
          else
            LL_String2 = 0      !This one
          end
        #ENDIF
        #IF(%ArrayCount > 0 and %ArrayCount2 = 0)
          If %Field[%ArrayCount] > 0 then
            LL_String2 = %Field[%ArrayCount] + %OffSet
          else
            LL_String2 = 0      !This one
          end
        #ELSIF(%ArrayCount2 > 0 and %ArrayCount3 = 0)
          If %Field[%ArrayCount,%ArrayCount2] > 0 then
            LL_String2 = %Field[%ArrayCount,%ArrayCount2] + %OffSet
          else
            LL_String2 = 0      !This one
          end
        #ELSIF(%ArrayCount3 > 0 and %ArrayCount4 = 0)
          If %Field[%ArrayCount,%ArrayCount2,%ArrayCount3] > 0 then
            LL_String2 = %Field[%ArrayCount,%ArrayCount2,%ArrayCount3] + %OffSet
          else
            LL_String2 = 0      !This one
          end
        #ELSIF(%ArrayCount4 > 0)
          If %Field[%ArrayCount,%ArrayCount2,%ArrayCount3,%ArrayCount4] > 0 then
            LL_String2 = %Field[%ArrayCount,%ArrayCount2,%ArrayCount3,%ArrayCount4] + %OffSet
          else
            LL_String2 = 0      !This one
          end
         #ENDIF
         #ELSE                                               #!IOtherwise it is just a date field - no array
          If %Field > 0 then
            #IF(EXTRACT(%FieldUserOptions,'DateOffSet_LL',1))
            #SET(%OffSet,EXTRACT(%FieldUserOptions,'DateOffSet_LL',1))
            LL_String2 = %Field[%ArrayCount] + %OffSet
            #ELSE
            LL_String2 = %Field + 2378857
            #ENDIF
          else
            LL_String2 = '1e1000'
          end
         #ENDIF
       #ELSIF (Sub(Upper(%FieldDisplayPicture),2,1) = 'T' or %FieldType='TIME')
         #IF(%ArrayCount > 0 or %ArrayCount2 > 0 or %ArrayCount3 > 0 or %ArrayCount4 > 0)   #!If it is a time and an array
            #IF(EXTRACT(%FieldUserOptions,'TimeOffSet_LL',1))
              #SET(%OffSet,EXTRACT(%FieldUserOptions,'TimeOffSet_LL',1))
            #ELSE
              #SET(%OffSet,8640000)
            #ENDIF
        #IF(%ArrayCount > 0 and %ArrayCount2 = 0)
          If %Field[%ArrayCount] > 0 then
            LL_String2 = %Field[%ArrayCount] + %OffSet
          else
            LL_String2 = 0      !This one
          end
        #ENDIF
        #IF(%ArrayCount > 0 and %ArrayCount2 = 0)
          If %Field[%ArrayCount] > 0 then
            LL_String2 = %Field[%ArrayCount] + %OffSet
          else
            LL_String2 = 0      !This one
          end
        #ELSIF(%ArrayCount2 > 0 and %ArrayCount3 = 0)
          If %Field[%ArrayCount,%ArrayCount2] > 0 then
            LL_String2 = %Field[%ArrayCount,%ArrayCount2] + %OffSet
          else
            LL_String2 = 0      !This one
          end
        #ELSIF(%ArrayCount3 > 0 and %ArrayCount4 = 0)
          If %Field[%ArrayCount,%ArrayCount2,%ArrayCount3] > 0 then
            LL_String2 = %Field[%ArrayCount,%ArrayCount2,%ArrayCount3] + %OffSet
          else
            LL_String2 = 0      !This one
          end
        #ELSIF(%ArrayCount4 > 0)
          If %Field[%ArrayCount,%ArrayCount2,%ArrayCount3,%ArrayCount4] > 0 then
            LL_String2 = %Field[%ArrayCount,%ArrayCount2,%ArrayCount3,%ArrayCount4] + %OffSet
          else
            LL_String2 = 0      !This one
          end
         #ENDIF
         #ELSE                                               #!IOtherwise it is just a time field - no array
           If %Field > 0 then
            LL_String2 = %Field / 8640000
          else
            LL_String2 = 0
          end
         #ENDIF
       #ELSE
         #IF(%ArrayCount > 0 and %ArrayCount2 = 0)
          LL_String2 = %Field[%ArrayCount]
         #ELSIF(%ArrayCount2 > 0 and %ArrayCount3 = 0)
          LL_String2 = %Field[%ArrayCount,%ArrayCount2]
         #ELSIF(%ArrayCount3 > 0 and %ArrayCount4 = 0)
          LL_String2 = %Field[%ArrayCount,%ArrayCount2,%ArrayCount3]
         #ELSIF(%ArrayCount4 > 0)
          LL_String2 = %Field[%ArrayCount,%ArrayCount2,%ArrayCount3,%ArrayCount4]
         #ELSE
          LL_String2 = %Field
         #ENDIF
       #ENDIF
     #ENDIF
    #INSERT(%FieldTypes)
          Do SendVarsToListAndLabel
          DISPOSE(LL_String2)

#GROUP(%SendOptions)
    LL_Result = LLSetOption(LL_hJob,LL_Option_SupportPageBreak,%SupportTextPageBreak)
    LL_Result = LLSetOption(LL_hJob,LL_Option_VarsCaseSensitive,%CaseSensitiveVars)
    LL_Result = LLSetOption(LL_hJob,LL_Option_MultipleTableLines,%MultiTableLines)
    LL_Result = LLSetOption(LL_hJob,LL_Option_SortVariables,%SortVars)
    LL_Result = LLSetOption(LL_hJob,LL_Option_ConvertCRLF,%ConvertCRLF)
    LL_Result = LLSetOption(LL_hJob,LL_Option_HelpAvailable,%LLHelpAvailable)
    LL_Result = LLSetOption(LL_hJob,LL_Option_NoParameterCheck,%NoParamCheck)
    LL_Result = LLSetOption(LL_hJob,LL_Option_NoNoTableCheck,%NoTableCheck)
    LL_Result = LLSetOption(LL_hJob,LL_Option_SpaceOptimization,%SpaceOptimize)
    LL_Result = LLSetOption(LL_hJob,LL_Option_DelayTableHeader,%DelayTableHead)
    LL_Result = LLSetOption(LL_hJob,LL_Option_Supervisor,%Supervisor)
    LL_Result = LLSetOption(LL_hJob,LL_OPTION_ALLOW_COMBINED_COLLECTING_OF_DATA_FOR_COLLECTIONCONTROLS,%CombineCollection)
    LL_Result = LLSetOption(LL_hJob,LL_Option_CompressStorage,%LLCompressPreview)
    LL_Result = LLSetOption(LL_hJob,LL_OPTION_SKETCH_COLORDEPTH,32)       !Sketch_Color_Depth
   #IF(%LLVersion='Version 9' or %LLVersion='Version 10' or %LLVersion = 'Version 11' or %LLVersion = 'Version 12' or %LLVersion = 'Version 13' or %LLVersion = 'Version 14' or %LLVersion = 'Version 15' or %LLVersion = 'Version 16' or %LLVersion = 'Version 17' or %LLVersion = 'Version 18' or %LLVersion = 'Version 19' or %LLVersion = 'Version 20' or %LLVersion = 'Version 21' or %LLVersion = 'Version 22' or %LLVersion = 'Version 23' or %LLVersion = 'Version 24' or %LLVersion = 'Version 25' or %LLVersion = 'Version 26' or %LLVersion = 'Version 27' or %LLVersion = 'Version 28' or %LLVersion = 'Version 29')
    LL_Result = LLSetOption(LL_hJob,LL_OPTION_NOFILEVERSIONUPGRADEWARNING,%LLWarnVersion)
   #ENDIF
    LL_Result = LLSetOption(LL_hJob,LL_OPTION_INCREMENTAL_PREVIEW,0)



#GROUP(%PreviewOptions)
    #IF(%PreviewSendTo = %true)
    LL_Result = LLViewerProhibitAction(LL_hJob,115)
    #ENDIF
    #IF(%PreviewSaveAs = %true)
    LL_Result = LLViewerProhibitAction(LL_hJob,116)
    #ENDIF
    #EMBED(%LLAfterSendingPreviewActions,'LL After Sending Previewer Actions')


#Group(%DialogStyle)
  #CASE(%ButtonStyle)
  #OF('Standard Windows Style')
   #SET(%FinalButtonStyle,1)
  #OF('Win95 Button Style')
   #SET(%FinalButtonStyle,9)
  #OF('Flat Buttons')
   #SET(%FinalButtonStyle,10)
  #ENDCASE
  #IF(%ButtonThreeDee = %True)
   #SET(%FinalButtonStyle,%FinalButtonStyle + 32768)
  #ENDIF
  #IF(%ToolTips = %True)
   #SET(%FinalButtonStyle,%FinalButtonStyle + 2048)
  #ENDIF
  #IF(%NoBitMaps = %True)
   #SET(%FinalButtonStyle,%FinalButtonStyle + 8192)
  #ENDIF
 

#Group(%SetLanguage)
  #CASE(%Language)
  #OF('English')
    #SET(%WhichLanguage,1)
  #OF('German')
    #SET(%WhichLanguage,0)
  #OF('Greek')
    #SET(%WhichLanguage,19)
  #OF('French')
    #SET(%WhichLanguage,18)
  #OF('Catalan')
    #SET(%WhichLanguage,8)
  #OF('Danish')
    #SET(%WhichLanguage,12)
  #OF('Dutch')
    #SET(%WhichLanguage,13)
  #OF('Hungarian')
    #SET(%WhichLanguage,21)
  #OF('Italian')
    #SET(%WhichLanguage,24)
  #OF('Norwegian')
    #SET(%WhichLanguage,29)
  #OF('Portuguese')
    #SET(%WhichLanguage,31)
  #OF('Spanish')
    #SET(%WhichLanguage,37)
  #OF('Swedish')
    #SET(%WhichLanguage,38)
  #ENDCASE


#Group(%DummyWindow)
LLWindow WINDOW,AT(,,1,1),FONT('MS Sans Serif',8,,FONT:regular),CENTER,GRAY,MAXIMIZE,NOFRAME
     END


#GROUP(%Flags)
  LL_String2_Size = 128
  LL_String2 &= NEW(CSTRING(LL_String2_Size+1))
  LL_String2 = ''
  LL_String1 = 'Flags.PageOverFlow'
  LL_String2 = LL_PageOverflow
  LL_FieldType = LL_Numeric
  Do SendVarsToListAndLabel
  DISPOSE(LL_String2)

  LL_String2_Size = 128
  LL_String2 &= NEW(CSTRING(LL_String2_Size+1))
  LL_String2 = ''
  LL_String1 = 'Flags.PageType'
  LL_String2 = LLPages#
  LL_FieldType = LL_Numeric
  Do SendVarsToListAndLabel
  DISPOSE(LL_String2)

#GROUP(%StandardTabs)
  #TAB('Files to Send')
    #DISPLAY('')
    #DISPLAY('You need to tell List && Label which files are to be made')
    #DISPLAY('available.')
    #DISPLAY('Enter all files here which will be sent to List && Label')
    #DISPLAY('')
    #BUTTON('&Select Files to send to List && Label'),MULTI(%RepFiles,%RepFileName & '  -  ' & %RepUsage),INLINE
    #PROMPT('File:',FILE),%RepFileName,REQ
    #PROMPT('Usage:',DROP('Variables|Fields|Both')),%RepUsage,Default('Both')
    #ENDBUTTON
    #DISPLAY()
    #DISPLAY('By default, the two control files LL_Replay and LL_RepArea are not made available to users for reporting. You may however, override this'),At(10,,180,30)
    #PROMPT('Make file LL_Replay available',Check),%LLSendReplay,at(10)
    #PROMPT('Make file LL_RepArea available',Check),%LLSendRepArea,at(10)
    #BOXED('')
      #DISPLAY('REMEMBER:- You MUST have LL_RepLay and')
      #DISPLAY('LL_RepArea in your file schematic!'),at(58)
    #ENDBOXED
  #ENDTAB
  #TAB('&Select Report Layout')
   #DISPLAY('')
   #PROMPT('Runtime Select of Layout or Direct call',OPTION),%RunDirect
   #PROMPT('Runtime Selection',RADIO)
   #PROMPT('Use Variable to Determine Default',RADIO)
   #ENABLE(%RunDirect = 'Runtime Selection')
   #DISPLAY('Please select the procedure that you will use to')
   #DISPLAY('select a report layout.')
   #DISPLAY('')
   #PROMPT('Layout Selection Proc:',Procedure),%RepLayProc,Default(%DefaultProc)
   #DISPLAY('')
   #PROMPT('Report Area Value',@s255),%Params,REQ
   #ENDENABLE
   #ENABLE(%RunDirect = 'Use Variable to Determine Default')
   #DISPLAY('')
   #DISPLAY('')
   #DISPLAY('Enter the Variable which holds the primary value')
   #DISPLAY('to look up LLL_:Ref')
   #PROMPT('Primary Variable: ',Field),%PrimaryValue,REQ
   #BUTTON('Notes on Primary Variables'),at(50,,130)
     #DISPLAY('If you are using a runtime variable to determine the layout to use, then you must declare a variable (LONG) which you must populate in your embed code, to hold the value of LLL_:Ref so that the correct layout can be retrieved before the printing starts.'),at(,,160,50)
   #ENDBUTTON
   #PROMPT('Variable for Output option: ',FIELD),%PreviewOpt
   #BUTTON('Notes on Preview and Export Options'),at(50,,130)
    #DISPLAY('If you are using a runtime variable to determine the layout to use, then you must also populate a variable (BYTE) in your embed code, with the type of output that you require'),at(,,160,35)
    #DISPLAY('The values are:-')
    #DISPLAY('  2 - Preview')
    #DISPLAY('  3 - Printer')
    #DISPLAY('  4 - RTF')
    #DISPLAY('  5 - HTML')
    #DISPLAY('  6 - JPEG')
    #DISPLAY('  7 - EMF')
    #DISPLAY('  8 - BMP')
    #DISPLAY('  9 - PDF')
    #DISPLAY('  10 - MHTML')
    #DISPLAY('  11 - XML')
    #DISPLAY('  12 - XLS (Excel - Versions 9 & 10 only)')
    #DISPLAY('  13 - TXT (Text - Versions 9 & 10 only)')
    #DISPLAY('  14 - MS Fax (Where installed)')
    #DISPLAY
    #DISPLAY('For example, if you are using a variable called LLRTOutput, and you wanted to output to RTF then you would put'),at(,,160,30)
    #DISPLAY('   LLRTOutput = 4')
    #DISPLAY('')
    #DISPLAY('at the start of your procedure.  If you are exporting the report to a file, you MUST also populate the fields LL_OutPutDir and LL_OutputFile'),At(10,,180,30)
   #ENDBUTTON
   #PROMPT('Variable for Printer options: ',FIELD),%PrinterOpt
   #BUTTON('Notes on Printer Options'),at(50,,130)
    #DISPLAY('If you are using a runtime variable to determine the layout to use, then you may also declare a variable (BYTE) which is a flag to indicate if the printer options screen is to appear before the print is started.  This will allow the users to select printers, start at specific labels on a sheet etc.'),at(,,160,50)
    #DISPLAY('Setting this variable to TRUE will cause the printer options to appear before printing starts, whilst setting the variable to FALSE will mean that printing will start without the options window appearing'),at(,,160,50)
   #ENDBUTTON
   #ENDENABLE
   #DISPLAY('')
  #ENDTAB
  #TAB('Define Manual Fields')
   #DISPLAY('')
   #DISPLAY('In this section you may define a variable which you wish')
   #DISPLAY('to include in List && Label.  These fields may be functions')
   #DISPLAY('such as Today() or Clock() or any valid Clarion expression')
   #DISPLAY('')
   #BUTTON('Manual &fields'),MULTI(%RepManFields,%RepManFieldName & ' (' & %RepManFieldType & ') - ' & %RepManFileField),INLINE
    #PROMPT('Field &name:',@S60),%RepManFieldName,REQ
    #PROMPT('Field &type:',DROP('String|Numeric|Boolean|Date|TIME|RTF|HTML|Drawing|Barcode')),%RepManFieldType
    #PROMPT('&Expression/Field:',EXPR),%RepManFileField
    #PROMPT('Field &format:',@S60),%RepManFieldFormat
    #BOXED(''),HIDE
    #PROMPT('Condition (Opt): ',@S255),%ManCondition
    #ENDBOXED
   #ENDBUTTON
  #ENDTAB
  #TAB('Binding Fields')
   #DISPLAY('')
   #DISPLAY('Any fields that are used in Clarion expressions must')
   #DISPLAY('be BINDed.  You can do this yourself in the embeded')
   #DISPLAY('code or add the fields here')
   #DISPLAY('')
   #BUTTON('Fields/Procs to BIND'),MULTI(%Binds,%Binder),INLINE
    #DISPLAY('')
    #PROMPT('Fields/Procs to BIND',@s30),%Binder,REQ
   #ENDBUTTON
  #ENDTAB
  #TAB('Page breaks')
    #DISPLAY
    #BOXED('Style of Report')
    #PROMPT('Is this an Invoice type of Report?',Check),%InvoiceStyle,AT(10)
    #ENABLE(%InvoiceStyle = %TRUE)
    #DISPLAY('Enter the field that determines to start printing a new')
    #DISPLAY('invoice')
    #PROMPT('Field to watch: ', FIELD),%BreakField,REQ
    #PROMPT('Reset Page Numbers after each invoice?',check),%ResetPageNumbers,at(10)
    #ENDENABLE
    #ENDBOXED
    #DISPLAY()
    #DISPLAY('Enter any other fields which will force a page break'),At(,,180,20)
    #BUTTON('Page Break Fields'),MULTI(%LLOtherBreakFields,%LLOtherBreakField),INLINE,at(,,,60)
    #PROMPT('Field:',Field),%LLOtherBreakField,REQ
    #DISPLAY('')
    #DISPLAY('You may also add an optional condition for this page break to happen.  This can be any valid Clarion Statement.  e.g.'),at(,,170,30)
    #DISPLAY('BRW1::View:Browse{{Prop:Order}} = ''CHI:House''')
    #PROMPT('Optional Condition',@S255),%LLPageBreakCondition
    #ENDBUTTON
    #DISPLAY('')
    #DISPLAY('Enter any expressions which will force a page break when expression returns true.'),At(,,180,20)
    #BUTTON('Expressions'),MULTI(%LLBreakExpressions,%LLBreakExpression),INLINE,at(,,,60)
    #PROMPT('Expression:',@S255),%LLBreakExpression,REQ
    #ENDBUTTON
    #DISPLAY('')
    #BUTTON('Setting page breaks in embed code'),AT(,,170)
    #DISPLAY('There is an embed called:-')
    #DISPLAY('')
    #DISPLAY('"Set up custom page break"')
    #DISPLAY('')
    #DISPLAY('Where you may enter code to set the local variable LL_PageBreak = TRUE.  Setting this variable to TRUE will cause List && Label to preform an immediate page break at that point. It will automatically be set back to false for the next line of data to be sent to List && Label'),at(,,170,60)
    #ENDBUTTON
  #EndTab
  #TAB('Suppress Children')
  #DISPLAY('')
   #DISPLAY('If you wish this report to be able to output to Labels and Cards as well as Lists WITHOUT child records causing multiple occurances of the Label or Card, then switch this checkbox on, and only the first record for a Parent/Chid relationship will be printed when a Label or Card is selected'),at(,,170,60)
   #Prompt('Suppress Child Records',CHECK),%SupressChild,at(10)
   #ENABLE(%SupressChild=%True)
   #Display
   #DISPLAY('You must now select the field which will uniquely identify the parent record.  Labels and Cards will only be printed when this field changes'),at(,,170,40)
   #Prompt('Unique Parent Identifier',Field),%LLParentID,REQ
   #ENDENABLE
  #ENDTAB
  #TAB('Printer Selection')
   #DISPLAY('')
   #DISPLAY('The printer definition file can be re-created every time a report is run.  This will ensure that the correct printer driver is used for each report.  It is advisable to have this option switched on to ensure compatibilities between different printer drivers.  This will be ignored if a variable is entered below and has a value assigned to it'),at(,,170,60)
   #Prompt('Create printer file for every report',Check),%RecreateDriver,Default(%True),at(10)
   #DISPLAY('')
   #DISPLAY('You may wish to select a different printer to print to, which may require different drivers.  You may select a variable which will hold the name of this printer, which will then automatically update the List && Label printer file with the correct driver for that printer.  Populating this variable with a valid printer name will also send the output to that printer if the user opts to output to printer'),at(,,170,65)
   #PROMPT('Variable to hold printer name',Field),%LLPrinterName
  #ENDTAB
  #TAB('Progress Options')
   #DISPLAY('')
   #PROMPT('Type of Progress: ',DROP('Clarion Progress Bar|Abort, bar meter & text|Abort, bridge meter & text|Abort & text|Bar meter & text|Bridge meter & text|Text Only|No Progress Window')),%ProgressType,Default(%DefaultProgressType),at(75,,110)
   #ENABLE(%ProgressType <> 'Clarion Progress Bar' and %ProgressType <> 'No Progress Window'),CLEAR
   #DISPLAY
   #DISPLAY('You may display static text in the progress box or')
   #DISPLAY('change the text as each record is printed')
   #DISPLAY('To do this simply enter a valid Clarion expression')
   #DISPLAY
   #PROMPT('Static or Dynamic Text',Option),%ProgressTextType
   #PROMPT('Static Text',Radio)
   #PROMPT('Dynamic Text',Radio)
   #ENABLE(%ProgressTextType = 'Static Text')
   #PROMPT('Static Text: ',@s255),%PrintText,at(75,102,105)
   #BUTTON('...'),At(182,102,10,10)
    #PROMPT('Static text ',Text),%PrintText
   #ENDBUTTON
   #ENDENABLE
   #ENABLE(%ProgressTextType = 'Dynamic Text')
   #PROMPT('Dynamic Expression',@s255),%DynamicText,at(75,,105)
   #BUTTON('...'),At(182,,10,10)
    #PROMPT('Dynamic Expression',Text),%DynamicText
   #ENDBUTTON
   #ENDENABLE
   #ENDENABLE
   #DISPLAY('')
   #DISPLAY('In order to give an accurate progress display , the template needs to know in advance how many records there are to print.  This can be done in two ways.  One way is to let the templates run through the list beforehand which will be 100% accurate, but can slow down the process, or supply your own figure.  Leave as 0 to let to templates calcuate the number'),at(,,170,60)
   #DISPLAY('REMEMBER to preceed a variable with !')
   #PROMPT('Approx number of records',EXPR),%ApproxToPrint,Default(0)
  #ENDTAB
  #TAB('Error Message')
   #DISPLAY('')
   #PROMPT('Process Errors from List && Label on open ',CHECK),%OpenError,default(%true),at(10)
   #ENABLE(%OpenError = %True),CLEAR
    #DISPLAY('')
    #PROMPT('Processing the List && Label error',OPTION),%ProcessError,default('Display message')
    #PROMPT('Call a procedure ',RADIO)
    #PROMPT('Display message',RADIO)
    #DISPLAY('')
    #DISPLAY('Please note:-  The local variable LL_Result holds any')
    #DISPLAY('error codes generated by List && Label')
    #DISPLAY('')
    #ENABLE(%ProcessError = 'Call a procedure'),CLEAR
     #PROMPT('Procedure to call:',PROCEDURE),%ErrorProc,REQ
     #PROMPT('Parameters:',@S80),%ErrorParams
    #ENDENABLE
    #DISPLAY('')
    #ENABLE(%ProcessError = 'Display message')
    #DISPLAY('Please remember to enclose text in quotes')
    #PROMPT('Text for Error: ',@S255),%ErrorText,REQ,Default('''Error when opening report was '' & LL_Result'),at(65,,115)
    #BUTTON('...'),At(182,,10,10)
      #PROMPT('Text for Error:',Text),%ErrorText
    #ENDBUTTON
    #ENDENABLE
   #ENDENABLE
  #ENDTAB
  #TAB('Options')
   #DISPLAY('')
   #DISPLAY('The function in brackets refers to the List && Label')
   #DISPLAY('function call that the option is a parameter of.')
   #DISPLAY('')
   #BOXED('General')
    #PROMPT('Support Text Page Breaks (LlSetOption)',CHECK),%SupportTextPageBreak,Default(%DefSupportTextPageBreak),at(10)
    #PROMPT('Case Sensitive Variables (LlSetOption)',CHECK),%CaseSensitiveVars,Default(%DefCaseSensitiveVars),at(10)
    #PROMPT('Multiple Table lines (LlSetOption)',CHECK),%MultiTableLines,Default(%DefMultiTableLines),at(10)
    #PROMPT('Sort Variables (LlSetOption)',CHECK),%SortVars,Default(%DefSortVars),at(10)
    #PROMPT('Convert CF/LF to LF (LlSetOption)',CHECK),%ConvertCRLF,Default(%DefConvertCRLF),at(10)
    #PROMPT('List && Label Help Available (LlSetOption)',CHECK),%LLHelpAvailable,Default(%DefLLHelpAvailable),at(10)
    #PROMPT('No Parameter Checking (LlSetOption)',CHECK),%NoParamCheck,Default(%DefNoParamCheck),at(10)
    #PROMPT('No Table Checking (LlSetOption)',CHECK),%NoTableCheck,Default(%DefNoTableCheck),at(10)
    #PROMPT('Space Optimization (LlSetOption)',CHECK),%SpaceOptimize,Default(%DefSpaceOptimize),at(10)
    #PROMPT('Delay Table Header (LlSetOption)',CHECK),%DelayTableHead,Default(%DefDelayTableHead),at(10)
    #PROMPT('Supervisor Option (LlSetOption)',CHECK),%Supervisor,Default(%DefSupervisor),at(10)
    #PROMPT('Combine Collection of Data for Collection Controls (LlSetOption)',CHECK),%CombineCollection,Default(%DefCombineCollection),at(10)
    #BOXED('Debug')
    #PROMPT('List && Label Debug (LlSetDebug)',CHECK),%Debugmode,At(10)
    #ENDBOXED
    #DISPLAY
    #PROMPT('Wrap Calls to L&&L APIs in Lockthread()',CHECK),%WrapCallsLockThread,at(10)
   #ENDBOXED
   #ENDTAB
   #TAB('Preview Options')
     #PROMPT('Do NOT Use List && Label Previewer',CHECK),%NotUseLLPreviewer,at(10),Default(%DefaultNotUseLLPreviewer)
     #ENABLE(%NotUseLLPreviewer = %True)
     #PROMPT('Previewer Procedure: ',Procedure),%LLPreviewProcedure,Default(%DefaultLLPreviewProcedure)
     #ENDENABLE
     #ENABLE(%NotUseLLPreviewer = %False)
     #DISPLAY('')
     #BOXED('Preview Options')
      #PROMPT('Remove "Send To" Button (LlViewerProhibitAction)',CHECK),%PreviewSendTo,Default(%DefPreviewSendTo),at(10)
      #PROMPT('Remove "Save As" Button (LlViewerProhibitAction)',CHECK),%PreviewSaveAs,Default(%DefPreviewSaveAs),at(10)
     #ENDBOXED
     #ENDENABLE
   #ENDTAB
   #TAB('Export Options')
   #BOXED('PDF')
   #DISPLAY('By default, RTF text is stored in PDF files as pictures which will create a large file.  You may export RTF text as unformatted text which will reduce the size of the file'),at(,,170,35)
   #PROMPT('Export RTF as unformated Text',check),%RTFPlainInPDF,at(10)
   #ENDBOXED
   #BOXED('HTML')
   #DISPLAY('By Default, every printed page will be exported into a single HTML file.  You may override this so that each page is generated into its own file.  Each file (except the first file) will be enumerated'),at(,,170,35)
   #PROMPT('Generated individual files for each page',check),%HTMLOneFilePerPage,at(10)
   #ENDBOXED
   #DISPLAY('')
   #DISPLAY('A Queue (LLExportFilesQ) has been added to your Local Data which will hold the names of all files that are generated by the exported report.  These files will NOT be deleted after the report has completed'),at(,,170,35)
   #DISPLAY('If a report has been emailed, the files that are created may be automatically deleted from the directory after they have been added to the email.  You may select a variable which, when set to true will automatically delete the files.  If no variable is selected, the files will not be deleted'),at(,,170,48)
   #PROMPT('Variable to delete files',Field),%LLAutoDeleteExportedFiles
   #ENDTAB
   #TAB('Faxing'),Where(%LLVersion='Version 9' or %LLVersion='Version 10' or %LLVersion = 'Version 11' or %LLVersion = 'Version 12' or %LLVersion = 'Version 13' or %LLVersion = 'Version 14' or %LLVersion = 'Version 15' or %LLVersion = 'Version 16' or %LLVersion = 'Version 17' or %LLVersion = 'Version 18' or %LLVersion = 'Version 19' or %LLVersion = 'Version 20' or %LLVersion = 'Version 21' or %LLVersion = 'Version 22' or %LLVersion = 'Version 23' or %LLVersion = 'Version 24' or %LLVersion = 'Version 25' or %LLVersion = 'Version 26' or %LLVersion = 'Version 27' or %LLVersion = 'Version 28' or %LLVersion = 'Version 29')
     #DISPLAY('Please note that fax support is available when faxing is loaded on the end user machine'),at(,,180,20)
     #DISPLAY('')
     #DISPLAY('Only one fax recipient can be specified per report')
     #DISPLAY('')
     #PROMPT('Enable Fax Support',Check),%AllowFaxing,at(10)
     #ENABLE(%AllowFaxing=%True)
       #DISPLAY('Select Varaibles (CStrings) which will hold the following information'),at(,,180,20)
       #PROMPT('Recipient Name (Opt)',Field),%FaxRecipName
       #PROMPT('Recipient Number',Field),%FaxRecipNumber,Req
       #PROMPT('Sender Name (Opt)',Field),%FaxSenderName
       #PROMPT('Sender Company (Opt)',Field),%FaxSenderCompany
       #PROMPT('Sender Department (Opt)',Field),%FaxSenderDept
       #PROMPT('Sender Billing Code (Opt)',Field),%FaxSenderBillingCode
     #ENDENABLE
   #ENDTAB
   #TAB('EMail'),Where(%LLVersion<>'Version 7' and %LLVersion<>'Version 6')
     #DISPLAY('Please note that email is only available for exported file formats'),at(,,180,20)
     #DISPLAY('')
     #DISPLAY('Emailing an exported report is achieved by setting a built in variable to true and populating a built in queue with the details of recipients'),at(,,180,30)
     #DISPLAY('Provided that the variable LLEMailReport is set to true and the Queue LLEMailQueue has one or more records, then the exported reports will be sent to the recipients in the queue'),at(,,180,35)
     #DISPLAY('The structure of the Queue is:-')
     #DISPLAY('   LLEMailQueue      QUEUE,PRE(LLQ_)')
     #DISPLAY('   LLMailTo                  CString(225)')
     #DISPLAY('   LLMailCC                  CString(255)')
     #DISPLAY('   LLMailBCC                CString(255)')
     #DISPLAY('END'),at(80)
     #DISPLAY('')
     #DISPLAY('Two extra fields can also be populated.  These are:-')
     #DISPLAY('LLSubject           !The Subject line of the email')
     #DISPLAY('LLBody               !The Body/Text of the email')
     #DISPLAY('')
     #BUTTON('Program Example'),At(50)
       #DISPLAY('')
       #DISPLAY('At the start of your procedure:-')
       #DISPLAY('')
       #DISPLAY('LLEMailReport = True        !Set flag to send email')
       #DISPLAY('Free(LLEMailQueue)          !Remove any previous recipients')
       #DISPLAY('LLQ_:LLMailTo = ''info@combit.net''')
       #DISPLAY('LLQ_:LLMailCC = ''''')
       #DISPLAY('LLQ_:LLMailBCC = ''''')
       #DISPLAY('Add(LLEMailQueue)')
       #DISPLAY('LLSubject = ''List and Label Test from Clarion''')
       #DISPLAY('LLBody = ''This is a List and Label export test from Clarion''')
       #DISPLAY('')
       #DISPLAY('')
     #ENDBUTTON
   #ENDTAB

#Group(%LLDefineVars)
LL_DefineVariables         ROUTINE
 #DECLARE(%CallRoutine)
 #EMBED(%LLStartDefineVar,'Begin List and Label Define Variables Routine')
 #FOR(%RepFiles)
   #IF(%RepFileName = 'LL_RepArea' and %LLSendRepArea=%False)
     #CYCLE
   #ENDIF
   #IF(%RepFileName = 'LL_RepLay' and %LLSendReplay=%False)
     #CYCLE
   #ENDIF
  #SET(%CallRoutine,'Send_' & %RepFileName & '_To_LL')
  do %CallRoutine
 #ENDFOR
 #EMBED(%LLEndDefineVar,'End List and Label Define Variables Routine')

#GROUP(%PopulateEmail)
 #EMBED(%LLBeforePopulateEmail,'LL Before populatinging Email from queue')
 If Records(LLEMailQueue) then
   Clear(LLFullMailTo)
   Clear(LLFullMailCC)
   Clear(LLFullMailBCC)
   Loop LLMailToRec# = 1 to Records(LLEMailQueue)
     Get(LLEMailQueue,LLMailToRec#)
     if Len(LLFullMailTo) > 0 then
       LLFullMailTo = LLFullMailTo & ';'
     end
     LLFullMailTo = LLFullMailTo & LLQ_:LLMailTo

     if Len(LLFullMailCC) > 0 then
       LLFullMailCC = LLFullMailCC & ';'
     end
     LLFullMailCC = LLFullMailCC & LLQ_:LLMailCC

     if Len(LLFullMailBCC) > 0 then
       LLFullMailBCC = LLFullMailBCC & ';'
     end
     LLFullMailBCC = LLFullMailBCC & LLQ_:LLMailBCC
   end
 end
 #EMBED(%LLAfterPopulateEmail,'LL After populatinging Email from queue')


#GROUP(%PrintOutToLL)
PrintOutToLL        Routine
    #IF(%SupressChild=%True)
      If LL_ReportType <> 2 then                            !This is a Card or Label
        If LL_SavedParent = %LLParentID then
          exit
        end
        LL_SavedParent = %LLParentID
      end
    #END
    DO LL_DefineVariables
    DO LL_DefineManualVariables
    #EMBED(%LLBeforePrint,'Before Sending Print to List & Label')
    if SOL_Pages = 0 then
      SOL_Pages = 1
    end
    CASE LL_ReportType
    OF LL_Project_List
      LL_PageBreak = false
    #IF(%InvoiceStyle=%TRUE)
      if LL_InvoiceBreak <> %BreakField then
        LL_PageBreak = true
      end
      LL_InvoiceBreak = %BreakField
    #ENDIF
    #FOR(%LLOtherBreakFields)
      IF %LLOtherBreakField <> %LLDeclareLocBreakField and (Clip(%LLDeclareLocBreakField) <> '' or %LLDeclareLocBreakField <> 0) then
      #IF(%LLPageBreakCondition)
        If %LLPageBreakCondition then
        #INDENT(2)
      #ENDIF
        LL_PageBreak = true
        LL_Result = LlPrintResetProjectState(LL_hJob)
      #IF(%LLPageBreakCondition)
        #INDENT(-2)
        end
      #ENDIF
      end
      %LLDeclareLocBreakField = %LLOtherBreakField
    #ENDFOR
      #EMBED(%LLCustombreak,'Set up custom page break')
      if LL_PageBreak = true then
        #EMBED(%LLBeforebreak,'Before Sending page break on break field')
        #IF(%WrapCallsLockThread=%TRUE)
        #IF(%LLNonMDI=%False)
        UnlockThread()
        #ENDIF
        #ENDIF
        LL_Result = llPrint(LL_hJob)
        #IF(%WrapCallsLockThread=%TRUE)
        #IF(%LLNonMDI=%False)
        LockThread()
        #ENDIF
        #ENDIF
      end
      #EMBED(%LLListBeforeLoop,'List & Label - Printing List - Before print Loop')
      !if LL_PageBreak = false then
        Loop LLPages# = 1 to SOL_Pages
          Loop
            if llPrintFields(LL_hJob) <> LL_WRN_REPEAT_DATA then
              Break
            else
              #EMBED(%LLListRepeatData,'List & Label - Printing List - Data overflows page overflow')
            end
            #EMBED(%LLListBeforePrintPage,'List & Label - Printing List - Before Printing Page')
            #IF(%WrapCallsLockThread=%TRUE)
            #IF(%LLNonMDI=%False)
            UnlockThread()
            #ENDIF
            #ENDIF
            LL_Result = llPrint(LL_hJob)
            #IF(%WrapCallsLockThread=%TRUE)
            #IF(%LLNonMDI=%False)
            LockThread()
            #ENDIF
            #ENDIF
          END
        end
      !end

    OF LL_Project_Card
      Loop LLPages# = 1 to SOL_Pages
        LL_PageOverflow = 0
        Loop
          #INSERT(%Flags)
          #IF(%WrapCallsLockThread=%TRUE)
          #IF(%LLNonMDI=%False)
          UnlockThread()
          #ENDIF
          #ENDIF
          LL_Result = llPrint(LL_hJob)
          #IF(%WrapCallsLockThread=%TRUE)
          #IF(%LLNonMDI=%False)
          LockThread()
          #ENDIF
          #ENDIF
          if LL_Result <> LL_WRN_REPEAT_DATA then
            break
          else
            LL_PageOverflow += 1
            #EMBED(%LLCardRepeatData,'List & Label - Printing Card - Data overflows page')
          end
        end
      end
    OF LL_Project_Label
      #EMBED(%LLSetUpQtyLabels,'Before sending List and Label Report Parameters to Label - Allocate Qty to LL_QtyLabels')
      Loop L# = 1 to LL_QtyLabels
      #EMBED(%LLLabelLoop,'In List & Label Label Loop')
        #IF(%WrapCallsLockThread=%TRUE)
        #IF(%LLNonMDI=%False)
        UnlockThread()
        #ENDIF
        #ENDIF
        LL_Result = llPrint(LL_hJob)
        #IF(%WrapCallsLockThread=%TRUE)
        #IF(%LLNonMDI=%False)
        LockThread()
        #ENDIF
        #ENDIF
      end
    END
     #EMBED(%LLAfterPrint,'After Sending Print to List & Label')

    LL_Printed += 1


#GROUP(%PopulateExportedFiles)
  LL_Result = LLGetOptionString(LL_hJob,LL_OPTIONSTR_EXPORTFILELIST,LL_FilesCreated,10240)
  Free(LLExportFilesQ)
  LL_LastSep# = 1
  LL_NextSep# = 0
  Loop
    LL_NextSep# = Instring(';',LL_FilesCreated,1,LL_LastSep#)
    if LL_NextSep# = 0 then
      LL_NextSep# = Len(LL_FilesCreated) + 1
    end
    LLExpf:Filename = sub(LL_FilesCreated,LL_LastSep#,LL_NextSep# - LL_LastSep#)
    LL_LastSep# = LL_NextSep# + 1
    #IF(%LLAutoDeleteExportedFiles<>'')
    if %LLAutoDeleteExportedFiles = true and LLEMailReport = True then
      Remove(LLExpf:Filename)
    else
      Add(LLExportFilesQ)
    end
    #ELSE
    Add(LLExportFilesQ)
    #ENDIF
    if LL_NextSep# = Len(LL_FilesCreated) + 1 then
      Break
    end
  end
  #EMBED(%LLAfterPopLLExportFilesQ,'After populating List and Label LLExportFilesQ')

#GROUP(%FindQtyToPrint)
  Set(%PrintView)
  LL_TotalRecordsInView = Records(%PrintView)
  if LL_TotalRecordsInView = -1 then                !Cannot tell because a key is in use
    LL_TotalRecordsInView = 0                       !So have to find out manually
    Loop                                            
      Next(%PrintView)
      If error() then
        Break
      end
      #IF(%ActiveTemplateParentInstance>0)
      If %ManagerName.ValidateRecord() = Record:Filtered then
        cycle
      end
      #ENDIF
      #EMBED(%LLCountViewContent,'L&L In Loop counting records in View')
      LL_TotalRecordsInView += 1
    end
  end

#GROUP(%ClarioNetPreview)