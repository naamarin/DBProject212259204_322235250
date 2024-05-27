import random

# List of unique meal names without spaces (ensure there are at least 400 unique names)
meal_names = [
    "Schnitzel", "Pizza", "Burger", "Pasta", "Salad", "Soup", "Steak", "Tacos",
    "Sandwich", "Curry", "Burrito", "Sushi", "Ramen", "Paella", "Quiche",
    "Kebab", "Falafel", "DimSum", "Goulash", "Risotto", "ChowMein", "Pho",
    "Dumplings", "Lasagna", "Pierogi", "Crepes", "Fajitas", "HotDog", "Shawarma",
    "Ceviche", "Empanadas", "Moussaka", "Enchiladas", "Bruschetta", "Biryani",
    "Jambalaya", "Omelette", "Tapas", "Tagine", "Ratatouille", "Chili", "FriedRice",
    "Gumbo", "ClamChowder", "BakedBeans", "Macaroni", "PotRoast", "Bangers",
    "BeefStew", "Cassoulet", "Chowder", "FishTacos", "Lobster", "Meatloaf", "Polenta",
    "ShepherdsPie", "TunaSalad", "WaldorfSalad", "ChickenWings", "ChiliDog",
    "CrabCakes", "EggRoll", "FishandChips", "FrenchToast", "HushPuppies",
    "JalapenoPoppers", "PekingDuck", "StuffedPeppers", "TeriyakiChicken",
    "TortillaSoup", "TurkeySandwich", "VeggieBurger", "BBQRibs", "ChickenParm",
    "Cornbread", "GrilledCheese", "LambChops", "MashedPotatoes", "Meatballs",
    "Nachos", "Oysters", "Pancakes", "PulledPork", "Quesadilla", "Ravioli",
    "RedBeans", "Salmon", "ShrimpCocktail", "SloppyJoes", "Spaghetti", "Tofu",
    "ZucchiniBread", "Arancini", "BabaGanoush", "Bibimbap", "Calzone", "Carbonara",
    "Chimichanga", "ChowMein", "CoqauVin", "DuckConfit", "EggsBenedict", "Fajitas",
    "FishCurry", "Frittata", "Gazpacho", "Gnocchi", "Gravlax", "HuevosRancheros",
    "Kimchi", "Laksa", "MakiRoll", "Mole", "Moussaka", "NasiGoreng", "Onigiri",
    "PadThai", "Pastrami", "PatatasBravas", "PolloAsado", "Porchetta", "Poutine",
    "Ratatouille", "Roti", "Satay", "ScotchEgg", "Shakshuka", "Souvlaki", "Spanakopita",
    "StuffedCabbage", "Sukiyaki", "SurfandTurf", "TandooriChicken", "TarteTatin",
    "Tempura", "Tiramisu", "TomYum", "TunaMelt", "Vichyssoise", "Vindaloo", "WontonSoup"
]

# Shuffle the meal names to randomize them
random.shuffle(meal_names)


data = []
for i in range(len(meal_names)):
    random_number = random.randint(111, 999)
    meal_name = meal_names[i]
    random_price = random.randint(15, 150)
    data.append(f"{random_number},{meal_name},{random_price}")

# Write data to a text file
with open("meal_data.txt", "w") as file:
    for line in data:
        file.write(line + "\n")

print("lines of data have been written to meal_data.txt")
