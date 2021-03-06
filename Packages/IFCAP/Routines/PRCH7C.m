PRCH7C ;WISC/PLT-PURCHASE CARD PROSTHETICS AMEND/RECONCILE INTERFACE; 4/1/98
V ;;5.1;IFCAP;;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 QUIT  ;invalid entry
 ;
 ; prca=ien of 442, prcb=new order amount
 ; X-return value=1 if amendment done, 0=not done
AMEND(PRCA,PRCB) ;amendment
 N PRC,PRCPROST,PRCRI,PRCHAUTH,PRCPAMT
 N PRCF,RETURN,PRCHAM,PRCHPO,PRCHNEW,OUT,CAN,PRCHAU,PRCHER,PRCHON
 N A,B,ER,FL,FIS,DELIVER,PRCHAMDA,PRCHAV,PRCHL1,PRCHLN,PRCHRET,LCNT
 N PRCHL2,ROU,DIC,I,PRCHAMT,PRCHAREC,PRCHEDI,PRCHN,PRCHO,SFUND
 N PRCHX,PRCHIMP,PRCHNRQ,PRCHP,REPO,PRCHNORE,%,%A,%B,D0,D1,J
 N DA
 D DUZ^PRCFSITE
 S PRCRI(442)=+PRCA,PRCRI(443.6)=+PRCA,PRCPAMT=PRCB
 ;
 ; Clean up arrays NEW, PRCFMO and PRCTMP before their first call.
 K NEW,PRCFMO,PRCTMP
 D KILL^PRCHMA1 S PRCHNEW="",PRCHNORE=1,CAN=0
 D DUZ^PRCFSITE
 S PRCHAUTH=1,PRCPROST=6
 S A=$P(^PRC(442,PRCRI(442),0),"^"),PRC("SITE")=$P(A,"-")
 S PRCHPO=PRCRI(442) I $D(^PRC(443.6,PRCRI(442),0)) S PRCHNEW=111
 ; S B=5 D ICLOCK^PRC0B("^PRC(442,"_PRCHPO_",",.B)
 ;
 ; The next two lines are needed when adding amendments in Prosthetics.
 L +^PRC(442,PRCHPO):0 E  W !,"Someone else is editing this entry, try later." G AMEEX
 S PRCENTRY=PRCHPO
 ; D AMENDNO^PRCHAMU D DCLOCK^PRC0B("^PRC(442,"_PRCHPO_",") G:'$G(PRCHAM) AMEEX
 D AMENDNO^PRCHAMU G:'$G(PRCHAM) AMEEX
 S PRCHAMT=0,FL=0 D INFO^PRCHAMU G:$D(PRCHAV)!ER AMEEX
 S X=$P($G(^PRC(443.6,PRCHPO,0)),U,16) D EN2^PRCHAMXB
 I PRCHNEW="" S DA(1)=PRCHPO,DA=PRCHAM,PRCHX=X,X=0,PRCHAMDA=34 D EN8^PRCHAMXB S X=PRCHX
 I $P(^PRC(443.6,PRCHPO,6,PRCHAM,0),U,4)=5!($P(^(0),U,4)=15) S CAN=1
 K NOCAN,DTOUT,DUOUT,REPONUM S PRCHAMDA=23,ROU=$P(^PRCD(442.2,PRCHAMDA,0),U,3),ROU=$TR(ROU,"~","^")
 S PRCHL1=$P(^PRCD(442.2,PRCHAMDA,1),U),PRCHL2=$P(^(1),U,2)
 D @ROU
 D CAN1^PRCHMA
AMEEX D KILL^PRCHMA1 S X=$S(PRCPROST=6.9:1,1:0)
 ;
 ; Clean up arrays NEW, PRCFMO, and PRCTMP after use.
 K NEW,PRCFMO,PRCTMP
 QUIT
 ;
RECON(PRCA,PRCB) ;prca=ri of file 442, prcb=ri of file 200
 ; X-return value 1 if final charge, 0=else
 N A
 I $G(IOSTBM)="" S X="IOSTBM" D ENDR^%ZISS I $G(IOSTBM)="" D EN^DDIOL("Wrong type terminal (missing IOSTBM)!") S X=0 QUIT
 S A=+^PRC(442,PRCA,0),A=$P(^PRC(411,A,9),U,7)
 D RECON^PRCH1A2(PRCA,PRCB,A)
 QUIT
