PRCHFPT4 ;WISC/RSD/RHD/DL-CONT. OF PRINT ;2/11/98 1045
V ;;5.1;IFCAP;;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
RR S Y=$S(PRCHFPT=1:$P(PRCH0,U,13),1:"") D RR1 S PRCHINV(1)="EST. SHP: "_Y_"    FOB: "_$P(PRCH1,U,6),Y=$P(X,U,12) D RR1 S PRCHINV(2)="AMT: "_Y_"   REC'D: "_$E($P(X,U,1),4,7)_$E($P(X,U,1),2,3)
 S PRCHINV(3)="DSCNT %: ",Y=$P($P(X,U,13),"%",1) I Y D RR1 S Y=$S($L(Y)<4:"0"_Y,1:Y),PRCHINV(3)=PRCHINV(3)_Y_" DAY: ",Y=$P($P(X,U,13),"%",2),PRCHINV(3)=PRCHINV(3)_+Y_$S($P(Y,+Y,2)'="":" TERM: P",1:"")
 S PRCHINV(4)="P TYP:   PAT: "_$P(PRCH0,U,1)_"  LC: "_$S(PRCHFPT=1&($P(X,U,9)="F"):"C",1:"P")
 S Y=$P(X,U,3) D RR1 S Z=$S($P(X,U,4)]"":1,1:""),PRCHINV(5)="L AMT"_Z_": "_Y_"  BOC"_Z_": "_$P(X,U,2) K Z
 I $P(X,U,4)]"" S Y=$P(X,U,5) D RR1 S PRCHINV(6)="L AMT2: "_Y_"  BOC2: "_$P(X,U,4)
 S Y=1
 Q
 ;
RR1 S Y=$S(Y:$P(Y,".",1)_$E($P(Y,".",2)_"00",1,2),1:"     ")
 Q
MORBOC ;
 N BOLN S (BOLN,PRCHL)=0,BOC=$P(PZZBOC,U),CNT=$P(PZZBOC,U,2) F  S BOC=$O(^PRC(442,D0,22,BOC)) Q:BOC=""!(BOC'>0)  S BOC22=$G(^(BOC,0)) I $P(BOC22,U,3)'=991 S BOC(CNT)=BOC22,CNT=CNT+1
 F NUM=3:1 Q:$G(BOC(NUM))=""  D
 .W !,?41,"BOC"_NUM_":",?48,$P(BOC(NUM),U),?56,"AMOUNT"_NUM_":",?66,$J($P(BOC(NUM),U,2),12,2)
 .S FMSLN="00"_$P(BOC(NUM),U,3),FMSLN=$E(FMSLN,$L(FMSLN)-2,99) W ?80,"FMS LINE: ",FMSLN S PRCHL=PRCHL+1,BOLN=BOLN+1 D:BOLN>44 
 ..D BOCLINE
 ..S P=P+1,BOLN=0
 ..D BOCTOP^PRCHFPT2
 ..Q
 .Q
 S SHPCHG=$P($G(^PRC(442,D0,0)),U,13)
 I SHPCHG>0 W !,?41,"BOC"_NUM_":",?48,+$P($G(^PRC(442,D0,23)),U),?56,"AMOUNT"_NUM_":",?66,$J(SHPCHG,12,2),?80,"FMS LINE: 991" S PRCHL=PRCHL+1,BOLN=BOLN+1
 ;
BOCLINE F Y=1:1:52-BOLN W !
 W !,"90-2139-ADP, MAY 1985" W:PRCHDES="R" ?72,"RECEIVING REPORT COPY"
 W !
 Q
 ;
SETUP ;
 S P=$O(^TMP($J,"P",1))
 S PRCHZ0=$G(^PRC(442,D0,0)),PRCHZ1=$G(^PRC(442,D0,1))
 S PRCHSTN=+$P(PRCHZ0,"^"),PRCHFCP=$P(PRCHZ0,"^",3)
 S PRC("BBFY")=$P($G(^PRC(442,D0,23)),U,2)
 S PODATE=$P(PRCHZ1,"^",15)
 S PRC("FY")=$E(PODATE,2,3),MO=+$E(PODATE,4,5)
 S:MO>9 PRC("FY")=$E(100+PRC("FY")+1,2,3)
 S PRCHB=PRCHFCP_"^"_PRC("FY")_"^"_PRC("BBFY")
 S PRCHPRJ=$S(PRC("BBFY")]"":$P($$ACC^PRC0C(PRCHSTN,PRCHB),U,3),1:"Not available")
 Q
