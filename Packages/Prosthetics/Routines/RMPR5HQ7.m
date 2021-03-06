RMPR5HQ7 ;HCIOFO/ODJ - INVENTORY ROLL UP - CREATE ^TMP GLOBAL FOR MAILING ; 20 SEP 00
 ;;3.0;PROSTHETICS;**51**;Feb 09, 1996
 Q
 ;
 ; Required vars are
 ; RMPRSDT
 ; RMPREDT
MAIL N KEYS,EOF,LINE,STR,TSTR,GROUP,CHNG,TNAM,USTR
 S TNAM="RMPR5A"
 K ^TMP($J,TNAM)
 D GRPARY^RMPR5HQ4(.GROUP)
 D INIT^RMPR5HQ6(.KEYS,.EOF,.CHNG)
 I EOF G MAILX
 S TSTR=""
 S $P(TSTR,"^",3)=$E(RMPRSDT,4,5)_"/"_$E(RMPRSDT,6,7)_"/"_(1700+$E(RMPRSDT,1,3))
 S $P(TSTR,"^",4)=$E(RMPREDT,4,5)_"/"_$E(RMPREDT,6,7)_"/"_(1700+$E(RMPREDT,1,3))
 S LINE=0
 F  D  Q:EOF
 . I CHNG("STATION") D
 .. S $P(TSTR,"^",2)=$P($G(^DIC(4,KEYS("STATION"),0)),"^",1)
 .. S I=$O(^RMPR(669.9,"C",KEYS("STATION"),"")) Q:I=""
 .. S $P(TSTR,"^",1)=$P($G(^RMPR(669.9,I,"INV")),"^",2) ;VISN
 .. Q
 . I CHNG("NPPD_GROUP") S $P(TSTR,"^",5)=GROUP(KEYS("NPPD_GROUP"))
 . I CHNG("NPPD_LINE") S $P(TSTR,"^",6)=KEYS("NPPD_LINE")_" "_$$NPLIN^RMPR5HQ5(KEYS("NPPD_LINE"))
 . ;I CHNG("HCPC_CODE") S $P(TSTR,"^",7)=$$GETITEM^RMPR5HQ5(KEYS("HCPC_IEN"),"")
 . I CHNG("HCPC_CODE") S $P(TSTR,"^",7)=KEYS("HCPC_CODE")
 . D RDHCPC(.KEYS,.STR) S:'+$P(STR,"^",3) $P(STR,"^",3)=""
 . I $L(STR,"^")<13 S $P(STR,"^",13)=""
 . F I=6,12 S:+$P(STR,"^",I) $P(STR,"^",I)=$J($P(STR,"^",I),0,2)
 . F I=7,13 S:+$P(STR,"^",I) $P(STR,"^",I)=$J($P(STR,"^",I),0,1)
 . I (+$P(STR,"^",1)&+$P(STR,"^",2))!(+$P(STR,"^",8)&+$P(STR,"^",9)) D
 .. S USTR=STR
 .. F I=2,5,6,7,9,11 S $P(USTR,"^",I)=""
 .. F I=1,4,8,10,12,13 S $P(STR,"^",I)=""
 .. S LINE=LINE+1
 .. D MAP(USTR,.TSTR)
 .. S ^TMP($J,TNAM,LINE)=TSTR
 .. S TSTR=$P(TSTR,"^",1,7)
 .. Q
 . S LINE=LINE+1
 . D MAP(STR,.TSTR)
 . S ^TMP($J,TNAM,LINE)=TSTR
 . S TSTR=$P(TSTR,"^",1,7)
 . D NXHCPC(.KEYS,.EOF,.CHNG)
 . Q
MAILX Q
 ;
 ; Read HCPC level in ^TMP
RDHCPC(PRIKEY,MYSTR) ;
 N TNAM,STATION,NPGRP,NPLIN,HCPC
 S TNAM="RMPR5"
 S STATION=PRIKEY("STATION")
 S NPGRP=PRIKEY("NPPD_GROUP")
 S NPLIN=PRIKEY("NPPD_LINE")
 S HCPC=PRIKEY("HCPC")
 S MYSTR=$G(^TMP($J,TNAM,STATION,NPGRP,NPLIN,HCPC))
 Q
 ;
 ; Get next HCPC code
