import numpy as np
L = 5
a = np.arange(-L, L+1)
for i in range(L):
    value = a[0]
    a = np.delete(a, 0)
    if i == 0:
        a = np.append(a, value)
    else:
        a = np.insert(a, -i*2, value)
print(a[[10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]])

a =31+\
55+\
54+\
83+\
132+\
3+\
96+\
111+\
119+\
111+\
105+\
56+\
32.5+\
85+\
124+\
32+\
61+\
84+\
170+\
136
print(a/20)