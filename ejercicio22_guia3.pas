(*A partir de un archivo de texto que contiene palabras separadas entre sí por uno o más blancos
desarrollar un programa para:
a) Mostrar la palabra con más cantidad de vocales del texto.
b) Grabar en un texto de salida las palabras con más de cuatro letras pero escritas al revés.
c) Contar cuántas son palíndromas (capicúas). *)

program ej22;
var
    archE, archS :text;
    cantvoc,maxvoc,cantlet,i, aux,capi:byte;
    car:char;
    palabra, maxpalabra : string[15];
    capibol: boolean;

begin
assign(archE,'ejercicio22.txt');
reset (archE);
assign (archS,'ejercicio22sal.txt');
rewrite (archS);
cantvoc := 0;
maxvoc := 0;
cantlet := 0;
palabra := '';
capi := 0;
read(archE,car);
while not eof(archE) do
    begin
        while (not eof(archE)) and (car <> ' ') do
            begin
                car := upcase(car);
                if (car = 'A') or (car = 'E') or (car='I') or (car = 'O') or (car = 'U') then
                     begin
                        cantvoc := cantvoc + 1;   
                    end;
                palabra := palabra + car;
                cantlet := cantlet + 1;
                read(archE,car);
            end;
        
        if eof(archE) then
            begin
                car := upcase(car);
                palabra:= palabra + car;
                cantlet := cantlet + 1;
            end; 
        if cantvoc > maxvoc then
            begin
            maxvoc := cantvoc;
            maxpalabra := palabra;
            end;
        if cantlet > 4 then
        begin
                for i := cantlet downto 1 do
                    begin
                        write(archS, palabra[i])
                    end;
                writeln(archS);    
        end;
        
        capibol:= False;
        aux:= 1;
        if cantlet > 2 then
            begin
                capibol:= True;
                if (cantlet mod 2) = 0 then
                    begin
                        while (aux + 1) <> cantlet do
                            begin
                                if palabra[aux] <> palabra[cantlet] then
                                    capibol:= False;

                                aux:= aux + 1;
                                cantlet:= cantlet - 1;  
                            end;
                    end
                else
                    begin
                        while aux <> cantlet do
                            begin
                                if palabra[aux] <> palabra[cantlet] then
                                    capibol:= False;

                                aux:= aux + 1;
                                cantlet:= cantlet - 1;    
                            end;

                    end;        
            end;
        
        
        if capibol then
            capi:= capi + 1;

        cantlet:= 0;
        cantvoc := 0;
        palabra := '';
        read(archE,car);
    end;
close(archE);
close(archS);
writeln('la palabra con mayor cantidad de vocales es: ',maxpalabra );
writeln(capi);
readln();    
end.