IBDEI11G ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,17285,2)
 ;;=^5008232
 ;;^UTILITY(U,$J,358.3,17286,0)
 ;;=J30.9^^88^859^64
 ;;^UTILITY(U,$J,358.3,17286,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17286,1,3,0)
 ;;=3^Rhinitis,Allgeric,Unspec
 ;;^UTILITY(U,$J,358.3,17286,1,4,0)
 ;;=4^J30.9
 ;;^UTILITY(U,$J,358.3,17286,2)
 ;;=^5008205
 ;;^UTILITY(U,$J,358.3,17287,0)
 ;;=J01.91^^88^859^65
 ;;^UTILITY(U,$J,358.3,17287,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17287,1,3,0)
 ;;=3^Sinusitis,Acute,Recurrent,Unspec
 ;;^UTILITY(U,$J,358.3,17287,1,4,0)
 ;;=4^J01.91
 ;;^UTILITY(U,$J,358.3,17287,2)
 ;;=^5008128
 ;;^UTILITY(U,$J,358.3,17288,0)
 ;;=J01.90^^88^859^66
 ;;^UTILITY(U,$J,358.3,17288,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17288,1,3,0)
 ;;=3^Sinusitis,Acute,Unspec
 ;;^UTILITY(U,$J,358.3,17288,1,4,0)
 ;;=4^J01.90
 ;;^UTILITY(U,$J,358.3,17288,2)
 ;;=^5008127
 ;;^UTILITY(U,$J,358.3,17289,0)
 ;;=J32.9^^88^859^67
 ;;^UTILITY(U,$J,358.3,17289,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17289,1,3,0)
 ;;=3^Sinusitis,Chronic,Unspec
 ;;^UTILITY(U,$J,358.3,17289,1,4,0)
 ;;=4^J32.9
 ;;^UTILITY(U,$J,358.3,17289,2)
 ;;=^5008207
 ;;^UTILITY(U,$J,358.3,17290,0)
 ;;=R06.83^^88^859^68
 ;;^UTILITY(U,$J,358.3,17290,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17290,1,3,0)
 ;;=3^Snoring
 ;;^UTILITY(U,$J,358.3,17290,1,4,0)
 ;;=4^R06.83
 ;;^UTILITY(U,$J,358.3,17290,2)
 ;;=^5019192
 ;;^UTILITY(U,$J,358.3,17291,0)
 ;;=R09.3^^88^859^69
 ;;^UTILITY(U,$J,358.3,17291,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17291,1,3,0)
 ;;=3^Sputum,Abnormal
 ;;^UTILITY(U,$J,358.3,17291,1,4,0)
 ;;=4^R09.3
 ;;^UTILITY(U,$J,358.3,17291,2)
 ;;=^5019202
 ;;^UTILITY(U,$J,358.3,17292,0)
 ;;=R06.82^^88^859^70
 ;;^UTILITY(U,$J,358.3,17292,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17292,1,3,0)
 ;;=3^Tachypnea NEC
 ;;^UTILITY(U,$J,358.3,17292,1,4,0)
 ;;=4^R06.82
 ;;^UTILITY(U,$J,358.3,17292,2)
 ;;=^5019191
 ;;^UTILITY(U,$J,358.3,17293,0)
 ;;=J03.90^^88^859^72
 ;;^UTILITY(U,$J,358.3,17293,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17293,1,3,0)
 ;;=3^Tonsillitis,Acute,Unspec
 ;;^UTILITY(U,$J,358.3,17293,1,4,0)
 ;;=4^J03.90
 ;;^UTILITY(U,$J,358.3,17293,2)
 ;;=^5008135
 ;;^UTILITY(U,$J,358.3,17294,0)
 ;;=J35.9^^88^859^71
 ;;^UTILITY(U,$J,358.3,17294,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17294,1,3,0)
 ;;=3^Tonsil & Adenoid Disease,Chronic,Unspec
 ;;^UTILITY(U,$J,358.3,17294,1,4,0)
 ;;=4^J35.9
 ;;^UTILITY(U,$J,358.3,17294,2)
 ;;=^5008218
 ;;^UTILITY(U,$J,358.3,17295,0)
 ;;=R06.2^^88^859^73
 ;;^UTILITY(U,$J,358.3,17295,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17295,1,3,0)
 ;;=3^Wheezing
 ;;^UTILITY(U,$J,358.3,17295,1,4,0)
 ;;=4^R06.2
 ;;^UTILITY(U,$J,358.3,17295,2)
 ;;=^5019184
 ;;^UTILITY(U,$J,358.3,17296,0)
 ;;=R53.0^^88^860^1
 ;;^UTILITY(U,$J,358.3,17296,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17296,1,3,0)
 ;;=3^Fatigue,Cancer Related
 ;;^UTILITY(U,$J,358.3,17296,1,4,0)
 ;;=4^R53.0
 ;;^UTILITY(U,$J,358.3,17296,2)
 ;;=^5019515
 ;;^UTILITY(U,$J,358.3,17297,0)
 ;;=R53.82^^88^860^2
 ;;^UTILITY(U,$J,358.3,17297,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17297,1,3,0)
 ;;=3^Fatigue,Chronic,Unspec
 ;;^UTILITY(U,$J,358.3,17297,1,4,0)
 ;;=4^R53.82
 ;;^UTILITY(U,$J,358.3,17297,2)
 ;;=^5019519
 ;;^UTILITY(U,$J,358.3,17298,0)
 ;;=R53.83^^88^860^3
 ;;^UTILITY(U,$J,358.3,17298,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17298,1,3,0)
 ;;=3^Fatigue,Other
 ;;^UTILITY(U,$J,358.3,17298,1,4,0)
 ;;=4^R53.83
 ;;^UTILITY(U,$J,358.3,17298,2)
 ;;=^5019520
 ;;^UTILITY(U,$J,358.3,17299,0)
 ;;=F51.11^^88^860^7
 ;;^UTILITY(U,$J,358.3,17299,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,17299,1,3,0)
 ;;=3^Hypersomnia,Primary
