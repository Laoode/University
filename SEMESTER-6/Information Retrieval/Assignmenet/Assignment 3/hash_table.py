class HashTable:  
    def __init__(self, size):  
        self.size = size  
        self.table = [None] * size  

    def hash_function(self, key):  
        return key % self.size  

    def insert(self, key, value):  
        index = self.hash_function(key)  
        self.table[index] = value  

    def search(self, key):  
        index = self.hash_function(key)  
        return self.table[index]  

    def display(self):  
        for index, value in enumerate(self.table):  
            print(f"Index {index}: {value}")  

# Contoh penggunaan  
hash_table = HashTable(10)  # Membuat hash table dengan ukuran 10  

# Menambahkan data (misalnya NIP)  
hash_table.insert(12345, "Pegawai A")  # NIP 12345  
hash_table.insert(67890, "Pegawai B")  # NIP 67890  
hash_table.insert(13579, "Pegawai C")  # NIP 13579  

# Menampilkan hash table  
hash_table.display()  

# Mencari data berdasarkan NIP  
nip_to_search = 67890  
print(f"Mencari pegawai dengan NIP {nip_to_search}: {hash_table.search(nip_to_search)}")  