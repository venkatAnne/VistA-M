XMUT2 ;(WASH ISC)/CAP-Large Msg Report ;12/04/2002  13:49
 ;;8.0;MailMan;**10**;Jun 28, 2002
 ; Entry points used by MailMan options (not covered by DBIA):
 ; ENTER    XMMGR-LARGE-MESSAGE-REPORT
ENTER ;
 N XMABORT,XML,XMD,I,XMSAVE
 S XMABORT=0
 D INIT(.XML,.XMD,.XMABORT) Q:XMABORT
 I $D(ZTQUEUED) D PROCESS(XML,XMD) Q
 F I="XML","XMD" S XMSAVE(I)=""
 D EN^XUTMDEVQ("PROC^XMUT2",$$EZBLD^DIALOG(36200),.XMSAVE) ; MailMan: Large Message Report
 Q
INIT(XML,XMD,XMABORT) ;
 S XML=$G(^XMB(1,1,"XMUT2-LINES")) I 'XML S XML=100
 S XMD=$O(^XMB(3.9,"C",""))
 Q:$D(ZTQUEUED)
 W !,$$EZBLD^DIALOG(36201),! ; This report lists messages longer than a certain number of lines.
 D MINLINES(.XML,.XMABORT) Q:XMABORT
 D STARTDT(.XMD,.XMABORT) Q:XMABORT
 Q
MINLINES(XML,XMABORT) ;
 N DIR,X,Y,DA
 ;Report on messages longer than this many lines
 D BLD^DIALOG(36203,"","","DIR(""A"")")
 S DIR(0)="4.3,8.14",DA=1
 D ^DIR I $D(DIRUT) S XMABORT=1 Q
 Q:Y=XML
 S XML=Y
 K DIR,X,Y,DA
 ;Make this the default for future reports
 D BLD^DIALOG(36204,"","","DIR(""A"")")
 S DIR("B")=$$EZBLD^DIALOG(39054) ; Yes
 S DIR(0)="Y"
 D ^DIR I $D(DIRUT) S XMABORT=1 Q
 Q:'Y
 S $P(^XMB(1,1,"XMUT2-LINES"),U)=XML
 Q
STARTDT(XMD,XMABORT) ;
 N DIR,X
 ;The default starting date is the date of the oldest message.
 ;Enter the start date
 W !
 D BLD^DIALOG(36202,"","","DIR(""A"")")
 S DIR("B")=$$FMTE^XLFDT(XMD,5)
 S DIR(0)="D^"_XMD_":"_DT_";EP"
 D ^DIR I $D(DIRUT) S XMABORT=1
 S XMD=Y
 Q
PROCESS(XML,XMD) ;
PROC ;
 N XMABORT,XMPAGE,XMCNT,XMDATE,XMREC,XMLINES,XMLEN,XMZ,XMLEFT
 S XMLEN("XMZ")=$$MAX^XLFMTH($L($O(^XMB(3.9,"A"),-1)),$L($$EZBLD^DIALOG(34633))) ;Msg ID
 S XMLEN("LINE")=$$MAX^XLFMTH(7,$L($$EZBLD^DIALOG(34003.1))+1) ;Lines
 S XMLEN("RCPT")=$$MAX^XLFMTH(6,$L($$EZBLD^DIALOG(36207))+1) ;Rcpts
 S XMLEFT=75-XMLEN("XMZ")-XMLEN("LINE")-XMLEN("RCPT")
 S XMLEN("FROM")=XMLEFT\2
 S XMLEN("SUBJ")=XMLEFT-XMLEN("FROM")
 S (XMABORT,XMCNT,XMPAGE)=0
 S XMDATE=$$FMTE^XLFDT(DT,5)
 W:$E(IOST,1,2)="C-" @IOF
 D HDR
 S XMD=XMD-.1
 S XMZ=""
 F  S XMD=$O(^XMB(3.9,"C",XMD)) Q:XMD=""  D  Q:XMABORT
 . F  S XMZ=$O(^XMB(3.9,"C",XMD,XMZ)) Q:XMZ=""  D  Q:XMABORT
 . . S XMCNT=XMCNT+1
 . . S XMLINES=+$P($G(^XMB(3.9,XMZ,2,0)),U,4)
 . . I $E(IOST,1,2)="C-",XMCNT#1000=0 W:$X>50 ! W "."
 . . Q:XMLINES'>XML
 . . S XMREC=$G(^XMB(3.9,XMZ,0))
 . . Q:$P(XMREC,U)?1"R"1N.N
 . . S XMRECIPS=+$P($G(^XMB(3.9,XMZ,1,0)),U,4)
 . . I $Y+3>IOSL D PAGE(.XMABORT) Q:XMABORT
 . . W !,$J(XMZ,XMLEN("XMZ")),$J(XMLINES,XMLEN("LINE")),$J(XMRECIPS,XMLEN("RCPT")),"  "
 . . W $$LJ^XLFSTR($E($$NAME^XMXUTIL($P(XMREC,U,2)),1,XMLEN("FROM")),XMLEN("FROM")),"  ",$$LJ^XLFSTR($E($$SUBJ^XMXUTIL2(XMREC),1,XMLEN("SUBJ")),XMLEN("SUBJ"))
 Q:XMABORT
 I $E(IOST,1,2)="C-" D WAIT^XMXUTIL
 I $D(ZTQUEUED) S ZTREQ="@"
 Q
PAGE(XMABORT) ;
 I $E(IOST,1,2)="C-" D PAGE^XMXUTIL(.XMABORT) Q:XMABORT
 W @IOF
 D HDR
 Q
HDR ;
 S XMPAGE=XMPAGE+1
 ;Messages with more than _XML_ lines,?50,Report date: _XMDATE_  _Page
 W $$EZBLD^DIALOG(36205,XML),?50,$$EZBLD^DIALOG(36206,XMDATE),"  ",$$EZBLD^DIALOG(34542,XMPAGE)
 ; Msg ID / Lines / Rcpts / From / Subject
 W !!,$J($$EZBLD^DIALOG(34633),XMLEN("XMZ")),$J($$EZBLD^DIALOG(34003.1),XMLEN("LINE")),$J($$EZBLD^DIALOG(36207),XMLEN("RCPT")),"  ",$$LJ^XLFSTR($$EZBLD^DIALOG(34006),XMLEN("FROM")),"  ",$$EZBLD^DIALOG(34002),!
 Q
ENT ;
 N XML,XMD
 S XML=1000,XMD=0
 F I="XML","XMD" S XMSAVE(I)=""
 D EN^XUTMDEVQ("PROC^XMUT2",$$EZBLD^DIALOG(36200),.XMSAVE) ; MailMan: Large Message Report
 Q