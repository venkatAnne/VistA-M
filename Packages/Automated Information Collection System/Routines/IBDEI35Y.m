IBDEI35Y ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,53111,1,4,0)
 ;;=4^D04.11
 ;;^UTILITY(U,$J,358.3,53111,2)
 ;;=^5001910
 ;;^UTILITY(U,$J,358.3,53112,0)
 ;;=D04.12^^243^2663^7
 ;;^UTILITY(U,$J,358.3,53112,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53112,1,3,0)
 ;;=3^Carcinoma in Situ Skin Left Eyelid
 ;;^UTILITY(U,$J,358.3,53112,1,4,0)
 ;;=4^D04.12
 ;;^UTILITY(U,$J,358.3,53112,2)
 ;;=^5001911
 ;;^UTILITY(U,$J,358.3,53113,0)
 ;;=D04.21^^243^2663^12
 ;;^UTILITY(U,$J,358.3,53113,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53113,1,3,0)
 ;;=3^Carcinoma in Situ Skin Right Ear/External Auricular Canal
 ;;^UTILITY(U,$J,358.3,53113,1,4,0)
 ;;=4^D04.21
 ;;^UTILITY(U,$J,358.3,53113,2)
 ;;=^5001913
 ;;^UTILITY(U,$J,358.3,53114,0)
 ;;=D04.22^^243^2663^6
 ;;^UTILITY(U,$J,358.3,53114,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53114,1,3,0)
 ;;=3^Carcinoma in Situ Skin Left Ear/External Auricular Canal
 ;;^UTILITY(U,$J,358.3,53114,1,4,0)
 ;;=4^D04.22
 ;;^UTILITY(U,$J,358.3,53114,2)
 ;;=^5001914
 ;;^UTILITY(U,$J,358.3,53115,0)
 ;;=D04.30^^243^2663^5
 ;;^UTILITY(U,$J,358.3,53115,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53115,1,3,0)
 ;;=3^Carcinoma in Situ Skin Face,Unspec
 ;;^UTILITY(U,$J,358.3,53115,1,4,0)
 ;;=4^D04.30
 ;;^UTILITY(U,$J,358.3,53115,2)
 ;;=^5001915
 ;;^UTILITY(U,$J,358.3,53116,0)
 ;;=D04.39^^243^2663^4
 ;;^UTILITY(U,$J,358.3,53116,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53116,1,3,0)
 ;;=3^Carcinoma in Situ Skin Face NEC
 ;;^UTILITY(U,$J,358.3,53116,1,4,0)
 ;;=4^D04.39
 ;;^UTILITY(U,$J,358.3,53116,2)
 ;;=^5001916
 ;;^UTILITY(U,$J,358.3,53117,0)
 ;;=D04.4^^243^2663^16
 ;;^UTILITY(U,$J,358.3,53117,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53117,1,3,0)
 ;;=3^Carcinoma in Situ Skin Scalp/Neck
 ;;^UTILITY(U,$J,358.3,53117,1,4,0)
 ;;=4^D04.4
 ;;^UTILITY(U,$J,358.3,53117,2)
 ;;=^267729
 ;;^UTILITY(U,$J,358.3,53118,0)
 ;;=D04.5^^243^2663^17
 ;;^UTILITY(U,$J,358.3,53118,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53118,1,3,0)
 ;;=3^Carcinoma in Situ Skin Trunk
 ;;^UTILITY(U,$J,358.3,53118,1,4,0)
 ;;=4^D04.5
 ;;^UTILITY(U,$J,358.3,53118,2)
 ;;=^5001917
 ;;^UTILITY(U,$J,358.3,53119,0)
 ;;=D04.61^^243^2663^15
 ;;^UTILITY(U,$J,358.3,53119,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53119,1,3,0)
 ;;=3^Carcinoma in Situ Skin Right Upper Limb
 ;;^UTILITY(U,$J,358.3,53119,1,4,0)
 ;;=4^D04.61
 ;;^UTILITY(U,$J,358.3,53119,2)
 ;;=^5001919
 ;;^UTILITY(U,$J,358.3,53120,0)
 ;;=D04.62^^243^2663^9
 ;;^UTILITY(U,$J,358.3,53120,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53120,1,3,0)
 ;;=3^Carcinoma in Situ Skin Left Upper Limb
 ;;^UTILITY(U,$J,358.3,53120,1,4,0)
 ;;=4^D04.62
 ;;^UTILITY(U,$J,358.3,53120,2)
 ;;=^5001920
 ;;^UTILITY(U,$J,358.3,53121,0)
 ;;=D04.71^^243^2663^14
 ;;^UTILITY(U,$J,358.3,53121,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53121,1,3,0)
 ;;=3^Carcinoma in Situ Skin Right Lower Limb
 ;;^UTILITY(U,$J,358.3,53121,1,4,0)
 ;;=4^D04.71
 ;;^UTILITY(U,$J,358.3,53121,2)
 ;;=^5001922
 ;;^UTILITY(U,$J,358.3,53122,0)
 ;;=D04.72^^243^2663^8
 ;;^UTILITY(U,$J,358.3,53122,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53122,1,3,0)
 ;;=3^Carcinoma in Situ Skin Left Lower Limb
 ;;^UTILITY(U,$J,358.3,53122,1,4,0)
 ;;=4^D04.72
 ;;^UTILITY(U,$J,358.3,53122,2)
 ;;=^5001923
 ;;^UTILITY(U,$J,358.3,53123,0)
 ;;=D04.8^^243^2663^11
 ;;^UTILITY(U,$J,358.3,53123,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53123,1,3,0)
 ;;=3^Carcinoma in Situ Skin Other Sites
 ;;^UTILITY(U,$J,358.3,53123,1,4,0)
 ;;=4^D04.8
 ;;^UTILITY(U,$J,358.3,53123,2)
 ;;=^5001924
 ;;^UTILITY(U,$J,358.3,53124,0)
 ;;=L72.0^^243^2663^40
 ;;^UTILITY(U,$J,358.3,53124,1,0)
 ;;=^358.31IA^4^2
