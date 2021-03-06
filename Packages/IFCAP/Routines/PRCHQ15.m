PRCHQ15 ;(WASH IRMFO)/LKG-Create Initial #442 entry from 2237 ;9/30/96  14:59
 ;;5.1;IFCAP;;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
POBLD(PRCHSY,PRCRFQDA,PRCQUOTE,PRCFOB) ;Given 2237 IEN build its PO
 N PRC410,PRCCOUNT,PRC,DIE,DR,PRCDSCNT,PRCHPO,PRCHSP,PRCHSX,PRCI,PRCIEN
 N PRCLN,PRCX,PRCY,PRCZ,X,Y,PRCDA410,PRCHHM,PRCHPONO,PRCCOST,PRCH,PRCHN,PRCHS
 N PRCHCC,PRCHITM,PRCHZ,PRCHZ1,PRCHZ2,PRCHZ3
 G:'$D(^PRCS(410,PRCHSY)) EX
 S PRC410(0)=$G(^PRCS(410,PRCHSY,0)) G:PRC410(0)="" EX
 S PRC("SITE")=$P(PRC410(0),U,5)
 I '$D(PRC("PER")) D
 . I $D(DUZ)#2,+DUZ>0 S PRC("PER")=+DUZ
 . S X=$S('$D(^VA(200,+PRC("PER"),20)):"",1:^VA(200,+PRC("PER"),20))
 . S $P(PRC("PER"),U,2,4)=$P(X,U,2)_U_$P(X,U,3)_U_$S($D(^VA(200,+PRC("PER"),.13)):$P(^(.13),U,2),1:"")
 S:PRC("SITE")]"" PRC("PARAM")=$G(^PRC(411,PRC("SITE"),0))
 S PRCHSX=$P(PRC410(0),U),PRC("FY")=$P(PRCHSX,"-",2),PRC("QTR")=$P(PRCHSX,"-",3)
 S PRCI=0
