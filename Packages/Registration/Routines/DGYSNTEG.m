DGYSNTEG ;ISC/XTSUMBLD KERNEL - Package checksum checker ;JUN 13, 1995@09:50:10
 ;;5.3;Registration;**54**;Aug 13, 1993
 ;;7.2;JUN 13, 1995@09:50:10
 S XT4="I 1",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
CONT F XT1=1:1 S XT2=$T(ROU+XT1) Q:XT2=""  S X=$P(XT2," ",1),XT3=$P(XT2,";",3) X XT4 I $T W !,X X ^%ZOSF("TEST") S:'$T XT3=0 X:XT3 ^%ZOSF("RSUM") W ?10,$S('XT3:"Routine not in UCI",XT3'=Y:"Calculated "_$C(7)_Y_", off by "_(Y-XT3),1:"ok")
 ;
 K %1,%2,%3,X,Y,XT1,XT2,XT3,XT4 Q
ONE S XT4="I $D(^UTILITY($J,X))",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
 W !,"Check a subset of routines:" K ^UTILITY($J) X ^%ZOSF("RSEL")
 W ! G CONT
ROU ;;
DGJTEE ;;19305246
DGMTCOU1 ;;3479357
DGPMDDCN ;;7220277
DGPMDDLD ;;6002222
DGPMRB ;;10610513
DGPMV3 ;;14901380
DGPTFMO1 ;;2178708
DGPTUTL1 ;;6629636
DGRP8 ;;195371
DGRUGBGJ ;;10944548
DGRUGSA ;;13095429
DGYSI001 ;;7991892
DGYSI002 ;;3248090
DGYSI003 ;;7851728
DGYSI004 ;;7224275
DGYSI005 ;;6722006
DGYSI006 ;;5899311
DGYSINI1 ;;4855606
DGYSINI2 ;;5232640
DGYSINI3 ;;16807620
DGYSINI4 ;;3357812
DGYSINI5 ;;547385
DGYSINIS ;;2214401
DGYSINIT ;;10242712
DGYSPOST ;;3725396
VADPT5 ;;12090055