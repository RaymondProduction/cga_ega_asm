program SaveASCIItoFileTurboPascal7;
uses Graph, Crt;

var
  Gd, Gm: Integer;
  F: Text;
  x, y, i, j, xs, ys: Integer;
  pixel: Byte;
  binaryStr: string;
  symbol: Char;

{ Процедура для запису символу у файл у вигляді бінарних рядків }
procedure SaveSymbolToFile(asciiCode: Integer; binaryData: array of string);
var
  k: Integer;
begin
  WriteLn(F, '    ; Символ ', asciiCode, ': ', symbol);  { Записуємо код символу та його представлення }
  for k := 0 to 7 do
    WriteLn(F, '    db ', binaryData[k], 'b');  { Записуємо кожен бінарний рядок }
  WriteLn(F);
end;

{ Процедура для зчитування пікселів символу та їх перетворення у бінарний формат }
procedure GetSymbolPixels(asciiCode: Integer; xss: Integer; yss: Integer);
var
  binaryData: array[0..7] of string;
  pixelValue: Integer;
  asciiCodeStr: String;
  ii: Integer;
begin
  symbol := Chr(asciiCode);  { Перетворюємо код ASCII у символ }
  Str(asciiCode, asciiCodeStr);  { Перетворюємо код символу у рядок для виведення }
  
  { Виводимо код символу у верхньому лівому куті екрану }
  SetColor(15);
  OutTextXY(0, 0, asciiCodeStr);
  
  { Встановлюємо стиль тексту та виводимо символ на позицію (xss, yss) }
  SetTextStyle(DefaultFont, 0, 1);
  OutTextXY(xss, yss, symbol);

  { Очищаємо масив для зберігання бінарних рядків }
  for ii := 0 to 7 do
    binaryData[ii] := '';

  { Зчитуємо пікселі з області 8x8 навколо символу та будуємо бінарний рядок }
  for y := 0 to 7 do
  begin
    for x := 0 to 7 do
    begin
      pixelValue := GetPixel(xss + x, yss + y);  { Зчитуємо значення пікселя }
      if pixelValue > 0 then
        binaryData[y] := binaryData[y] + '1'  { Записуємо '1', якщо піксель активний }
      else
        binaryData[y] := binaryData[y] + '0';  { Записуємо '0', якщо піксель неактивний }
    end;
  end;

  { Записуємо зчитані бінарні дані у файл }
  SaveSymbolToFile(asciiCode, binaryData);

  { Очищаємо екран від коду символу }
  SetColor(0);
  OutTextXY(0, 0, asciiCodeStr);
end;

begin
  { Ініціалізація графічного режиму для EGA/VGA }
  Gd := Detect;
  InitGraph(Gd, Gm, '');  { Вказуємо шлях до драйверів графіки, якщо необхідно }

  if GraphResult <> grOk then
  begin
    WriteLn('Graphics error: ', GraphErrorMsg(GraphResult));
    Halt(1);
  end;

  { Відкриваємо файл для запису }
  Assign(F, 'cp866.asm');
  Rewrite(F);
  
  xs := 0;  { Початкова координата x для виведення символу }
  ys := 20; { Початкова координата y для виведення символу }

  { Проходимо всі ASCII символи від 0 до 255 }
  for i := 0 to 255 do
  begin
    GetSymbolPixels(i, xs, ys);  { Обробляємо кожен символ і зчитуємо його пікселі }
    
    xs := xs + 8;  { Переміщаємося на наступну позицію по осі x }
    if xs + 8 > 640 then  { Якщо досягли кінця екрану по осі x, переносимо на наступний рядок }
    begin
      xs := 0;
      ys := ys + 8;
    end;
  end;

  ReadLn;  { Очікуємо натискання клавіші перед завершенням }
  
  { Закриваємо файл і графічний режим }
  Close(F);
  CloseGraph;
end.
