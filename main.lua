local Shop = {}


    Shop.q = "What do you wish to buy?"
    
    Shop[1] = {}
        Shop[1][name] = "sword"
        Shop[1][stuff] = {}
            Shop[1][stuff][1] = {
             name = "Bronze Sword",
             cost = 15,
             power = 5
            } 
            Shop[1][stuff][2] = {
            name = "Silver Sword",
            cost = 30,
            power = 10
            }
            
        Shop[2][name] = "armor"
        Shop[2][stuff] = {}
            Shop[2][stuff][1] = {
            name = "Bronze Armor",
            cost = 20,
            life = 15
            }
            Shop[2][stuff][2] = {
            name = "Silver Armor",
            cost = 40,
            life = 30
            }


printscreen = function(s)
        
        local i = 1
        print(s.q)
        while i<=#s do
            print(i.." - "..s[i][name])
            i = i+1
        end
        
        print(1+#s.." - Return")
        
        local action = tonumber(io.read())
        if action <=#s and action>0 then
            action = valid
        end
        
        if action ~= valid then
            print("Select a valid action!")
        end
        
        while action == valid do
           print("Valid action! ^--^") 
        end
        
end --printscreen

printscreen(Shop)
