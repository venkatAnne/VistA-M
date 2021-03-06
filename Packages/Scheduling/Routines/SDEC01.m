SDEC01 ;ALB/SAT - VISTA SCHEDULING RPCS ;APR 08, 2016
 ;;5.3;Scheduling;**627,642**;Aug 13, 1993;Build 23
 ;
 Q
 ;
SUSRINFO(SDECY,SDECDUZ) ;get SCHEDULING USER INFO
 ;SUSRINFO(SDECY,SDECDUZ)  external parameter tag is in SDEC
 ;INPUT:
 ; SDECDUZ = (optional) user ID pointer to NEW PATIENT file
 ;                      Default to current user
 ; RETURN:
 ;   Successful Return:
 ;     Global Array containing 1 entry with following:
 ;   Data is separated by ^:
 ;    1. MANAGER -  YES if the user has the SDECZMGR key
 ;                  NO  if not
 ;    2. USER_NAME
 ;    3. MENU    -  YES if the user has the SDECZMENU key
 ;                  NO  if not
 ;    4. SUPER   -  YES if the user has the SD SUPERVISOR key
 ;                  NO if not
 ;    5. SDWLMENU - YES if the user has the SDWL MENU key
 ;                  NO if not
 ;    6. SDECRMIC - YES if the user has the SDECZ REQUEST key
 ;                  NO if not
 ;    7. SDOB     - YES if the user has the SDOB key
 ;                  NO if not
 ;    8. SDMOB    - YES if the user has the SDMOB key
 ;                  NO if not
 N SDECMENU,SDECMGR,SDECERR,SDECI,SDSUPER,SDWLMENU,SDECRMIC
 N SDOB,SDMOB,SDTMP
 K ^TMP("SDEC",$J)
 S SDECY="^TMP(""SDEC"","_$J_")"
 S SDECI=0
 S SDECERR=""
 S SDTMP="T00010MANAGER^T00020USER_NAME^T00030MENU^T00030SUPER^T00030SDWLMENU^T00030SDECRMIC"
 S SDTMP=SDTMP_"^T00030SDOB^T00030SDMOB"
 S ^TMP("SDEC",$J,SDECI)=SDTMP_$C(30)
 ;Check SECURITY KEY file for SDECZMGR keys
 I '+$G(SDECDUZ) S SDECDUZ=DUZ
 S SDECMGR=$$APSEC("SDECZMGR",SDECDUZ)
 S SDECMGR=$S(SDECMGR=1:"YES",1:"NO")
 S SDECMENU=$$APSEC("SDECZMENU",SDECDUZ)
 S SDECMENU=$S(SDECMENU=1:"YES",1:"NO")
 S SDSUPER=$$APSEC("SD SUPERVISOR",SDECDUZ)
 S SDSUPER=$S(SDSUPER=1:"YES",1:"NO")
 S SDWLMENU=$$APSEC("SDWL MENU",SDECDUZ)
 S SDWLMENU=$S(SDWLMENU=1:"YES",1:"NO")
 S SDECRMIC=$$APSEC("SDECZ REQUEST",SDECDUZ)
 S SDECRMIC=$S(SDECRMIC=1:"YES",1:"NO")
 S SDOB=$$APSEC("SDOB",SDECDUZ)
 S SDOB=$S(SDOB=1:"YES",1:"NO")
 S SDMOB=$$APSEC("SDMOB",SDECDUZ)
 S SDMOB=$S(SDMOB=1:"YES",1:"NO")
 S SDECI=SDECI+1
 S ^TMP("SDEC",$J,SDECI)=SDECMGR_"^"_$$GET1^DIQ(200,SDECDUZ_",",.01)_"^"_SDECMENU_"^"_SDSUPER_"^"_SDWLMENU_"^"_SDECRMIC_"^"_SDOB_"^"_SDMOB_$C(30)
 S ^TMP("SDEC",$J,SDECI)=^TMP("SDEC",$J,SDECI)_$C(31)_SDECERR
 Q
 ;
