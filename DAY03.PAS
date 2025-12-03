program day03;

var
  f: text;
  c: char;
  i: integer;
  d: integer;
  cur: integer;
  first: integer;
  second: integer;
  p: integer;
  n: integer;
  ans: integer;

begin
  assign(f, ParamStr(1));
  reset(f);

  ans := 0;

  while not EOF(f) do
  begin
    c := #0;

    cur := 0;
    first := 0;
    second := 0;
    p := 0;

    repeat
      read(f, c);
      if ord(c) <> 10 then
      begin
        n := ord(c) - 48;
	if (cur = 0) and (first = 0) then
	  first := n
	else
	begin
	  if p > 0 then
	  begin
	    first := p;
	    second := n;
	    cur := first*10 + second;
	    p := 0;
	  end;

	  if n > first then
	    p := n;

	  if n > second then
	  begin
	    second := n;
	    cur := first*10 + second;
	  end;
	end;
      end;
    until (ord(c) = 10) or eof(f);
    Inc(ans, cur);
    writeln(cur);
    writeln;
  end;

  close(f);

  writeln('done - ', ans); (* 17092 *)
  readln;
end.
