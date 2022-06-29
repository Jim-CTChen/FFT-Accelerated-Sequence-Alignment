a = [[0, 30], [30, 60], [45, 75], [75, 105], [111, 141]]
a = [[0, 30], [15, 45], [30, 60], [45, 75], [75, 105], [111, 141]]
a = [[1, 31], [12, 42], [13, 43], [31, 61], [61, 91]]
print(a)
i = 0
for i in range(len(a)-1):
    j = i+1
    while j < len(a):
        print(f'(i, j): ({i}, {j})')
        print(f'a: {a}')
        if a[i][1] == a[j][0]: # combine
            a[i][1] = a[j][1]
            del a[j]
        else: j += 1
print(a)

print(a)