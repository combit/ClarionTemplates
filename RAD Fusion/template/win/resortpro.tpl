#TEMPLATE(SolaceReSortPro,'Solace ReSort Pro Templates'),FAMILY('ABC')
#HELP('Resortpro.HLP')
#!*****************************************************************************
#EXTENSION(SolaceResortPro,'Global Extension for ReSort Pro Templates'),Application
#SHEET,HSCROLL,ADJUST
 #TAB('Global')
  #DISPLAY ('(c) copyright Solace Software Ltd 2004')
  #DISPLAY ('    all rights reserved worldwide.')
  #DISPLAY (' version 2.6   12th March 2004')
  #DISPLAY ('')
  #DISPLAY ('simon@solace-software.demon.co.uk')
  #DISPLAY ('http://www.solace-software.demon.co.uk')
  #DISPLAY ('')
  #DISPLAY ('ABC Applications')
  #DISPLAY ('')
  #DISPLAY ('This template will allow end users to specify their')
  #DISPLAY ('own sort orders for browses and reports')
  #DISPLAY ('')
  #DISPLAY('If this is a Multi-dll app and this app is the app where the data is declared, then tick this box below.  If this is a single .exe or a app of a multi-dll which does not declare the data, then leave this unchecked'),at(10,,175,45)
  #PROMPT('This is the "Data" .dll',CHECK),%ResortDataDll,At(10)
 #ENDTAB
#END

#AT (%AfterGlobalIncludes)
  Include('Resort.inc')
#ENDAT


#!************************************ Browse ABC **********************

#CONTROL(SolaceReSortProButton,'Solace Custom Sort a Browse'),WINDOW,REQ(SolaceResortPro),hlp('Adding a Custom Sort button to your Window'),REQ(BrowseBox(ABC))
  CONTROLS
    BUTTON('Custom Sort'),AT(,,66,17),USE(?SolaceReSort),#ORIG(?SolaceReSort),LEFT
    BUTTON('Reset Sort'),AT(,,66,17),USE(?SolaceReSet),#ORIG(?SolaceReSet),LEFT,DISABLE
  END

