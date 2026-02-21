return function(sValue: string, sLine: number)
  local old; old = hookfunction(debug.info, newcclosure(function(...)
      local args = {...};
      local r = {old(...)};
      
      local _ = args[#args];
      
      if type(_) == "string" then
          local sidx = _:find("s", 1);
          if sidx then
              local s = r[sidx];
              if s == "[C]" or s == "" then
                  r[sidx] = sValue;
              end;
          end;
          
          local lidx = _:find("l", 1);
          if lidx then
              local l = r[lidx];
              if l == -1 then
                  r[lidx] = sLine;
              end;
          end;
      end;
      
      return unpack(r);
  end));
end;
