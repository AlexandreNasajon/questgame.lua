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
      else
        print("comprou "..screen[action].name)
        return printscreen(screen)
      end
  else
      print("Select a valid action!")
      return printscreen(screen)
  end
end

return printscreen
