#TEMPLATE(SolaceReSort,'Solace ReSort Templates'),FAMILY('ABC')
#HELP('Resort.HLP')
#!*****************************************************************************
#EXTENSION(SolaceResort,'Global Extension for ReSort Templates'),Application
#SHEET,HSCROLL,ADJUST
 #TAB('Global')
  #DISPLAY ('(c) copyright Solace Software Ltd 2001')
  #DISPLAY ('    all rights reserved worldwide.')
  #DISPLAY (' version 2.1   28th Pril 2002')
  #DISPLAY ('')
  #DISPLAY ('simon@solace-software.demon.co.uk')
  #DISPLAY ('http://www.solace-software.demon.co.uk')
  #DISPLAY ('')
  #DISPLAY ('ABC Applications')
  #DISPLAY ('')
  #DISPLAY ('This template will allow end users to specify their')
  #DISPLAY ('own sort orders for browses and reports')
  #DISPLAY ('')
  #PROMPT ('Procedure for setting Sort Order',Procedure),%SortProcedure,Req
 #ENDTAB
#END


#AT(%AfterFileDeclarations),Priority(4000)
#!SortSave             FILE,DRIVER('TOPSPEED'),RECLAIM,PRE(SOL_SS),CREATE,BINDABLE,THREAD
#!RefKey                   KEY(SOL_SS:Ref),NOCASE,OPT
#!ProcNameKey              KEY(SOL_SS:ProcName,SOL_SS:CtrlName),NOCASE,OPT
#!Record                   RECORD,PRE()
#!Ref                         LONG
#!ProcName                    CSTRING(100)
#!CtrlName                    CSTRING(30)
#!                         END
#!                     END
#!
#!SortFields           FILE,DRIVER('TOPSPEED'),PRE(SOL_SF),CREATE,BINDABLE,THREAD
#!RefKey                   KEY(SOL_SF:Ref),NOCASE,OPT
#!SortSaveRefKey           KEY(SOL_SF:Ref,SOL_SF:SortSaveRef),DUP,NOCASE,OPT
#!OrderKey                 KEY(SOL_SF:SortSaveRef,SOL_SF:SortOrder),DUP,NOCASE,OPT
#!Record                   RECORD,PRE()
#!Ref                         LONG
#!FieldName                   STRING(200)
#!SortSaveRef                 LONG
#!SortOrder                   LONG
#!                         END
#!                     END
#ENDAT

#GlobalData
SolaceOrderQ         QUEUE,PRE(SOL_ORD)
FieldToUse           CSTRING(41)
Direction            CSTRING(13)
Order                BYTE
FieldName            CSTRING(21)
OrigPointer          Long
ProcControl          CSTRING(255)
                   END
SolaceAvailQ         QUEUE,PRE(SOL_AVQ)
AvailFields          CSTRING(41)
FileFieldName        CSTRING(21)
                   END
#ENDGlobalData

#!************************************ Browse ABC **********************

#CONTROL(SolaceReSortButton,'Custom Sort a browse'),WINDOW,REQ(SolaceResort),hlp('Adding a Custom Sort button to your Window'),REQ(BrowseBox(ABC))
  CONTROLS
    BUTTON('Custom Sort'),AT(,,66,17),USE(?SolaceReSort),#ORIG(?SolaceReSort),LEFT
    BUTTON('Reset Sort'),AT(,,66,17),USE(?SolaceReSet),#ORIG(?SolaceReSet),LEFT,DISABLE
  END

#BUTTON ('Custom Sort Button Properties'), AT(,, 180)
  #SHEET
    #TAB ('&Files and Fields')
      #BOXED('')
        #PROMPT ('Procedure for setting Sort Order',Procedure),%SortProcname,Req,Default(%SortProcedure)
      #ENDBOXED
      #BOXED (' Files and Fields ')
        #DISPLAY ('')
        #BUTTON('Files to make Available to sort on'), MULTI(%AvailFiles,%AvailFile), INLINE, AT(10)
        #PROMPT ('File:', File), %AvailFile,REQ
        #ENDBUTTON
        #DISPLAY ('')
        #BUTTON ('Fields to override'), MULTI(%FieldsToOverride, %FieldToOverride& '  -  ' & %OverideType),INLINE, AT(10,, 173, 90)
          #PROMPT ('Field to override:', Field), %FieldToOverride, REQ
          #PROMPT ('Type of Control:', Option), %OverideType, REQ
          #PROMPT('Not Available',Radio)
          #PROMPT('Change Description',Radio)
          #ENABLE(%OverideType = 'Change Description')
          #PROMPT('Description to Display',@s40),%OverrideDesc,REQ
          #ENDENABLE
        #ENDBUTTON
      #ENDBOXED
    #ENDTAB
  #ENDSHEET
