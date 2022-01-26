List & Label Templates Version 9 up to 23

IMPORTANT!!


Developer vs End user
There is a file called Solace.INI which, during the installation of the Templates was placed in the Windows directory. The presence of this file allows the developer to use the procedures that will be given to the customer with enhancements that the customer should not usually have.
If the procedures RptLayoutManager and UpdateReplay detect this file, they will do a number of things:-

RptLayoutManager
Changes the appearance of the both the browses to include the LLA_:Ref in the 'Areas' browse as well as update buttons and in the Layout browse, a factory default indicator will appear together with the List & Label filename which that record uses.

UpdateReplay
A checkbox for the field factory default appears
Allow factory default layouts to be edited or deleted.

If the file Solace.ini is not found in the Windows directory, the above fields/browse changes will not appear.

NOTE
Unless you want your customer to have access to these seetings, do not ship the file Solace.ini!!!



Factory defaults
There is now an option in the Layout Designer button extension to prevent users from changing or deleting factory default layouts.  You may also add a message if they try to do so.

I have changed the way in which the List & Label files are named.  This is not actually in the templates themselves but is in the procedure UpdateReplay in the Prime Fields embeds.  The code reads:-

if LLL_:FactoryDefault = true then
  LLL_:FileName = 'FD' & LLL_:Ref
Else
  LLL_:FileName = 'LT' & LLL_:Ref
End

This is to prevent you, as a programmer, sending out new factory defaults which could then override layouts that the user has created themselves.  Please note that as this is embeded code and not actually in the templates, it will not happen automatically so you will need to either add the above code yourself or reimport the txa file that is supplied with this upgrade.  Please note that if you reimport the txa, any changes to these procedures that you have made will be lost!

The field FactoryDefault in the file LL_RepLay needs to be set manually to either 1 or 0 using any file scanner.


Invoices
There is now an option on both the Process and Report Extension templates to declare a layout as an Invoice Style layout.  This enables the templates to automatically handle page breaks for you and also combine a List and Card type project into one.  When defining an Invoice type project, it should be declared as a ‘List’ type of project.  This will then enable the Table button in the List & label designer.
When you declare the layout as an Invoice type, you need to enter the field that the Templates use to break on.  This field is the one on the child side of the relationship.  For example in an Invoice of InvHead and Detail,

InvHead		File,Pre(Inv)
Ref		 Long
CustomerRef	 Long
etc
		.

Detail		File,Pre(Det)
InvHeadRef	 Long
ItemRef		 Long
etc
	.
the field that you would enter here would be Det:InvHeadRef.

Date Offsets
In order to facilitate different date storages, I have added a new option to allow programmers to override the standard Clarion date format.  As you may be aware List & Label expects dates to be passed to it in the Julian format (see page 14 of the List & Label manual).  To achieve this, the templates add on 2378857 to the standard Clarion date.  However, if you wish to store non standard Clarion dates, you may override this figure by adding:

DateOffSet_LL(n) 
 
to the user options of that date field in the dictionary.  n = number of days to offset.  You may need to experiment with the value of n depending on the format that you are using.

Manual Fields
In previous versions of the templates, manual fields appeared in the List & Label designer under the grouping of OTHER.  There is now an option on the Global extension template to override this name to whatever to feel is more appropriate.

Error Message
If an error occures when opening a layout, the message box title now includes the error number that was returned by List & Label.

Incidently, although the error number -23 is not listed in the List & Label manual, it is one of the most common errors!  It means that a layout was designed with a variable which is not supplied at runtime.  This may be a manual field which has been added at design time and not included in the report/process template or simply that that a field in a file has been deleted of the attribute N0_LL added after the layout was designed.

Hand Code Template
For those of you who really enjoy getting your hands dirty, there is also a new Hand Code template.  This template simply adds all the functionally to your proceudre to communicate with List & Label.  However, it is up to you to call the variaous routines that it adds yourself.  This extension is ideal for those times when you really have a report which requires fine tuning.

Blobs
Blobs in files are now supported.  There was a problem in previous versions that caused the compiler to stop.  This has been sorted and there is now options to tell the templates what the contents of the Blob are (RTF/Graphics/Text).  Please see the help file for more information on this.

File Paths
You may now specify file paths for both your List & Label files as well as your print preview temporary files.  These can be specified in the Global extension template.  Please note that if you do not want files to be placed in sub directories, then please leave these blank.

