'''Stemming'''
# import Sastrawi library 
from Sastrawi.Stemmer.StemmerFactory import StemmerFactory

# create stemmer
factory = StemmerFactory()
stemmer = factory.create_stemmer()

# stem
sentence = "Perekonomian Indonesia sedang dalam pertumbuhan yang membanggakan dan baik-baik saja, meniru-nirukannya."
output   = stemmer.stem(sentence)

print(output)
# ekonomi indonesia sedang dalam tumbuh yang bangga dan baik saja tiru balas