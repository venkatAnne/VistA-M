ESPSCR ;DALISC/CKA - OFFENSE REPORT SCREENS;8/92
 ;;1.0;POLICE & SECURITY;;Mar 31, 1994
EN ;
OFFE ;OFFENDER SCREEN INPUT
 S ESPNOT=0
 F ESPN=1:1 Q:'$D(ESPFN)&(ESPN'=1)!($D(DTOUT))  D OFIN  Q:ESPNOT
 QUIT
OFIN I $D(^TMP($J,"UOR","O",ESPN)) D WARN I 'ESPNOT K ^TMP($J,"UOR","O")
 Q:ESPNOT  S ESPTEST=""
 W !!,"OFFENDER #",ESPN
 K ESPFN D EN^ESPMNI
 I $D(DTOUT) S NOUPD=1 Q
 S ESPNO=0 I '$D(ESPFN) D DESCR
 I $D(DTOUT) S NOUPD=1 Q
PERS I 'ESPNO S DIR(0)="912.05,3.01" D RD G:$D(DTOUT) NOUPD G:$D(DUOUT) SO S ESPD(3.01)=Y
SO F ESPX=.04:.01:.1 S ESPTEST=ESPTEST_$G(ESPD(ESPX))
 QUIT:'$D(ESPFN)&(ESPTEST="")&($G(ESPD(3.01))="")
 S ^TMP($J,"UOR","O",ESPN)=$G(ESPFN)_"^^^"_$G(ESPD(.04))_"^"_$G(ESPD(.05))_"^"_$G(ESPD(.06))_"^"_$G(ESPD(.07))_"^"_$G(ESPD(.08))_"^"_$G(ESPD(.09))_"^"_$G(ESPD(.1)),^TMP($J,"UOR","OPERS",ESPN)=$G(ESPD(3.01))_"^"
 K ESPD S ESPI=1
OFF S DIR(0)="912.11,.01" D RD Q:$D(DIRUT)  S ESPOFF(ESPI)=+Y
DISP S DIR(0)="912.11,.02" D RD G:$D(DUOUT) SOF G:$D(DTOUT) NOUPD  S ESPDISP(ESPI)=+Y
 S CHD(ESPI)=""
CHD I ESPDISP(ESPI)=1 S DIR(0)="912.11,.04" D RD G:$D(DUOUT) SOF G:$D(DTOUT) NOUPD S CHD(ESPI)=Y
SOF S ^TMP($J,"UOR","O",ESPN,ESPI,0)=ESPOFF(ESPI)_"^"_$G(ESPDISP(ESPI))_"^^"_$G(CHD(ESPI))
YN S DIR(0)="Y",DIR("A")="Do you want to enter another offense for this offender",DIR("B")="NO" D ^DIR K DIR
 G:$D(DTOUT) NOUPD
 I "01"'[Y W !!,$C(7),?5,"You must enter Yes or No." G YN
 I Y S ESPI=ESPI+1 G OFF
 QUIT
EXIT K ESPNO,ESPTEST,X,Y
 QUIT
NO W $C(7),!!?5,"NO '^'S ALLOWED!",!!
 QUIT
NOUPD W !!,$C(7),?20,"NO UPDATING HAS OCCURRED!!!",!! K ESPCL,ESPD,ESPDTR,ESPX,ESPY,^TMP($J) S NOUPD=1 QUIT
DESCR ;Enter unknown offender description
 S DIR(0)="Y",DIR("A")="Do you wish to enter an unknown offender description",DIR("B")="NO" D ^DIR K DIR
 G:$D(DTOUT) NOUPD
 I 'Y S ESPNO=1 QUIT
 W !!,"UNKNOWN OFFENDER DESCRIPTION"
RACE S DIR(0)="912.05,.04" D RD Q:$D(DUOUT)!($D(DTOUT))  S ESPD(.04)=$P(Y,U)
HGHT S DIR(0)="912.05,.05" D RD Q:$D(DUOUT)!($D(DTOUT))  S ESPD(.05)=Y
WGHT S DIR(0)="912.05,.06" D RD Q:$D(DUOUT)!($D(DTOUT))  S ESPD(.06)=Y
HAIR S DIR(0)="912.05,.07" D RD Q:$D(DUOUT)!($D(DTOUT))  S ESPD(.07)=$P(Y,U)
EYE S DIR(0)="912.05,.08" D RD Q:$D(DUOUT)!($D(DTOUT))  S ESPD(.08)=$P(Y,U)
SKIN S DIR(0)="912.05,.09" D RD Q:$D(DUOUT)!($D(DTOUT))  S ESPD(.09)=$P(Y,U)
SCAR S DIR(0)="912.05,.1" D RD Q:$D(DUOUT)!($D(DTOUT))  S ESPD(.1)=Y
 QUIT
RD D ^DIR I $S($L(X)>1&($E(X)=U):1,($L(X)>1&(X[U)):1,1:0) D NO K X,Y G RD
 K DIR
 QUIT
WARN W !!,$C(7),"Warning:  The names that you have previously entered will be replaced if you enter a name."
 S DIR(0)="Y",DIR("A")="Are you sure you want to do this",DIR("B")="NO" D ^DIR K DIR
 I 'Y S ESPNOT=1
 QUIT