RESGRPUS(SDECY,SDECDUZ) ;return ACTIVE resource group names for the given user
 ;RESGRPUS(SDECY,SDECDUZ)  external parameter tag is in SDEC
 ;Returns ADO Recordset with all ACTIVE resource group names to which user has access
 ;based on entries in SDEC RESOURCE USER file
 ;If SDECDUZ=0 then returns all department names for current DUZ
 ;If user SDECDUZ possesses the key SDECZMGR
 ;then ALL resource group names are returned regardless of whether any active resources
 ;are associated with the group or not.
 ;
 N SDECERR,SDECRET,SDECIEN,SDECRES,SDECDEP,SDECDDR,SDECDEPN,SDECRDAT,SDECRNOD,SDECI
 N SDECMGR,SDECNOD
 K ^TMP("SDEC01",$J)
 K ^TMP("SDEC",$J)
 S SDECY="^TMP(""SDEC"","_$J_")"
 S SDECI=0
 S SDECERR=""
 S ^TMP("SDEC",$J,SDECI)="I00020RESOURCE_GROUPID^T00030RESOURCE_GROUP"_$C(30)
 I '+SDECDUZ S SDECDUZ=DUZ
 ;Check SECURITY KEY file for SDECZMGR keys
 S SDECMGR=$$APSEC("SDECZMGR",SDECDUZ)
 ;
 ;User does not have SDECZMGR keys, so
 ;$O THRU AC XREF OF SDEC RESOURCE USER
 I 'SDECMGR,$D(^SDEC(409.833,"AC",SDECDUZ)) S SDECIEN=0 F  S SDECIEN=$O(^SDEC(409.833,"AC",SDECDUZ,SDECIEN)) Q:'+SDECIEN  D
 . S SDECRES=$P(^SDEC(409.833,SDECIEN,0),U)
 . Q:'$D(^SDEC(409.832,"AB",SDECRES))
 . Q:'$D(^SDEC(409.831,SDECRES))
 . S SDECRNOD=^SDEC(409.831,SDECRES,0)
 . ;QUIT if the resource is inactive
 . Q:$P(SDECRNOD,U,2)=1
 . S SDECDEP=0 F  S SDECDEP=$O(^SDEC(409.832,"AB",SDECRES,SDECDEP)) Q:'+SDECDEP  D
 . . Q:'$D(^SDEC(409.832,SDECDEP,0))
 . . Q:$D(^TMP("SDEC01",$J,SDECDEP))
 . . S ^TMP("SDEC01",$J,SDECDEP)=""
 . . S SDECDEPN=$P(^SDEC(409.832,SDECDEP,0),U)
 . . S SDECI=SDECI+1
 . . S ^TMP("SDEC",$J,SDECI)=SDECDEP_U_SDECDEPN_$C(30)
 . . Q
 . Q
 ;
 ;User does have SDECZMGR keys, so
 ;$O THRU SDEC RESOURCE GROUP file directly
 I SDECMGR S SDECIEN=0 F  S SDECIEN=$O(^SDEC(409.832,SDECIEN)) Q:'+SDECIEN  D
 . Q:'$D(^SDEC(409.832,SDECIEN,0))
 . S SDECNOD=^SDEC(409.832,SDECIEN,0)
 . S SDECDEPN=$P(SDECNOD,U)
 . S SDECI=SDECI+1
 . S ^TMP("SDEC",$J,SDECI)=SDECIEN_U_SDECDEPN_$C(30)
 . Q
 ;
 S ^TMP("SDEC",$J,SDECI)=^TMP("SDEC",$J,SDECI)_$C(31)_SDECERR
 Q
 ;
RESGPUSR(SDECY,SDECDUZ) ;GROUP RESOURCE
 ;RESGPUSR(SDECY,SDECDUZ)  external parameter tag is in SDEC
 ;Returns ADO Recordset with all ACTIVE GROUP/RESOURCE combinations
 ;to which user has access based on entries in SDEC RESOURCE USER file
 ;If SDECDUZ=0 then returns all ACTIVE GROUP/RESOURCE combinations for current DUZ
 ;If user SDECDUZ possesses the key SDECZMGR
 ;then ALL ACTIVE resource group names are returned
 ;
 N SDECERR,SDECRET,SDECIEN,SDECRES,SDECDEP,SDECDDR,SDECDEPN,SDECRDAT,SDECRNOD,SDECI
 N SDECRESN,SDECMGR,SDECRESD,SDECNOD,SDECSUBID
 N SDCL,SDPRV,SDTYP
 K ^TMP("SDEC01",$J)
 S SDECY="^TMP(""SDEC"","_$J_")"
 K @SDECY
 S SDECI=0
 S SDECERR=""
 S @SDECY@(SDECI)="I00020RESOURCE_GROUPID^T00030RESOURCE_GROUP^I00020RESOURCE_GROUP_ITEMID^T00030RESOURCE_NAME^I00020RESOURCEID"_$C(30)
 I '+SDECDUZ S SDECDUZ=DUZ
 ;Check SECURITY KEY file for SDECZMGR key
 S SDECMGR=$$APSEC("SDECZMGR",SDECDUZ)
 ;
 S SDECIEN=0 F  S SDECIEN=$O(^SDEC(409.832,SDECIEN)) Q:'+SDECIEN  D
 . Q:'$D(^SDEC(409.832,SDECIEN,0))
 . S SDECNOD=^SDEC(409.832,SDECIEN,0)
 . S SDECDEPN=$P(SDECNOD,U)
 . S SDECRES=0 F  S SDECRES=$O(^SDEC(409.832,SDECIEN,1,SDECRES)) Q:'+SDECRES  D
 . . N SDECRESD
 . . Q:'$D(^SDEC(409.832,SDECIEN,1,SDECRES,0))
 . . S SDECRESD=$P(^SDEC(409.832,SDECIEN,1,SDECRES,0),"^")
 . . Q:'$D(^SDEC(409.831,SDECRESD,0))
 . . S SDECRNOD=$G(^SDEC(409.831,SDECRESD,0))
 . . Q:SDECRNOD=""
 . . ;QUIT if the resource is inactive
 . . S SDCL=$P(SDECRNOD,U,4)
 . . S SDTYP=$P(SDECRNOD,U,11)
 . . I $P(SDTYP,";",2)="VA(200," D RESPRV1^SDEC01B($P(SDTYP,";",1),SDCL)
 . . Q:$$GET1^DIQ(409.831,SDECRESD_",",.02)="YES"
 . . S SDECRESN=$P(SDECRNOD,U)
 . . S SDECI=SDECI+1
 . . S @SDECY@(SDECI)=SDECIEN_U_SDECDEPN_U_SDECRES_U_SDECRESN_U_SDECRESD_$C(30)
 . . Q
 . Q
 ;
 S @SDECY@(SDECI)=@SDECY@(SDECI)_$C(31)_SDECERR
 Q
 ;
APSEC(SDECKEY,SDECDUZ) ;EP - Return TRUE (1) if user has keys SDECKEY, otherwise, returns FALSE (0)
 ;
 N SDECIEN,SDECPKEY
 I '$G(SDECDUZ) Q 0
 ;
 I SDECKEY="" Q 0
 I '$D(^DIC(19.1,"B",SDECKEY)) Q 0
 S SDECIEN=$O(^DIC(19.1,"B",SDECKEY,0))
 I '+SDECIEN Q 0
 I '$D(^VA(200,SDECDUZ,51,SDECIEN,0)) Q 0
 Q 1
