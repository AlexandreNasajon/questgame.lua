local Player = require("Player")
local Screens = require("Screens")
local Items = require("Items")
local Enemies = require("Enemies")
local Functions = {}

--BUY---------------
Functions.buy = function(item)
    if Player.gold >= item.cost then
        Screens.Pack[1+#Screens.Pack] = item --coloca o item no pack/nao tá funfando
        Player.gold = Player.gold - item.cost --reduz o gold do player/tá funfado
        print("You got a "..item.name.."!")
        print("You have "..Player.gold.." gold.")
    else
        print("You don't have enough gold!")
    end
end

Functions.printstats = function(p)
    print(p.name,"Life: "..p.life,"Power: "..p.power,"Gold: "..p.gold)
end

--PRINTSCREEN----------------------------------------
local printscreen
printscreen = function(screen)
  Functions.printstats(Player)
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
      else
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
Functions.game = function()
    print("What's your name?")
    Player.name = io.read()
    print("Hello, "..Player.name.."!")
    printscreen(Screens.Inicial)
end

return Functions
