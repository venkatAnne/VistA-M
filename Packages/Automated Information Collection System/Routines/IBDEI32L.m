IBDEI32L ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,51475,1,2,0)
 ;;=2^96105
 ;;^UTILITY(U,$J,358.3,51475,1,3,0)
 ;;=3^Aphasia Assessment,Per Hr
 ;;^UTILITY(U,$J,358.3,51476,0)
 ;;=90901^^223^2486^3^^^^1
 ;;^UTILITY(U,$J,358.3,51476,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,51476,1,2,0)
 ;;=2^90901
 ;;^UTILITY(U,$J,358.3,51476,1,3,0)
 ;;=3^Biofeedback training any method
 ;;^UTILITY(U,$J,358.3,51477,0)
 ;;=96111^^223^2486^4^^^^1
 ;;^UTILITY(U,$J,358.3,51477,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,51477,1,2,0)
 ;;=2^96111
 ;;^UTILITY(U,$J,358.3,51477,1,3,0)
 ;;=3^Developmental testing, extended
 ;;^UTILITY(U,$J,358.3,51478,0)
 ;;=97750^^223^2486^5^^^^1
 ;;^UTILITY(U,$J,358.3,51478,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,51478,1,2,0)
 ;;=2^97750
 ;;^UTILITY(U,$J,358.3,51478,1,3,0)
 ;;=3^Extrem Perf Testing,Ea 15min
 ;;^UTILITY(U,$J,358.3,51479,0)
 ;;=95832^^223^2486^6^^^^1
 ;;^UTILITY(U,$J,358.3,51479,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,51479,1,2,0)
 ;;=2^95832
 ;;^UTILITY(U,$J,358.3,51479,1,3,0)
 ;;=3^Hand Muscle Testing
 ;;^UTILITY(U,$J,358.3,51480,0)
 ;;=95831^^223^2486^7^^^^1
 ;;^UTILITY(U,$J,358.3,51480,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,51480,1,2,0)
 ;;=2^95831
 ;;^UTILITY(U,$J,358.3,51480,1,3,0)
 ;;=3^Muscle Testing, Limb
 ;;^UTILITY(U,$J,358.3,51481,0)
 ;;=95834^^223^2486^8^^^^1
 ;;^UTILITY(U,$J,358.3,51481,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,51481,1,2,0)
 ;;=2^95834
 ;;^UTILITY(U,$J,358.3,51481,1,3,0)
 ;;=3^Muscle Testing, total body
 ;;^UTILITY(U,$J,358.3,51482,0)
 ;;=97003^^223^2486^9^^^^1
 ;;^UTILITY(U,$J,358.3,51482,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,51482,1,2,0)
 ;;=2^97003
 ;;^UTILITY(U,$J,358.3,51482,1,3,0)
 ;;=3^Occupational Therapy evaluation
 ;;^UTILITY(U,$J,358.3,51483,0)
 ;;=97001^^223^2486^11^^^^1
 ;;^UTILITY(U,$J,358.3,51483,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,51483,1,2,0)
 ;;=2^97001
 ;;^UTILITY(U,$J,358.3,51483,1,3,0)
 ;;=3^Physical Therapy evaluation
 ;;^UTILITY(U,$J,358.3,51484,0)
 ;;=97004^^223^2486^10^^^^1
 ;;^UTILITY(U,$J,358.3,51484,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,51484,1,2,0)
 ;;=2^97004
 ;;^UTILITY(U,$J,358.3,51484,1,3,0)
 ;;=3^Occupational Therapy re-evaluation
 ;;^UTILITY(U,$J,358.3,51485,0)
 ;;=97002^^223^2486^12^^^^1
 ;;^UTILITY(U,$J,358.3,51485,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,51485,1,2,0)
 ;;=2^97002
 ;;^UTILITY(U,$J,358.3,51485,1,3,0)
 ;;=3^Physical Therapy re-evaluation
 ;;^UTILITY(U,$J,358.3,51486,0)
 ;;=62310^^223^2487^1^^^^1
 ;;^UTILITY(U,$J,358.3,51486,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,51486,1,2,0)
 ;;=2^62310
 ;;^UTILITY(U,$J,358.3,51486,1,3,0)
 ;;=3^Injection spine C/T
 ;;^UTILITY(U,$J,358.3,51487,0)
 ;;=62311^^223^2487^2^^^^1
 ;;^UTILITY(U,$J,358.3,51487,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,51487,1,2,0)
 ;;=2^62311
 ;;^UTILITY(U,$J,358.3,51487,1,3,0)
 ;;=3^Injection spine L/S
 ;;^UTILITY(U,$J,358.3,51488,0)
 ;;=64479^^223^2487^3^^^^1
 ;;^UTILITY(U,$J,358.3,51488,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,51488,1,2,0)
 ;;=2^64479
 ;;^UTILITY(U,$J,358.3,51488,1,3,0)
 ;;=3^INJ Epidural, foramen, C/T
 ;;^UTILITY(U,$J,358.3,51489,0)
 ;;=64480^^223^2487^4^^^^1
 ;;^UTILITY(U,$J,358.3,51489,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,51489,1,2,0)
 ;;=2^64480
 ;;^UTILITY(U,$J,358.3,51489,1,3,0)
 ;;=3^INJ Epidural,C/T Ea Addl Level
 ;;^UTILITY(U,$J,358.3,51490,0)
 ;;=64483^^223^2487^5^^^^1
 ;;^UTILITY(U,$J,358.3,51490,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,51490,1,2,0)
 ;;=2^64483
 ;;^UTILITY(U,$J,358.3,51490,1,3,0)
 ;;=3^INJ Epidural, foramen, L/S
 ;;^UTILITY(U,$J,358.3,51491,0)
 ;;=64484^^223^2487^6^^^^1
