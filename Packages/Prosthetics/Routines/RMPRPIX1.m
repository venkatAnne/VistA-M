RMPRPIX1 ;HINCIO/ODJ - PIP HCPCS ITEM FILE 661.11 APIs ;3/8/01
 ;;3.0;PROSTHETICS;**61**;Feb 09, 1996
 Q
 ;
 ;***** IEN - get the ien for a HCPCS item
 ;
 ; Inputs:
 ;    RMPR("STATION") - Station ien
 ;    RMPR("HCPCS")   - HCPCS code
 ;    RMPR("ITEM")    - HCPCS Item
 ;
 ; Outputs:
 ;    RMPR("IEN") - ien for HCPCS Item rec.
 ;    RMPRERR     - exit code returned by function
 ;                   0 - no problems
 ;                   1,2,3 - null inputs
IEN(RMPR) ;
 N RMPRIEN,RMPRERR
 S RMPRERR=0
 I $G(RMPR("STATION"))="" S RMPRERR=1 G IENX
 I $G(RMPR("HCPCS"))="" S RMPRERR=2 G IENX
 I $G(RMPR("ITEM"))="" S RMPRERR=3 G IENX
 S RMPRIEN=$O(^RMPR(661.11,"ASHI",RMPR("STATION"),RMPR("HCPCS"),RMPR("ITEM"),""))
 S RMPR("IEN")=RMPRIEN
IENX Q RMPRERR
 ;
 ;***** CRE - Create a new HCPCS Item (661.11) record
 ;
 ; Inputs
CRE(RMPR) ;
 N RMPRCRE,RMPRFDA,RMPRFME,RMPRIEN,X,Y,DA
 S RMPRCRE=0
 L +^RMPR(661.11)
 ;
 ; Get new seq. number for Item
 I $G(RMPR("ITEM"))="" D
 . S RMPR("ITEM")=1+$O(^RMPR(661.11,"ASHI",RMPR("STATION"),RMPR("HCPCS"),""),-1)
 . Q
 ;
 ; Update 661.11
 S RMPRFDA(661.11,"+1,",.01)=RMPR("HCPCS")
 S RMPRFDA(661.11,"+1,",1)=RMPR("ITEM")
 S RMPRFDA(661.11,"+1,",2)=RMPR("DESCRIPTION")
 S RMPRFDA(661.11,"+1,",3)=RMPR("STATION")
 S RMPRFDA(661.11,"+1,",4)=RMPR("SOURCE")
 S RMPRFDA(661.11,"+1,",5)=$G(RMPR("UNIT"))
 S RMPRFDA(661.11,"+1,",6)=RMPR("HCPCS")_"-"_RMPR("ITEM")
 S RMPRFDA(661.11,"+1,",7)=RMPR("ITEM MASTER IEN")
 D UPDATE^DIE("","RMPRFDA","RMPRIEN","RMPRFME")
 L -^RMPR(661.11)
 I $D(RMPRFME) S RMPRCRE=1 G CREX
 S RMPR("IEN")=RMPRIEN(1)
 ;
 ; Update Inventory Flag
 K RMPRFDA,RMPRFME
 S RMPRIEN=$O(^RMPR(661.1,"B",RMPR("HCPCS"),""))_","
 S RMPRFDA(661.1,RMPRIEN,10)=1
 D FILE^DIE("","RMPRFDA","RMPRFME")
CREX Q RMPRCRE
 ;
 ;***** UPD - Update HCPCS Item record (661.11)
