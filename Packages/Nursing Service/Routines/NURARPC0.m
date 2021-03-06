NURARPC0 ;HIRMFO/MD-DRIVER TO PRINT AMIS 1106 ACUITY REPORTS ;2/28/96
 ;;4.0;NURSING SERVICE;;Apr 25, 1997
 Q:'$D(^DIC(213.9,1,"OFF"))  Q:$P(^DIC(213.9,1,"OFF"),"^",1)=1
 S (NURQUEUE,NUROUT,NURMDSW,NURMDSW(3))=0 D LOSER^NURARST G QUIT:NUROUT,EN1:SEL=2,EN2:SEL=1
EN1 ; ENTRY FROM OPTION NURAPR-RES-PCSER
 S NHOSPSW=1,NURSTYPE="",NURSUMSW=0
 G HSKEEP
EN2 ; ENTRY FROM OPTION NURAPR-RES-PCLOC
 S NHOSPSW=0,NURSTYPE="U"
HSKEEP ; SET LOCAL VARIABLES
 S NURPAGE=0,(NURSWARD,NBDSECT,NURSWHEN)="",%DT="",X="T",(NURMDSW(1),NURMDSW(2))=1
 D ^%DT S NRPTDAT=Y
 D RPTYPSEL,REPTYPE:NHOSPSW,WARDSEL:'NHOSPSW I $G(NUROUT) G QUIT
 D @$S(NURSTYPE="U"&(NHOSPSW):"HOSPSEL",1:"BEDSEL") I $G(NUROUT) G QUIT
 D TIMESEL I NUROUT G QUIT
 D @$S(NURSWHEN="D":"SETDAY^NURARPC1",NURSWHEN="M":"SETMON^NURARPC1",NURSWHEN="Q"!(NURSWHEN="A"):"SETQUART^NURARPC1",1:"ERROR") W !
 G:NUROUT QUIT
 S ZTRTN="START^NURARPC0" D EN7^NURSUT0 G:POP!($D(ZTSK)) QUIT
START ;
 K ^TMP($J),^TMP("NURBDSM",$J)
 D ^NURARPC3
 I '$D(ZTSK),'NUROUT G HSKEEP
QUIT ; KILL LOCAL VARIABLES
 D CLOSE^NURSUT1,^NURAKILL
 Q
RPTYPSEL ; SELECT WHETHER REPORT IS BED SECTION OR WARD
 W !!!!,?21,"Patient Classification Data",!!,?19,"AMIS Report 10-1106 Segment 200"
 Q
REPTYPE ;
 D EN9^NURSAGSP
 I NURMDSW D:NHOSPSW EN12^NURSAGSP Q:$G(NUROUT)  W ! S DIC(0)="AEMQZ" D EN8^NURSAGSP Q:$G(NUROUT)!$G(NURSUMSW)
 W !!,?13,"Please select whether this report is to show",!,?13,"acuity by unit or bed section"
 R !!,?13,"Select U for Unit or B for Bed Section: ",NURSTYPE:DTIME
 I "^"[NURSTYPE!('$T) S NUROUT=1 Q
 I NURSTYPE?1L S NURSTYPE=$C($A(NURSTYPE)-32)
 Q:((NURSTYPE="B")!(NURSTYPE="U"))
 W $C(7) G REPTYPE
HOSPSEL ; SET UP FOR WHOLE HOSPITAL REPORT
 S NURSWARD="" Q
WARDSEL ; SELECT WARD FOR REPORT
 S DIC("S")="I '($G(^(""I""))=""A""&($P($G(^(1)),U)=""I""))"
ASK R !!,"Select Nursing Unit: ",X:DTIME I "^"[X!('$T) S NUROUT=1 Q
 S DIC="^NURSF(211.4,",DIC(0)="EMZQ" D ^DIC K DIC
 I +Y'>0 G ASK
 S NURSWARD(0)=Y(0,0),NURSWARD=+Y
 Q
BEDSEL ; SELECT BED SECTION FOR REPORT
 Q:$G(NURSUMSW)  W !!,"Select Nursing Bed Section (Press return for all bed sections): "
 R NBDSECT:DTIME I NBDSECT="^"!'$T S NUROUT=1 Q
 Q:NBDSECT=""
 S X=NBDSECT,DIC="^NURSF(213.3,",DIC(0)="QEM" D ^DIC K DIC G:((+Y=-1)!(X["?")) BEDSEL
 S NBDSECT=+Y
 Q
TIMESEL ; SELECT REPORT RANGE (DAILY, MONTHLY, QUARTERLY OR ANNUALLY)
 W !!,?13,"Select report range: ",!!,?18,"Daily",!,?18,"Monthly",!,?18,"Quarterly",!,?18,"Annually"
TIME ;
 R !!,?13,"Enter Selection (D,M,Q or A): ",NURSWHEN:DTIME
 I "^"[NURSWHEN!('$T) S NUROUT=1 Q
 I NURSWHEN?1L S NURSWHEN=$C($A(NURSWHEN)-32)
 Q:((NURSWHEN="A")!(NURSWHEN="D")!(NURSWHEN="M")!(NURSWHEN="Q"))
 W $C(7) G TIME
 Q
ERROR ; ERROR IN SELECTION PROCESS
 W !!,$C(7),"CANNOT RUN REPORT, PARAMETERS WERE BADLY CHOSEN"
 S NUROUT=1
 Q
