program day01;

var
  f: text;
  c: char;
  s: string;
  num: integer;
  d: integer;
  dir: integer;
  dial: integer;
  ans1: integer;
  ans2: integer;
  i: integer;

begin
  assign(f, ParamStr(1));
  reset(f);

  dial := 50;
  ans1 := 0;
  ans2 := 0;

  while not EOF(f) do
  begin
    c := #0;
    s := '';

    while (ord(c) <> 10) and (not EOF(f)) do
    begin
      read(f, c);
      s := concat(s, c);
    end;
    delete(s, length(s), 1);

    val(copy(s, 2, length(s) - 1), num, d);

    if pos('L', s) = 1 then
      dir := 1
    else
      dir := -1;
    for i := 1 to num do
      begin
        dial := (dial + dir) mod 100;
        if dial = 0 then
          ans2 := ans2 + 1;
      end;
    if dial = 0 then
      Inc(ans1);
  end;

  close(f);

  writeln(ans1);
  writeln(ans2);
  readln;
end.
