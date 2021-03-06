RMPR5HQD ;HCIOFO/RVD - NPPD GROUP USAGE REPORT FOR HQ ; 06 OCT 00
 ;;3.0;PROSTHETICS;**51**;Feb 09, 1996
 ;
 ; HNC - added grand totals
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DQ1 ;print PIP Report
 F RST=0:0 S RST=$O(^TMP($J,R5,RST)) Q:RST'>0  D:(RSTA'="")&(RSTA'=RST)&(RPR=1) HDRG S RSTA=RST F RI=0:0 S RI=$O(^TMP($J,R5,RST,RI)) Q:$G(RFL)  D:(RGRP'="")&(RGRP'=RI) SUMG1 Q:RI'>0  D
 .D:RPR=0 HDRG
 .S RGRP=RI
 .S RNPGRP=RMARRAY(RI)
 .S RJ=""
 .F  S RJ=$O(^TMP($J,R5,RST,RI,RJ)) Q:$G(RFL)  Q:RJ=""  D
 ..S RLINE=RJ,RNPLINE=$$NPLIN^RMPR5HQ5(RJ)
 ..S RK="" F  S RK=$O(^TMP($J,R5,RST,RI,RJ,RK)) Q:$G(RFL)!(RK="")  D
 ...S RL=""
 ...F  S RL=$O(^TMP($J,R5,RST,RI,RJ,RK,RL)) Q:$G(RFL)!(RL="")  D
 ....I RLCNT=0 D GLN1
 ....S RLCNT=RLCNT+1
 ....S RDAT=^TMP($J,R5,RST,RI,RJ,RK,RL)
 ....S RMVA=$P(RDAT,U,1)
 ....S RMCOM=$P(RDAT,U,2)
 ....S RMUSE=$P(RDAT,U,3)
 ....S RMISU=$P(RDAT,U,4)
 ....S RMISN=$P(RDAT,U,5)
 ....S RMAVEN=$P(RDAT,U,6)
 ....S RMDLEN=$J($P(RDAT,U,7),5,2)
 ....S RMQOHU=$P(RDAT,U,8)
 ....S RMQOHN=$P(RDAT,U,9)
 ....S RMVALU=$P(RDAT,U,10)
 ....S RMVALN=$P(RDAT,U,11)
 ....S RMAVEU=$P(RDAT,U,12)
 ....S RMDLEU=$J($P(RDAT,U,13),5,2)
 ....S RMGISUG=RMGISUG+RMISU
 ....S RMGISNG=RMGISNG+RMISN
 ....;
 ....S RMGTIU=RMGTIU+RMISU
 ....S RMGTIN=RMGTIN+RMISN
 ....;
 ....S RMGTOU=RMGTOU+RMVALU
 ....S RMGTON=RMGTON+RMVALN
 ....;total for GROUP
 ....I (RMCOM'=""),$G(RMCOM) S RTUSEGC=RTUSEGC+RMCOM
 ....I (RMVA'=""),$G(RMVA) S RTUSEGA=RTUSEGA+RMVA
 ....S RMTVAG=RMTVAG+RMVA
 ....S RMTCOMG=RMTCOMG+RMCOM
 ....S RMTISUG=RMTISUG+RMISU
 ....S RMTISNG=RMTISNG+RMISN
 ....S RMTQOHUG=RMTQOHUG+RMQOHU
 ....S RMTQOHNG=RMTQOHNG+RMQOHN
 ....S RMTVALUG=RMTVALUG+RMVALU
 ....S RMTVALNG=RMTVALNG+RMVALN
 ....S (RPRINT,RPR)=1
 ;
 D CNTRX^RMPR5HQA S ^TMP($J,"RI",RC)=""
 D CNTRX^RMPR5HQA S ^TMP($J,"RI",RC)=REQ
 D CNTRX^RMPR5HQA S ^TMP($J,"RI",RC)=""
 I '$G(RPRINT) D CNTRX^RMPR5HQA S ^TMP($J,"RI",RC)="No Records to Print !!" Q
 D CNTRX^RMPR5HQA
 S ^TMP($J,"RI",RC)="          GRAND TOTAL $ VALUE ISSUED (Used) = $"_$J($FN(RMGTIU,",",2),10)
 S ^TMP($J,"RI",RC)=^TMP($J,"RI",RC)_"          GRAND TOTAL $ VALUE ON-HAND (Used) = $"_$J($FN(RMGTOU,",",2),12)
 D CNTRX^RMPR5HQA
 S ^TMP($J,"RI",RC)="          GRAND TOTAL $ VALUE ISSUED (New)  = $"_$J($FN(RMGTIN,",",2),10)
 S ^TMP($J,"RI",RC)=^TMP($J,"RI",RC)_"          GRAND TOTAL $ VALUE ON-HAND (New)  = $"_$J($FN(RMGTON,",",2),12)
 S RMGTOT=RMGTOU+RMGTON
 D CNTRX^RMPR5HQA S ^TMP($J,"RI",RC)=""
 D CNTRX^RMPR5HQA S ^TMP($J,"RI",RC)=RB30_RB30_"GRAND TOTAL $ VALUE ON-HAND = "_"$"_$J($FN(RMGTOT,",",2),12)
 D CNTRX^RMPR5HQA S ^TMP($J,"RI",RC)="<End of Report>"
 Q
 ;
HDRG ;print heading.
 D CNTRX^RMPR5HQA S ^TMP($J,"RI",RC)=""
 I RPR=1 D CNTRX^RMPR5HQA S ^TMP($J,"RI",RC)=RES
 D CNTRX^RMPR5HQA S ^TMP($J,"RI",RC)=""
 S RPR=1
 S RSTN=$$STN^RMPR5HQC(RSTA)
 D CNTRX^RMPR5HQA
 S ^TMP($J,"RI",RC)="PROSTHETIC INVENTORY NPPD GROUP REPORT"_RB10_"Run Date: "_RMRDATE
 D CNTRX^RMPR5HQA S ^TMP($J,"RI",RC)="STATION: "_$E(RSTN,1,30)_RB6_RMBD_"- "_RMED_"  [ "_RMCALDAY_" calendar days ]"
 Q
 ;
GLN1 ;print NPPD GROUP and LINE header.
 D CNTRX^RMPR5HQA S ^TMP($J,"RI",RC)=""
 D CNTRX^RMPR5HQA S ^TMP($J,"RI",RC)=""
 D CNTRX^RMPR5HQA S ^TMP($J,"RI",RC)="ENTIRE SUMMARY"
 D LBL1^RMPR5HQA
 Q
 ;
SUMG1 ;print summary total for NPPD GROUP
 D CNTRX^RMPR5HQA S ^TMP($J,"RI",RC)=RLN
 D CNTRX^RMPR5HQA S ^TMP($J,"RI",RC)=RGRP_RB1_RNPGRP
 S:$G(RTUSEGA) RTAVEGA=RTUSEGA/RMCALDAY
 S:$G(RTUSEGC) RTAVEGC=RTUSEGC/RMCALDAY
 S:$G(RTUSEGA) RTDLEGA=RMTQOHUG/RTAVEGA
 S:$G(RTUSEGC) RTDLEGC=RMTQOHNG/RTAVEGC
 S RTDLEGA=$S(RTDLEGA>999:">999",1:$J(RTDLEGA,6,0))
 S RTDLEGC=$S(RTDLEGC>999:">999",1:$J(RTDLEGC,6,0))
 S:RMTQOHNG=0 RTDLEGC=""
 S:RMTQOHUG=0 RTDLEGA=""
 S:(RMTQOHNG>0)&(RMTCOMG<1) RTDLEGC=">"_RMCALDAY
 S:(RMTQOHUG>0)&(RMTVAG<1) RTDLEGA=">"_RMCALDAY
 ;
 D CNTRX^RMPR5HQA
 S ^TMP($J,"RI",RC)="     (Used)"_RB13_$J(RMTVAG,5)_RB1_$J($FN(RMTISUG,",",2),9)_RB1_"|"_RB18_"|"_RB1_$J(RTUSEGA,5)_RB1_"|"_RB1_$J(RTAVEGA,8,2)_RB1_"|"
 S ^TMP($J,"RI",RC)=^TMP($J,"RI",RC)_RB1_$J(RMTQOHUG,6)_RB8_"|"_RB1_$J(RTDLEGA,6)_RB1_"|"_RB1_$J($FN(RMTVALUL,",",2),11)
 ;next line for NEW
 D CNTRX^RMPR5HQA
 S ^TMP($J,"RI",RC)="     (New)"_RB30_"|"_RB1_$J(RMTCOMG,6)_RB1_$J($FN(RMTISNG,",",2),9)_RB1_"|"_RB1_$J(RTUSEGC,5)_RB1_"|"_RB1_$J(RTAVEGC,8,2)_RB1_"|"
 S ^TMP($J,"RI",RC)=^TMP($J,"RI",RC)_RB6_$J(RMTQOHNG,8)_RB1_"|"_RB1_$J(RTDLEGC,6)_RB1_"|"_RB11_$J($FN(RMTVALNG,",",2),11)
 ;
 S (RMTVAG,RMTISUG,RMTCOMG,RMTISNG,RTUSEGA,RTUSEGC,RTAVEGA,RTAVEGC,RMTQOHUG,RMTQOHNG,RTDLEGA,RTDLEGC,RMTVALUG,RMTVALNG)=0
 S (RNPGRP,RGRP)=""
 Q