#BUTTON ('Solace Custom Sort Button Properties'), AT(,, 180)
#SHEET
   #Prepare
    #Declare(%DefaultObjectName)
    #Set(%DefaultObjectName,'Resort' & %ActiveTemplateInstance)
    #If(%ResortObject='')
      #Set(%ResortObject,%DefaultObjectName)
    #EndIf
   #EndPrepare
    #TAB ('&Files and Fields')
      #BOXED (' Files and Fields ')
        #DISPLAY ('')
        #DISPLAY('You may find it easier to exclude all fields then include')
        #DISPLAY('the ones you want')
        #Prompt('Exclude all fields',Check),%ExcludeAllFields,at(10)
        #ENABLE(%ExcludeAllFields=%False)
        #DISPLAY('Files to make Available to sort on')
        #BUTTON('Files to make Available to sort on'), MULTI(%AvailFiles,%AvailFile), INLINE, AT(10)
        #PROMPT ('File:', File), %AvailFile,REQ
        #ENDBUTTON
        #ENDENABLE
        #DISPLAY ('')
        #DISPLAY('Fields to override')
        #BUTTON ('Fields to override'), MULTI(%FieldsToOverride, %FieldToOverride& '  -  ' & %OverideType),INLINE, AT(10,, 173, 90)
          #PROMPT ('Field to override:', Field), %FieldToOverride, REQ
          #PROMPT ('Type of Control:', Option), %OverideType, REQ,Default('Not Available')
          #PROMPT('Not Available',Radio)
          #Prompt('Make available',Radio)
          #PROMPT('Change Description',Radio)
          #ENABLE(%OverideType = 'Change Description')
          #PROMPT('Description to Display',@s40),%OverrideDesc,REQ
          #ENDENABLE
        #ENDBUTTON
      #ENDBOXED
    #ENDTAB
    #TAB('Options')
     #DISPLAY
     #DISPLAY('Because custom sorting may not use a key, it may take a little while to execute.  If you expect to have a large amount of data in this record, then you may display a message warning users that this may take a while to complete.'),at(,,180,40)
     #DISPLAY
     #PROMPT('Message to display',TEXT),%ResortMessage,Default('Warning - Customised sorting may take a while to complete')
     #PROMPT('Heading for messagebox',@S100),%ResortHeader,Default('Custom Sort')
     #DISPLAY
     #DISPLAY('You may also base this message on a condition. For example:-'),at(,,180,15)
     #DISPLAY('Records(Customer) > 1000'),at(25)
     #DISPLAY('Leave blank to always display the message.')
     #DISPLAY
     #PROMPT('Condition',@S255),%ResortCondition
     #DISPLAY('')
    #ENDTAB
    #TAB('Sorting with Tabs')
      #DISPLAY('This section allows you to add a new tab to a sheet at runtime if the user assigns a default sort order'),At(10,,173,20)
      #PROMPT('This Browse uses tabs to sort',Check),%ResortBrowseTabs,at(10)
      #ENABLE(%ResortBrowseTabs=%True)
       #Prompt('Sheet controlling Browse',Control),%ResortBrowseControlSheet
       #DISPLAY('')
       #Display('In order to allow maximum flexibility of sorting, if a user has selected a custom sort order, and then selects a new tab (to select a predefined sort order), the custom sort should then be reset'),at(10,,173,40)
       #Prompt('Reset custom sorts on tab change',Check),%TabResetSort,Default(%True),at(10)
       #DISPLAY('')
       #DISPLAY('If the addition of new tabs on the sheet means that the tabs go onto two or more rows, you can elect to keep all the tabs on one row and scroll.'),at(10,,173,30)
       #Prompt('Tab Scroll type',Drop('Do not change|Spread Scroll buttons|Joined Scroll buttons')),%Resortscrolltype,REQ
      #ENDENABLE
      #DISPLAY
    #ENDTAB
    #TAB('Classes')
      #PROMPT('Object Name:', @S30),%ResortObject,REQ
    #ENDTAB
#ENDSHEET
#ENDBUTTON

#DECLARE(%ManagerName)

#ATSTART
  #DECLARE(%SolResortButton)
  #DECLARE(%SolResetButton)
  #DECLARE(%SortStr)
  #DECLARE(%ParentUse)
  #DECLARE(%ParentFrom)
  #FOR(%Control),WHERE(%ControlInstance=%ActiveTemplateInstance)
    #IF(%ControlOriginal='?SolaceReSort')
      #SET(%SolResortButton,%Control)
    #ELSE      #!IF(%ControlOriginal='?SolaceReSet')
      #SET(%SolResetButton,%Control)
    #ENDIF
  #ENDFOR
  #FOR(%Control),WHERE(%ActiveTemplateParentInstance=%Controlinstance)
    #SET(%ParentUse,%Control)
    #SET(%ParentFrom,%ControlFrom)
  #END
#ENDAT

#AT(%DataSection),Priority(7500)
%ResortObject     Class(SolResort)
               end
#ENDAT


#AT(%LocalDataClassData)
%InstancePrefix:SolaceSortStr       CString(255)
%ManagerName:SolaceSort                          Byte
%ManagerName:SolaceCurrentFilter                 CString(512)

%ManagerName:SolaceBrowseSortQ       Queue
UseVar                    Long
UseText                   CString(60)
ChoiceNum                 Long
SortString                CString(60)
SortNumber                Long
ListFormat                CString(1000)
                        end

%ManagerName:SolaceOriginalTabs      Long
%ManagerName:SolaceAddedTabs         Long
#ENDAT

#AT( %WindowManagerMethodCodeSection, 'Init', '(),BYTE'),PRIORITY(7600)
  %ResortObject.Init()
  Open(Resort)
#ENDAT


#AT(%WindowManagerMethodCodeSection, 'Init', '(),BYTE'),PRIORITY(8140)
 #IF(%ResortBrowseTabs=%True)
  do %ManagerName:SolaceBuildSortTabs
 #ENDIF
 %ResortObject.SaveOriginalFormat(%ParentUse{Prop:Format})
