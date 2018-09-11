result = 0
flag = 0
add = 1
n = int(input())
for i in range(n):
    if flag == 2:
        add += 1
        result += add
        flag = 1
    else:
        result += add
        flag += 1

list_ = []
for i in range(result):
    list_.append(i+1)

res = []
for i in range(n):
    res.append([])

for j in range(n):
    while len(res[j]) <= j:
        if j%2 != 0:
            res[j].append(" ")
            res[j].append(str(list_.pop(0)))
        else:
            res[j].append(str(list_.pop(0)))
            res[j].append(" ")
    if j%2 == 0:
        res[j].pop(-1)

num_spaces = 2 * (len(''.join(res[-1])) + 1)

for i in range(n):
    print(''.join(res[i]), end='')
    print(' ' * (num_spaces - 2*len(''.join(res[i]))), end='')
    res[i].reverse()
    print(''.join(res[i]))
