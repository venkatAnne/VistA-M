IBDFSS1 ;ALB/MAF - FORMS TRACKING SELECTED STATUS - JUL 6 1995
 ;;3.0;AUTOMATED INFO COLLECTION SYS;;APR 24, 1997
 ;
 ;
HEADER ;  -- Set up header line for the display
 S IBDCNT1=IBDCNT1+1
 S IBDCNT=IBDCNT+1,VALMCNT=VALMCNT+1
 S X=""
 S IBDFDIV1(IBDFDV)=IBDCNT
 S X=$$SETSTR^VALM1(" ",X,1,3) D TMP1
 S X="",IBDCNT=IBDCNT+1,VALMCNT=VALMCNT+1
 S IBDVAL=IBDFDV
 S IBDVAL1=$L(IBDVAL) S IBDVAL1=(80-IBDVAL1)/2 S IBDVAL1=IBDVAL1\1 S X=$$SETSTR^VALM1(" ",X,1,IBDVAL1)
 S X=$$SETSTR^VALM1(IBDVAL,X,IBDVAL1,25) D TMP1,CNTRL^VALM10(VALMCNT,1,80,IOINHI,IOINORM,0)
 S X="",IBDCNT=IBDCNT+1,VALMCNT=VALMCNT+1
 S X=$$SETSTR^VALM1(" ",X,1,3) D TMP1
 S IBDCNT1=IBDCNT1-1
 Q
 ;
 ;
HEADER1 ;  -- Set up header line for the display
 S IBDCNT1=IBDCNT1+1
 S IBDCNT=IBDCNT+1,VALMCNT=VALMCNT+1
 S X=""
 I $D(VAUTG) S IBCLIN(IBDFGR,IBDFCL)=IBDCNT
 I '$D(VAUTG) S IBCLIN(IBDFDV,IBDFCL)=IBDCNT
 S X=$$SETSTR^VALM1(" ",X,1,3) D TMP1
 S X="",IBDCNT=IBDCNT+1,VALMCNT=VALMCNT+1
 S IBDVAL=IBDFCL
 S X=$$SETSTR^VALM1(IBDVAL,X,1,25) D TMP1,CNTRL^VALM10(VALMCNT,1,80,IOINHI,IOINORM,0)
 S IBDCNT1=IBDCNT1-1
 Q
 ;
 ;
HEADER2 ;  -- Set up header line for the clinic group
 S IBDCNT1=IBDCNT1+1
 S IBDCNT=IBDCNT+1,VALMCNT=VALMCNT+1
 S X=""
 S IBDFGRP1(IBDFDV,IBDFGR)=IBDCNT
 S X=$$SETSTR^VALM1(" ",X,1,3) D TMP1
 S X="",IBDCNT=IBDCNT+1,VALMCNT=VALMCNT+1
 ;S IBDVAL=$P(^IBD(357.99,IBDFGR,0),"^",1)
 S IBDVAL=IBDFGR
 S IBDVAL1=$L(IBDVAL) S IBDVAL1=(80-IBDVAL1)/2 S IBDVAL1=IBDVAL1\1 S X=$$SETSTR^VALM1(" ",X,1,IBDVAL1)
 S X=$$SETSTR^VALM1(IBDVAL,X,IBDVAL1,25) D TMP1,CNTRL^VALM10(VALMCNT,1,80,IOINHI,IOINORM,0)
 S X="",IBDCNT=IBDCNT+1,VALMCNT=VALMCNT+1
 S X=$$SETSTR^VALM1(" ",X,1,3) D TMP1
 S IBDCNT1=IBDCNT1-1
 Q
TMP1 ; -- Set up TMP Array
 S ^TMP("SSEL",$J,IBDCNT,0)=X,^TMP("SSEL",$J,"IDX",VALMCNT,IBDCNT1)=""
 S ^TMP("SELIDX",$J,IBDCNT1)=VALMCNT
 Q
