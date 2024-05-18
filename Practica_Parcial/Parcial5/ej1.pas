Program ej1;
uses
    sysutils;

const
    N = 2;
    valor_alto = 9999;

type
    producto_maestro_type = record
        codigo: integer;
        nombre: string;
        descripcion: string;
        precio: real;
        vendidos: integer;
        max_vendidos_mes: integer;
    end;

    producto_det_type = record
        codigo: integer;
        vendidos: integer;
    end;

    maestro_file = file of producto_maestro_type;
    detalle_file = file of producto_det_type;

    detalles_file = array[1..N] of detalle_file;
    array_productos = array[1..N] of producto_det_type;


procedure leer(var a: detalle_file; var reg_det: producto_det_type);
begin
    if(not eof(a))then
        read(a, reg_det)
    else
        reg_det.codigo := valor_alto;
end;



procedure minimo(var dets: detalles_file; var resto: array_productos; var min: producto_det_type);
var
    i, min_i: integer;
begin
    min_i := 1;
    min := resto[1];

    for i:= 2 to N do begin
        if(resto[i].codigo < min.codigo)then begin
            min := resto[i];
            min_i := i;
        end;
    end;

    leer(dets[min_i], resto[min_i]);
end;


procedure actualizar_maestro(var maestro: maestro_file; dets: detalles_file);
var
    resto: array_productos;
    reg_m: producto_maestro_type;
    min, aux: producto_det_type;
    i: integer;
begin
    for i:= 1 to N do begin
        reset(dets[i]); leer(dets[i], resto[i]);
    end;
    reset(maestro);
    read(maestro, reg_m); // Se que si o si tiene productos

    minimo(dets, resto, min);
    while(min.codigo <> valor_alto)do begin
        {Si o si existe el producto en maestro, no verifico por la llegada al final}
        while(reg_m.codigo <> min.codigo)do
            read(maestro, reg_m);
        
        aux := min; {aux.vendidos tendra el total de vendidos del mes de ese producto}
        minimo(dets, resto, min);
        while(aux.codigo = min.codigo)do begin
            aux.vendidos := aux.vendidos + min.vendidos;
            minimo(dets, resto, min);
        end;
        reg_m.vendidos := reg_m.vendidos + aux.vendidos;
        if(aux.vendidos > reg_m.max_vendidos_mes)then begin
            writeln('Codigo: ', reg_m.codigo);
            writeln('Nombre: ', reg_m.nombre);
            writeln('Max. anterior: ', reg_m.max_vendidos_mes);
            writeln('Max. nuevo: ', aux.vendidos);
            reg_m.max_vendidos_mes := aux.vendidos; //Actualizo
        end;
        seek(maestro, filepos(maestro)-1);
        write(maestro, reg_m);
    end;

    for i:=1 to N do
        close(dets[i]);
    close(maestro);
end;

procedure txt_a_bin(var maestro: maestro_file; var dets: detalles_file);
var
    i: integer;
    txt: text;
    reg_m: producto_maestro_type;
    reg_d: producto_det_type;
begin
    for i:= 1 to N do begin
        rewrite(dets[i]);
        reg_d.codigo := i*1;
        reg_d.vendidos := 50;
        write(dets[i], reg_d);
        reg_d.codigo := i*2;
        reg_d.vendidos := 300;
        write(dets[i], reg_d);
        reg_d.codigo := i*3;
        reg_d.vendidos := 250;
        write(dets[i], reg_d);
        close(dets[i]);
    end;

    rewrite(maestro);
    assign(txt, 'maestro.txt'); reset(txt);
    while(not eof(txt))do begin
        readln(txt, reg_m.codigo);
        readln(txt, reg_m.nombre);
        readln(txt, reg_m.descripcion);
        readln(txt, reg_m.precio);
        readln(txt, reg_m.vendidos);
        readln(txt, reg_m.max_vendidos_mes);
        write(maestro, reg_m);
    end;

    writeln('Archivo binario creado');
    close(maestro);
end;


var
    maestro: maestro_file;
    dets: detalles_file;
    i: integer;
    prod: producto_maestro_type;

begin
    for i := 1 to N do
        assign(dets[i], concat('det', IntToStr(i), '.dat'));
    assign(maestro, 'maestro.dat');

    txt_a_bin(maestro, dets);
    actualizar_maestro(maestro, dets);

    Reset(maestro);
    while(not eof(maestro))do begin
        read(maestro, prod);
        writeln('Codigo: ', prod.codigo);
        writeln('Nombre: ', prod.nombre);
        writeln('Descripcion: ', prod.descripcion);
        writeln('Precio: ', prod.precio:0:2);
        writeln('Vendidos: ', prod.vendidos);
        writeln('Max vendidos mes: ', prod.max_vendidos_mes);
        writeln('---------------------------------');
    end;
    Close(maestro);
end.