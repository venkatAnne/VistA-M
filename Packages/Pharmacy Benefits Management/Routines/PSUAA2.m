PSUAA2 ;BIR/RDC - ALLERGY/ADVERSE EVENT Mail Messages; 23 FEB 2004
 ;;4.0;PHARMACY BENEFITS MANAGEMENT;;MARCH, 2005
 ;
 ; Reference to file #4.3        supported by DBIA 2496
 ;
EN1 ;ENtry point for ALLERGY/ADVERSE EVENT Mail Message
 ;
 S DOMSG=""
 S XMCHAN=1
 S XMDUZ=DUZ
 S MSGTOT=$G(^XTMP("PSU_"_PSUJOB,"PSUAA","MSGTCNT"))
 S:MSGTOT="" MSGTOT=1
 S LINECNT=$G(^XTMP("PSU_"_PSUJOB,"PSUAA","LINECNT"))
 S:LINECNT=0 LINECNT=1
 ;                                 ** SET THE HEADER DATA
 S X=$$VALI^PSUTL(4.3,1,217)
 S PSUVFAC=+$$VAL^PSUTL(4,X,99)
 ;
 S X=PSUVFAC,DIC=40.8,DIC(0)="X",D="C" D IX^DIC
 S X=+Y S PSUVDIV=$$VAL^PSUTL(40.8,X,.01)
 ;
 I $G(PSUMASF)!$G(PSUDUZ)!$G(PSUPBMG) S DOMSG=1 D
 . I '$D(^XTMP("PSU_"_PSUJOB,"PSUAA","MSGTCNT")) D  Q  ; quit - no data 
 .. S CURMSG=1
 .. S XMSUB="V. 4.0 PBMAA"_" "_PSUMON_" "_CURMSG_"/"_MSGTOT_" "_PSUVFAC_" "_PSUVDIV
 .. S ^XTMP("PSU_"_PSUJOB,"PSUAA","ERR",1)="No data to report"
 .. S XMTEXT="^XTMP(""PSU_"_PSUJOB_""",""PSUAA"",""ERR"","
 .. M XMY=PSUXMYS1
 .. D ^XMD
 . ;                    **  there are messages - send them **
 . F CURMSG=1:1:MSGTOT D
 .. S XMSUB="V. 4.0 PBMAA"_" "_PSUMON_" "_CURMSG_"/"_MSGTOT_" "_PSUVFAC_" "_PSUVDIV
 .. S XMTEXT="^XTMP(""PSU_"_PSUJOB_""",""PSUAA"","_CURMSG_","
 .. M XMY=PSUXMYH
 .. D ^XMD
 I DOMSG D  ;                        ** CONFIRMATION MESSAGE **
 . S ^XTMP("PSU_"_PSUJOB,"CONFIRM",PSUVFAC,11,"L")=LINECNT
 . S ^XTMP("PSU_"_PSUJOB,"CONFIRM",PSUVFAC,11,"M")=MSGTOT
 ;
 Q
 ;
