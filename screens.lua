local Items = require("Items")

local Screens = {}


Screens.Swords = {Items.bronze_sword,Items.silver_sword} 
Screens.Swords.name = "swords"
Screens.Swords.question = "It is a dangerous world..."


Screens.Armors = {Items.bronze_armor,Items.silver_armor}   
Screens.Armors.name = "armors"
Screens.Armors.question = "Protect yourself!"

Screens.Shop = {Screens.Swords,Screens.Armors} 
Screens.Armors.parent = Screens.Shop
Screens.Swords.parent = Screens.Shop
Screens.Shop.question = "What do you wish to buy?"  
Screens.Shop.parent = nil

return Screens
