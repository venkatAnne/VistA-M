PRSEPRG0 ;HINS/DAD-REVIEW GROUP MEMBERS REPORT ; 08/30/94  2:12 PM
 ;;4.0;PAID;;Sep 21, 1995
 S PRSESRV=$$EN3^PRSEUTL3(DUZ)
 S PRSEMISC=+$O(^PRSP(454.1,"B","MISCELLANEOUS",0))
 K DIC S DIC="^PRSE(452.3,",DIC(0)="AEMNQZ"
 S DIC("A")="Select REVIEW GROUP (Press RETURN for all): "
 S DIC("S")="S PRSE=$P(^(0),U,2) I (PRSESRV=PRSE)!(PRSEMISC=PRSE)!($$EN4^PRSEUTL3(DUZ))"
 W ! D ^DIC I $D(DTOUT)!$D(DUOUT) G EXIT
 S PRSEGRP=$S(Y>0:+Y,1:0),PRSEGRP("TX")=$G(Y(0,0))
 S ZTRTN="ENTSK^PRSEPRG0",(ZTSAVE("PRSEGRP"),ZTSAVE("PRSEGRP("))=""
 S (ZTSAVE("PRSESRV"),ZTSAVE("PRSEMISC"))=""
 S ZTDESC="Education Tracking REVIEW GROUP MEMBERS REPORT"
 K %ZIS,IOP D DEV^PRSEUTL G:POP!($D(ZTSK)) EXIT
ENTSK ;
 K ^TMP($J,"PRSEPRG0")
 I PRSEGRP D
 . D LOOP
 . Q
 E  D
 . S PRSEGRP=0
 . F  S PRSEGRP=$O(^PRSE(452.3,PRSEGRP)) Q:PRSEGRP'>0  D LOOP
 . Q
 K PRSEUNDL S $P(PRSEUNDL,"-",81)=""
 S PRSEQUIT=0,PRSEPAGE=1,PRSENOW=$$FMTE^XLFDT($$DT^XLFDT())
 U IO D HEADER
 I $O(^TMP($J,"PRSEPRG0",""))="" D  G EXIT
 . W !!,"No data found for this report."
 . I $G(PRSEGRP("TX"))]"" W !,"Review group: ",PRSEGRP("TX")
 . Q
 S PRSEGRP=""
 F  S PRSEGRP=$O(^TMP($J,"PRSEPRG0",PRSEGRP)) Q:PRSEGRP=""!PRSEQUIT  D
 . W !!,PRSEGRP
 . S PRSENAME=""
 . F  S PRSENAME=$O(^TMP($J,"PRSEPRG0",PRSEGRP,PRSENAME)) Q:PRSENAME=""!PRSEQUIT  D
 .. S Y="",Y=$G(^TMP($J,"PRSEPRG0",PRSEGRP,PRSENAME)) D:Y>0 DD^%DT W !?20,PRSENAME W:$G(Y)'="" ?50,Y
 .. I $Y>(IOSL-6) D PAUSE,HEADER
 .. Q
 . Q
EXIT ;
 K ^TMP($J,"PRSEPRG0") S POUT=+$G(PRSEQUIT) D CLOSE^PRSEUTL,^PRSEKILL
 Q
LOOP ;
 S X=$G(^PRSE(452.3,PRSEGRP,0))
 S PRSEGRP(0)=$P(X,U),PRSESERV=$P(X,U,2) Q:PRSEGRP(0)=""
 I (PRSESERV'=PRSESRV)&(PRSESERV'=PRSEMISC)&('$$EN4^PRSEUTL3(DUZ)) Q
 S PRSPCD0=0
 F  S PRSPCD0=$O(^PRSPC("ARG",PRSEGRP,PRSPCD0)) Q:PRSPCD0'>0  D
 . S PRSEPD1=$O(^PRSPC("ARG",PRSEGRP,PRSPCD0,0)),PRSENAME=$P($G(^PRSPC(PRSPCD0,0)),U) Q:PRSENAME=""!($P($G(^PRSPC(PRSPCD0,1)),U,33)'="N")
 . S ^TMP($J,"PRSEPRG0",PRSEGRP(0),PRSENAME)=$P($G(^PRSPC(PRSPCD0,5,PRSEPD1,0)),U,2)
 . Q
 I $O(^TMP($J,"PRSEPRG0",PRSEGRP(0),""))="" D
 . S ^TMP($J,"PRSEPRG0",PRSEGRP(0),"NONE")=""
 . Q
 Q
PAUSE ;
 I $E(IOST)="C" K DIR S DIR(0)="E" D ^DIR S PRSEQUIT=$S(Y'>0:1,1:0)
 Q
HEADER ;
 Q:PRSEQUIT
 W:($E(IOST)="C")!(PRSEPAGE>1) @IOF
 W !!?30,"REVIEW GROUP MEMBERS",?68,PRSENOW,!?68,"PAGE: ",PRSEPAGE
 S PRSEPAGE=PRSEPAGE+1
 W !,"REVIEW GROUP",?20,"GROUP MEMBER",?50,"DATE ASSIGNED",!,PRSEUNDL
 Q
