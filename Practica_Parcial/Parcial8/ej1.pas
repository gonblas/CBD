Program ej1;

const
    N = 20;
    valor_alto = 9999;

type
    venta_detalle_type = record
        anio: integer;
        mes: integer;
        dia: integer;
        codigo_marca: integer;
        codigo_modelo: integer;
        nombre_marca: string;
        nombre_modelo: string;
        color: string;
        DNI: integer;
        monto: real;
    end;

    venta_maestro_type = record
        anio: integer;
        mes: integer;
        monto_total: real;
        vendidos: integer;
    end;

    detalle_type = file of venta_detalle_type;
    maestro_type = file of venta_maestro_type;

    detalles_type = array[1..N] of detalle_type;
    array_ventas = array[1..N] of venta_detalle_type;


procedure leer(var a:detalle_type; var reg_det: venta_detalle_type);
begin
    if(not eof(a))then
        read(a, reg_det)
    else begin
        reg_det.anio := valor_alto;
    end;
end;


procedure minimo(var dets: detalles_type; var resto: array_ventas; var min: venta_detalle_type);
var
    min_i, i: integer;
begin
    min := resto[1];
    min_i := 1;

    for i:= 1 to N do begin
        if(resto[i].anio < min.anio)then begin
            min := resto[i];
            min_i := i;
        end
        else if(resto[i].anio = min.anio)then begin
            if(resto[i].mes < min.mes)then begin
                min := resto[i];
                min_i := i;
            end
            else if(resto[i].mes = min.mes)then begin
                if(resto[i].dia < min.dia)then begin
                    min := resto[i];
                    min_i := i;
                end
                else if(resto[i].dia = min.dia)then begin
                    if(resto[i].codigo_marca < min.codigo_marca)then begin
                        min := resto[i];
                        min_i := i;
                    end
                    else if(resto[i].codigo_marca = min.codigo_marca)then begin
                        if(resto[i].codigo_modelo < min.codigo_modelo)then begin
                            min := resto[i];
                            min_i := i;
                        end;
                    end;
                end;
            end;
        end;
    end;
    leer(dets[min_i], resto[min_i]);
end;


procedure generar_maestro_y_reporte(var maestro: maestro_type; var reporte: text; dets: detalles_type);
var
    reg_m: venta_maestro_type;
    min, aux: venta_detalle_type;
    i, ventas_mes_act, ventas_modelo_act, max_modelo, min_modelo: integer;
    max_nombre, min_nombre: string;
    resto: array_ventas;

begin
    for i:=1 to N do begin
        reset(dets[i]); leer(dets[i], resto[i]);
    end;
    rewrite(maestro); rewrite(reporte);

    minimo(dets, resto, min);
    while(min.anio <> valor_alto)do begin

        aux := min;
        while(aux.anio = min.anio)do begin
            ventas_mes_act := 1;
            while((aux.anio = min.anio) and (aux.mes = min.mes))do begin 
                while((aux.anio = min.anio) and (aux.mes = min.mes) and (aux.dia = min.dia))do begin
                    max_modelo := -1; max_nombre := 'zzz';
                    min_modelo := valor_alto; min_nombre := 'zzz';
                    while((aux.anio = min.anio) and (aux.mes = min.mes) and (aux.dia = min.dia) and (aux.codigo_marca = min.codigo_marca))do begin

                        minimo(dets, resto, min);
                        ventas_modelo_act := 1;
                        while((aux.anio = min.anio) and (aux.mes = min.mes) and (aux.dia = min.dia) and (aux.codigo_marca = min.codigo_marca) and (aux.codigo_modelo = min.codigo_modelo))do begin
                            aux.monto := aux.monto + min.monto;
                            ventas_modelo_act := ventas_modelo_act + 1;
                            minimo(dets, resto, min);
                        end;
                        ventas_mes_act := ventas_mes_act + ventas_modelo_act;
                        {Comparo los maximos y minimos}

                        if(ventas_modelo_act > max_modelo)then begin
                            max_modelo := ventas_modelo_act;
                            max_nombre := aux.nombre_modelo;
                        end
                        else if(ventas_modelo_act < min_modelo)then begin
                            min_modelo := ventas_modelo_act;
                            min_nombre := aux.nombre_modelo;
                        end;
                    end;
                    {Agrego los maximos y minimos al reporte}
                    writeln(reporte, 'El modelo ', max_nombre, ' es el modelo con mas ventas: ', max_modelo, ' y ', min_nombre, ' es el modelo con menos ventas: ', min_nombre, ' de la marca ', aux.nombre_marca, '.');
                end;
            end;
            {Proceso los datos y lo meto en el maestro}
            reg_m.anio := aux.anio;
            reg_m.mes := aux.mes;
            reg_m.monto_total := aux.monto;
            reg_m.vendidos := ventas_mes_act;

            write(maestro, reg_m);
        end;
    end;

    for i:=1 to N do begin
        close(dets[i]);
    end;
    close(maestro); close(reporte);
end;


var
    maestro: maestro_type;
    dets: detalles_type;
    reporte: text;
    nombre: string;
    i: integer;
begin
    for i:= 1 to N do begin
        writeln('Ingrese el nombre del detalle ', i, ': ');
        readln(nombre);
        assign(dets[i], nombre);
    end;
    writeln('Ingrese el nombre del maestro: ');
    assign(maestro, nombre);

    writeln('Ingrese el nombre del reporte: ');
    assign(reporte, nombre);

    generar_maestro_y_reporte(maestro, reporte, dets);
end.