program day04;

type
   TGrid = array[1..137] of Array[1..137] of Boolean;

var
  f: text;
  i: integer;
  j: integer;
  grid: TGrid;
  c: char;
  ans: integer;
  count: integer;
  r: integer;
  cl: integer;
  oans: integer;

begin
  assign(f, ParamStr(1));
  reset(f);

  i := 1;
  j := 1;
  oans := 0;

  while not eof(f) do
  begin
    repeat
      read(f, c);
      if ord(c) <> 10 then
      begin
        if c = '.' then
          grid[i, j] := false
        else
          grid[i, j] := true;
        Inc(j);
      end;
    until (ord(c) = 10) or eof(f);

    Inc(i);
    j := 1;
  end;
  close(f);

  r := 137;
  cl := 137;

  repeat
    ans := 0;
    for i := 1 to r do
    begin
      for j := 1 to cl do
      begin
        if grid[i, j] = true then
        begin
          count := 0;
          if (i > 1) and (grid[i - 1, j] = true) then
            Inc(count);
          if (i > 1) and (j > 1) and (grid[i - 1, j - 1] = true) then
            Inc(count);
          if (i > 1) and (j < cl) and (grid[i - 1, j + 1] = true) then
            Inc(count);
          if (j > 1) and (grid[i, j - 1] = true) then
            Inc(count);
          if (j < cl) and (grid[i, j + 1] = true) then
            Inc(count);
          if (i < r) and (grid[i + 1, j] = true) then
            Inc(count);
          if (i < r) and (j > 1) and (grid[i + 1, j - 1] = true) then
            Inc(count);
          if (i < r) and (j < cl) and (grid[i + 1, j + 1] = true) then
            Inc(count);
          if count < 4 then
          begin
            grid[i, j] := false;
            Inc(ans);
          end;
        end;
      end;
    end;
    Inc(oans, ans);
  until ans = 0;

  writeln('done - ', oans);
  readln;
end.