#ENDAT

#AT( %WindowManagerMethodCodeSection, 'Init', '(),BYTE'),PRIORITY(9950)
  BIND('%ManagerName:SolaceCurrentFilter',%ManagerName:SolaceCurrentFilter)
#ENDAT

#AT( %WindowManagerMethodCodeSection, 'Kill', '(),BYTE'),PRIORITY(6500)
  Close(Resort)
  %ResortObject.Kill
#ENDAT

#AT(%ControlEventHandling,%ResortBrowseControlSheet,'NewSelection'),PRIORITY(4499)
  #IF(%TabResetSort=%True)
    %InstancePrefix:SolaceSortStr = ''
    %SolResetButton{Prop:Disable} = true
  #END
#ENDAT


#AT (%ControlEventHandling,%SolResortButton,'Accepted'),PRIORITY(6500)
  #INSERT(%LoadQueue)
  %InstancePrefix:SolaceSortStr = %ResortObject.SelectReportOrder('%Procedure','','','%Procedure.%ManagerName',2,0,'Browse',%ParentUse{Prop:Format},%ParentFrom)
  #if(%ResortBrowseTabs=%True)
  do %ManagerName:SolaceBuildSortTabs
  #ENDIF
  if %InstancePrefix:SolaceSortStr then
    %ManagerName:SolaceSort = %ManagerName.AddSortOrder()
    %ManagerName.AppendOrder(%InstancePrefix:SolaceSortStr)
    %ManagerName:SolaceCurrentFilter = %ManagerName::View:Browse{Prop:Filter}
    %ManagerName.Setfilter(%ManagerName:SolaceCurrentFilter)
    %ManagerName.ApplyFilter
   #IF(%ResortCondition and %ResortMessage)
    if %ResortCondition then
   #ENDIF
    #IF(%ResortMessage)
    Case message('%ResortMessage','%ResortHeader',icon:Exclamation,button:ok+Button:Cancel,Button:Ok,1)
    of Button:Ok
    #ENDIF
      %ManagerName.SetSort(%ManagerName:SolaceSort,1)
      Enable(%SolResetButton)
    #IF(%ResortMessage)
    end
    #ENDIF
   #IF(%ResortCondition and %ResortMessage)
    End
   #ENDIF
  end
#ENDAT

#AT (%ControlEventHandling,%SolResetButton,'Accepted'),PRIORITY(6500)
  %InstancePrefix:SolaceSortStr = ''
  Disable(%SolResetButton)
  %ManagerName.ResetSort(1)
#ENDAT

