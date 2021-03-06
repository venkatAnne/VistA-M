ABSVQ ;VAMC ALTOONA/CTB_TKW_RSD - QUE PRINTOUTS ;8/28/01  12:31 PM
V ;;4.0;VOLUNTARY TIMEKEEPING;**10,23,25**;JULY 6, 1994
 ;IF ABSVQ("FORCEQ") IS DEFINED ROUTINE WILL FORCE %ZTLOAD
 K IOP,ZTSK
 G:$D(ZTIO) TIME
 W:$D(ABSVQ("FORCEQ")) !,"QUEUE TO PRINT ON:"
 S %ZIS("B")="",%ZIS="MNQ"
 D ^%ZIS I POP W "  <No Device Selected>",*7,! R X:2 S NODEV="" G EXIT
 S (ABIOP,IOP)=ION_";"_IOST_";"_IOM_";"_IOSL
 I IO=IO(0),'$D(ABSVQ("FORCEQ")),'$D(IO("Q")) D ^%ZIS D @ZTRTN D:$D(IO("S")) ^%ZISC G EXIT
TIME I '$D(ZTDTH) D DQTIME I '% D CLOSE W:(IOM-$X)<20 ! W "  <Nothing Queued>",*7 S NODEV="" G EXIT
 S (ZTSAVE("DUZ"),ZTSAVE("ABIOP"))="" D ^%ZTLOAD,CLOSE W:(IOM-$X)<20 ! W "  <Request Queued>",*7,!
EXIT K %ZIS,I,IO("Q"),IOP,K,N,ABIOP,ABSVL,ABSVQ G ZTKILL
CLOSE D ^%ZISC QUIT
DQTIME S U="^",%=1 K ZTDTH W !,"Enter DATE & TIME to ",$S('$D(ZTIO):"print",ZTIO]"":"print",1:"run"),". NOW// " R X:$S($D(DTIME):DTIME,1:30) I X[U!('$T) S %=0 K X Q
 S:X="" X="NOW" S %DT="ER" D ^%DT S %=0 I Y<0 G DQTIME
 S X=Y D H^%DTC S Y=Y_"000",ZTDTH=%H_","_($E(Y,9,10)*60+$E(Y,11,12)*60),%=1
 K %DT,%H,ABSVXY,X,Y Q
MSG ;;PRINTS MESSAGE CONTAINED IN X.  IF IT DOESNT FIT ON ONE LINE, X IS PRINTED ON THE NEXT LINE.
 N X1,X2,ZX Q:'$D(X)
 F  Q:$E(X)'="!"  W ! S X=$E(X,2,9999)
 I $S('$D(IOM):1,IOM="":1,1:0) W $P(X,"*") W:X["*" *7 R X:2 K X Q
 I ($L($P(X,"*"))+4+$X)>IOM W !,?(IOM-($L($P(X,"*"))+4))
 F ZX=1:1 D BRK:($L(X)+6)>IOM W "  ",$P(X,"*"),! Q:'$D(X1)  S X=X1 K X1
 W:X["*" *7
 W:$E(X,$L(X))="!" !
 Q
BRK N I
 S X1=X F I=1:1 Q:$L($P(X," ",1,I))>(IOM-6)!($L(X)<(IOM-6))  S X1=$P(X," ",1,I)
 S X2=$P(X," ",I,999),X=X1,X1=X2 K X2 Q
PAUSE ; MAKES TERMINAL PAUSE WHEN DISPLAYING DATA ONLINE
 S %=1 W !!,"Press RETURN to continue or '^' to quit: " R X:DTIME S:'$T!(X["^") %=0 Q
ENCON W !,"  ** Press RETURN to Continue **" R X:DTIME Q
DIKILL ; KILL STANDARD FILE MANAGER VARIABLES
 K %,%DT,ABSVXX,ABSVXY,BY,D,DA,DCC,DIC,DIE,DIJ,DIPT,DIPASS,DISYS,DP,DR,D0,D1,D2,DQ,DHD,DLAYGO,F,FLDS,FR,I,IOX,IOY,J,K,L,O,P,POP,W,X,Y,Z,ZTSK Q
DIWKILL ; KILL FILE MANAGER WORD PROCESSING VARIABLES
 K DIW,DIWF,DIWI,DIWL,DIWR,DIWT,DIWTC,DIWX,DWLW,X1 Q
ZTKILL ; KILL VARIABLES USED BY UNIVERSAL TASK MANAGER
 K %ZIS,POP,ZTRTN,ZTUCI,ZTDTH,ZTSAVE,ZTDESC,ZTIO,ZTSK,ZTSKT Q
CNVD ; CONVERTS DATE FROM INTERNAL (YYYMMDD) STORAGE FORMAT TO MM/DD/YYYY
 S (Y,ABSVXX)="" I X]"" S Y=$E(X,4,5)_"/"_$E(X,6,7)_"/"_($E(X,1,3)+1700) S ABSVXX=Y_$S(X[".":"  "_$E($P(X,".",2)_"0000",1,2)_":"_$E($P(X,".",2)_"0000",3,4),1:"")
 Q
NOW N %H,ABSVXI,ABSVXM,ABSVXD,ABSVXY S %H=$H D TT S %=$P($H,",",2),%=%#3600\60/100+(%\3600)/100,%=X_$S(%:%,1:"") S Y=% D D S ABSVXX=Y S Y=X D D Q
TT D 7 S ABSVXI(1)=ABSVXM,ABSVXI(2)=ABSVXD,ABSVXI(3)=ABSVXY Q
7 S %=%H>21608+%H-.1,ABSVXY=%\365.25+141,%=%#365.25\1
 S ABSVXD=%+306#(ABSVXY#4=0+365)#153#61#31+1,ABSVXM=%-ABSVXD\29+1
 S X=ABSVXY_"00"+ABSVXM_"00"+ABSVXD Q
 ;
D ;CONVERTS FILEMAN INTERNAL DATE TO EXTERNAL FORMAT
 S:Y Y=$S($E(Y,4,5):$P("JAN^FEB^MAR^APR^MAY^JUN^JUL^AUG^SEP^OCT^NOV^DEC","^",+$E(Y,4,5))_" ",1:"")_$S($E(Y,6,7):+$E(Y,6,7)_",",1:"")_($E(Y,1,3)+1700)_$P("@"_$E(Y_0,9,10)_":"_$E(Y_"000",11,12),"^",Y[".")
 Q
HILO S (ABSVHI,ABSVLO,ABSVNORM)="*0" I ^%ZOSF("OS")'["M/11" Q
 N TMP I $D(IOST)["0" S IOP=$S($D(ION):ION,1:IO(0)) D ^%ZIS K IOP,POP
 S:$D(^%ZIS(2,IOST(0),7)) TMP=^(7),ABSVHI=$P(TMP,"^",1),ABSVLO=$P(TMP,"^",2),ABSVNORM=$P(TMP,"^",3) I ABSVHI=""!(ABSVLO="")!(ABSVNORM="") S (ABSVLO,ABSVHI,ABSVNORM)="*0"
 Q
NA N X
 S X="  <NO ACTION TAKEN>*" D MSG QUIT
