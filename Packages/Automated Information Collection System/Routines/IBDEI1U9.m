IBDEI1U9 ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,30783,2)
 ;;=^118032
 ;;^UTILITY(U,$J,358.3,30784,0)
 ;;=R29.1^^135^1384^118
 ;;^UTILITY(U,$J,358.3,30784,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,30784,1,3,0)
 ;;=3^Meningismus
 ;;^UTILITY(U,$J,358.3,30784,1,4,0)
 ;;=4^R29.1
 ;;^UTILITY(U,$J,358.3,30784,2)
 ;;=^5019313
 ;;^UTILITY(U,$J,358.3,30785,0)
 ;;=R29.5^^135^1384^155
 ;;^UTILITY(U,$J,358.3,30785,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,30785,1,3,0)
 ;;=3^Transient Paralysis
 ;;^UTILITY(U,$J,358.3,30785,1,4,0)
 ;;=4^R29.5
 ;;^UTILITY(U,$J,358.3,30785,2)
 ;;=^5019316
 ;;^UTILITY(U,$J,358.3,30786,0)
 ;;=R34.^^135^1384^39
 ;;^UTILITY(U,$J,358.3,30786,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,30786,1,3,0)
 ;;=3^Anuria and Oliguria
 ;;^UTILITY(U,$J,358.3,30786,1,4,0)
 ;;=4^R34.
 ;;^UTILITY(U,$J,358.3,30786,2)
 ;;=^5019333
 ;;^UTILITY(U,$J,358.3,30787,0)
 ;;=R35.8^^135^1384^140
 ;;^UTILITY(U,$J,358.3,30787,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,30787,1,3,0)
 ;;=3^Polyuria NEC
 ;;^UTILITY(U,$J,358.3,30787,1,4,0)
 ;;=4^R35.8
 ;;^UTILITY(U,$J,358.3,30787,2)
 ;;=^5019336
 ;;^UTILITY(U,$J,358.3,30788,0)
 ;;=R39.12^^135^1384^141
 ;;^UTILITY(U,$J,358.3,30788,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,30788,1,3,0)
 ;;=3^Poor Urinary Stream
 ;;^UTILITY(U,$J,358.3,30788,1,4,0)
 ;;=4^R39.12
 ;;^UTILITY(U,$J,358.3,30788,2)
 ;;=^5019342
 ;;^UTILITY(U,$J,358.3,30789,0)
 ;;=R39.14^^135^1384^73
 ;;^UTILITY(U,$J,358.3,30789,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,30789,1,3,0)
 ;;=3^Feeling of Incomplete Bladder Emptying
 ;;^UTILITY(U,$J,358.3,30789,1,4,0)
 ;;=4^R39.14
 ;;^UTILITY(U,$J,358.3,30789,2)
 ;;=^5019344
 ;;^UTILITY(U,$J,358.3,30790,0)
 ;;=R41.4^^135^1384^122
 ;;^UTILITY(U,$J,358.3,30790,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,30790,1,3,0)
 ;;=3^Neurologic Neglect Syndrome
 ;;^UTILITY(U,$J,358.3,30790,1,4,0)
 ;;=4^R41.4
 ;;^UTILITY(U,$J,358.3,30790,2)
 ;;=^303316
 ;;^UTILITY(U,$J,358.3,30791,0)
 ;;=R41.81^^135^1384^32
 ;;^UTILITY(U,$J,358.3,30791,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,30791,1,3,0)
 ;;=3^Age-Related Cognitive Decline
 ;;^UTILITY(U,$J,358.3,30791,1,4,0)
 ;;=4^R41.81
 ;;^UTILITY(U,$J,358.3,30791,2)
 ;;=^5019440
 ;;^UTILITY(U,$J,358.3,30792,0)
 ;;=R41.0^^135^1384^61
 ;;^UTILITY(U,$J,358.3,30792,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,30792,1,3,0)
 ;;=3^Disorientation/Confusion/Delrium,Unspec
 ;;^UTILITY(U,$J,358.3,30792,1,4,0)
 ;;=4^R41.0
 ;;^UTILITY(U,$J,358.3,30792,2)
 ;;=^5019436
 ;;^UTILITY(U,$J,358.3,30793,0)
 ;;=R41.82^^135^1384^34
 ;;^UTILITY(U,$J,358.3,30793,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,30793,1,3,0)
 ;;=3^Altered Mental Status,Unspec
 ;;^UTILITY(U,$J,358.3,30793,1,4,0)
 ;;=4^R41.82
 ;;^UTILITY(U,$J,358.3,30793,2)
 ;;=^5019441
 ;;^UTILITY(U,$J,358.3,30794,0)
 ;;=R43.0^^135^1384^37
 ;;^UTILITY(U,$J,358.3,30794,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,30794,1,3,0)
 ;;=3^Anosmia
 ;;^UTILITY(U,$J,358.3,30794,1,4,0)
 ;;=4^R43.0
 ;;^UTILITY(U,$J,358.3,30794,2)
 ;;=^7949
 ;;^UTILITY(U,$J,358.3,30795,0)
 ;;=R43.1^^135^1384^132
 ;;^UTILITY(U,$J,358.3,30795,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,30795,1,3,0)
 ;;=3^Parosmia
 ;;^UTILITY(U,$J,358.3,30795,1,4,0)
 ;;=4^R43.1
 ;;^UTILITY(U,$J,358.3,30795,2)
 ;;=^5019451
 ;;^UTILITY(U,$J,358.3,30796,0)
 ;;=R43.2^^135^1384^129
 ;;^UTILITY(U,$J,358.3,30796,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,30796,1,3,0)
 ;;=3^Parageusia
 ;;^UTILITY(U,$J,358.3,30796,1,4,0)
 ;;=4^R43.2
 ;;^UTILITY(U,$J,358.3,30796,2)
 ;;=^5019452
 ;;^UTILITY(U,$J,358.3,30797,0)
 ;;=R43.9^^135^1384^148
 ;;^UTILITY(U,$J,358.3,30797,1,0)
 ;;=^358.31IA^4^2
