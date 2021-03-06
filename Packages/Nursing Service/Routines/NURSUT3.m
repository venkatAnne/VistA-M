NURSUT3 ;HIRMFO/RM,MD-UTILITIES FOR FILES 210 AND 211.8 ; 3/4/03 10:51am
 ;;4.0;NURSING SERVICE;**33,38**;Apr 25, 1997
 ;
 ; Reference to ^SC is supported by IA #1416
 ; Reference to File #454.1 is supported by IA #1404
 ; ^XSEC is covered by supported reference #10076 
 ;
EN1 ; INPUT TRANSFORM FOR THE VACANCY DATE (#3) OF THE OCCUPANCY/TRANS.
 ; DATE (#2) FIELD OF THE POSITION CONTROL FILE.
 S NUR(0)=$P($G(^NURSF(211.8,DA(1),0)),U,1,2)_U_$S($D(^NURSF(211.8,DA(1),1,DA,0)):^(0),1:""),NURSBAD=$S(Y'>+NUR(0):"1^3",1:0)
 I 'NURSBAD S $P(NUR(0),U,8)=X D EN3^NURSUT2
 K:NURSBAD X D EN4
 Q
EN2 ; ENTRY FROM INPUT TRANSFORM FOR 1 & 1.5 SUBFIELDS OF FIELD 27
 ; OF FILE 210
 S NURS(0)=$S($D(^NURSF(210,DA(1),18,DA,0)):^(0),1:""),NURS("HELP")="DATE MUST BE "_$P("GREATER THAN DATE STARTED ^LESS THAN DATE ENDED ",U,NURS*10=10+1),%DT(0)=+($E("-",NURS*10=10)_$P(NURS(0),U,$E(24,NURS*10=10+1)))
 K:%DT(0)=0 %DT(0) S %DT="E" D ^%DT S X=Y I Y<1 W !?5,NURS("HELP") K X
 K %DT,NURS
 Q
EN3 ; ENTRY FROM INPUT TRANSFORM ON SUBFIELD .01 OF SUBFIELD 5.5 OF
 ; FIELD 27 IN FILE 20
 S NURS=0 F D1=0:0 S D1=$O(^NURSF(210,DA(2),18,D1)) Q:D1'>0  F D2=0:0 S D2=$O(^NURSF(210,DA(2),18,D1,1,D2)) Q:D2'>0  I $D(^NURSF(210,DA(2),18,D1,1,D2,0)) S NURS(0)=$P(^(0),U) S:X=$P(NURS(0),U) NURS=1
 I '+NURS W !!,$C(7),?5,"NO FUNDS WERE REQUESTED FOR "_$S(X="T":"TRAVEL",X="A":"AIRFARE",X="P":"PER DIEM",1:"REGISTRATION")_":" K X
 K NURS
 Q
EN4 ; PRINT ERROR MESSAGE BASED ON WHAT IS RETURNED FROM EN3
 ; INPUT VARIABLES: NURSBAD=$S(0:NO PROB,1:PROB)^$S(1:FTEE>1,2:DUP PRI,
 ;                                               3:STARTDT>VACDT,4:DUP)
 ;                                               SERVICE POS,5:NO PRI)
 ;                                               ASS:ERR,7:DUP DUTY
 ;                                               TOURS)
 I NURSBAD W !!?5,$C(7) W:'($P(NURSBAD,U,2)=5) "DUE TO CHANGES THAT HAVE BEEN MADE, "
 I  W $S($P(NURSBAD,U,2)=1:"THE TOTAL FTEE",$P(NURSBAD,U,2)=2:"TWO PRIMARY ASSIGNMENTS EXIST FOR",$P(NURSBAD,U,2)=3:"THE START DATE IS GREATER THAN",$P(NURSBAD,U,2)=4:"DUPLICATE SERVICE POSITIONS ON THE",1:"")
 I  W $S($P(NURSBAD,U,2)=7:"DUPLICATE DUTY TOURS ON THE",1:"")
 I  W $S($P(NURSBAD,U,2)=1:"",$P(NURSBAD,U,2)=2:"",$P(NURSBAD,U,2)=3:"",$P(NURSBAD,U,2)=4:"",$P(NURSBAD,U,2)=5:"NO PRIMARY POSITION WAS DESIGNATED, THIS POSITION WILL BE PRIMARY",$P(NURSBAD,U,2)=7:"",1:"")
 I  W $S($P(NURSBAD,U,2)=1:"",$P(NURSBAD,U,2)=2:"",$P(NURSBAD,U,2)=3:"",$P(NURSBAD,U,2)=4:"",$P(NURSBAD,U,2)=5:"",$P(NURSBAD,U,2)=6:"NO PRIMARY POSITION EXISTS FOR THIS ",$P(NURSBAD,U,2)=7:"",1:"INVALID DATA EXISTS FOR THIS")
 I  W !?5,$S($P(NURSBAD,U,2)=1:"WOULD BE GREATER THAN 1 FOR THIS ",$P(NURSBAD,U,2)=2:"THIS ",$P(NURSBAD,U,2)=3:"THE VACANCY DATE FOR THIS ",$P(NURSBAD,U,2)=4!($P(NURSBAD,U,2)=7):"SAME LOCATION EXIST FOR THIS ",1:"")
 I  W:'($P(NURSBAD,U,2)=5) "EMPLOYEE. PLEASE RETRY THE CHANGE.",!
 K NURSBAD,NX
 Q
EN5 ; ENTRY FROM INPUT TRANSFORM FOR 2 & 3 SUBFIELDS OF FIELD 24
 ; OF FILE 210
 S NURS(0)=$S($D(^NURSF(210,DA(1),12,DA,0)):^(0),1:""),NURS("HELP")="DATE MUST BE "_$P("GREATER THAN DATE STARTED ^LESS THAN DATE ENDED ",U,NURS*10=20+1),%DT(0)=+($E("-",NURS*10=20)_$P(NURS(0),U,$E(23,NURS*10=20+1)))
 S:%DT(0)=0 %DT(0)=2500101 ;this check stops erroneous years from being entered if user responds with 010100 and FileMan returns 1/1/1900
 K:%DT(0)=0 %DT(0) S %DT="E" D ^%DT S X=Y I Y<1 W !?5,NURS("HELP") K X
 K %DT,NURS
 Q
EN6(DA) ; SCREEN IF EMPLOYEE IS AUTHORIZED TO VIEW THIS LOCATION
 ;   VARIABLES ARE SET BASED ON DIC("S") TO FILE 210.
 ;
 S NURSZORT=1
 N NURNODE4,NUR200DA,NUR21182,NURDATA,NURSSEE
 S NUR200DA=+$G(^NURSF(210,+Y,0)) I NUR200DA'>0 S NURSZORT=0
 I NURSZORT D
 .  I $G(NURSZAP)>6 D  Q:'NURSZORT  ; Check location security.
 .  .  S NURSZORT=0
 .  .  S NURNODE4=0 F  S NURNODE4=$O(^NURSF(211.8,"C",NUR200DA,NURNODE4)) Q:NURNODE4'>0  D  Q:NURSZORT
 .  .  .  S NUR21182=0 F  S NUR21182=$O(^NURSF(211.8,"C",NUR200DA,NURNODE4,NUR21182)) Q:NUR21182'>0  D  Q:NURSZORT
 .  .  .  .  S NURDATA=$G(^NURSF(211.8,NURNODE4,1,NUR21182,0)) Q:NURDATA=""
 .  .  .  .  Q:$P(NURDATA,U)=""!($P(NURDATA,U)>DT)!($P(NURDATA,U,6)'=""&($P(NURDATA,U,6)'>DT))
 .  .  .  .  S NURSZORT=1 D EN3^NURSAUTL
 .  .  .  .  Q
 .  .  .  Q
 .  .  Q
 .  D EN2^NURSAUTL:$G(NURSZAP) ; Check service position security.
 .  Q
 Q +$G(NURSZORT)
 ;
