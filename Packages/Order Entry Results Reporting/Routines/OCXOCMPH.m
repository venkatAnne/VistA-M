OCXOCMPH ;SLC/RJS,CLA - ORDER CHECK CODE COMPILER (Build GETDF Function) ;10/29/98  12:37
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**32**;Dec 17,1997
 ;;  ;;ORDER CHECK EXPERT version 1.01 released OCT 29,1998
 ;
 Q
BLDDF ;
 N OCXDF,OCXGDF,OCXDR,OCXHL7
 S OCXGDF=$$LINE^OCXOCMP4("GETDF") Q:'OCXGDF
 S OCXHL7=$O(^OCXS(860.6,"B","GENERIC HL7 MESSAGE ARRAY",0)) Q:'OCXHL7
 ;
 S OCXDF=0 F  S OCXDF=$O(^TMP("OCXCMP",$J,"DATA FIELD",OCXDF)) Q:'OCXDF  D
 .S OCXDR=$G(^TMP("OCXCMP",$J,"DATA FIELD",OCXDF,OCXHL7,1))
 .I $L(OCXDR) D
 ..D IN^OCXOCMP4("GETDF"," "_OCXDR)
 ..S ^TMP("OCXCMP",$J,"DATA FIELD",OCXDF,OCXHL7,1)="||NOOP||"
 ;
 Q
 ;
SWAP ;
 Q:'$$LINE^OCXOCMP4("SWAPOUT","NAME","ARRAY") 1
 D IN^OCXOCMP4("SWAPOUT"," Q:'$L(NAME)")
 D IN^OCXOCMP4("SWAPOUT"," K ^TMP(""OCXSWAP"",$J,NAME)")
 D IN^OCXOCMP4("SWAPOUT"," S ^TMP(""OCXSWAP"",$J)=($P($H,"","",2)+($H*86400)+(2*60))_"" <- ^TMP ENTRY EXPIRATION DATE FOR ^OCXOPURG""")
 D IN^OCXOCMP4("SWAPOUT"," M ^TMP(""OCXSWAP"",$J,NAME)=ARRAY")
 D IN^OCXOCMP4("SWAPOUT"," K ARRAY")
 ;
 Q:'$$LINE^OCXOCMP4("SWAPIN","NAME","ARRAY") 1
 D IN^OCXOCMP4("SWAPIN"," Q:'$L(NAME)")
 D IN^OCXOCMP4("SWAPIN"," K ARRAY")
 D IN^OCXOCMP4("SWAPIN"," M ARRAY=^TMP(""OCXSWAP"",$J,NAME)")
 D IN^OCXOCMP4("SWAPIN"," K ^TMP(""OCXSWAP"",$J,NAME)")
 ;
 Q
 ;
