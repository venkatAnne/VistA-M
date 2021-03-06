SPNUTL0 ;HISC/DAD-GENERIC FILE ENTRY SELECTOR ;12/8/95  09:40
 ;;2.0;Spinal Cord Dysfunction;;01/02/1997
 ;
 ;*** SELECTS A GROUP OF RECORDS FROM A FILE ***
 ;
 ;REQUIRES:
 ;  SPNDIC      = FILE NUMBER OR GLOBAL ROOT
 ;  SPNDIC(0)   = DIC(0) STRING
 ;  SPNUTIL     = NODE TO STORE DATA UNDER IN ^TMP($J,SPNUTIL,
 ;OPTIONAL:
 ;  SPNDIC("A") = DIC("A") STRING
 ;  SPNDIC("B") = DIC("B") STRING
 ;  SPNDIC("S") = DIC("S") STRING
 ;  SPNDIC("W") = DIC("W") STRING
 ;RETURNS:
 ;  SPNQUIT     = $S(UP_ARROW_OUT:1 , NOTHING_SELECTED:1 , 1:0)
 ;  ^TMP($J,SPNUTIL,EXTERNAL_.01_FIELD_DATA,IEN) = ""
EN1 ;
 S SPNQUIT=0
 I ($D(SPNDIC)[0)!($D(SPNDIC(0))[0)!($D(SPNUTIL)[0) S SPNQUIT=1 G EXIT
 I (SPNDIC="")!(SPNDIC(0)="")!(SPNUTIL="") S SPNQUIT=1 G EXIT
 D K S DIC=SPNDIC
 I DIC D  G:SPNQUIT EXIT
 . S (SPNDIC,DIC)=$$GET1^DID(DIC,"","","GLOBAL NAME")
 . I DIC="" S SPNQUIT=1
 . Q
 S DIC(0)=SPNDIC(0),DIC(0)=$TR(DIC(0),"AL")
 S:DIC(0)'["Z" DIC(0)=DIC(0)_"Z" S SPNDIC(0)=DIC(0)
 D DO^DIC1 S SPNFNUM=+DO(2),SPNFNAME=$P(DO,"^")
 S SPNFLD01=$$GET1^DID(SPNFNUM,.01,"","LABEL")
 S SPNFSCR=$S($D(DO("SCR"))#2:DO("SCR"),1:"") K DO
 S SPNFLD01("S")=SPNFLD01_$S($E(SPNFLD01,$L(SPNFLD01))?1L:"s",1:"S")
 F X="A","B","S","W" S SPNDIC(X)=$S($D(SPNDIC(X))#2:SPNDIC(X),1:"")
 S:SPNDIC("A")="" SPNDIC("A")="Select "_SPNFNAME_" "_SPNFLD01_": "
 S SPNALL=0,SPNNUM=1 K TMP($J,SPNUTIL) D HOME^%ZIS
1 D SETDIC
 W !!,$S(SPNNUM>1:"Another one: ",1:DIC("A"))
 W $S((SPNNUM=1)&(SPNDIC("B")]""):SPNDIC("B")_"// ",1:"")
 R X:DTIME S:('$T)!($E(X)="^") SPNQUIT=1
 G:SPNQUIT EXIT S:(SPNNUM=1)&(X="")&(SPNDIC("B")]"") X=SPNDIC("B")
 G:X="" EXIT S SPNDSEL=$S(X?1"-"1.E:1,1:0) S:SPNDSEL X=$E(X,2,$L(X))
 I $L(X),$L(X)<4,"Aa"[$E(X),"Ll"[$E(X,2),"Ll"[$E(X,3) D ALL G EXIT:SPNQUIT,1:SPNALL
 D HELP:$E(X)="?",^DIC K DIC G:+Y'>0 1
 I $$CHKFLD(SPNFNUM)["D" D
 . N %DT,X
 . S SPND0=Y,X=Y(0,0),%DT="ST" D ^%DT S Y(0,0)=Y,Y=SPND0
 . Q
 I 'SPNDSEL,'$D(^TMP($J,SPNUTIL,$E(Y(0,0),1,63),+Y)) D
 . S ^TMP($J,SPNUTIL,$E(Y(0,0),1,63),+Y)=""
 . S SPNNUM=SPNNUM+1
 . Q
 I SPNDSEL,$D(^TMP($J,SPNUTIL,$E(Y(0,0),1,63),+Y)) D
 . K ^TMP($J,SPNUTIL,$E(Y(0,0),1,63),+Y)
 . S SPNNUM=SPNNUM-$S(SPNNUM>0:1,1:0)
 . Q
 G 1
EXIT ;
 S SPNQUIT=$S(SPNQUIT:1,$O(^TMP($J,SPNUTIL,""))="":1,1:0)
 K SPNDIC,SPNUTIL
K K %,C,D0,DA,DIC,DIK,DIR,DO,SPN,SPNALL,SPND0,SPNDSEL,SPNDT,SPNFLD01
 K SPNFNAME,SPNFNUM,SPNFSCR,SPNLINE,SPNNUM,X,Y
 Q
ALL ;
 S SPN="By '"_X_"' do you mean all "_$S($G(SPNFSCR)]"":"",$G(SPNDIC("S"))]"":"",1:$P(@(SPNDIC_"0)"),"^",4)_" ")_SPNFNAME_" "_SPNFLD01("S")
 D WRAP(SPN)
 S %=1 D YN^DICN S SPNALL=$S(%=1:1,1:0) S:%=-1 SPNQUIT=1
 I '% D  G ALL
 . W !?7,"Answer Y(es) if you want all of the ",SPNFLD01("S"),","
 . W !?7,"otherwise answer N(o)"
 . Q
 I SPNQUIT!'SPNALL W:'SPNQUIT !!,X Q
 N X F SPND0=0:0 S SPND0=$O(@(SPNDIC_"SPND0)")) Q:SPND0'>0  D AL
 W:SPNNUM=1 " ??",*7
 Q
AL I SPNFSCR]"" D SETDIC I $D(@(SPNDIC_"SPND0,0)"))#2 S (D0,DA,Y)=SPND0 X SPNFSCR Q:'$T
 I SPNDIC("S")]"" D SETDIC I $D(@(SPNDIC_"SPND0,0)"))#2 S (D0,DA,Y)=SPND0 X DIC("S") Q:'$T
 S Y=$P($G(@(SPNDIC_"SPND0,0)")),"^"),C=$P(^DD(SPNFNUM,.01,0),"^",2) Q:Y=""
 D Y^DIQ
 I $$CHKFLD(SPNFNUM)["D" D
 . N %DT,X
 . S X=Y,%DT="ST" D ^%DT
 . Q
 S ^TMP($J,SPNUTIL,$E(Y,1,63),SPND0)="",SPNNUM=SPNNUM+1
 Q
HELP ;
 N X S SPN="Select a "_SPNFNAME_" "_SPNFLD01_" from the displayed list."
 D WRAP(SPN)
 W !?5,"To deselect an ",SPNFLD01," type a minus sign (-)"
 W !?5,"in front of it, e.g.  -",SPNFLD01,"."
 W !?5,"To get all ",SPNFLD01," type ALL."
 G:$O(^TMP($J,SPNUTIL,""))="" HLP
SHOW S SPNLINE=$Y,SPN="" W !!,"You have already selected:"
 F  S SPN=$O(^TMP($J,SPNUTIL,SPN)) Q:SPN=""!SPNQUIT  D
 . F SPND0=0:0 S SPND0=$O(^TMP($J,SPNUTIL,SPN,SPND0)) Q:SPND0'>0!SPNQUIT  D
 .. S SPN(0)=SPN
 .. I $$CHKFLD(SPNFNUM)["D" D
 ... N Y
 ... S Y=SPN(0) X ^DD("DD") S SPN(0)=Y
 ... Q
 .. I SPNDIC(0)["N" W !?3,SPND0,?15,SPN(0)
 .. E  W !?3,SPN(0)
 .. D SETDIC
 .. I $D(DIC("W"))#2,DIC("W")]"",$D(@(SPNDIC_"SPND0,0)"))#2 D
 ... S (D0,DA,Y)=SPND0 X DIC("W")
 ... Q
 .. I $Y>(IOSL+SPNLINE-3) D PAUSE S SPNLINE=$Y
 .. Q
 . Q
HLP W ! S SPNQUIT=0
 Q
WRAP(X) ;
 W ! F  D  Q:X=""
 . S Y=$L($E(X,1,IOM-20)," ")
 . W !?5,$P(X," ",1,Y)
 . S X=$P(X," ",Y+1,999)
 . Q
 Q
PAUSE ;
 K DIR S DIR(0)="E" D ^DIR K DIR S SPNQUIT=$S(Y:0,1:1)
 Q
SETDIC ;
 K DIC,DO S DIC=SPNDIC
 F X="0","A","B","S" I SPNDIC(X)]"" S DIC(X)=SPNDIC(X)
 I $D(SPNDIC("W")) S DIC("W")=SPNDIC("W")
 D DO^DIC1
 Q
CHKFLD(X) ;
 N A S A=$$GET1^DID(X,.01,"","SPECIFIER")
 I A["P" F  S A=$$CHKFLD($TR(A,$TR(A,".0123456789"))) Q:A'["P"
 Q A
