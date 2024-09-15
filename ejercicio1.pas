program ej1;

var
    arch : text;
    i,y,cantrond,valor1,valor2, totmenor, totmenor10,es10:byte;
    nombre : string[10];
    puntaje : word;
    

begin
    writeln('ingrese un valor y');
    readln(y);
    assign(arch,'ejercicio.txt');
    reset(arch);
    totmenor := 0;
    totmenor10 := 0;
    while not eof(arch) do
    begin
        puntaje := 0;
        es10 := 0;
        readln(arch,cantrond);
        readln(arch,nombre);
        for i:= 1 to cantrond do
        begin
            read(arch,valor1);
            readln(arch,valor2);

            if valor1 = valor2 then
                puntaje := puntaje + (valor1 + valor2)*3
            else if (valor1 = (valor2 + 1)) or (valor1 = (valor2 -1)) then
                puntaje := puntaje + (valor1 + valor2)*2
            else 
                puntaje := puntaje + ( valor1 + valor2);

            if (valor1 = 10) or (valor2 = 10) then
                es10 := es10 + 1;  
            
        end;    
        writeln('el puntaje obtenido por el jugador', nombre, ' es:', puntaje);                   
        if puntaje < y then
            begin
                if es10 <> 0 then
                     writeln('el porcentajee s:', (es10/cantrond)*100:3:0,'%') 
                else
                    writeln('el porcentaje es 0%');        
            end;


    end;
    close(arch);
end.
