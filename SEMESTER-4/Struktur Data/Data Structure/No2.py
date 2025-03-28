
lis = []
# a = inp.split()
# for i in a:
#     lis.append(i[0])
# print(a)
# print(lis)
def inisial(a):
    a = inp.split()
    for i in a:
        lis.append(i[0])
    x = ''.join(lis)
    x= x.upper()
    print(x)


inp = input('Masukkan nama lengkap: ')
a = inisial(inp)


