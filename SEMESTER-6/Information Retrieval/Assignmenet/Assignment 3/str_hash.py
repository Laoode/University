class SimpleHashTable:  
    def __init__(self, size):  
        self.size = size  
        self.table = [None] * size  

    def hash_function(self, key):  
        # Mengkonversi string menjadi integer berdasarkan nilai ASCII  
        key_int = sum(ord(char) for char in key)  # Menggunakan nilai ASCII  
        return key_int % self.size  # Hitung indeks  

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
hash_table = SimpleHashTable(10)  

# Menambahkan data dengan kunci string  
hash_table.insert("Alice", "Data Alice")  
hash_table.insert("Bob", "Data Bob")  
hash_table.insert("Charlie", "Data Charlie")  

# Menampilkan hash table  
hash_table.display()  

# Mencari data berdasarkan kunci string  
print(f"Mencari data untuk 'Bob': {hash_table.search('Bob')}")  