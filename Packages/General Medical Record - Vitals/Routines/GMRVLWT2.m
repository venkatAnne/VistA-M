GMRVLWT2 ;HIRMFO/YH-DOT MATRIX WEIGHT GRAPH - 3 ;5/27/97
 ;;4.0;Vitals/Measurements;**1**;Apr 25, 1997
SETHD ;
 ;GMRWT = WEIGHT VALUE WHEN $Y=1
 ;GMRWT(1) = $Y
 ;GMRWT(2) = GWT LOCAL GLOBAL COUNT
 S GMRWHI=GMRWT-(($Y-1)*1.666),GMRWLO=GMRWHI-1.666
 S GMR3=(($Y/3)=($Y\3))
 S GMRHDR10=$S($Y>5&GMR3&($Y<57)&($Y'=GMRWT(1)):"        5",$Y=GMRWT(1)&(GMRWT(2)<9):GWT(GMRWT(2)),1:"")
 I $Y=GMRWT(1) S GMRWT(1)=GMRWT(1)+6,GMRWT(2)=GMRWT(2)+1
 Q
DATAPRT ;
 S GMRLINE=GMRX1
 S GMRNM=0 F GMRDT=0:0 S GMRDT=$O(^TMP($J,"GMRDT",GMRDT)) Q:GMRDT'>0  D SETLINE Q:GMRNM=10
 W GMRLINE
 Q
SETLINE ;
 S GMRNM=GMRNM+1,GMROLD=$P(GMRLINE,"|",GMRNM),GMRW=$O(^TMP($J,"GMRVG","W",GMRDT,""))
 S GMRWOFF=($Y=6&(+GMRW>(GWT(1)+5)))!($Y=56&(+GMRW<(GWT(8)-7)))
 S GMROLD=$E($S(+GMRW>0&(+GMRW'<GMRWLO&(+GMRW'>GMRWHI)!GMRWOFF):"W"_$S('GMRWOFF:" ",1:"**"),1:"")_"          ",1,10)
 S $P(GMRLINE,"|",GMRNM)=GMROLD
 Q
