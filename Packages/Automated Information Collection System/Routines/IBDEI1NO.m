IBDEI1NO ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,27703,0)
 ;;=C20.^^132^1320^147
 ;;^UTILITY(U,$J,358.3,27703,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27703,1,3,0)
 ;;=3^Malig Neop Rectum
 ;;^UTILITY(U,$J,358.3,27703,1,4,0)
 ;;=4^C20.
 ;;^UTILITY(U,$J,358.3,27703,2)
 ;;=^267090
 ;;^UTILITY(U,$J,358.3,27704,0)
 ;;=C64.1^^132^1320^152
 ;;^UTILITY(U,$J,358.3,27704,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27704,1,3,0)
 ;;=3^Malig Neop Right Kidney,Except Renal pelvis
 ;;^UTILITY(U,$J,358.3,27704,1,4,0)
 ;;=4^C64.1
 ;;^UTILITY(U,$J,358.3,27704,2)
 ;;=^5001248
 ;;^UTILITY(U,$J,358.3,27705,0)
 ;;=C65.1^^132^1320^155
 ;;^UTILITY(U,$J,358.3,27705,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27705,1,3,0)
 ;;=3^Malig Neop Right Renal Pelvis
 ;;^UTILITY(U,$J,358.3,27705,1,4,0)
 ;;=4^C65.1
 ;;^UTILITY(U,$J,358.3,27705,2)
 ;;=^5001251
 ;;^UTILITY(U,$J,358.3,27706,0)
 ;;=C62.91^^132^1320^156
 ;;^UTILITY(U,$J,358.3,27706,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27706,1,3,0)
 ;;=3^Malig Neop Right Testis
 ;;^UTILITY(U,$J,358.3,27706,1,4,0)
 ;;=4^C62.91
 ;;^UTILITY(U,$J,358.3,27706,2)
 ;;=^5001237
 ;;^UTILITY(U,$J,358.3,27707,0)
 ;;=C17.9^^132^1320^157
 ;;^UTILITY(U,$J,358.3,27707,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27707,1,3,0)
 ;;=3^Malig Neop Small Intestine,Unspec
 ;;^UTILITY(U,$J,358.3,27707,1,4,0)
 ;;=4^C17.9
 ;;^UTILITY(U,$J,358.3,27707,2)
 ;;=^5000926
 ;;^UTILITY(U,$J,358.3,27708,0)
 ;;=C16.9^^132^1320^158
 ;;^UTILITY(U,$J,358.3,27708,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27708,1,3,0)
 ;;=3^Malig Neop Stomach,Unspec
 ;;^UTILITY(U,$J,358.3,27708,1,4,0)
 ;;=4^C16.9
 ;;^UTILITY(U,$J,358.3,27708,2)
 ;;=^5000923
 ;;^UTILITY(U,$J,358.3,27709,0)
 ;;=C02.9^^132^1320^160
 ;;^UTILITY(U,$J,358.3,27709,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27709,1,3,0)
 ;;=3^Malig Neop Tongue,Unspec
 ;;^UTILITY(U,$J,358.3,27709,1,4,0)
 ;;=4^C02.9
 ;;^UTILITY(U,$J,358.3,27709,2)
 ;;=^5000891
 ;;^UTILITY(U,$J,358.3,27710,0)
 ;;=C64.9^^132^1320^125
 ;;^UTILITY(U,$J,358.3,27710,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27710,1,3,0)
 ;;=3^Malig Neop Kidney,Except Renal Pelvis,Unspec
 ;;^UTILITY(U,$J,358.3,27710,1,4,0)
 ;;=4^C64.9
 ;;^UTILITY(U,$J,358.3,27710,2)
 ;;=^5001250
 ;;^UTILITY(U,$J,358.3,27711,0)
 ;;=C34.92^^132^1320^128
 ;;^UTILITY(U,$J,358.3,27711,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27711,1,3,0)
 ;;=3^Malig Neop Left Bronchus/Lung,Unspec Part
 ;;^UTILITY(U,$J,358.3,27711,1,4,0)
 ;;=4^C34.92
 ;;^UTILITY(U,$J,358.3,27711,2)
 ;;=^5000968
 ;;^UTILITY(U,$J,358.3,27712,0)
 ;;=C34.90^^132^1320^114
 ;;^UTILITY(U,$J,358.3,27712,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27712,1,3,0)
 ;;=3^Malig Neop Bronchus/Lung,Unspec Part
 ;;^UTILITY(U,$J,358.3,27712,1,4,0)
 ;;=4^C34.90
 ;;^UTILITY(U,$J,358.3,27712,2)
 ;;=^5000966
 ;;^UTILITY(U,$J,358.3,27713,0)
 ;;=C65.9^^132^1320^148
 ;;^UTILITY(U,$J,358.3,27713,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27713,1,3,0)
 ;;=3^Malig Neop Renal Pelvis,Unspec
 ;;^UTILITY(U,$J,358.3,27713,1,4,0)
 ;;=4^C65.9
 ;;^UTILITY(U,$J,358.3,27713,2)
 ;;=^5001253
 ;;^UTILITY(U,$J,358.3,27714,0)
 ;;=C50.912^^132^1320^129
 ;;^UTILITY(U,$J,358.3,27714,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27714,1,3,0)
 ;;=3^Malig Neop Left Female Breast,Unspec Site
 ;;^UTILITY(U,$J,358.3,27714,1,4,0)
 ;;=4^C50.912
 ;;^UTILITY(U,$J,358.3,27714,2)
 ;;=^5001196
 ;;^UTILITY(U,$J,358.3,27715,0)
 ;;=C50.911^^132^1320^151
 ;;^UTILITY(U,$J,358.3,27715,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27715,1,3,0)
 ;;=3^Malig Neop Right Female Breast,Unspec Site
 ;;^UTILITY(U,$J,358.3,27715,1,4,0)
 ;;=4^C50.911
