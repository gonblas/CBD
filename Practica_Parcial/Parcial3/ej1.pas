Program ej1;

const
    valor_alto = 9999;
    N = 50;



type
    producto_det_type = record
        codigo: integer;
        vendidos: integer;
    end;

    producto_maestro_type = record
        codigo: integer;
        nombre: string;
        descripcion: string;
        stock: integer;
    end;

    detalle_type = file of producto_det_type;
    array_prod_detalle = array[1..N] of producto_det_type;
    array_detalle = array[1..N] of detalle_type;

    maestro_type = file of producto_maestro_type;


procedure leer(var a: detalle_type; var datos: producto_det_type);
begin
    if(not eof(a))then 
        write(a, datos)
    else
        datos.codigo := valor_alto;
end;

procedure minimo(var dets: array_detalle; var resto: array_prod_detalle; var min: producto_det_type);
var
    min_i, i: integer;
begin
    min := resto[1];
    min_i := 1;

    for i:= 2 to N do begin
        if(resto[i].codigo < min.codigo)then begin
            min := resto[i];
            min_i:= i;
        end;
    end;

    leer(dets[min_i], resto[min_i]);
end;





procedure actualizar_maestro(var maestro: maestro_type; var dets: array_detalle);
var
    resto: array_prod_detalle;
    reg_m: producto_maestro_type;
    min, aux: producto_det_type;
    i: integer;

begin
    //Abro los archivos
    for i:=1 to N do begin
        reset(dets[i]); leer(dets[i], resto[i]);
    end;

    reset(maestro);
    minimo(dets, resto, min);

    while(min.codigo <> valor_alto)do begin
        read(maestro, reg_m);
        while(reg_m.codigo <> min.codigo)do // Supongo que existe en el maestro
            read(maestro, reg_m);
        aux := min;
        while((min.codigo <> valor_alto) and (aux.codigo = min.codigo))do begin
            // Supongo que tiene stock suficiente
            reg_m.stock := reg_m.stock - min.vendidos;
            minimo(dets, resto, min);
        end;
        seek(maestro, filepos(maestro)-1);
        write(maestro, reg_m);
    end;

    for i:=1 to N do begin
        close(dets[i]); 
    end;
    close(maestro);
end;


var
    dets: array_detalle;
    maestro: maestro_type;
    i: integer;
    nombre: string;
begin
    for i:= 1 to N do begin
        writeln('Ingrese el nombre del archivo detalle ', i, ': ');
        readln(nombre);
        assign(dets[i], nombre);
    end;

    writeln('Ingrese el nombre del archivo maestro: ');
    readln(nombre);
    assign(maestro, nombre);

    actualizar_maestro(maestro, dets);
end.