#AT( %BrowserMethodCodeSection,%ActiveTemplateParentInstance,'ResetSort'),Priority(1300)
 if %InstancePrefix:SolaceSortStr and %SolResetButton{Prop:Disable} = false then
   Setcursor(Cursor:Wait)
   SolRet# = SELF.SetSort(%ManagerName:SolaceSort,Force)
   Setcursor()
   Return(SolRet#)
 end
 !Tabs
 if choice(%ResortBrowseControlSheet) > %ManagerName:SolaceOriginalTabs then
   %ManagerName:SolaceBrowseSortQ.ChoiceNum = choice(%ResortBrowseControlSheet)
   Get(%ManagerName:SolaceBrowseSortQ,%ManagerName:SolaceBrowseSortQ.ChoiceNum)
   Setcursor(Cursor:Wait)
   SolRet# = SELF.SetSort(%ManagerName:SolaceBrowseSortQ.SortNumber,Force)
   if %ManagerName:SolaceBrowseSortQ.ListFormat = '' then
     %ParentUse{Prop:Format} = %ResortObject.OriginalFormat
   else
     %ParentUse{Prop:Format} = %ManagerName:SolaceBrowseSortQ.ListFormat
   end
   Setcursor()
   Return(SolRet#)
 else
   %ParentUse{Prop:Format} = %ResortObject.OriginalFormat
 end
 if %ManagerName:SolaceOriginalTabs = 1
   SolRet# = SELF.SetSort(1,Force)
 end
#ENDAT


#AT(%ProcedureRoutines)
#IF(%ResortBrowseTabs=%True)
%ManagerName:SolaceBuildSortTabs     Routine
  if Records(%ManagerName:SolaceBrowseSortQ) then
    Loop RemoveTabs# = 1 to Records(%ManagerName:SolaceBrowseSortQ)
      Get(%ManagerName:SolaceBrowseSortQ,RemoveTabs#)
      Destroy(%ManagerName:SolaceBrowseSortQ.UseVar)
    end
    Free(%ManagerName:SolaceBrowseSortQ)
  end
  %ManagerName:SolaceOriginalTabs = %ResortBrowseControlSheet{Prop:NumTabs}
  %ManagerName:SolaceAddedTabs = 0

  RST_:ProcedureName = '%Procedure'
  RST_:ControlName = '%Procedure.%ManagerName'
  RST_:DefaultForProcedure = true
  Set(RST_:DefaultForProcedureKey,RST_:DefaultForProcedureKey)
  Loop
    Next(Resort)
    If Error() then
      Break
    end
    if Resort.ProcedureName <> '%Procedure' or Resort.ControlName <> '%Procedure.%ManagerName' or Resort.DefaultForProcedure = false then
      break
    end
    %ManagerName:SolaceBrowseSortQ.UseVar = Create(0,Create:Tab,%ResortBrowseControlSheet)
    %ManagerName:SolaceBrowseSortQ.UseVar{Prop:Text} = Resort.SortName
    Unhide(%ManagerName:SolaceBrowseSortQ.UseVar)
   #IF(%Resortscrolltype<>'Do not change')
    if %ResortBrowseControlSheet{Prop:TabRows} > 1 then
   #IF(%Resortscrolltype='Spread Scroll buttons')
      %ResortBrowseControlSheet{Prop:Join} = False
      %ResortBrowseControlSheet{Prop:HScroll} = True
   #ENDIF
   #IF(%Resortscrolltype='Joined Scroll buttons')
      %ResortBrowseControlSheet{Prop:Join} = true
      %ResortBrowseControlSheet{Prop:HScroll} = false
   #ENDIF
    end
   #ENDIF
    %ManagerName:SolaceAddedTabs += 1
    %ManagerName:SolaceBrowseSortQ.SortNumber = %ManagerName.AddSortOrder()
    %ManagerName.AppendOrder(Resort.SortStrings)
    %ManagerName:SolaceBrowseSortQ.Usetext = Resort.SortName
    %ManagerName:SolaceBrowseSortQ.SortString = Resort.SortStrings
    %ManagerName:SolaceBrowseSortQ.ChoiceNum = %ManagerName:SolaceOriginalTabs + %ManagerName:SolaceAddedTabs
    %ManagerName:SolaceBrowseSortQ.ListFormat = Resort.BrowseLayout
    Add(%ManagerName:SolaceBrowseSortQ,%ManagerName:SolaceBrowseSortQ.ChoiceNum)
  end
#ENDIF
#ENDAT






#!********************************************** Report ABC ******************

#EXTENSION(ReSortProReportProcess,'Solace Custom Sort Report/Process'),Procedure,REQ(SolaceResortPro),hlp('Report')
  #Prepare
   #Declare(%DefaultObjectName)
   #Set(%DefaultObjectName,'Resort' & %ActiveTemplateInstance)
   #If(%ResortObject='')
     #Set(%ResortObject,%DefaultObjectName)
   #EndIf
  #EndPrepare
#SHEET
#TAB('General')
    #BOXED (' Files and Fields ')
    #DISPLAY ('')
    #DISPLAY('You may find it easier to exclude all fields then include')
    #DISPLAY('the ones you want')
    #Prompt('Exclude all fields',Check),%ExcludeAllFields,at(10)
    #ENABLE(%ExcludeAllFields=%False)
    #DISPLAY('Files to make Available to sort on')
    #BUTTON('Files to make Available to sort on'), MULTI(%AvailFiles,%AvailFile), INLINE, AT(10)
    #PROMPT ('File:', File), %AvailFile,REQ
    #ENDBUTTON
    #ENDENABLE
    #DISPLAY ('')
    #DISPLAY('Fields to override')
    #BUTTON ('Fields to override'), MULTI(%FieldsToOverride, %FieldToOverride& '  -  ' & %OverideType),INLINE, AT(,, 173, 90)
      #PROMPT ('Field to override:', Field), %FieldToOverride, REQ
      #PROMPT ('Type of Control:', Option), %OverideType, REQ,Default('Not Available')
      #PROMPT('Not Available',Radio)
      #Prompt('Make available',Radio)
      #PROMPT('Change Description',Radio)
      #ENABLE(%OverideType = 'Change Description')
      #PROMPT('Description to Display',@s40),%OverrideDesc,REQ
      #ENDENABLE
    #ENDBUTTON
  #ENDBOXED
#ENDTAB
#TAB('Options')
  #DISPLAY ('You may either append this sort order to the existing order or replace it.  Please be aware however, that if you replace it, any group breaks that may be in your report may become invalid'),at(,,180,35)
  #PROMPT('Append or Replace Sort order',Option),%AppendReplace
    #Prompt('Append',Radio)
    #PROMPT('Replace',Radio)
  #DISPLAY('')
  #BOXED('Conditional Sort')
   #DISPLAY('If the following checkbox is switched off, then the sort options window will be displayed every time this procedure is run.  If it is switched on, then you may select a variable to determine whether or not to display the sort window'),at(10,,173,45)
   #PROMPT('Only Display Sort Window if a Variable is set to true',CHECK),%ConditionalSort,at(10)
   #DISPLAY('')
   #ENABLE(%ConditionalSort=%True)
    #DISPLAY('Select a Variable which, when set to true, will pop up the sort window before the report executes'),at(10,,173,20)
    #PROMPT('Variable',Field),%SwitchVariable,REQ
   #ENDENABLE
  #ENDBOXED
#ENDTAB
#TAB('Classes')
  #PROMPT('Object Name:', @S30),%ResortObject,REQ
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

#AT(%DataSection),Priority(7500)
%ResortObject     Class(SolResort)
               end
#ENDAT

#LocalData
SolaceSortStr       CString(255)
SolaceCurrentFilter CString(512)
SolaceSort          Byte
UseDefaultSortOrder Byte
#ENDLOCALDATA

#AT( %WindowManagerMethodCodeSection, 'Init', '(),BYTE'),PRIORITY(7600)
  %ResortObject.Init()
  Open(Resort)
#ENDAT


#AT( %WindowManagerMethodCodeSection, 'Init', '(),BYTE'),PRIORITY(9950)

  BIND('SolaceCurrentFilter',SolaceCurrentFilter)

  RST_:ProcedureName = '%Procedure'
  RST_:ControlName = '%Procedure'
  RST_:DefaultForProcedure = true
  Get(Resort,RST_:DefaultForProcedureKey)           !Found a default sort sort to use
  if ~Error()
    SolaceSortStr = RST_:SortStrings
    UseDefaultSortOrder = true
  End

 #IF(%ConditionalSort=%True)
  if %SwitchVariable = true then
  #INDENT(2)
 #ENDIF
  #INSERT(%LoadQueue)
  #EMBED(%BeforeCallSolaceSortProc,'Solace ReSort - Before calling Sort procedure')
 #IF(%ConditionalSort=%True)
   if %SwitchVariable = true then
   #INDENT(2)
 #ENDIF
   if UseDefaultSortOrder = true then
     SolaceSortStr = %ResortObject.SelectReportOrder('%Procedure','','','%Procedure',2,RST_:Ref,'Report','')
   else
     SolaceSortStr = %ResortObject.SelectReportOrder('%Procedure','','','%Procedure',2,0,'Report','')
   end
 #IF(%ConditionalSort=%True)
   #INDENT(-2)
   END
 #ENDIF
  #EMBED(%AfterCallSolaceSortProc,'Solace ReSort - After calling Sort procedure')
  if SolaceSortStr <> '' then
   #IF(%AppendReplace='Append')
     %MasterClass.AppendOrder(SolaceSortStr)
   #ELSE
    SolaceSort = %MasterClass.AddSortOrder()
    %MasterClass.AppendOrder(SolaceSortStr)
    %MasterClass.Setfilter(Process:View{Prop:Filter})
    %MasterClass.ApplyFilter()
    %MasterClass.SetSort(SolaceSort)
   #ENDIF
  end
 #IF(%ConditionalSort=%True)
  #INDENT(-2)
  END
 #ENDIF
#ENDAT

#AT( %WindowManagerMethodCodeSection, 'Kill', '(),BYTE'),PRIORITY(6500)
  Close(Resort)
  %ResortObject.Kill
#ENDAT


#!********************************** Group Load Queue ***************************

#GROUP(%LoadQueue)
#DECLARE(%OverDesc)
#DECLARE(%ActualFieldName)
#DECLARE(%NotAvailable,Long)
   Free(SolaceAvailQ)
  #IF(%ExcludeAllFields=%False)
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
     #IF(%FieldName)
      #SET(%ActualFieldName,Sub(%FieldName,2,Len(%FieldName)-2))
     #ELSE
      #SET(%ActualFieldName,%Field)
     #ENDIF
     #IF(%NotAvailable=%True)
       #CYCLE
     #ENDIF
    #IF(%OverDesc<>'')
     Ret$ = %ResortObject.SelectReportOrder('%Procedure','%File - ' & '%OverDesc','%ActualFieldName','',1,0,'','')              !Overriden Description
    #ELSE
     #IF(%FieldDescription)
     Ret$ = %ResortObject.SelectReportOrder('%Procedure','%File - ' & '%FieldDescription','%ActualFieldName','',1,0,'','')      !Field Description
     #ELSIF(%FieldHeader)
     Ret$ = %ResortObject.SelectReportOrder('%Procedure','%File - ' & '%FieldHeader','%ActualFieldName','',1,0,'','')           !Listbox Column Header
     #ENDIF
    #ENDIF
     #ENDFOR
   #ENDFOR
  #ELSE
   #FOR(%FieldsToOverride)
     #FIX(%Field,%FieldToOverride)
     #IF(%FieldName)
      #SET(%ActualFieldName,Sub(%FieldName,2,Len(%FieldName)-2))
     #ELSE
      #SET(%ActualFieldName,%Field)
     #ENDIF
     #IF(%OverideType='Make available')
       #!SET(%Field,%FieldToOverride)
       #IF(%OverrideDesc)
         #SET(%OverDesc,%OverrideDesc)
       #ENDIF
     #ENDIF
       #IF(%OverDesc<>'')
       Ret$ = %ResortObject.SelectReportOrder('%Procedure','%File - ' & '%OverDesc','%ActualFieldName','',1,0,'','')              !Overriden Description
       #ELSE
       #IF(%FieldDescription)
       Ret$ = %ResortObject.SelectReportOrder('%Procedure','%File - ' & '%FieldDescription','%ActualFieldName','',1,0,'','')      !Field Description
       #ELSIF(%FieldHeader)
       Ret$ = %ResortObject.SelectReportOrder('%Procedure','%File - ' & '%FieldHeader','%ActualFieldName','',1,0,'','')           !Listbox Column Header
       #ENDIF
    #endif
   #ENDFOR

  #ENDIF

   #IF(sub(%cwtemplateversion,1,2) = 'v2')
   #IF(%ExcludeAllFields=%False)
   #FOR(%AvailFiles)
     #FIX(%File,%AvailFile)
     #FOR(%Field)
     #IF(%FieldID<>'')
     BIND('%Field',%Field)
     #ENDIF
     #ENDFOR
   #ENDFOR
   #ENDIF
   #ENDIF


