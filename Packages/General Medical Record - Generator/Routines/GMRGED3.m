GMRGED3 ;HIRMFO/RM-PATIENT DATA EDIT (cont.) ;9/1/95
 ;;3.0;Text Generator;;Jan 24, 1996
EN1 ; REPLACE/WITH TEXT GMRGTX(0)=TEXT TO BE EDITED, GMRGTX(1)=1 FOR 
 ; INTERNAL TEXT, 0 FOR OTHER KINDS
REPLACE W ?$X+2,GMRGTX(0),!?4,"Replace " R GMRG1:DTIME S:GMRG1="^"!(GMRG1="^^")!'$T GMRGOUT=1 Q:GMRGOUT!(GMRG1="")  I GMRG1?1"?".E D REPHLP W ! G REPLACE
 I GMRG1["@" D DEL Q:GMRGTX(0)=""!GMRGOUT  W ! G REPLACE
 D:GMRG1["..." RANGE
 S GMRG2=GMRG1,GMRG3=$S(GMRG2="":0,GMRGTX(0)[GMRG2:1,1:0) W:'GMRG3 $C(7)," ??",!
 I GMRG3 D WITH Q:GMRGTX(0)=""!GMRGOUT  W ! G REPLACE
 W ! G REPLACE
REPHLP W !!?5,"At the ""Replace"" prompt, enter exactly the text you want to replace.",!?5,"You may also enter ""..."" to replace the entire text, ""...(text)"" to",!?5,"replace from the beginning through ""(text)"", or ""(text)..."" to replace"
 W !?5,"from ""(text)"" through the end.",!?5,"At the ""With"" prompt, enter the new text.",!?10
 Q
WITH W "  With " R GMRG4:DTIME S:GMRG4="^"!(GMRG4="^^")!'$T GMRGOUT=1 Q:GMRGOUT  I GMRG4?1"?".E D REPHLP G WITH
 S GMRGTX(2)=$P(GMRGTX(0),GMRG1)_GMRG4_$P(GMRGTX(0),GMRG1,2,$L(GMRGTX(0),GMRG1)) I GMRGTX(2)="" D DEL Q:GMRGOUT  I GMRGTX(0)'="" W $C(7)," ??" Q
 Q:GMRGOUT  S GMRGTX(0)=GMRGTX(2)
 Q
RANGE S GMRG5=$P(GMRG1,"..."),GMRG7=$F(GMRGTX(0),GMRG5),GMRG5(0)=$S(GMRG5'=""&GMRG7:GMRG7-$L(GMRG5),'GMRG7:0,1:1)
 S GMRG6=$P(GMRG1,"...",2),GMRG8=$F(GMRGTX(0),GMRG6,GMRG7),GMRG6(0)=$S('GMRG8!'GMRG7:0,GMRG6'="":GMRG8-1,1:$L(GMRGTX(0))),GMRG1=$E(GMRGTX(0),GMRG5(0),GMRG6(0))
 Q
DEL ; DELETE EXISTING TEXT
 I 'GMRGTX("@") W !,$C(7),"CANNOT DELETE!!" Q
 I GMRGTX(1) W !?5,$C(7),"If you delete bracketed text, the original default will become the",!?5,"the new value."
 W !?5,$C(7),"WANT TO DELETE" S %=0 D YN^DICN S:%=1 GMRGTX(0)="" S:%=-1 GMRGOUT=1 Q:%'=0  W !?6,"Answer Yes if you wish to delete this text, else answer No." G DEL
 Q
VALIDATE ; VALIDATE USER SELECTION ENTRY
 F GMRG1=1:1 S GMRG2=$P(GMRGS,",",GMRG1) Q:GMRG2=""  S:GMRG2="a" GMRG2="A" D VAL0 Q:'GMRGOOD
 Q
VAL0 ; VALIDATION CONT.
 I GMRG2["-" S GMRG3=$P(GMRG2,"-"),GMRG2=$P(GMRG2,"-",2),GMRG5=1 S:GMRG2="a" GMRG2="A"
 E  S GMRG3=$S(GMRG2'="A":+GMRG2,1:GMRG2),GMRG5=0
 I '(GMRG3?1N.N!('GMRG5&(GMRG3="A"))!(GMRG3>0)) S GMRGOOD=0 Q
 I GMRG5,GMRG2="A" S GMRGOOD=0 Q
 S:GMRG2?1N.N1"/;" GMRG2=+GMRG2_";/"
 I GMRG2?1N.N!(GMRG2?1N.N1"@")!(GMRG2?1N.N1";")!(GMRG2?1N.N1"/")!(GMRG2?1N.N1"/;")!(GMRG2?1N.N1";/")!(GMRG2="A") D VAL1 Q
 I 'GMRG5,(GMRG2?1N.N1";".E!(GMRG2?1N.N1"/".E)) D VALTXT Q  ;S GMRG6=$S(GMRG2?1N.N1";".E:";",1:"/"),GMRG4=$P(GMRG2,GMRG6,2,99) S:GMRG6=";"&(GMRG4'="")&($P(GMRGSEL(+GMRG2),"^",2)["]") GMRGOOD=0 Q:'GMRGOOD  D VAL1 Q
 S GMRGOOD=0
 Q
VAL1 ;
 I GMRG2="A" S GMRGQUSL("A")=1 Q
 I +GMRG2<1!(+GMRG2>GMRGSTAR(1))!(+GMRG2<GMRG3)!(GMRG3<1)!(GMRG3>GMRGSTAR(1)) S GMRGOOD=0 Q
 F GMRG10=GMRG3:1:+GMRG2 S:$S('$D(GMRGSEL(GMRG10)):1,GMRG2["/"&($P(GMRGSEL(GMRG10),"^",2)'["]"):1,1:0) GMRGOOD=0 Q:'GMRGOOD  S GMRGQUSL(GMRG10)=$P(GMRG2,+GMRG2,2,$L(GMRG2,+GMRG2))
 Q
VALTXT ;
 I +GMRG2<1!(+GMRG2>GMRGSTAR(1)) S GMRGOOD=0 Q
 K GMRG4 S (GMRG12,GMRG13,GMRG11)=0,GMRG14=$L($P(GMRGSEL(+GMRG2),"^",2),"]")-1
 F GMRG6=0:0 S GMRG12=$S('GMRG11:$F(GMRG2,";",GMRG12),1:0),GMRG13=$S(GMRG14>0:$F(GMRG2,"/",GMRG13),1:0),GMRG6=GMRG12!GMRG13 Q:GMRG6'>0  D STXT
 S GMRG11=0
 F GMRG6=0:0 S GMRG6=$O(GMRG4(GMRG6)),GMRG13=$O(GMRG4(GMRG6)),GMRG13=$S(GMRG13>0:GMRG13-1,1:$L(GMRG2)) Q:GMRG6'>0  D STXT1
 S GMRG14=$P($G(GMRGSEL(+GMRG2,1)),"^",2),GMRG12=$L($G(GMRG4("A"))) F GMRG6=1:1:$L($P(GMRGSEL(+GMRG2),"^",2),"]")-1 S GMRG12=GMRG12+$L($S($D(GMRG4("I",GMRG6)):GMRG4("I",GMRG6),1:$P(GMRG14,"|",GMRG6+1)))+1
 I GMRG12>175 S GMRGOOD=0 Q
 S GMRG2=+GMRG2_$G(GMRG4("A")) F GMRG6=0:0 S GMRG6=$O(GMRG4("I",GMRG6)) Q:GMRG6'>0  S GMRG2=GMRG2_$G(GMRG4("I",GMRG6))
 S GMRGQUSL(+GMRG2)=$P(GMRG2,+GMRG2,2,$L(GMRG2,+GMRG2))
 Q
STXT ;
 S:GMRG12>0 GMRG11=1 S:GMRG13>0 GMRG14=GMRG14-1
 S:GMRG13>0 GMRG4(GMRG13-1)="I"
 S:GMRG12>0 GMRG4(GMRG12-1)="A"
 Q
STXT1 ;
 S:GMRG4(GMRG6)="I" GMRG11=GMRG11+1,GMRG4("I",GMRG11)=$E(GMRG2,GMRG6,GMRG13)
 S:GMRG4(GMRG6)="A" GMRG4("A")=$E(GMRG2,GMRG6,GMRG13)
 Q
PROMPT ;
 I $P(GMRGTERM(0),"^",6)=""&($P(GMRGTERM(0),"^",7)="") W "Select: " Q
 I $P(GMRGTERM(0),"^",7)="" W "Select at least ",$P(GMRGTERM(0),"^",6),": " Q
 I $P(GMRGTERM(0),"^",6)="" W "Select up to ",$P(GMRGTERM(0),"^",7),": " Q
 I $P(GMRGTERM(0),"^",6)'=$P(GMRGTERM(0),"^",7) W "Select at least ",$P(GMRGTERM(0),"^",6),", but no more than ",$P(GMRGTERM(0),"^",7),": "
 E  W "Select only ",$P(GMRGTERM(0),"^",6),": "
 Q
