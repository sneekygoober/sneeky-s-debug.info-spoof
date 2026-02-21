return function(sValue: string, sLine: number)
  local old; old = hookfunction(debug.info, function(...)
      local args = {...};
      local r = {old(...)};
      
      local _ = args[#args];
      
      if type(_) == "string" then
          local sidx = _:find("s", 1);
          if sidx then
              local src = r[sidx]
              if src == "[C]" or src == "" then
                  r[sidx] = sValue;
              end;
          end;
          
          local lidx = _:find("l", 1);
          if lidx then
              local line = r[lidx]
              if line == -1 then;
                  r[lidx] = sLine;
              end;
          end;
      end;
      
      return unpack(r);
  end);
end;
