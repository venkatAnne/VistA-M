GECSDG ;WISC/RFJ-pims dggecsb patch routine                       ;01 Nov 93
 ;;2.0;GCS;;MAR 14, 1995
DGGECSB ;ALB/DMK/CMM - MAS PRINT A CODE SHEET ; 07/20/89
 ;;5.3;REGISTRATION;**47**;Aug 13, 1993
 ;
PRINT N DIC
 S DIC="^GECS(2100,",DIC(0)="AEQMZ",DIC("A")="Select MAS Code Sheet ID: "
 S DIC("S")="I $P(^(0),U,8)>333&($P(^(0),U,8)<342)!($P(^(0),U,8)>400)&($P(^(0),U,8)<421)!($P(^(0),U,8)=223)!($P(^(0),U,8)=345)!($P(^(0),U,8)=346)!($P(^(0),U,8)=167)!($P(^(0),U,8)=290)"
 W ! D ^DIC G END:X=""!(X="^"),PRINT:Y<0
 S HY=Y(0,0),CSDA=+Y,(FR,TO)=Y(0,0),BY="@.01",FLDS="[GECS TRANSMIT LIST]"
 S GECS("TTF")=$P(Y(0),"^",8)
 I $D(^GECS(2100,+Y,"KEY")) G KEY
 K DIC,Y,X
 D FIELD
 S L=0,DHD="MAS CODE SHEET ID # : "_FR,DIC="^GECS(2100,",DIOEND="D READ^DGGECSB",ZTSAVE("^UTILITY(""DIQ1"",$J,")="",ZTSAVE("HDR")="",ZTSAVE("CSDA")=""
 D EN1^DIP G PRINT
END K CSDA,TO,FR,BY,FLDS,HY,L,DHD,DA,DR,DIQ,HDR,GECSMAP,GECSTT,GECS,HY
 K GECSEDIT,DIOEND
 K ^UTILITY("DIQ1",$J)
 Q
FIELD S GECSTT=$G(GECS("TTF"))
 S GECSEDIT=$P($G(^GECS(2101.2,+$O(^GECS(2101.2,"B",GECSTT,0)),0)),"^",3) I GECSEDIT="" Q
 S GECSEDIT=$E(GECSEDIT,2,$L(GECSEDIT)-1)
 ;strip off [ ]
 N ENT
 S ENT=$O(^DIE("B",GECSEDIT,0)) I 'ENT Q
 D GETMAP^GECSXMAP(ENT) I '$D(GECSMAP) Q
 ;Build DR string from GECSMAP
 N DIC,DA,DR,FR,TO,Y,BY,FLDS,L,DHD,SLASH,PP,NEXT,SEMI,LOOP
 S DIC="^GECS(2100,",DA=CSDA,DR="9.1;1;"
 F LOOP=1:1:GECSMAP D
 .S NEXT=GECSMAP(LOOP)
 .I LOOP>1 S N1=GECSMAP(LOOP-1),N1=$E(N1,$L(N1)-2,$L(N1)),NEXT=N1_NEXT K N1
 .S SLASH=$F(NEXT,"\"),SEMI=$F(NEXT,";",SLASH)
 .F  S PP=$E(NEXT,SLASH,SEMI-2) Q:PP=""  D
 ..S DR=DR_PP_";"
 ..S NEXT=$E(NEXT,SEMI,$L(NEXT))
 ..S SLASH=$F(NEXT,"\"),SEMI=$F(NEXT,";",SLASH)
 S DR=$E(DR,1,$L(DR)-1),DIQ(0)="E",HDR=DR
 K ^UTILITY("DIQ1",$J)
 D EN^DIQ1
 Q
READ ;
 N ENT,ADAT,LOOP,PRT,HEAD
 F LOOP=1:1 S ENT=$P(HDR,";",LOOP) Q:ENT=""  D
 .W !,$P(^DD(2100,ENT,0),"^")_": "_^UTILITY("DIQ1",$J,2100,CSDA,ENT,"E")
 .I LOOP=1 W !
 K ^UTILITY("DIQ1",$J)
 Q
KEY ;PRINT KEYPUNCH CODE SHEET
 K ^UTILITY("DIQ1",$J)
 D H1
 S BY="@.01",FLDS="51;C1;""",L=0,DIC="^GECS(2100,"
 S DHD="W ?0 D HEAD^DGGECSB W ?0 ;PRINT KEYPUNCH CODESHEET"
 S ZTSAVE("^UTILITY(""DIQ1"",$J,")="",ZTSAVE("DHD")="",ZTSAVE("CSDA")="",ZTSAVE("DIOEND")=""
 D EN1^DIP G PRINT
H1 ;
 N DR,DIC,DA K ^UTILITY("DIQ1",$J)
 S DR="9.1",DIC="^GECS(2100,",DA=CSDA,DIQ(0)="E"
 D EN^DIQ1
 S HDR=DR
 Q
HEAD ;
 S QQ="",$P(QQ,"+",79)="+"
 S MD=$O(^UTILITY("DIQ1",$J,2100,CSDA,0)),MD=^UTILITY("DIQ1",$J,2100,CSDA,MD,"E") K ^UTILITY("DIQ1",$J,2100,CSDA,MD,"E") S HDR=$P(HDR,";",2)
 W !!,?5,"MAS KEYPUNCH CODE SHEET ID#: "_HY
 W ?50,$P(^DD(2100,"9.1",0),"^")_": "_MD,!,QQ,!
 D READ W !
 K QQ,MD
 Q
