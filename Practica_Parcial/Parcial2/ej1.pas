Program ej1;

const
    valor_alto = 9999;

type
    excursion_type = record
        codigo: integer;
        nombre: string;
        descripcion: string;
        total: integer;
    end;

    maestro_type = file of excursion_type;



procedure leer(var archivo: text; var excursion: excursion_type);
begin
    if (not eof(archivo)) then begin
        readln(archivo, excursion.codigo);
        readln(archivo, excursion.nombre);
        readln(archivo, excursion.descripcion);
        readln(archivo, excursion.total)
    end
    else
        excursion.codigo := valor_alto;
end;

procedure text_a_bin(var fuente: text; var maestro: maestro_type);
var
    act, ant: excursion_type;
begin
    reset(fuente); rewrite(maestro);
    leer(fuente, act);

    while(act.codigo <> valor_alto)do begin
        ant := act;
        leer(fuente, act);

        while((act.codigo <> valor_alto) and (ant.codigo = act.codigo))do begin
            ant.total := ant.total + act.total;
            leer(fuente, act);
        end;
        Write(maestro, ant);
    end;

    close(fuente); close(maestro);
end;


var
    fuente: text;
    maestro: maestro_type;
    excursion: excursion_type;
begin
    Assign(fuente, 'excursiones.txt');
    Assign(maestro, 'excursiones.dat');

    text_a_bin(fuente, maestro);

    reset(maestro);
    while (not eof(maestro)) do begin
        read(maestro, excursion);
        writeln('Codigo: ', excursion.codigo);
        writeln('Nombre: ', excursion.nombre);
        writeln('Descripcion: ', excursion.descripcion);
        writeln('Total: ', excursion.total);
        writeln;
    end;
    close(maestro);
end.