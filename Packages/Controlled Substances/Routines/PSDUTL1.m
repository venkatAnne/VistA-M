PSDUTL1 ;BIR/JPW-Utility FM and X-Refs (cont'd) ; 18 Jan 94
 ;;3.0; CONTROLLED SUBSTANCES ;;13 Feb 97
SACT ;set 'ACT' x-ref on field 3 in 58.81
 S PSDNL=$P(^PSD(58.81,DA,0),"^",3),PSDDRU=$P(^(0),"^",5),PSDTYPE=$P(^(0),"^",2)
 I ('PSDNL)!('PSDDRU)!('PSDTYPE) K PSDNL,PSDDRU,PSDTYPE Q
 S ^PSD(58.81,"ACT",X,PSDNL,PSDDRU,PSDTYPE,DA)="" K PSDNL,PSDDRU,PSDTYPE
 Q
KACT ;kill 'ACT' x-ref on field 3 in 58.81
 S PSDNL=$P(^PSD(58.81,DA,0),"^",3),PSDDRU=$P(^(0),"^",5),PSDTYPE=$P(^(0),"^",2)
 I ('PSDNL)!('PSDDRU)!('PSDTYPE) K PSDNL,PSDDRU,PSDTYPE Q
 K ^PSD(58.81,"ACT",X,PSDNL,PSDDRU,PSDTYPE,DA),PSDNL,PSDDRU,PSDTYPE
 Q
SACT1 ;set 'ACT' x-ref on field 1 in 58.81
 S PSDATT=$P(^PSD(58.81,DA,0),"^",4),PSDNL=$P(^(0),"^",3),PSDDRU=$P(^(0),"^",5)
 I ('PSDATT)!('PSDNL)!('PSDDRU) K PSDATT,PSDNL,PSDDRU Q
 S ^PSD(58.81,"ACT",PSDATT,PSDNL,PSDDRU,X,DA)="" K PSDNL,PSDATT,PSDDRU
 Q
KACT1 ;kill 'ACT' x-ref on field 1 in 58.81
 S PSDATT=$P(^PSD(58.81,DA,0),"^",4),PSDNL=$P(^(0),"^",3),PSDDRU=$P(^(0),"^",5)
 I ('PSDATT)!('PSDNL)!('PSDDRU) K PSDATT,PSDNL,PSDDRU Q
 K ^PSD(58.81,"ACT",PSDATT,PSDNL,PSDDRU,X,DA),PSDNL,PSDATT,PSDDRU
 Q
SACT2 ;set 'ACT' x-ref on field 2 in 58.81
 S PSDATT=$P(^PSD(58.81,DA,0),"^",4),PSDDRU=$P(^(0),"^",5),PSDTYPE=$P(^(0),"^",2)
 I ('PSDATT)!('PSDDRU)!('PSDTYPE) K PSDATT,PSDDRU,PSDTYPE Q
 S ^PSD(58.81,"ACT",PSDATT,X,PSDDRU,PSDTYPE,DA)="" K PSDATT,PSDDRU,PSDTYPE
 Q
KACT2 ;kill 'ACT' x-ref on field 2 in 58.81
 S PSDATT=$P(^PSD(58.81,DA,0),"^",4),PSDDRU=$P(^(0),"^",5),PSDTYPE=$P(^(0),"^",2)
 I ('PSDATT)!('PSDDRU)!('PSDTYPE) K PSDATT,PSDDRU,PSDTYPE Q
 K ^PSD(58.81,"ACT",PSDATT,X,PSDDRU,PSDTYPE,DA),PSDATT,PSDDRU,PSDTYPE
 Q
SACT3 ;set 'ACT' x-ref on field 4 in 58.81
 S PSDNL=$P(^PSD(58.81,DA,0),"^",3),PSDATT=$P(^(0),"^",4),PSDTYPE=$P(^(0),"^",2)
 I 'PSDNL!('PSDATT)!('PSDTYPE) K PSDNL,PSDATT,PSDTYPE Q
 S ^PSD(58.81,"ACT",PSDATT,PSDNL,X,PSDTYPE,DA)="" K PSDATT,PSDNL,PSDTYPE
 Q
KACT3 ;kill 'ACT' x-ref on field 4 in 58.81
 S PSDNL=$P(^PSD(58.81,DA,0),"^",3),PSDATT=$P(^(0),"^",4),PSDTYPE=$P(^(0),"^",2)
 I ('PSDNL)!('PSDATT)!('PSDTYPE) K PSDNL,PSDATT,PSDTYPE Q
 K ^PSD(58.81,"ACT",PSDATT,PSDNL,X,PSDTYPE,DA),PSDNL,PSDATT,PSDTYPE
 Q
SACT4 ;set 'ACT' x-ref on field 34 in 58.81
 S PSDNL=$P(^PSD(58.81,DA,0),"^",3),PSDDRU=$P(^(0),"^",5),PSDTYPE=3
 I ('PSDNL)!('PSDDRU)!('PSDTYPE) K PSDNL,PSDDRU,PSDTYPE Q
 S ^PSD(58.81,"ACT",X,PSDNL,PSDDRU,PSDTYPE,DA)="" K PSDNL,PSDDRU,PSDTYPE
 Q
KACT4 ;kill 'ACT' x-ref on field 34 in 58.81
 S PSDNL=$P(^PSD(58.81,DA,0),"^",3),PSDDRU=$P(^(0),"^",5),PSDTYPE=3
 I ('PSDNL)!('PSDDRU)!('PSDTYPE) K PSDNL,PSDDRU,PSDTYPE Q
 K ^PSD(58.81,"ACT",X,PSDNL,PSDDRU,PSDTYPE,DA),PSDNL,PSDDRU,PSDTYPE
 Q
SACT5 ;set 'ACT' x-ref on field 48 in 58.81
 S PSDNL=$P(^PSD(58.81,DA,0),"^",3),PSDDRU=$P(^(0),"^",5),PSDTYPE=14
 I ('PSDNL)!('PSDDRU)!('PSDTYPE) K PSDNL,PSDDRU,PSDTYPE Q
 S ^PSD(58.81,"ACT",X,PSDNL,PSDDRU,PSDTYPE,DA)="" K PSDNL,PSDDRU,PSDTYPE
 Q
KACT5 ;kill 'ACT' x-ref on field 48 in 58.81
 S PSDNL=$P(^PSD(58.81,DA,0),"^",3),PSDDRU=$P(^(0),"^",5),PSDTYPE=14
 I ('PSDNL)!('PSDDRU)!('PSDTYPE) K PSDNL,PSDDRU,PSDTYPE Q
 K ^PSD(58.81,"ACT",X,PSDNL,PSDDRU,PSDTYPE,DA),PSDNL,PSDDRU,PSDTYPE
 Q
SACT6 ;set 'ACT' x-ref on field 55 in 58.81
 S PSDNL=$P(^PSD(58.81,DA,0),"^",3),PSDDRU=$P(^(0),"^",5),PSDTYPE=13
 I ('PSDNL)!('PSDDRU)!('PSDTYPE) K PSDNL,PSDDRU,PSDTYPE Q
 S ^PSD(58.81,"ACT",X,PSDNL,PSDDRU,PSDTYPE,DA)="" K PSDNL,PSDDRU,PSDTYPE
 Q
KACT6 ;kill 'ACT' x-ref on field 55 in 58.81
 S PSDNL=$P(^PSD(58.81,DA,0),"^",3),PSDDRU=$P(^(0),"^",5),PSDTYPE=13
 I ('PSDNL)!('PSDDRU)!('PSDTYPE) K PSDNL,PSDDRU,PSDTYPE Q
 K ^PSD(58.81,"ACT",X,PSDNL,PSDDRU,PSDTYPE,DA),PSDNL,PSDDRU,PSDTYPE
 Q
SAD ;set 'AD' x-ref on field 17 in 58.81
 S PSDOST=+$P(^PSD(58.81,DA,0),"^",11) I 'PSDOST K PSDOST Q
 S ^PSD(58.81,"AD",PSDOST,X,DA)="" K PSDOST
 Q
KAD ;kill 'AD' x-ref on field 17 in 58.81
 S PSDOST=+$P(^PSD(58.81,DA,0),"^",11) I 'PSDOST K PSDOST Q
 K ^PSD(58.81,"AD",PSDOST,X,DA),PSDOST
 Q
SAW ;set 'AW' x-ref on field 13 in 58.85
 S PSDDS=$P(^PSD(58.85,DA,0),"^",2) I 'PSDDS K PSDDS Q
 S ^PSD(58.85,"AW",PSDDS,X,DA)="" K PSDDS
 Q
KAW ;kill 'AW' x-ref on field 13 in 58.85
 S PSDDS=$P(^PSD(58.85,DA,0),"^",2) I 'PSDDS K PSDDS Q
 K ^PSD(58.85,"AW",PSDDS,X,DA),PSDDS
 Q
SAW1 ;set 'AW' x-ref on field 1 in 58.85
 Q:'$D(^PSD(58.85,DA,2))
 S PSDPRT=$P(^PSD(58.85,DA,2),"^") I 'PSDPRT K PSDPRT Q
 S ^PSD(58.85,"AW",X,PSDPRT,DA)="" K PSDPRT
 Q
KAW1 ;kill 'AW' x-ref on field 1 in 58.85
 Q:'$D(^PSD(58.85,DA,2))
 S PSDPRT=$P(^PSD(58.85,DA,2),"^") I 'PSDPRT K PSDPRT Q
 K ^PSD(58.85,"AW",X,PSDPRT,DA),PSDPRT
 Q