GETNUM D ENPO^PRCHUTL
 I '$D(PRCHPO) D  G GETNUM:Y=1,EX
 . N DIR S DIR(0)="YA",DIR("A")="No PO Number was entered, do you want to try again? "
 . S DIR("B")="YES",DIR("?")="Answer 'YES' to return to prompt for PO Number"
 . D ^DIR
 S PRCI=PRCI+1
 L +^PRC(442,DA):5 E  W !,"Another user is editing this entry!" K DA G:PRCI<10 GETNUM W !,"Lock Table Problem - Please contact IRM!" S PRCHPO="" G EX
 S DIE=442,DA=PRCHPO,DR="42///^S X=$P(^PRC(444,PRCRFQDA,0),U)"
 N PONUM S PONUM=$P($P($G(^PRC(442,PRCHPO,0)),"^"),"-",2)
 D ^DIE
 ;If an order is Certified then INV Address should be FISCAL,
 ;otherwise it will be FMS.            <<<< nois DUB-0597-31814 <<<<
 I $E(PONUM,1)'="C" D
 . S DR=".02////1;.08////N;.04///FMS;.1///TODAY" D ^DIE
 . Q
 I $E(PONUM,1)="C" D
 . S DR=".02////2;.08////N;.04///FISCAL;.1///TODAY" D ^DIE
 . Q
 S PRCY=$P(PRC410(0),U,10) I PRCY]"" S DR="31////^S X=PRCY"  D ^DIE
 S PRCY=$P($G(^PRCS(410,PRCHSY,3)),U,4) I PRCY]"" S DR="5////^S X=PRCY" D ^DIE
 S X=$P(^PRCS(410,PRCHSY,3),U),$P(^PRC(442,PRCHPO,0),U,3)=X,^PRC(442,"E",$P(X," "),PRCHPO)="",PRC("CP")=X
 S PRC("BBFY")=$$BBFY^PRCSUT(PRC("SITE"),PRC("FY"),PRC("CP"),1)
 S PRC("APP")=$P($$ACC^PRC0C(PRC("SITE"),+PRC("CP")_"^"_PRC("FY")_"^"_PRC("BBFY")),U,11)
 S $P(^PRC(442,PRCHPO,0),U,4)=PRC("APP")
 S PRCY=$P($G(^PRC(420,PRC("SITE"),1,$P(PRCHSX,"-",4),0)),U,12)
 I PRCY]"" S DR=".03////^S X=PRCY" D ^DIE
 S PRCHN("MP")=$S($D(^PRCD(442.5,+$P(^PRC(442,DA,0),U,2),0)):$P(^(0),U,3),1:"")
 S PRCHN("SFC")=+$P(^PRC(442,DA,0),U,19)
 D EN2^PRCHNPO3
 S PRCY=$P($G(^PRCS(410,PRCHSY,3)),U,3) I PRCY]"" S DR="2///^S X=PRCY" D ^DIE
 S PRCY=$P($G(^PRCS(410,PRCHSY,3)),U,5) I PRCY]"" S DR="5.2////^S X=PRCY" D ^DIE
 S PRCY=$P($G(^PRC(444,PRCRFQDA,1)),U,3) I PRCY]"" S DR="5.4////^S X=PRCY" D ^DIE
 S PRCY=$P($G(^PRCS(410,PRCHSY,9)),U) I PRCY]"" S DR="5.6///^S X=PRCY" D ^DIE
 S DR="6.4////^S X=PRCFOB" D ^DIE
 S PRCY=$P($G(^PRCS(410,PRCHSY,1)),U,4) I PRCY]"" S DR="7////^S X=PRCY" D ^DIE
 S PRCY=$P($G(^PRCS(410,PRCHSY,9)),U,4) I PRCY>0 S $P(^PRC(442,PRCHPO,0),U,13)=PRCY
 S DR="16////^S X=DUZ" D ^DIE
 S DR="26///^S X=PRC(""BBFY"")" D ^DIE
 S PRCHSY(0)=^PRC(443,PRCHSY,0)
 S PRCHS="" D ^PRCHSP1
 S PRCHSP="",PRCH="",PRCDA410=PRCHSY D LST1^PRCHNPO2 S PRCHSY=PRCDA410 K PRCHSY(0)
 S PRCX=0,PRCCOUNT=0
 F  S PRCX=$O(^PRC(442,PRCHPO,2,PRCX)) Q:+PRCX'=PRCX  S PRCCOUNT=PRCCOUNT+1
 S PRCIEN=0
 F  S PRCIEN=$O(^PRCS(410,PRCHSY,"IT",PRCIEN)) Q:+PRCIEN'=PRCIEN  D
 . S PRCZ=^PRCS(410,PRCHSY,"IT",PRCIEN,0)
 . S PRCX=$P(PRCZ,U,3) S:PRCX]"" $P(^PRC(442,PRCHPO,2,PRCIEN,0),U,3)=PRCX
 . S PRCX=$P(PRCZ,U,6) S:PRCX]"" $P(^PRC(442,PRCHPO,2,PRCIEN,0),U,6)=PRCX
 . I $P($G(^PRCS(410,PRCHSY,"IT",PRCIEN,1,0)),U,4)>0 D
 . . N IENS S IENS=PRCIEN_","_PRCHPO_"," K ^TMP("DIERR",$J)
 . . D WP^DIE(442.01,IENS,1,"","^PRCS(410,PRCHSY,""IT"",PRCIEN,1)")
 . . K ^TMP("DIERR",$J)
 . S PRCX=0
 . F  S PRCX=$O(^PRC(444,"AE",PRCHSY,PRCRFQDA,PRCX)) Q:PRCX=""  Q:$P($G(^PRC(444,PRCRFQDA,2,PRCX,3)),U,7)=PRCIEN
 . Q:PRCX=""
 . S PRCLN=$P($G(^PRC(444,PRCRFQDA,2,PRCX,0)),U)
 . S PRCY=$O(^PRC(444,PRCRFQDA,8,PRCQUOTE,3,"B",PRCLN,"")) Q:PRCY=""
 . S $P(^PRC(442,PRCHPO,2,PRCIEN,2),U,14)=$P($G(^PRC(444,PRCRFQDA,8,PRCQUOTE,3,PRCY,0)),U,11)
 . S $P(^PRC(442,PRCHPO,2,PRCIEN,4),U,17)=$P($G(^PRC(444,PRCRFQDA,8,PRCQUOTE,3,PRCY,1)),U)
 . S $P(^PRC(442,PRCHPO,2,PRCIEN,4),U,18)=$P($G(^PRC(444,PRCRFQDA,8,PRCQUOTE,3,PRCY,1)),U,2)
 . S:$P($G(^PRC(442,PRCHPO,2,PRCIEN,0)),U,13)="" $P(^PRC(442,PRCHPO,2,PRCIEN,0),U,13)=$P($G(^PRC(444,PRCRFQDA,8,PRCQUOTE,3,PRCY,0)),U,6)
 . S:$P($G(^PRC(442,PRCHPO,2,PRCIEN,2)),U,3)="" $P(^PRC(442,PRCHPO,2,PRCIEN,2),U,3)=$P($G(^PRC(444,PRCRFQDA,8,PRCQUOTE,3,PRCY,0)),U,5)
 . S X=$P($G(^PRC(444,PRCRFQDA,8,PRCQUOTE,3,PRCY,1)),U,6)
 . S:X="" X=$P($G(^PRC(444,PRCRFQDA,8,PRCQUOTE,0)),U,7)
 . I X]"" D
 . . S Y=$P($G(^PRC(442,PRCHPO,1)),U) I Y="" K X Q
 . . I '$D(^PRC(440,Y,4,"B",$E(X,1,30))) K X Q
 . . S $P(^PRC(442,PRCHPO,2,PRCIEN,2),U,2)=X
 . . S ^PRC(442,PRCHPO,2,"AC",$E(X,1,30),PRCIEN)=""
 . S PRCCOST=$P($G(^PRC(444,PRCRFQDA,8,PRCQUOTE,3,PRCY,1)),U,3,5)
 . S PRCDSCNT=$P(PRCCOST,U,2,3),PRCCOST=$FN($P(PRCCOST,U),"",4)
 . S $P(^PRC(442,PRCHPO,2,PRCIEN,0),U,9)=PRCCOST
 . S $P(^PRC(442,PRCHPO,2,PRCIEN,2),U)=$FN(PRCCOST*$P(^PRC(442,PRCHPO,2,PRCIEN,0),U,2),"",4)
 . I $P(PRCDSCNT,U)'>0,$P(PRCDSCNT,U,2)'>0 Q
 . K DA,DIC,DD,DO S DA(1)=PRCHPO,DIC="^PRC(442,DA(1),3,",X=PRCIEN,DIC(0)="LX"
 . S DLAYGO=442.03,DIC("P")=$P(^DD(442,14,0),U,2) D FILE^DICN K DIC,DLAYGO
 . Q:+Y<1  S DA=+Y
 . S PRCX=$S($P(PRCDSCNT,U)>0:$P(PRCDSCNT,U),1:"$"_$P(PRCDSCNT,U,2))
 . S DIE="^PRC(442,DA(1),3,",DR="1////^S X=PRCX" D ^DIE
 . S PRCZ=$G(^PRCS(410,PRCHSY,"IT",PRCIEN,0))
 . S PRCX=$S($P(PRCDSCNT,U)>0:PRCDSCNT/100*$P(PRCZ,U,2)*$P(PRCZ,U,7),1:$P(PRCDSCNT,U,2))
 . S PRCX=$FN(PRCX,"",2),$P(^PRC(442,PRCHPO,2,PRCIEN,2),U,6)=PRCX
 . S DR="2///^S X=PRCX;3///1" D ^DIE
 . S PRCCOUNT=PRCCOUNT+1,DR="5///^S X=PRCCOUNT" D ^DIE
 S PRCCOUNT=PRCCOUNT+1
 K DA,DIE S DIE=442,DA=PRCHPO,DR="15///^S X=PRCCOUNT" D ^DIE
 S PRCX=0
 F  S PRCX=$O(^PRC(444,PRCRFQDA,8,PRCQUOTE,2,PRCX)) Q:+PRCX'=PRCX  D
 . S PRCY=$G(^PRC(444,PRCRFQDA,8,PRCQUOTE,2,PRCX,0)) Q:PRCY=""
 . S X=$P(PRCY,U)
 . K DA,DIC S DA(1)=PRCHPO,DIC="^PRC(442,DA(1),5,",DIC(0)="LX"
 . S DIC("P")=$P(^DD(442,9.2,0),U,2),DLAYGO=442.06 D ^DIC K DIC,DLAYGO
 . Q:+Y<1
 . S DA=+Y,DIE="^PRC(442,DA(1),5,",PRCY=$P(PRCY,U,2)
 . S DR="1///^S X=PRCY" D ^DIE
 S PRCX=0,PRCY=0
 F  S PRCX=$O(^PRC(442,PRCHPO,2,PRCX)) Q:+PRCX'=PRCX  D
 . S PRCZ=$G(^PRC(442,PRCHPO,2,PRCX,2)) Q:PRCZ=""
 . S PRCY=$P(PRCZ,U)-$P(PRCZ,U,6)+PRCY
 S ^PRC(442,PRCHPO,9,0)="^"_$P(^DD(442,35,0),U,2)_"^1^1"
 S PRCY=$FN(PRCY,"",2)
 S $P(^PRC(442,PRCHPO,9,1,0),U)=PRCY,$P(^PRC(442,PRCHPO,0),U,15)=PRCY
 S $P(^PRC(442,PRCHPO,1),U,8)=$P(^PRC(444,PRCRFQDA,8,PRCQUOTE,0),U,2)
 I PRCFOB="O" W !!,"As FOB is Origin, you will now be prompted for the Shipping BOC.",! S DIE=442,DA=PRCHPO,DR="13.05R" D ^DIE
 S PRCX=$P(^PRC(442,PRCHPO,1),U)
 I PRCX'="",$P($G(^PRC(440,PRCX,3)),U,2)="Y" D
 . W !,"As this PO has an EDI Vendor, you will be asked about Special Handling."
 . S DIE=442,DR="18.6//NO;S:X'=""Y"" Y=0;18.7",DA=PRCHPO
 . D ^DIE K DIE,DR
EX L:$G(PRCHPO)>0 -^PRC(442,PRCHPO)
 Q $S($G(PRCHPO)>0:$P($G(^PRC(442,PRCHPO,0)),U),1:"")