NXHCPC(RMPRKEY,RMPREOF,RMPRCHNG) ;
 N TNAM,NPGRP,NPLIN,HCPC,ITEM,INVIEN,STATION
 S TNAM="RMPR5"
 S STATION=RMPRKEY("STATION")
 S NPGRP=RMPRKEY("NPPD_GROUP")
 S NPLIN=RMPRKEY("NPPD_LINE")
 S HCPC=RMPRKEY("HCPC")
 S RMPRCHNG("STATION")=0
 S RMPREOF=0,RMPRCHNG("NPPD_GROUP")=0,RMPRCHNG("NPPD_LINE")=0
 S HCPC=$O(^TMP($J,TNAM,STATION,NPGRP,NPLIN,HCPC))
 S:HCPC="" NPLIN=$O(^TMP($J,TNAM,STATION,NPGRP,NPLIN))
 S:NPLIN="" NPGRP=$O(^TMP($J,TNAM,STATION,NPGRP))
 S:NPGRP="" STATION=$O(^TMP($J,TNAM,STATION))
 I STATION=""!(STATION="Z") S RMPREOF=1,RMPRCHNG("HCPC_CODE")=0,RMPRCHNG("HCPC_ITEM")=0,RMPRCHNG("INVENTORY_IEN")=0 G NXHCPCX
 S:NPGRP="" NPGRP=$O(^TMP($J,TNAM,STATION,"")),RMPRCHNG("STATION")=1
 S:NPLIN="" NPLIN=$O(^TMP($J,TNAM,STATION,NPGRP,"")),RMPRCHNG("NPPD_GROUP")=1
 S:HCPC="" HCPC=$O(^TMP($J,TNAM,STATION,NPGRP,NPLIN,"")),RMPRCHNG("NPPD_LINE")=1
 S RMPRCHNG("HCPC_CODE")=1
 S ITEM=$O(^TMP($J,TNAM,STATION,NPGRP,NPLIN,HCPC,""))
 S RMPRCHNG("HCPC_ITEM")=1
 S INVIEN=$O(^TMP($J,TNAM,STATION,NPGRP,NPLIN,HCPC,ITEM,""))
 S RMPRCHNG("INVENTORY_IEN")=1
 S RMPRKEY("STATION")=STATION
 S RMPRKEY("NPPD_GROUP")=NPGRP
 S RMPRKEY("NPPD_LINE")=NPLIN
 S RMPRKEY("HCPC")=HCPC
 S RMPRKEY("HCPC_CODE")=$P(HCPC,"/",1)
 S RMPRKEY("HCPC_IEN")=$P(HCPC,"/",2)
 S RMPRKEY("HCPC_ITEM")=ITEM
 S RMPRKEY("INVENTORY_IEN")=INVIEN
NXHCPCX Q
MAP(CALC,RUP) ;
 S $P(RUP,"^",8)=$P(CALC,"^",2)
 S $P(RUP,"^",9)=$P(CALC,"^",5)
 S:+$P(RUP,"^",8) $P(RUP,"^",10)=$J($P(RUP,"^",9)/$P(RUP,"^",8),0,2)
 S $P(RUP,"^",11)=$P(CALC,"^",6)
 S $P(RUP,"^",12)=$P(CALC,"^",7)
 S $P(RUP,"^",13)=$P(CALC,"^",9)
 S $P(RUP,"^",14)=$P(CALC,"^",11)
 S:+$P(RUP,"^",13) $P(RUP,"^",15)=$J($P(RUP,"^",14)/$P(RUP,"^",13),0,2)
 S $P(RUP,"^",16)=$P(CALC,"^",1)
 S $P(RUP,"^",17)=$P(CALC,"^",4)
 S:+$P(RUP,"^",16) $P(RUP,"^",18)=$J($P(RUP,"^",17)/$P(RUP,"^",16),0,2)
 S $P(RUP,"^",19)=$P(CALC,"^",12)
 S $P(RUP,"^",20)=$P(CALC,"^",13)
 S $P(RUP,"^",21)=$P(CALC,"^",8)
 S $P(RUP,"^",22)=$P(CALC,"^",10)
 S:+$P(RUP,"^",21) $P(RUP,"^",23)=$J($P(RUP,"^",22)/$P(RUP,"^",21),0,2)
 S $P(RUP,"^",24)=$G(RMCALDAY)
 Q
