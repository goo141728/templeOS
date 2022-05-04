! { dg-options "-O2 -floop-nest-optimize" }

MODULE whittaker
  INTEGER, PARAMETER :: dp=8
  INTEGER, PARAMETER :: maxfac = 30
  REAL(KIND=dp), PARAMETER, DIMENSION (-1:2*maxfac+1) :: dfac = (/&
 0.10000000000000000000E+01_dp, 0.10000000000000000000E+01_dp, 0.10000000000000000000E+01_dp,&
 0.20000000000000000000E+01_dp, 0.30000000000000000000E+01_dp, 0.80000000000000000000E+01_dp,&
 0.15000000000000000000E+02_dp, 0.48000000000000000000E+02_dp, 0.10500000000000000000E+03_dp,&
 0.38400000000000000000E+03_dp, 0.94500000000000000000E+03_dp, 0.38400000000000000000E+04_dp,&
 0.10395000000000000000E+05_dp, 0.46080000000000000000E+05_dp, 0.13513500000000000000E+06_dp,&
 0.64512000000000000000E+06_dp, 0.20270250000000000000E+07_dp, 0.10321920000000000000E+08_dp,&
 0.34459425000000000000E+08_dp, 0.18579456000000000000E+09_dp, 0.65472907500000000000E+09_dp,&
 0.37158912000000000000E+10_dp, 0.13749310575000000000E+11_dp, 0.81749606400000000000E+11_dp,&
 0.31623414322500000000E+12_dp, 0.19619905536000000000E+13_dp, 0.79058535806250000000E+13_dp,&
 0.51011754393600000000E+14_dp, 0.21345804667687500000E+15_dp, 0.14283291230208000000E+16_dp,&
 0.61902833536293750000E+16_dp, 0.42849873690624000000E+17_dp, 0.19189878396251062500E+18_dp,&
 0.13711959580999680000E+19_dp, 0.63326598707628506250E+19_dp, 0.46620662575398912000E+20_dp,&
 0.22164309547669977187E+21_dp, 0.16783438527143608320E+22_dp, 0.82007945326378915594E+22_dp,&
 0.63777066403145711616E+23_dp, 0.31983098677287777082E+24_dp, 0.25510826561258284646E+25_dp,&
 0.13113070457687988603E+26_dp, 0.10714547155728479551E+27_dp, 0.56386202968058350995E+27_dp,&
 0.47144007485205310027E+28_dp, 0.25373791335626257948E+29_dp, 0.21686243443194442612E+30_dp,&
 0.11925681927744341235E+31_dp, 0.10409396852733332454E+32_dp, 0.58435841445947272053E+32_dp,&
 0.52046984263666662269E+33_dp, 0.29802279137433108747E+34_dp, 0.27064431817106664380E+35_dp,&
 0.15795207942839547636E+36_dp, 0.14614793181237598765E+37_dp, 0.86873643685617511998E+37_dp,&
 0.81842841814930553085E+38_dp, 0.49517976900801981839E+39_dp, 0.47468848252659720789E+40_dp,&
 0.29215606371473169285E+41_dp, 0.28481308951595832474E+42_dp, 0.17821519886598633264E+43_dp/)
CONTAINS
  SUBROUTINE whittaker_c0 ( wc, r, expa, erfa, alpha, l, n )
    INTEGER, INTENT(IN)                      :: n, l
    REAL(KIND=dp), INTENT(IN)                :: alpha
    REAL(KIND=dp), DIMENSION(n)              :: erfa, expa, r, wc
    INTEGER                                  :: i, k
    REAL(dp) :: t1,x
    SELECT CASE (l)
      CASE DEFAULT
        DO i = 1, n
          DO k = 0, l/2
            wc(i) = wc(i) + expa(i)*x**(2*k+1)*t1**(2*k+3)*&
                    dfac(l+1)/dfac(2*k+1)*2**(k+1)
          END DO
        END DO
    END SELECT
  END SUBROUTINE whittaker_c0
END MODULE whittaker