EN7(DUZ) ; PRSE TRAIN SECURITY KEY CHECK
 Q $S($D(^XUSEC("PRSE TRAIN",DUZ)):1,1:0)
EN8(DUZ) ; PRSE SUP SECURITY KEY CHECK
 Q $S($D(^XUSEC("PRSE SUP",DUZ)):1,1:0)
EN9(DUZ) ; PRSE CORD SECURITY KEY CHECK
 Q $S($D(^XUSEC("PRSE CORD",DUZ)):1,1:0)
EN10(DUZ) ;
 I NURSZAP>0,+$$EN8^NURSUT3($G(DUZ)) S NURSZAP=0 Q
 I NURSZAP>0,+$$EN9^NURSUT3($G(DUZ)) S NURSZAP=0 Q
 I NURSZAP>7,+$$EN7^NURSUT3($G(DUZ)) S NURSZAP=7
 Q
EN11(DA) ; GET FACILITY WITH POSITION CONTROL IEN IN THE NURS POSITION
 ; CONTROL 211.8 FILE. THE VALUE OF THE FUNCTION WILL BE "" IF THERE
 ; IS NO FACILITY ASSOCIATED WITH THIS HOSPITAL LOCATION, OR THE
 ; FREE TEXT VALUE OF THE FACILITY
 S XXX="",DIC44DA=+$$GET1^DIQ(211.8,DA,.01,"I")
 I DIC44DA S DIC4DA=+$$GET1^DIQ(44,DIC44DA,3,"I") I DIC4DA S XXX=$$GET1^DIQ(4,+DIC4DA,.01,"I")
 S:XXX="" XXX=$S($G(NURMDSW):"  BLANK",$G(^NURSA(213.2,1,0)):$$GET1^DIQ(4,+$G(^NURSA(213.2,1,0)),.01,"I"),1:"")
 K DIC44DA,DIC4DA
 Q XXX