#ENDBUTTON
#DISPLAY ('')

#DECLARE(%ManagerName)

#ATSTART
  #DECLARE(%SolResortButton)
  #DECLARE(%SolResetButton)
  #DECLARE(%SortStr)
  #FOR(%Control),WHERE(%ControlInstance=%ActiveTemplateInstance)
    #IF(%ControlOriginal='?SolaceReSort')
      #SET(%SolResortButton,%Control)
    #ELSE      #!IF(%ControlOriginal='?SolaceReSet')
      #SET(%SolResetButton,%Control)
    #ENDIF                                       
  #ENDFOR
#ENDAT

#AT(%LocalDataClassData)
%InstancePrefix:SolaceSortStr       CString(255)
SolaceSort                          Byte
#ENDAT



#AT (%ControlEventHandling,%SolResortButton,'Accepted'),PRIORITY(6500)
  #INSERT(%LoadQueue)
  SolaceSort = %ManagerName.AddSortOrder()
  %InstancePrefix:SolaceSortStr = %SortProcedure('','','%Procedure.%ManagerName',2)
  if %InstancePrefix:SolaceSortStr then
    %ManagerName.AppendOrder(%InstancePrefix:SolaceSortStr)
    Case message('Warning - Customised sorting may take a while to complete','Custom Sort',icon:Exclamation,button:ok+Button:Cancel,Button:Ok,1)
    of Button:Ok
      %ManagerName.SetSort(SolaceSort,1)
      Enable(%SolResetButton)
    end
  end
#ENDAT

#AT (%ControlEventHandling,%SolResetButton,'Accepted'),PRIORITY(6500)
  %InstancePrefix:SolaceSortStr = ''
  Disable(%SolResetButton)
  %ManagerName.ResetSort(1)
#ENDAT

