local Player = require("Player")
local Screens = require("Screens")
local Items = require("Items")
local Enemies = require("Enemies")
local Functions = {}

--BUY---------------
buy = function(item)
    if Player.gold >= item.cost then
        Player.Pack = item --coloca o item no pack
        Player.gold = Player.gold - item.cost --reduz o gold do player
        print("You got a "..item.name.."!")
    else
        print("You don't have enough gold!")
    end
end

Functions.buy = buy

--PRINTSCREEN----------------------------------------
printscreen = function(screen)
  print(screen.question)
  print("0 - Return")
  for chave, valor in ipairs(screen) do
    print(chave.." - "..valor.name)
  end
  local action = tonumber(io.read())
  if action <= #screen and action >= 0 then
      print("Valid action! ^--^") 
      if action == 0 then
        if screen.parent then
          return printscreen(screen.parent)
        else -- primeira tela
          print("Bye")
          return        
        end
        
      end
      if screen[action].question then 
        return printscreen(screen[action])
      elseif screen[action] == Screens.Shop.Armors or screen[action] == Screens.Shop.Swords then
        buy(screen[action])
        return printscreen(screen)
      end
  else
      print("Select a valid action!")
      return printscreen(screen)
  end
end

Functions.printscreen = printscreen


--GAME-----------------------------------------------
game = function()
    print("What's your name?")
    Player.name = io.read()
    print("Hello, "..Player.name.."!")
    printscreen(Screens.Inicial)
end

Functions.game = game

return Functions
