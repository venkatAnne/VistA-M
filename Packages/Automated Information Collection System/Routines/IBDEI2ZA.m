IBDEI2ZA ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,49927,2)
 ;;=^332744
 ;;^UTILITY(U,$J,358.3,49928,0)
 ;;=J98.2^^219^2434^34
 ;;^UTILITY(U,$J,358.3,49928,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,49928,1,3,0)
 ;;=3^Emphysema,Interstitial
 ;;^UTILITY(U,$J,358.3,49928,1,4,0)
 ;;=4^J98.2
 ;;^UTILITY(U,$J,358.3,49928,2)
 ;;=^39734
 ;;^UTILITY(U,$J,358.3,49929,0)
 ;;=J98.4^^219^2434^42
 ;;^UTILITY(U,$J,358.3,49929,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,49929,1,3,0)
 ;;=3^Lung Disorders
 ;;^UTILITY(U,$J,358.3,49929,1,4,0)
 ;;=4^J98.4
 ;;^UTILITY(U,$J,358.3,49929,2)
 ;;=^5008362
 ;;^UTILITY(U,$J,358.3,49930,0)
 ;;=C34.11^^219^2434^53
 ;;^UTILITY(U,$J,358.3,49930,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,49930,1,3,0)
 ;;=3^Malig Neop Upper Lobe,Rt Bronchus/Lung
 ;;^UTILITY(U,$J,358.3,49930,1,4,0)
 ;;=4^C34.11
 ;;^UTILITY(U,$J,358.3,49930,2)
 ;;=^5000961
 ;;^UTILITY(U,$J,358.3,49931,0)
 ;;=C34.12^^219^2434^52
 ;;^UTILITY(U,$J,358.3,49931,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,49931,1,3,0)
 ;;=3^Malig Neop Upper Lobe,Lt Bronchus/Lung
 ;;^UTILITY(U,$J,358.3,49931,1,4,0)
 ;;=4^C34.12
 ;;^UTILITY(U,$J,358.3,49931,2)
 ;;=^5000962
 ;;^UTILITY(U,$J,358.3,49932,0)
 ;;=C34.2^^219^2434^46
 ;;^UTILITY(U,$J,358.3,49932,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,49932,1,3,0)
 ;;=3^Malig Neop Middle Lobe,Bronchus/Lung
 ;;^UTILITY(U,$J,358.3,49932,1,4,0)
 ;;=4^C34.2
 ;;^UTILITY(U,$J,358.3,49932,2)
 ;;=^267137
 ;;^UTILITY(U,$J,358.3,49933,0)
 ;;=C34.31^^219^2434^44
 ;;^UTILITY(U,$J,358.3,49933,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,49933,1,3,0)
 ;;=3^Malig Neop Lower Lobe,Rt Bronchus/Lung
 ;;^UTILITY(U,$J,358.3,49933,1,4,0)
 ;;=4^C34.31
 ;;^UTILITY(U,$J,358.3,49933,2)
 ;;=^5133321
 ;;^UTILITY(U,$J,358.3,49934,0)
 ;;=C34.32^^219^2434^43
 ;;^UTILITY(U,$J,358.3,49934,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,49934,1,3,0)
 ;;=3^Malig Neop Lower Lobe,Lt Bronchus/Lung
 ;;^UTILITY(U,$J,358.3,49934,1,4,0)
 ;;=4^C34.32
 ;;^UTILITY(U,$J,358.3,49934,2)
 ;;=^5133322
 ;;^UTILITY(U,$J,358.3,49935,0)
 ;;=C34.81^^219^2434^48
 ;;^UTILITY(U,$J,358.3,49935,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,49935,1,3,0)
 ;;=3^Malig Neop Overlapping Sites,Rt Bronchus/Lung
 ;;^UTILITY(U,$J,358.3,49935,1,4,0)
 ;;=4^C34.81
 ;;^UTILITY(U,$J,358.3,49935,2)
 ;;=^5000964
 ;;^UTILITY(U,$J,358.3,49936,0)
 ;;=C34.82^^219^2434^47
 ;;^UTILITY(U,$J,358.3,49936,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,49936,1,3,0)
 ;;=3^Malig Neop Overlapping Sites,Lt Bronchus/Lung
 ;;^UTILITY(U,$J,358.3,49936,1,4,0)
 ;;=4^C34.82
 ;;^UTILITY(U,$J,358.3,49936,2)
 ;;=^5000965
 ;;^UTILITY(U,$J,358.3,49937,0)
 ;;=C34.91^^219^2434^51
 ;;^UTILITY(U,$J,358.3,49937,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,49937,1,3,0)
 ;;=3^Malig Neop Unspec Part,Rt Bronchus/Lung
 ;;^UTILITY(U,$J,358.3,49937,1,4,0)
 ;;=4^C34.91
 ;;^UTILITY(U,$J,358.3,49937,2)
 ;;=^5000967
 ;;^UTILITY(U,$J,358.3,49938,0)
 ;;=C34.92^^219^2434^50
 ;;^UTILITY(U,$J,358.3,49938,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,49938,1,3,0)
 ;;=3^Malig Neop Unspec Part,Lt Bronchus/Lung
 ;;^UTILITY(U,$J,358.3,49938,1,4,0)
 ;;=4^C34.92
 ;;^UTILITY(U,$J,358.3,49938,2)
 ;;=^5000968
 ;;^UTILITY(U,$J,358.3,49939,0)
 ;;=C38.4^^219^2434^49
 ;;^UTILITY(U,$J,358.3,49939,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,49939,1,3,0)
 ;;=3^Malig Neop Pleura
 ;;^UTILITY(U,$J,358.3,49939,1,4,0)
 ;;=4^C38.4
 ;;^UTILITY(U,$J,358.3,49939,2)
 ;;=^267140
 ;;^UTILITY(U,$J,358.3,49940,0)
 ;;=C39.9^^219^2434^45
 ;;^UTILITY(U,$J,358.3,49940,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,49940,1,3,0)
 ;;=3^Malig Neop Lower Respiratory Tract