#AT( %BrowserMethodCodeSection,%ActiveTemplateParentInstance,'ResetSort'),Priority(1300)
 if %InstancePrefix:SolaceSortStr then
   Setcursor(Cursor:Wait)
   SolRet# = SELF.SetSort(SolaceSort,Force)
   Setcursor()
   Return(SolRet#)
 end
#ENDAT

#!********************************************** Report ABC ******************

#EXTENSION(ReSortReportProcess,'ReSort Report and Process'),Procedure,hlp('Report')
#SHEET
#TAB('General')
        #BOXED('')
          #PROMPT ('Procedure for setting Sort Order',Procedure),%ReportSortProc,Req,Default(%SortProcedure)
        #ENDBOXED
        #BOXED (' Files and Fields ')
        #DISPLAY ('')
        #BUTTON('Files to make Available to sort on'), MULTI(%AvailFiles,%AvailFile), INLINE, AT(10)
        #PROMPT ('File:', File), %AvailFile,REQ
        #ENDBUTTON
        #DISPLAY ('')
        #BUTTON ('Fields to override'), MULTI(%FieldsToOverride, %FieldToOverride& '  -  ' & %OverideType),INLINE, AT(10,, 173, 90)
          #PROMPT ('Field to override:', Field), %FieldToOverride, REQ
          #PROMPT ('Type of Control:', Option), %OverideType, REQ
          #PROMPT('Not Available',Radio)
          #PROMPT('Change Description',Radio)
          #ENABLE(%OverideType = 'Change Description')
          #PROMPT('Description to Display',@s40),%OverrideDesc,REQ
          #ENDENABLE
        #ENDBUTTON
      #ENDBOXED
#ENDTAB
#ENDSHEET

#ATSTART
  #DECLARE(%MasterClass)
  #IF(%ProcedureTemplate='Process')
   #SET(%MasterClass,'ThisProcess')
  #ELSE
   #SET(%MasterClass,'ThisReport')
  #ENDIF
#ENDAT


#LocalData
SolaceSortStr       CString(255)
SolaceSort          Byte
#ENDLOCALDATA

#AT( %WindowManagerMethodCodeSection, 'Init', '(),BYTE'),PRIORITY(9950)
  #INSERT(%LoadQueue)
  #EMBED(%BeforeCallSolaceSortProc,'Solace ReSort - Before calling Sort procedure')
  SolaceSortStr = %SortProcedure('','','%Procedure',2)
  #EMBED(%AfterCallSolaceSortProc,'Solace ReSort - After calling Sort procedure')
  if SolaceSortStr<> '' then
    !Process:View{Prop:Order} = SolaceSortStr
    SolaceSort = %MasterClass.AddSortOrder()
    %MasterClass.AppendOrder(SolaceSortStr)
    %MasterClass.SetSort(SolaceSort)
    !%MasterClass.SetFilter()
    !%MasterClass.ApplyFilter()
  end
#ENDAT


#!************************** Browse Legacy *****************************
#CONTROL(SolaceReSortButtonLegacy,'Custom Sort a browse'),WINDOW,REQ(SolaceResort),hlp('Adding a Custom Sort button to your Window'),REQ(BrowseBox(Clarion))
  CONTROLS
    BUTTON('Custom Sort'),AT(,,66,17),USE(?SolaceReSort),#ORIG(?SolaceReSort),LEFT
    BUTTON('Reset Sort'),AT(,,66,17),USE(?SolaceReSet),#ORIG(?SolaceReSet),LEFT,DISABLE
  END

#BUTTON ('Custom Sort Button Properties'), AT(,, 180)
  #SHEET
    #TAB ('&Files and Fields')
      #BOXED('')
        #PROMPT ('Procedure for setting Sort Order',Procedure),%SortProcname,Req,Default(%SortProcedure)
      #ENDBOXED
      #BOXED (' Files and Fields ')
        #DISPLAY ('')
        #BUTTON('Files to make Available to sort on'), MULTI(%AvailFiles,%AvailFile), INLINE, AT(10)
        #PROMPT ('File:', File), %AvailFile,REQ
        #ENDBUTTON
        #DISPLAY ('')
        #BUTTON ('Fields to override'), MULTI(%FieldsToOverride, %FieldToOverride& '  -  ' & %OverideType),INLINE, AT(10,, 173, 90)
          #PROMPT ('Field to override:', Field), %FieldToOverride, REQ
          #PROMPT ('Type of Control:', Option), %OverideType, REQ
          #PROMPT('Not Available',Radio)
          #PROMPT('Change Description',Radio)
          #ENABLE(%OverideType = 'Change Description')
          #PROMPT('Description to Display',@s40),%OverrideDesc,REQ
          #ENDENABLE
        #ENDBUTTON
      #ENDBOXED
    #ENDTAB
  #ENDSHEET
#ENDBUTTON
#DISPLAY ('')

#DECLARE(%ManagerName)

#ATSTART
  #DECLARE(%SolResortButton)
  #DECLARE(%SolResetButton)
  #DECLARE(%SortStr)
  #FOR(%Control),WHERE(%ControlInstance=%ActiveTemplateInstance)
    #IF(%ControlOriginal='?SolaceReSort')
      #SET(%SolResortButton,%Control)
    #ELSE      #!IF(%ControlOriginal='?SolaceReSet')
      #SET(%SolResetButton,%Control)
    #ENDIF                                       
  #ENDFOR
#ENDAT

#AT(%DataSectionBeforeWindow)
%InstancePrefix:SolaceSortStr       CString(255)
SolaceSort                          Byte
#ENDAT

#AT (%ControlEventHandling,%SolResortButton,'Accepted'),PRIORITY(6500)
  #INSERT(%LoadQueue)
#! SolaceSort = %ManagerName.AddSortOrder()
#!  %InstancePrefix:SolaceSortStr = %SortProcedure('','','%Procedure.%ManagerName',2)
#!  if %InstancePrefix:SolaceSortStr then
#!    %ManagerName.AppendOrder(%InstancePrefix:SolaceSortStr)
#!    Case message('Warning - Customised sorting may take a while to complete','Custom Sort',icon:Exclamation,button:ok+Button:Cancel,Button:Ok,1)
#!    of Button:Ok
#!      %ManagerName.SetSort(SolaceSort,1)
#!      Enable(%SolResetButton)
#!    end
#!  end
#ENDAT

#AT (%ControlEventHandling,%SolResetButton,'Accepted'),PRIORITY(6500)
  %InstancePrefix:SolaceSortStr = ''
  Disable(%SolResetButton)
#!  %ManagerName.ResetSort(1)
#ENDAT

#AT( %BrowserMethodCodeSection,%ActiveTemplateParentInstance,'ResetSort'),Priority(1300)
#! if %InstancePrefix:SolaceSortStr then
#!   Setcursor(Cursor:Wait)
#!   SolRet# = SELF.SetSort(SolaceSort,Force)
#!   Setcursor()
#!   Return(SolRet#)
#! end
#ENDAT


#!********************************************** Report Legacy ******************

#EXTENSION(ReSortReportProcessLegacy,'ReSort Report and Process Legacy'),Procedure,hlp('Report')
#SHEET
#TAB('General')
        #BOXED('')
          #PROMPT ('Procedure for setting Sort Order',Procedure),%ReportSortProc,Req,Default(%SortProcedure)
        #ENDBOXED
        #BOXED (' Files and Fields ')
        #DISPLAY ('')
        #BUTTON('Files to make Available to sort on'), MULTI(%AvailFiles,%AvailFile), INLINE, AT(10)
        #PROMPT ('File:', File), %AvailFile,REQ
        #ENDBUTTON
        #DISPLAY ('')
        #BUTTON ('Fields to override'), MULTI(%FieldsToOverride, %FieldToOverride& '  -  ' & %OverideType),INLINE, AT(10,, 173, 90)
          #PROMPT ('Field to override:', Field), %FieldToOverride, REQ
          #PROMPT ('Type of Control:', Option), %OverideType, REQ
          #PROMPT('Not Available',Radio)
          #PROMPT('Change Description',Radio)
          #ENABLE(%OverideType = 'Change Description')
          #PROMPT('Description to Display',@s40),%OverrideDesc,REQ
          #ENDENABLE
        #ENDBUTTON
      #ENDBOXED
#ENDTAB
#ENDSHEET

#ATSTART
  #DECLARE(%MasterClass)
  #IF(%ProcedureTemplate='Process')
   #SET(%MasterClass,'ThisProcess')
  #ELSE
   #SET(%MasterClass,'ThisReport')
  #ENDIF
#ENDAT


#LocalData
SolaceSortStr       CString(255)
SolaceSort          Byte
#ENDLOCALDATA

#AT( %AfterFileOpen ),PRIORITY(9950)
  #INSERT(%LoadQueue)
  #EMBED(%BeforeCallSolaceSortProc,'Solace ReSort - Before calling Sort procedure')
  SolaceSortStr = %SortProcedure('','','%Procedure',2)
  #EMBED(%AfterCallSolaceSortProc,'Solace ReSort - After calling Sort procedure')
  if SolaceSortStr<> '' then
    Process:View{Prop:Order} = clip(SolaceSortStr)
  end
#ENDAT

#AT( %BeforeInitialGet),PRIORITY(4000)
  Set(Process:View)
#ENDAT

#AT(%AfterClosingReport),PRIORITY(5000)
  UNBIND
#ENDAT

#!********************************** Group Load Queue ***************************

#GROUP(%LoadQueue)
#DECLARE(%OverDesc)
#DECLARE(%NotAvailable,Long)
   Free(SolaceAvailQ)
   #FOR(%AvailFiles)
     #FIX(%File,%AvailFile)
     #FOR(%Field)
     #SET(%OverDesc,'')
     #SET(%NotAvailable,%False)
     #FOR(%FieldsToOverride)
       #IF(%FieldToOverride = %Field)
         #IF(%OverideType='Not Available')
           #SET(%NotAvailable,%True)
           #BREAK
         #ELSE
           #SET(%OverDesc,%OverrideDesc)
           #BREAK
         #ENDIF
       #ENDIF
     #ENDFOR
     #IF(%NotAvailable=%True)
       #CYCLE
     #ENDIF
    #IF(%OverDesc<>'')
     Ret$ = %SortProcedure('%File - ' & '%OverDesc','%Field','',1)              !Overriden Description
    #ELSE
     #IF(%FieldDescription)
     Ret$ = %SortProcedure('%File - ' & '%FieldDescription','%Field','',1)      !Field Description
     #ELSIF(%FieldHeader)
     Ret$ = %SortProcedure('%File - ' & '%FieldHeader','%Field','',1)           !Listbox Column Header
     #ENDIF
    #ENDIF
     #ENDFOR
   #ENDFOR

   #IF(sub(%cwtemplateversion,1,2) = 'v2')
   #FOR(%AvailFiles)
     #FIX(%File,%AvailFile)
     #FOR(%Field)
     #IF(%FieldID<>'')
     BIND('%Field',%Field)
     #ENDIF
     #ENDFOR
   #ENDFOR
   #ENDIF


