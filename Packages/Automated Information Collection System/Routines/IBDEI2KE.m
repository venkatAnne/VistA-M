IBDEI2KE ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,43015,1,3,0)
 ;;=3^NSC,EACH NERVE; 9-10 STUDIES
 ;;^UTILITY(U,$J,358.3,43016,0)
 ;;=95912^^194^2159^24^^^^1
 ;;^UTILITY(U,$J,358.3,43016,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,43016,1,2,0)
 ;;=2^95912
 ;;^UTILITY(U,$J,358.3,43016,1,3,0)
 ;;=3^NSC,EACH NERVE; 11-12 STUDIES
 ;;^UTILITY(U,$J,358.3,43017,0)
 ;;=95913^^194^2159^25^^^^1
 ;;^UTILITY(U,$J,358.3,43017,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,43017,1,2,0)
 ;;=2^95913
 ;;^UTILITY(U,$J,358.3,43017,1,3,0)
 ;;=3^NSC,EACH NERVE; 13 or more STUDIES
 ;;^UTILITY(U,$J,358.3,43018,0)
 ;;=90471^^194^2160^1^^^^1
 ;;^UTILITY(U,$J,358.3,43018,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,43018,1,2,0)
 ;;=2^90471
 ;;^UTILITY(U,$J,358.3,43018,1,3,0)
 ;;=3^Immunization Admin,Single
 ;;^UTILITY(U,$J,358.3,43019,0)
 ;;=90472^^194^2160^2^^^^1
 ;;^UTILITY(U,$J,358.3,43019,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,43019,1,2,0)
 ;;=2^90472
 ;;^UTILITY(U,$J,358.3,43019,1,3,0)
 ;;=3^Immunization Admin,Ea Addl
 ;;^UTILITY(U,$J,358.3,43020,0)
 ;;=90887^^194^2161^1^^^^1
 ;;^UTILITY(U,$J,358.3,43020,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,43020,1,2,0)
 ;;=2^90887
 ;;^UTILITY(U,$J,358.3,43020,1,3,0)
 ;;=3^Consultation w/ Family
 ;;^UTILITY(U,$J,358.3,43021,0)
 ;;=90791^^194^2161^2^^^^1
 ;;^UTILITY(U,$J,358.3,43021,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,43021,1,2,0)
 ;;=2^90791
 ;;^UTILITY(U,$J,358.3,43021,1,3,0)
 ;;=3^Psychiatric DX Interview
 ;;^UTILITY(U,$J,358.3,43022,0)
 ;;=90846^^194^2161^3^^^^1
 ;;^UTILITY(U,$J,358.3,43022,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,43022,1,2,0)
 ;;=2^90846
 ;;^UTILITY(U,$J,358.3,43022,1,3,0)
 ;;=3^Family Psytx w/o Patient
 ;;^UTILITY(U,$J,358.3,43023,0)
 ;;=99401^^194^2161^4^^^^1
 ;;^UTILITY(U,$J,358.3,43023,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,43023,1,2,0)
 ;;=2^99401
 ;;^UTILITY(U,$J,358.3,43023,1,3,0)
 ;;=3^Preventive Counseling, IND 15Min
 ;;^UTILITY(U,$J,358.3,43024,0)
 ;;=99402^^194^2161^5^^^^1
 ;;^UTILITY(U,$J,358.3,43024,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,43024,1,2,0)
 ;;=2^99402
 ;;^UTILITY(U,$J,358.3,43024,1,3,0)
 ;;=3^Preventive Counseling, IND 30Min
 ;;^UTILITY(U,$J,358.3,43025,0)
 ;;=99403^^194^2161^6^^^^1
 ;;^UTILITY(U,$J,358.3,43025,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,43025,1,2,0)
 ;;=2^99403
 ;;^UTILITY(U,$J,358.3,43025,1,3,0)
 ;;=3^Preventive Counseling, IND 45Min
 ;;^UTILITY(U,$J,358.3,43026,0)
 ;;=99404^^194^2161^7^^^^1
 ;;^UTILITY(U,$J,358.3,43026,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,43026,1,2,0)
 ;;=2^99404
 ;;^UTILITY(U,$J,358.3,43026,1,3,0)
 ;;=3^Preventive Counseling, IND 60Min
 ;;^UTILITY(U,$J,358.3,43027,0)
 ;;=99411^^194^2161^8^^^^1
 ;;^UTILITY(U,$J,358.3,43027,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,43027,1,2,0)
 ;;=2^99411
 ;;^UTILITY(U,$J,358.3,43027,1,3,0)
 ;;=3^Preventive Counseling, Group 30Min
 ;;^UTILITY(U,$J,358.3,43028,0)
 ;;=99412^^194^2161^9^^^^1
 ;;^UTILITY(U,$J,358.3,43028,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,43028,1,2,0)
 ;;=2^99412
 ;;^UTILITY(U,$J,358.3,43028,1,3,0)
 ;;=3^Preventive Counseling, Group 60Min
 ;;^UTILITY(U,$J,358.3,43029,0)
 ;;=99367^^194^2161^10^^^^1
 ;;^UTILITY(U,$J,358.3,43029,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,43029,1,2,0)
 ;;=2^99367
 ;;^UTILITY(U,$J,358.3,43029,1,3,0)
 ;;=3^Team Conf w/Pat by HC Pro 30Min
 ;;^UTILITY(U,$J,358.3,43030,0)
 ;;=99367^^194^2161^11^^^^1
 ;;^UTILITY(U,$J,358.3,43030,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,43030,1,2,0)
 ;;=2^99367
 ;;^UTILITY(U,$J,358.3,43030,1,3,0)
 ;;=3^Team Conf w/o Pat by Phys 30Min
 ;;^UTILITY(U,$J,358.3,43031,0)
 ;;=99368^^194^2161^12^^^^1