EN12(DA) ; GET FACILITY WITH IEN FROM THE NURS LOCATION 211.4 FILE
 ; THE VALUE OF THE FUNCTION WILL BE " BLANK" IF THERE IS NO FACILITY ASSOCIATED
 ; WITH THIS NURS LOCATION OR THE FREE TEXT VALUE OF THE FACILITY
 S XXX="",DIC4DA=+$P($G(^SC(+$G(^NURSF(211.4,+DA,0)),0)),U,4),XXX=$$GET1^DIQ(4,+DIC4DA,.01,"I") S:XXX="" XXX="  BLANK" K DIC4DA
 Q XXX
EN13(NOD1) ; GET PRODUCT LINE OF PRIMARY NURS LOCATIO WITH IEN FROM THE
 ; POSITION CONTROL FILE THE VALUE OF THE FUNCTION WILL BE " BLANK
 ; IF THERE IS NO PRODUCT LINE ASSOCIATED WITH THIS NURS LOCATION OR THE
 ; FREE TEXT VALUE OF THE PRODUCT LINE
 N NURUNIT,SC44DA,NUR2127 S SC44DA=+$G(^NURSF(211.8,NOD1,0)),NURUNIT=$O(^NURSF(211.4,"B",SC44DA,0))
 S XXX=" BLANK",NUR2127=+$P($G(^NURSF(211.4,+NURUNIT,1)),U,4) I NUR2127 S XXX=$$GET1^DIQ(212.7,+NUR2127,.01,"I")
 Q XXX
GETSER() ; THIS PROCEDURE WILL RETURN THE VALUE FOR NURSING IN THE
 ; PAID COST CENTER ORGANIZATION CODE (454.1) FILE.  THE VALUE
 ; OF THE FUNCTION WILL BE "" IF THERE ARE NO NURSING ENTRIES, OR
 ; A LIST OF NURSING ENTRY IEN's SEPARATED BY ^'s.
 N FXN
 S FXN(1)=$O(^PRSP(454.1,"B","NURSING",0))
 S FXN(2)=$O(^PRSP(454.1,"B","NURSING SERVICE",0))
 I FXN(1)!FXN(2) S FXN=U_$S(FXN(1):FXN(1)_U,1:"")_$S(FXN(2):FXN(2)_U,1:"")
 E  S FXN=""
 Q FXN
