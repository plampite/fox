program wxml_example

use FoX_wxml

type(xmlf_t) :: xf

integer :: age = 34
real, dimension(20)  :: x
real, dimension(4,4)  :: y

call xml_OpenFile("simple.xml",xf, indent=.true.)
call xml_AddDOCTYPE(xf, "john", "hello.dtd")
call xml_AddInternalEntity(xf, "abc", "A B C")

call xml_AddXMLStylesheet(xf,href="simple.css",type="text/css",media="braille")
call xml_AddXMLPI(xf, name="robots")
call xml_AddPseudoAttribute(xf, "index", "yes")
call xml_AddPseudoAttribute(xf, "follow", "no")
call xml_AddXMLPI(xf,name="ccode", data="{hello_world();}")
!
! Uncomment this to test name checks
!
!!call xml_NewElement(xf,"98_john")
!
call xml_NewElement(xf,"john")
call xml_AddAttribute(xf,"age",age)
!
! Markup escaping in attributes
!
call xml_AddAttribute(xf,"with_markup","O'Reilly & Assoc is < OUP but > Wiley")
call xml_NewElement(xf,"peter")
call xml_NewElement(xf,"tim")
call xml_AddAttribute(xf,"age","37")
call xml_AddAttribute(xf,"weight",123.45d0,fmt="r3")
call xml_AddAttribute(xf,"cholesterol",167.0d0,fmt="r0")
call xml_EndElement(xf,"tim")
call xml_AddCharacters(xf,"Ping-pong")
call xml_AddCharacters(xf,"champion")
!
! Markup escaping in pcdata
!
call xml_AddCharacters(xf," in years < 2004")
!
call xml_NewElement(xf,"data")
call xml_AddAttribute(xf,"units","eV")
call random_number(x)
!call xml_AddArray(xf,x)
call xml_EndElement(xf,"data")
call xml_NewElement(xf,"data")
call xml_AddAttribute(xf,"units","Ryd")
call random_number(y)

call xml_AddNamespace(xf, "http://www.w3.org/1999/xhtml", "h")
call xml_AddNamespace(xf, "http://www.w3.org/1999/svg", "svg")
call xml_NewElement(xf, "html", "h")
call xml_NewElement(xf, "svg", "svg")
call xml_EndElement(xf, "svg", "svg")
call xml_NewElement(xf, "head", "h")
call xml_Addnamespace(xf,"http://www.xml-cml.org/schema", "cml")
call xml_AddAttribute(xf, "convention", "eMinerals", "cml")
call xml_EndElement(xf, "head", "h")
!
! Writing multidimensional arrays... index order?
!
!call xml_AddArray(xf,reshape(y,(/ 16 /)))
!
! xml_Close will take care to close all outstanding elements
!
call xml_Close(xf)

! Equivalent code:
!
!!call xml_EndElement(xf,"data")
!!call xml_EndElement(xf,"peter")
!!call xml_EndElement(xf,"john")


end program wxml_example
