       real*8 function time2julian(year,month,day,hour,minute,second)
           implicit none
           integer year,month,day,hour,minute,second
           real*8 y,m,d,h,mn,s
           real*8 jdn,jd
           y = year
           m = month
           d = day
           h = hour
           mn = minute
           s = second
! algorithm is from wiki english version, division is integer division
! jdn = 367*y-(7*(y+5001+(m-9)/7))/4+(275*m)/9 + d +1729777
! todo: the result of this algorithm have a offset about 13 with the
! normal version. But result of inversion(julian2time) is same with the input.
! for example   : 2000-01-01 12:00:00              
! this algorithm:   2451558
! wiki result   :   2451545

           jdn=367*y-int((7*(y+5001+int((m-9)/7)))/4)+int((275*m)/9)+d+1729777
           jd = jdn + (h-12.)/24. + mn/1440. + s/86400.
           time2julian = jd
      end function

      integer*8 function julian2time(jd)
          implicit none
          real*8 jd
          integer*8 time
          integer tInDay
          integer ::y=4716,j=1401,m=2,n=12,r=4,&
            p=1461,v=3,u=5,s=153,w=2,b=247277,c=-38
          integer f,e,g,h,day,month,year,hour,minute,second,JJ
          JJ = floor(jd+0.5)
          f = JJ+j
          e = r*f+v
          g = mod(e,p)/r
          h = u*g+w
          day = mod(h,s)/u + 1
          month = mod(h/s + m,n)+1
          year = (e/p)-y + (n+m-month)/n
!         write(*,*) jd,JJ
          tInDay = floor((jd-JJ)*86400+43200+0.5)
          second = mod(tInDay,60)
          minute = mod((tInDay-second)/60,60)
          hour = mod((tInDay-second-minute*60)/3600,24)
!          write(*,*) year,month,day,hour,minute,second
          !write(*,*) year*1D8+month*1d6+day*1d4+hour*1d2+minute
          time =  year*1D10+month*1d8+day*1d6+hour*1d4+minute*1d2+second
          
      end function
