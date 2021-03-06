RMPR29W2 ;HOIFO/SPS -  WORK ORDER MATERIAL GRID OWL PROGRAM ;11/8/05  07:12
 ;;3.0;PROSTHETICS;**75**;Feb 09, 1996;Build 25
 ;
 ;
A1(RMPR6642) ;entry point for testing
 D A2
 Q
EN(RESULT,RMPR6642) ; -- Broker callback to get list to display
A2 N STRING,CLREND,COLUMN,ON,OFF
 S DATE=2010101
 ;S SITE="ALL",START=00,STOP=99
 K ^TMP($J)
 N RMPRA,CDATE,X
 S (CNT,VALMCNT)=0,RRX=""
 I '$D(^RMPR(664.2,RMPR6642,0)) Q
 D REC
 G EXIT
 Q
REC ;records to grid
 ;stop date, init action date
 ;check ien, patch 77
 ;
 ;
 N DIC,DIQ,DR,STOPDT
 ;
 ;Get Work Order Data and add to array
 S RMPRAON="" F  S RMPRAON=$O(^RMPR(664.2,RMPR6642,1,RMPRAON)) Q:RMPRAON=""  D
 . Q:'$D(^RMPR(664.2,RMPR6642,1,RMPRAON,0))
 . S CNT=CNT+1
 . S RMPRII=^RMPR(664.2,RMPR6642,1,RMPRAON,0)
 . ;Internal and external Material
 . S RMPRMI=$P(RMPRII,U),RMPRSME=$$EXTERNAL^DILFD(664.22,.01,"",RMPRMI)
 . ;Internal/external unit of issue
 . S RMPRUI=$P(RMPRII,U,7),RMPRUIE=$$EXTERNAL^DILFD(664.22,6,"",RMPRUI)
 . ;Internal/external Vendor
 . S RMPRVI=$P(RMPRII,U,6),RMPRVE=$$EXTERNAL^DILFD(664.22,5,"",RMPRVI)
 . ;Internal/external patient category
 . ;S RMPRPCI=$P(RMPRII,U,8),RMPRPCE=$$EXTERNAL^DILFD(664.16,9,"",RMPRPCI)
 . ;Internal/External HCPCS
 . ;S RMPRPHCI=$P($G(^RMPR(664.1,RMPR6641,2,RMPRAON,2)),U,1),RMPRPHCE=$$EXTERNAL^DILFD(661.1,1,"",RMPRPHCI)
 . ;Internal/External CPT Modifier
 . ;S RMPRMI=$P($G(^RMPR(664.1,RMPR6641,2,RMPRAON,2)),U,2)
 . ;,RMPRPHCE=$$EXTERNAL^DILFD(81.3,"",RMPRME)
 . S ^TMP($J,"RMPRM",CNT)=0_U_RMPRAON_U_RMPRSME_U_$P(RMPRII,U,2)_U_$P(RMPRII,U,3)_U_$P(RMPRII,U,4)_U_RMPRVE_U_RMPRUIE
 . S ^TMP($J,"RMPRM",CNT)=^TMP($J,"RMPRM",CNT)_U_$P(RMPRII,U,8)_U_$P(RMPRII,U,11)_U_$P(RMPRII,U,12)
 K CDATE,WHO,SSN,TYPE,DES,PDAY,STATUS,ADATE
 ;PUT RESULTS IN GLOBAL!!
 Q
 K DNT,DATE,RMPRAON,RMPRII,RMPRMI,RMPRSME,RMPRUI,RMPRUIE,RMPRVE,RMPRVI,RRX,VALMCNT
EXIT ;common exit point
 S RESULT=$NA(^TMP($J))
 Q
