RMPFEA ;DDC/KAW-APPROVE/DISAPPROVE ORDERS; [ 06/16/95   3:06 PM ]
 ;;2.0;REMOTE ORDER/ENTRY SYSTEM;;JUN 16, 1995
RMPFSET I '$D(RMPFMENU) D MENU^RMPFUTL I '$D(RMPFMENU) W !!,$C(7),"*** A MENU SELECTION MUST BE MADE ***" Q  ;;RMPFMENU must be defined
 I '$D(RMPFSTAN)!'$D(RMPFDAT)!'$D(RMPFSYS) D ^RMPFUTL Q:'$D(RMPFSTAN)!'$D(RMPFDAT)!'$D(RMPFSYS)
 W @IOF,!,"APPROVE/DISAPPROVE ORDERS" D APRV G END:'AP
WRITE W !!,"APPROVAL",?13,"will place an order in the open transmission batch",!?13,"with the status APPROVED"
 W !!,"DISAPPROVAL",?13,"of an order will terminate that order with a status",!?13,"of DISAPPROVED."
 D CONT G END:$D(RMPFOUT),RMPFSET:$D(RMPFQUT),RMPFSET:Y'=""
START S RMPFORD="S",RMPFTP="B" K RMPFP S RMPFP(2)="" D ^RMPFDS1 K RMPFP
 D SEL^RMPFEA1 G END:$D(RMPFOUT)
 I RMPFM="M" D MULTI^RMPFEA1 G END:$D(RMPFOUT),START
 G END:'$D(RMPFX)
 S DFN=$P(^RMPF(791810,RMPFX,0),U,4) I DFN D PAT^RMPFUTL
 S S0=^RMPF(791810,RMPFX,0),RMPFTYP=$P(S0,U,2) I 'RMPFTYP D MSG G END
 I '$D(^RMPF(791810.1,RMPFTYP,0)) D MSG G END
 S TP=$P(^RMPF(791810.1,RMPFTYP,0),U,3)
ST1 D ^RMPFDT1 S RMPFHAT="",X=$P(^RMPF(791810,RMPFX,0),U,2)
 I X,$D(^RMPF(791810.1,X,0)) S RMPFHAT=$P(^(0),U,2)
APP W !!,"Enter <A>pprove, <D>isapprove" S FX="AaDd"
 I RMPFHAT="C" W ", <H>istory" S FX=FX_"Hh"
 W " or <^> to exit: A// " D READ G END:$D(RMPFOUT)
APP1 I $D(RMPFQUT) W !!,"Enter an <A> if you wish to approve this order,",!?7,"a <D> if you wish to disapprove this order" W:FX["H" !?6,"an <H> to view the history of the order" W !?6,"an <^> to exit." G APP
 S:Y="" Y="A" S Y=$E(Y,1) I FX'[Y S RMPFQUT="" G APP1
 I "Hh"[Y D ^RMPFDT7 G END:$D(RMPFOUT),ST1
 I "Dd"[Y D DIS G END:$D(RMPFOUT),START
 S X="NOW",%DT="T" D ^%DT D SET^RMPFEA2 G START
END K RMPFNAM,RMPFSSN,RMPFDOB,RMPFORD,RMPFTP,RMPFP,RMPFM,RMPFS,S0,DFN
 K Y,L,CM,FX,RMPFO,RMPFTYP,TP,RMPFOUT,RMPFQUT,T,J,DISYS,RMPFDOD,SS
 K SP,%,%Y,%DT,RMPFCX,D,D0,DA,DIC,DIE,DI,DQ,DR,FY,PR,PJ,I,X,AP Q
DIS ;; input: RMPFX
 ;;output: None
 W !!,"Reason for Disapproval: " D READ G END:$D(RMPFOUT)
DIS1 I $D(RMPFQUT) W !!,"Enter the reason for disapproving this order in 3 to 30 characters." G DIS
 I $L(Y)<3!$L(Y)>30 S RMPFQUT="" G DIS
 S RMPFDR=Y,X="NOW",%DT="T" D ^%DT S TD=Y
 S DA=RMPFX,DIE="^RMPF(791810,",DR=".03////7;.06////"_TD_";.1////"_DUZ_";.11////"_DT_";10.02////"_RMPFDR D ^DIE
 S DIE="^RMPF(791810,"_RMPFX_",101,",DA(1)=RMPFX,DR=".17////"_TD_";.18////7"
 S DA=0 F  S DA=$O(^RMPF(791810,RMPFX,101,DA)) Q:'DA  D ^DIE
 K DA,DIE,DR,Y,RMPFDR,TD Q
APRV S X=$P(RMPFSYS,U,7),AP=0 S:X="" X="S"
 I X="N" W $C(7),!!,"*** APPROVAL PROCESS OCCURS AUTOMATICALLY WHEN ORDER IS PLACED ***" D CONT G APRVE
 I RMPFMENU=10,X="A" S AP=1 G APRVE
 I $D(^XUSEC("RMPF SUPERVISOR",DUZ)) S AP=1 G APRVE
 I X="A",$D(^RMPF(791813,RMPFSTAN,101,DUZ,0)),$P(^(0),U,3) S AP=1 G APRVE
 D MSG,CONT
APRVE Q
READ K RMPFOUT,RMPFQUT
 R Y:DTIME I '$T W $C(7) R Y:5 G READ:Y="." S:'$T Y=U
 I Y?1"^".E S (RMPFOUT,Y)="" Q
 S:Y?1"?".E (RMPFQUT,Y)=""
 Q
MSG W $C(7),!!,"*** YOU HAVE NOT BEEN DESIGNATED AS ",$S($P(RMPFSYS,U,7)="A":"AN AUDIOLOGIST OR SUPERVISOR",1:"A SUPERVISOR")," ***" Q
CONT F I=1:1 Q:$Y>20  W !
 W !!,"Enter <RETURN> to continue." D READ Q