UPD(RMPR11) ;
 N RMPRFDA,RMPRFME,X,Y,DA,RMPRIEN,RMPRERR
 S RMPRERR=0
 S RMPRIEN=RMPR11("IEN")_","
 I $D(RMPR11("HCPCS")) D
 . S RMPRFDA(661.11,RMPRIEN,.01)=RMPR11("HCPCS")
 . Q
 I $D(RMPR11("ITEM")) D
 . S RMPRFDA(661.11,RMPRIEN,1)=RMPR11("ITEM")
 . Q
 S:$D(RMPR11("DESCRIPTION")) RMPRFDA(661.11,RMPRIEN,2)=RMPR11("DESCRIPTION")
 S:$D(RMPR11("SOURCE")) RMPRFDA(661.11,RMPRIEN,4)=RMPR11("SOURCE")
 S:$D(RMPR11("UNIT")) RMPRFDA(661.11,RMPRIEN,5)=RMPR11("UNIT")
 S:$D(RMPR11("HCPCS-ITEM")) RMPRFDA(661.11,RMPRIEN,6)=RMPR11("HCPCS-ITEM")
 S:$D(RMPR11("ITEM MASTER IEN")) RMPRFDA(661.11,RMPRIEN,7)=RMPR11("ITEM MASTER IEN")
 D:$D(RMPRFDA) FILE^DIE("","RMPRFDA","RMPRFME")
 I $D(RMPRFME) S RMPRERR=1 G UPDX
UPDX Q RMPRERR
 ;
 ;***** DUP - Check that a HCPCS Item does not have a different
 ;            source on the same code
DUP(RMPR,RMPRDUP) ;
 N RMPRS,RMPRERR,RMPR1,RMPR1I
 S RMPRERR=0,RMPRDUP=0
 S RMPRERR=$$IEN(.RMPR) G:RMPRERR DUPX
 I RMPR("IEN")="" G DUPX
 S RMPR1("IEN")=RMPR("IEN")
 S RMPRERR=$$GET(.RMPR1) G:RMPRERR DUPX
 S RMPRERR=$$ETOI(.RMPR1,.RMPR1I) G:RMPRERR DUPX
 I RMPR1I("SOURCE")=RMPR("SOURCE") D
 . S RMPRDUP=0
 . Q
 E  D
 . S RMPRDUP=1
 . Q
DUPX Q RMPRERR
 ;
 ;***** GET - read HCPCS Item 661.11 record
GET(RMPR) ;
 N RMPRCRE,RMPRFME,RMPROUP,RMPRIEN
 S RMPRCRE=0
 I $G(RMPR("IEN"))="" D
 . S RMPRCRE=$$IEN(.RMPR)
 . Q
 I RMPRCRE G GETX
 S RMPRIEN=RMPR("IEN")_","
 D GETS^DIQ(661.11,RMPRIEN,"*","","RMPROUP","RMPRFME")
 I $D(RMPRFME) S RMPRCRE=1 G GETX
 S RMPR("HCPCS")=RMPROUP(661.11,RMPRIEN,.01)
 S RMPR("ITEM")=RMPROUP(661.11,RMPRIEN,1)
 S RMPR("DESCRIPTION")=RMPROUP(661.11,RMPRIEN,2)
 S RMPR("STATION")=RMPROUP(661.11,RMPRIEN,3)
 S RMPR("SOURCE")=RMPROUP(661.11,RMPRIEN,4)
 S RMPR("UNIT")=RMPROUP(661.11,RMPRIEN,5)
 S RMPR("HCPCS-ITEM")=RMPROUP(661.11,RMPRIEN,6)
 S RMPR("ITEM MASTER")=RMPROUP(661.11,RMPRIEN,7)
 S RMPR("STATUS")=RMPROUP(661.11,RMPRIEN,8)
GETX Q RMPRCRE
 ;
 ; Given HCPCS code get 1st active HCPCS record in 661.1 file
 ; If none are active then use 1st ien (should never occur)
HPACT(RMPR) ;
 N RMPRCRE,RMPRFME,RMPROUP,RMPRIEN,RMPRE,RMPRI
 S RMPRCRE=0
 I $G(RMPR("HCPCS"))="" S RMPRCRE=1 G HPACTX
 S RMPRI=""
 F  S RMPRI=$O(^RMPR(661.1,"B",RMPR("HCPCS"),RMPRI)) Q:RMPRI=""  D  Q:RMPRE("STATUS")="ACTIVE"
 . K RMPRE S RMPRE("IEN")=RMPRI
 . S RMPRCRE=$$HPGET(.RMPRE)
 . Q
 I $G(RMPRE("IEN"))'="" M RMPR=RMPRE
HPACTX Q RMPRCRE
 ;
 ;***** HPGET - Get a HCPCS record
