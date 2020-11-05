import numpy as np

def DayOfMonth(D,hour,minute,second):
    return D + (hour/24.) + (minute/1440.) + (second / 86400.)

def IsJulianDate(Y,M,D):
    if(Y >1582):
        return False
    if(Y <1582):
        return True
    if(M > 10):
        return False
    if(M < 10):
        return True
    if(D > 14):
        return False

    return False

def greg2jul(Y,M,D,hour,minute,second):

    B = 0

    if(M<=2):
        Y = Y - 1
        M = M + 12

    if(not(IsJulianDate(Y,M,D))):
        A = Y//100
        B = 2 - A + (A//4)

    JD = int(365.25*(Y+4716))+int(30.6001*(M+1))+ DayOfMonth(D,hour,minute,second) + B -1524.5

    return JD

def jul2greg(JD):
    Q = JD + 0.5
    Z = int(Q)
    W = int((Z-1867216.25)/36524.25)
    X = W//4
    A = Z+1+W-X
    B = A+1524
    C = (B-122.1)//365.25
    D = int(365.25*C)
    E = (B-D)//30.6001
    F = int(30.6001*E)
    day = B-D-F+(Q-Z)
    if(E<12):
        month = E - 13
    else:
        month = E - 1
    if(month<=2):
        year = C - 4715
    else:
        year = C - 4716
    return year,month,day

JD = greg2jul(2056,12,2,12,0,0)
print(JD)
print(jul2greg(JD))
