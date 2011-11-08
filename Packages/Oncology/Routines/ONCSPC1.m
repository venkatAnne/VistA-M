ONCSPC1 ;Hines OIFO/GWB - PCE Study of Soft Tissue Sarcoma ;05/30/00
 ;;2.11;ONCOLOGY;**6,26**;Mar 07, 1995
 ;Table I
 K TABLE,HTABLE
 S TABLE("ACCESSION NUMBER")="AN"
 S TABLE("SEQUENCE NUMBER")="SN"
 S TABLE("POSTAL CODE AT DIAGNOSIS")="PCAD"
 S TABLE("DATE OF BIRTH")="DOB"
 S TABLE("RACE")="R"
 S TABLE("SPANISH ORIGIN")="SO"
 S TABLE("SEX")="S"
 S TABLE("PRIMARY PAYER AT DIAGNOSIS")="PPAD"
 S TABLE("FAMILY HISTORY OF SOFT TISSUE SARCOMA")="FHOSTS"
 S TABLE("PERSONAL HISTORY OF ANY CANCER")="PHOAC"
 S HTABLE(1)="ACCESSION NUMBER"
 S HTABLE(2)="SEQUENCE NUMBER"
 S HTABLE(3)="POSTAL CODE AT DIAGNOSIS"
 S HTABLE(4)="DATE OF BIRTH"
 S HTABLE(5)="RACE"
 S HTABLE(6)="SPANISH ORIGIN"
 S HTABLE(7)="SEX"
 S HTABLE(8)="PRIMARY PAYER AT DIAGNOSIS"
 S HTABLE(9)="FAMILY HISTORY OF SOFT TISSUE SARCOMA"
 S HTABLE(10)="PERSONAL HISTORY OF ANY CANCER"
 S CHOICES=10
 K DIQ S DIC="^ONCO(165.5,",DR=".05;.06",DA=ONCONUM,DIQ="ONC" D EN^DIQ1
 S D0=ONCOPA D DOB1^ONCOES S Y=X D DATEOT^ONCOPCE S DOB=Y
 W @IOF D HEAD^ONCSPC0 W !?25,"TABLE I - GENERAL INFORMATION",!
AN W !,"ACCESSION NUMBER.....................: ",ONC(165.5,ONCONUM,.05)
SN W !,"SEQUENCE NUMBER......................: ",ONC(165.5,ONCONUM,.06)
PCAD S DIE="^ONCO(165.5,",DA=ONCONUM
 S DR="9POSTAL CODE AT DIAGNOSIS............." D ^DIE G:$D(Y) JUMP
DOB W !,"DATE OF BIRTH........................: ",DOB
R S DIE="^ONCO(160,",DA=ONCOPA
 S DR="8RACE................................." D ^DIE G:$D(Y) JUMP
SO S DIE="^ONCO(160,",DA=ONCOPA
 S DR="9SPANISH ORIGIN......................." D ^DIE G:$D(Y) JUMP
S S DIE="^ONCO(160,",DA=ONCOPA
 S DR="10SEX.................................." D ^DIE G:$D(Y) JUMP
PPAD S DIE="^ONCO(165.5,",DA=ONCONUM
 S DR="18PRIMARY PAYER AT DIAGNOSIS..........." D ^DIE G:$D(Y) JUMP
FHOSTS S DIE="^ONCO(165.5,",DA=ONCONUM
 S DR="500FAMILY HISTORY OF SOFT TISSUE SARCOMA" D ^DIE G:$D(Y) JUMP
PHOAC S DIE="^ONCO(165.5,",DA=ONCONUM
 S DR="501PERSONAL HISTORY OF ANY CANCER......." D ^DIE G:$D(Y) JUMP
 W ! K DIR S DIR(0)="E" D ^DIR
 G EXIT
JUMP ;Jump to prompts
 S XX="" R !!,"GO TO: ",X:DTIME I (X="")!(X[U) S OUT="Y" G EXIT
 I X["?" D  G JUMP
 .W !,"CHOOSE FROM:" F I=1:1:CHOICES W !,?5,HTABLE(I)
 I '$D(TABLE(X)) S XX=X,X=$O(TABLE(X)) I ($P(X,XX,1)'="")!(X="") W *7,"??" D  G JUMP
 .W !,"CHOOSE FROM:" F I=1:1:CHOICES W !,?5,HTABLE(I)
 S X=TABLE(X)
 G @X
EXIT K HTABLE,TABLE,CHOICES
 K DOB
 K DA,DR,DIE,DIR,DIROUT,DIRUT,DTOUT,DUOUT,X,XX,Y
 Q