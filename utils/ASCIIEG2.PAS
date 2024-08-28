program SaveASCIItoFileTurboPascal7;
uses Graph, Crt;

var
  Gd, Gm: Integer;
  F: Text;
  x, y, i, j, xs, ys: Integer;
  pixel: Byte;
  binaryStr: string;
  symbol: Char;

{ Процедура для запису символу у файл у вигляд? б?нарних рядк?в }
procedure SaveSymbolToFile(asciiCode: Integer; binaryData: array of string);
var
  k: Integer;
begin
  WriteLn(F, '    ; Символ ', asciiCode, ': ', symbol);  { Записуємо код символу та його представлення }
  for k := 0 to 7 do
    WriteLn(F, '    db ', binaryData[k], 'b');  { Записуємо кожен б?нарний рядок }
  WriteLn(F);
end;

{ Процедура для зчитування п?ксел?в символу та їх перетворення у б?нарний формат }
procedure GetSymbolPixels(asciiCode: Integer; xss: Integer; yss: Integer);
var
  binaryData: array[0..7] of string;
  pixelValue: Integer;
  asciiCodeStr: String;
  ii: Integer;
begin
  symbol := Chr(asciiCode);  { Перетворюємо код ASCII у символ }
  Str(asciiCode, asciiCodeStr);  { Перетворюємо код символу у рядок для виведення }
  
  { Виводимо код символу у верхньому л?вому кут? екрану }
  SetColor(15);
  OutTextXY(0, 0, asciiCodeStr);
  
  { Встановлюємо стиль тексту та виводимо символ на позиц?ю (xss, yss) }
  SetTextStyle(DefaultFont, 0, 1);
  OutTextXY(xss, yss, symbol);

  { Очищаємо масив для збер?гання б?нарних рядк?в }
  for ii := 0 to 7 do
    binaryData[ii] := '';

  { Зчитуємо п?ксел? з област? 8x8 навколо символу та будуємо б?нарний рядок }
  for y := 0 to 7 do
  begin
    for x := 0 to 7 do
    begin
      pixelValue := GetPixel(xss + x, yss + y);  { Зчитуємо значення п?кселя }
      if pixelValue > 0 then
        binaryData[y] := binaryData[y] + '1'  { Записуємо '1', якщо п?ксель активний }
      else
        binaryData[y] := binaryData[y] + '0';  { Записуємо '0', якщо п?ксель неактивний }
    end;
  end;

  { Записуємо зчитан? б?нарн? дан? у файл }
  SaveSymbolToFile(asciiCode, binaryData);

  { Очищаємо екран в?д коду символу }
  SetColor(0);
  OutTextXY(0, 0, asciiCodeStr);
end;

begin
  { ?н?ц?ал?зац?я граф?чного режиму для EGA/VGA }
  Gd := Detect;
  InitGraph(Gd, Gm, '');  { Вказуємо шлях до драйвер?в граф?ки, якщо необх?дно }

  if GraphResult <> grOk then
  begin
    WriteLn('Graphics error: ', GraphErrorMsg(GraphResult));
    Halt(1);
  end;

  { В?дкриваємо файл для запису }
  Assign(F, 'cp866.asm');
  Rewrite(F);
  
  xs := 0;  { Початкова координата x для виведення символу }
  ys := 20; { Початкова координата y для виведення символу }

  { Проходимо вс? ASCII символи в?д 0 до 255 }
  for i := 0 to 255 do
  begin
    GetSymbolPixels(i, xs, ys);  { Обробляємо кожен символ ? зчитуємо його п?ксел? }
    
    xs := xs + 8;  { Перем?щаємося на наступну позиц?ю по ос? x }
    if xs + 8 > 640 then  { Якщо досягли к?нця екрану по ос? x, переносимо на наступний рядок }
    begin
      xs := 0;
      ys := ys + 8;
    end;
  end;

  ReadLn;  { Оч?куємо натискання клав?ш? перед завершенням }
  
  { Закриваємо файл ? граф?чний режим }
  Close(F);
  CloseGraph;
end.
