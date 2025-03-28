inp = int(input("Masukkan jumlah tiket yang ingin dibeli: "))
print("1. 2D Reguler (Rp 35,000)")
print("2. 3D (Rp 45,000)")

mem_1=35000
mem_2=45000

inp_kat= int(input("Masukkan kategori studio (1/2): "))
inp_mem= input("Apakah ada membership (Y/N): ")
inp_mem=inp_mem.upper()

if inp_kat ==1:
    harga = mem_1* inp
    print(f'Harga Per Tiket : Rp {mem_1}')
    if inp_mem == 'y':
        kurang = harga*15/100
        diskon = harga - kurang
        print(f'Membership mendapatkan diskon sebesar 15%')
        print(f'Total Harga sebelum Diskon : Rp {harga}')
        print(f'Diskon : Rp {kurang}')
        print(f'Total Bayar Setelah Diskon : Rp {diskon}')
    else:
        no_disk='Pelanggan tidak memiliki membership, tidak mendapatkan diskon'
        print(no_disk)
        print(f'Total Harga  : Rp {harga}')
        
else:
    harga = mem_2* inp
    print(f'Harga Per Tiket : Rp {mem_2}')
    if inp_mem == 'y':
        kurang = harga*15/100
        diskon = harga - kurang
        print(f'Membership mendapatkan diskon sebesar 15%')
        print(f'Total Harga sebelum Diskon : Rp {harga}')
        print(f'Diskon : Rp {kurang}')
        print(f'Total Bayar Setelah Diskon : Rp {diskon}')
    else:
        no_disk='Pelanggan tidak memiliki membership, tidak mendapatkan diskon'
        print(no_disk)
        print(f'Total Harga  : Rp {harga}')

# print(f'Harga Per Tiket : Rp {mem1}')
# print(f'Membership mendapatkan diskon sebesar 15%')
# print(f'Total Harga sebelum Diskon : Rp {harga}')
# print(f'Diskon : Rp {kurang}')
# print(f'Total Bayar Setelah Diskon : Rp {diskon}')
 