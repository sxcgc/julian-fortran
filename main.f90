       program main
           implicit none
           real*8 jdn
           real*8 time2julian,temp
           integer*8 julian2time
           external time2julian,julian2time
       
           temp = time2julian(2000,2,29,12,0,5)
           write(*,*)"2000-02-29-12-00-05", temp,julian2time(temp)
           temp = time2julian(2001,2,29,12,0,5)
           write(*,*)"2001-02-29-12-00-05", temp,julian2time(temp)
       end program main