HPGET(RMPR) ;
 N RMPRCRE,RMPRFME,RMPROUP,RMPRIEN
 S RMPRCRE=0
 I $G(RMPR("IEN"))="" S RMPRCRE=1 G HPGETX
 S RMPRIEN=RMPR("IEN")_","
 D GETS^DIQ(661.1,RMPRIEN,"*","","RMPROUP","RMPRFME")
 I $D(RMPRFME) S RMPRCRE=2 G HPGETX
 S RMPR("HCPCS")=RMPROUP(661.1,RMPRIEN,.01)
 S RMPR("SHORT DESC")=RMPROUP(661.1,RMPRIEN,.02)
 S RMPR("NEW HCPC IEN")=RMPROUP(661.1,RMPRIEN,1)
 S RMPR("CPT CODE")=RMPROUP(661.1,RMPRIEN,2)
 S RMPR("STATUS")=RMPROUP(661.1,RMPRIEN,3)
 S RMPR("NPPD REPAIR CODE")=RMPROUP(661.1,RMPRIEN,5)
 S RMPR("NPPD NEW CODE")=RMPROUP(661.1,RMPRIEN,6)
 S RMPR("CALC FLAG")=RMPROUP(661.1,RMPRIEN,9)
 S RMPR("INV FLAG")=RMPROUP(661.1,RMPRIEN,10)
 S RMPR("LAB TIME")=RMPROUP(661.1,RMPRIEN,11)
HPGETX Q RMPRCRE
 ;
 ;***** HPETOI - Convert external to internal form for HCPCS rec.
HPETOI(RMPRE,RMPRI) ;
 N RMPRFDA,RMPRIEN,RMPRFDI,RMPRFME,RMPRERR
 S RMPRERR=0
 S RMPRIEN=RMPRE("IEN")_","
 D GETS^DIQ(661.1,RMPRIEN,"*","I","RMPRFDI","RMPRFME")
 I $D(RMPRFME) S RMPRERR=1 G HPETOIX
 S RMPRI("IEN")=RMPRE("IEN")
 S RMPRI("NEW HCPC IEN")=RMPRFDI(661.1,RMPRIEN,1,"I")
 S RMPRI("CPT CODE")=RMPRFDI(661.1,RMPRIEN,2,"I")
 S RMPRI("STATUS")=RMPRFDI(661.1,RMPRIEN,3,"I")
 S RMPRI("NPPD REPAIR CODE")=RMPRFDI(661.1,RMPRIEN,5,"I")
 S RMPRI("NPPD NEW CODE")=RMPRFDI(661.1,RMPRIEN,6,"I")
 S RMPRI("CALC FLAG")=RMPRFDI(661.1,RMPRIEN,9,"I")
 S RMPRI("INV FLAG")=RMPRFDI(661.1,RMPRIEN,10,"I")
 S RMPRI("LAB TIME")=RMPRFDI(661.1,RMPRIEN,11,"I")
HPETOIX Q RMPRERR
 ;
 ;***** ETOI - Convert external to internal form
ETOI(RMPRE,RMPRI) ;
 N RMPRFDA,RMPRIEN,RMPRFDI,RMPRFME,RMPRERR
 S RMPRERR=0
 S RMPRIEN=RMPRE("IEN")_","
 D GETS^DIQ(661.11,RMPRIEN,"*","I","RMPRFDI","RMPRFME")
 I $D(RMPRFME) S RMPRERR=1 G ETOIX
 S RMPRI("IEN")=RMPRE("IEN")
 S RMPRI("HCPCS")=RMPRFDI(661.11,RMPRIEN,.01,"I")
 S RMPRI("ITEM")=RMPRFDI(661.11,RMPRIEN,1,"I")
 S RMPRI("DESCRIPTION")=RMPRFDI(661.11,RMPRIEN,2,"I")
 S RMPRI("STATION")=RMPRFDI(661.11,RMPRIEN,3,"I")
 S RMPRI("SOURCE")=RMPRFDI(661.11,RMPRIEN,4,"I")
 S RMPRI("UNIT")=RMPRFDI(661.11,RMPRIEN,5,"I")
 S RMPRI("ITEM MASTER IEN")=RMPRFDI(661.11,RMPRIEN,7,"I")
ETOIX Q RMPRERR