LRRP6A1 ;DALISC/J0 - LAB TEST SUMMARY REPORT-BUILD ;11/27/92
 ;;5.2;LAB SERVICE;**201**;Sep 27, 1994
EN ;
DQ ;
 D INIT S:$D(ZTQUEUED) ZTREQ="@" K ZTSK
 S ACCTRNS=$P(^LRO(68,LRAA,0),U,3) Q:"MDQY"'[ACCTRNS
 I ACCTRNS="D" D DAILY
 I ACCTRNS="Y" D YEARLY
 I ACCTRNS="M"!(ACCTRNS="Q") D MONTHLY
 D PRINT
 D:$D(ZTQUEUED) WRAPUP^LRRP6
 Q
INIT ;
 S:$D(ZTQUEUED) ZTREQ="@" K ZTSK U IO
 K ^TMP("LR",$J)
 S LRDAT=$$Y2K^LRX(DT),(LRPAG,LREND)=0
 Q
DAILY ;
 S LRDT=LRSDT
 F  S LRDT=$O(^LRO(68,LRAA,1,LRDT)) Q:('LRDT)!(LRDT>LREDT)  D
 . S LRANN=+$G(LRANF)
 . F  S LRANN=$O(^LRO(68,LRAA,1,LRDT,1,LRANN)) Q:'LRANN!(LRANN>LRANL)  S LRPDT=+$P($G(^(LRANN,3)),U,3) D ACC
 Q
YEARLY ;
 S LRDT=$E(LRSDT,1,3)_"0000"-.001,LREDT=LREDT_".99999"
 F  S LRDT=$O(^LRO(68,LRAA,1,LRDT)) Q:('LRDT)!(LRDT>LREDT)  D
 .  S LRANN=+$G(LRANF)
 .  F  S LRANN=$O(^LRO(68,LRAA,1,LRDT,1,LRANN)) Q:'LRANN!(LRANN>LRANL)  D
 .  .  Q:'$D(^LRO(68,LRAA,1,LRDT,1,LRANN,0))#2  S LRANN0=+$P($G(^(3)),U,3)
 .  .  I LRANN0,LRANN0'>LREDT&(LRANN0'<LRSDT) S LRPDT=LRANN0 D ACC
 Q
MONTHLY ;
 S LRDT=$E(LRSDT,1,5)_"00"-.001,LREDT=LREDT_".99999"
 F  S LRDT=$O(^LRO(68,LRAA,1,LRDT)) Q:('LRDT)!(LRDT>LREDT)  D
 .  S LRANN=+$G(LRANF)
 .  F  S LRANN=$O(^LRO(68,LRAA,1,LRDT,1,LRANN)) Q:'LRANN!(LRANN>LRANL)  D
 .  .  Q:'$D(^LRO(68,LRAA,1,LRDT,1,LRANN,0))#2  S LRANN0=+$P($G(^(3)),U,3)
 .  .  I LRANN0,LRANN0'>LREDT&(LRANN0'<LRSDT) D ACC
 Q
ACC ;
 S LRAN=$G(^LRO(68,LRAA,1,LRDT,1,LRANN,.2)) Q:LRAN=""
 S LRTIC=$P(LRAN," ",3)
 S LRTIC=$S($L(LRTIC)'>1:"00"_LRTIC,$L(LRTIC)'>2:"0"_LRTIC,1:LRTIC)
 S LRAN=$E(LRAN,1,$L(LRAN)-$L($P(LRAN," ",3)))_LRTIC
 S LRTST=0
 F  S LRTST=$O(^LRO(68,LRAA,1,LRDT,1,LRANN,4,LRTST)) Q:'LRTST  D
 . S LRTNAM=$E($$TST^LRCAPR2(LRTST),1,60)
 . S LRCPN=0
 . F  S LRCPN=$O(^LRO(68,LRAA,1,LRDT,1,LRANN,4,LRTST,1,LRCPN)) Q:'LRCPN  D
 . . S LRNODE=$G(^LRO(68,LRAA,1,LRDT,1,LRANN,4,LRTST,1,LRCPN,0)) Q:'LRNODE
 . . Q:$P(LRNODE,U,3)'=1
 . . S LRMULT=+$P(LRNODE,U,4)
 . . I $D(LRDIVSEL),'$D(LRDIVSEL(+$P(LRNODE,U,8)))#2 Q
 . . S LRCAPNAM=$E($$WKLDNAME^LRCAPU(LRCPN),1,60)
 . . Q:('$L(LRCAPNAM))!('LRCAPNUM)
 . . S LRCC(LRCAPNAM)=LRCAPNUM
 . . D BMPTOTS
 Q
BMPTOTS ;
 S LRANX=LRAN N LRAN
 S LRAN=LRANX_"~"_LRDT
 S:'$D(^TMP("LR",$J))#2 ^($J)=0
 S ^($J)=^TMP("LR",$J)+LRMULT
 S:'$D(^TMP("LR",$J,"ACCNUM",LRAN))#2 ^(LRAN)=0
 S ^(LRAN)=^TMP("LR",$J,"ACCNUM",LRAN)+LRMULT
 ;***S:'$D(^TMP("LR",$J,"ACCNUM",LRAN,LRTNAM))#2 ^(LRTNAM)=0
 ;***S ^(LRTNAM)=^TMP("LR",$J,"ACCNUM",LRAN,LRTNAM)+LRMULT
 S:'$D(^TMP("LR",$J,"ACCNUM",LRAN,LRTNAM,LRCAPNAM))#2 ^(LRCAPNAM)=0
 S ^(LRCAPNAM)=^TMP("LR",$J,"ACCNUM",LRAN,LRTNAM,LRCAPNAM)+LRMULT
 S:'$D(^TMP("LR",$J,"WKLD",LRCAPNAM))#2 ^(LRCAPNAM)=0
 S ^(LRCAPNAM)=^TMP("LR",$J,"WKLD",LRCAPNAM)+LRMULT
 S:'$D(^TMP("LR",$J,"TST"))#2 ^("TST")=0
 S ^("TST")=^TMP("LR",$J,"TST")+LRMULT
 S:'$D(^TMP("LR",$J,"TST",LRTNAM))#2 ^(LRTNAM)=0
 S ^(LRTNAM)=^TMP("LR",$J,"TST",LRTNAM)+LRMULT
 S:'$D(^TMP("LR",$J,"TST",LRTNAM,LRCAPNAM))#2 ^(LRCAPNAM)=0
 S ^(LRCAPNAM)=^TMP("LR",$J,"TST",LRTNAM,LRCAPNAM)+LRMULT
 Q
PRINT ;
 W:$E(IOST,1,2)="C-" @IOF
 S $P(LRDASH,"=",IOM)="",$P(LRSTAR,"*",IOM)=""
 I '$D(^TMP("LR",$J)) D NOTHING Q
 D:LRREPTYP="D" DET^LRRP6A3 Q:LREND
 D COND^LRRP6A2
 Q
NOTHING ;
 S LRPAG=LRPAG+1
 W LRDASH
 W !,"Lab Test Summary for ",LRDATRNG
 W ?62,LRDAT,?72,"PAGE ",$J(LRPAG,3)
 W !,"Accession Area:  ",LRX
 W !,LRSTAR
 W !!?18,"***  NO DATA FOR REPORT OPTIONS SELECTED  ***"
 I $D(LRDIVSEL) D
 . W !!,"DIVISIONS SELECTED",!,$E(LRDASH,1,18)
 . S LRDIV=""
 . F  S LRDIV=$O(LRDIVSEL(LRDIV)) Q:LRDIV=""  W !,LRDIVSEL(LRDIV)
 Q
