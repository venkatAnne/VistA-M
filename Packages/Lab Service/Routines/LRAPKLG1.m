LRAPKLG1 ;DSS/FHS - STATUS OF SURGICAL CASE ;08/10/16  09:35
 ;;5.2;LAB SERVICE;**462**;Sep 27, 1994;Build 44
 ; Supported calls AI #, 5286,103,3615
STATUS(LRCASE) ; GET Surgery case status
 N ANS,ERR,LRSDOC
 S:'$D(LROPER) LROPER=""
 ;GET SURGEON
 S LRSDOC=$S($P($G(^SRF(LRCASE,"NON")),U)="Y":$P(^("NON"),U,6),1:$P($G(^SRF(LRCASE,.1)),U,4))
 S LRSURPHY="DR:"_$$GET1^DIQ(200,LRSDOC_",",.01,"ANS","ERR")
 I $P($G(^SRF(LRCASE,"NON")),U)="Y" S LROPER=LROPER_$S($P($G(^(30)),U):" (ABORTED)",$P($G(^("NON")),U,5):" (COMPLETED)",1:" (NOT COMPLETE)")_" "_LRSURPHY Q
 I $P($G(^SRF(LRCASE,30)),U)'="" D CAN Q
 I $P($G(^SRF(LRCASE,31)),U,8)'="" D CAN Q
 I $P($G(^SRF(LRCASE,.2)),U,12) S LROPER=LROPER_" (COMPLETED)"_" "_LRSURPHY Q
 I $D(^SRF(LRCASE,.2)),$P(^(.2),U,12)="" S LRSTAT=0 D SCH I LRSTATUS=0 D REQ Q:LRSTATUS  G NO
 I '$D(^SRF(LRCASE,.2)) S LRSTAT=0 D SCH I LRSTATUS=0 D REQ Q:LRSTATUS=1  G NO
 Q
NO ; not requested or scheduled
 S LROPER=LROPER_" (NOT COMPLETE)"_" "_LRSURPHY
 Q
CAN ; cancelled or aborted
 N LRV
 S LRV(.2)=$G(^SRF(LRCASE,.2))
 I $P(LRV(.2),U)!($P(LRV(.2),U,10)) S LROPER=LROPER_" (ABORTED)"_" "_LRSURPHY Q
 S LROPER=LROPER_" (CANCELLED)"_" "_LRSURPHY
 Q
SCH ; check to see if case is scheduled
 I '$D(^SRF(LRCASE,31)) S LRSTATUS=0 Q
 I $P($G(^SRF(LRCASE,31)),U,4)="" S LRSTATUS=0 Q
 I $P($G(^SRF(LRCASE,31)),U,4) D:LRSTAT=0 TIM0 D:LRSTAT=1 TIM1 S LRSTATUS=1 Q
 Q
TIM0 I '$D(^SRF(LRCASE,.2)) S LROPER=LROPER_" (SCHEDULED)"_" "_LRSURPHY Q
 I $P(^SRF(LRCASE,.2),U,2) S LROPER=LROPER_" (NOT COMPLETE)"_" "_LRSURPHY Q
 I $P(^SRF(LRCASE,.2),U,2)="" S LROPER=LROPER_" (SCHEDULED)"_" "_LRSURPHY
 Q
TIM1 S LROPER=LROPER_" (SCHEDULED)"_" "_LRSURPHY Q
REQ ; check to see if case has been requested
 I $D(^SRF(LRCASE,"REQ")),$P(^("REQ"),U)=1,'$D(^SRF(LRCASE,.2)) S LROPER=LROPER_" (REQUESTED)"_" "_LRSURPHY S LRSTATUS=1 Q
 I $D(^SRF(LRCASE,"REQ")),$P(^("REQ"),U)=1,$D(^SRF(LRCASE,.2)),$P(^(.2),U,2)="" S LROPER=LROPER_" (REQUESTED)"_" "_LRSURPHY S LRSTATUS=1
 Q
ABORT ; aborted case
 S LRABORT=0 I $D(^SRF(LRCASE,.2)),$P(^(.2),U,10)'="" S LRABORT=1
 Q
STORE(LRDFN,LRSS,LRIDT,LRDIAL) ;Load the surgery dialog into ^LR(
 ;LRHDR ARRAY SET IN DISPLAY^LRAPKLG
 ;Where "X" = array subscript
 ;LRHDR(33,X)="Preoperative diagnosis"
 ;LRHDR(34,X)="Post Opertive Diag"
 ;LRHDR(38,X)="Operative Finding"
 ;LRHDR(39,X)="Brief Clinical History"
 Q:'$G(LROK)
 N ANS,X,Y,IEN,FDA,LRX
 S LRIEN=LRIDT_","_LRDFN_","
 S FIL=$S(LRSS="SP":63.08,LRSS="CY":63.09,LRSS="EM":63.02,1:"")
 Q:FIL=""
 S IEN=2 F  S IEN=$O(LRDIAL(IEN)) Q:IEN<1  D
 . S FDA=$S(IEN=39:.013,IEN=33:.014,IEN=38:.015,IEN=34:.016,1:0)
 . K ERR D WP^DIE(FIL,LRIEN,FDA,"A","LRDIAL("_IEN_")","ERR")
 W !!,$$CJ^XLFSTR("Surgery data transfer is completed",IOM),!
 Q
