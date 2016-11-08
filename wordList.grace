import "random" as random
//
// wordList object.  Exports mathod atRandom that returns 
//
def words = list [
    "Apple", "Apricot", "Avocado", "Banana", "Bilberry", "Blackberry", 
    "Blackcurrant", "Blueberry", "Boysenberry", "Cantaloupe", "Currant", "Cherry", 
    "Cherimoya", "Cloudberry", "Coconut", "Cranberry", "Damson", "Date", 
    "Dragonfruit", "Durian", "Elderberry", "Feijoa", "Fig", "Grapefruit", "Guava", 
    "Huckleberry", "Jackfruit", "Kiwi", "Kumquat", "Lemon", "Lime", "Loquat", 
    "Lychee", "Mango", "Marionberry", "Melon", "Cantaloupe", "Honeydew", 
    "Watermelon", "Mulberry", "Nectarine", "Olive", "Orange", "Clementine", 
    "Mandarine", "Tangerine", "Papaya", "PawPaw", "Passionfruit", "Peach", "Pear", 
    "Persimmon", "Physalis", "Plum", "Pineapple", "Pomegranate", "Pomelo", 
    "Mangosteen", "Quince", "Raspberry", "Salmonberry", "Raspberry", 
    "Rambutan", "Redcurrant", "Satsuma", "Starfruit", "Strawberry", "Tangelo", 
    "Tamarillo", "Thimbleberry", "Tomato", "Wampee", "Watermelon", "Wineberry", 
    "Yuzu"
]

method atRandom -> String {
  // returns one of the known words, chosen at random.
  def index = random.integerIn 1 to (words.size)
  words.at(index)
}
