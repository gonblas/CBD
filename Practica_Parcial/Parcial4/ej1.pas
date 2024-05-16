Program ej1;

const 
    valor_alto = 9999;

type
    vivienda_type = record
        codPartido: integer;
        tipoVivienda: integer;
    end;

    vivienda_compacta_type = record
        codPartido: integer;
        tipoVivienda: integer;
        total: integer;
    end;

    file_vivienda = file of vivienda_type;
    file_compacto = file of vivienda_compacta_type;


procedure leer(var a: file_vivienda; var reg: vivienda_type);
begin
    if(not eof(a))then
        read(a, reg)
    else begin
        reg.codPartido := valor_alto;
        reg.tipoVivienda := valor_alto;
    end;
end;



procedure compactar(var viviendas: file_vivienda; var f_comp: file_compacto);
var
    max_partido, max, act: integer;
    reg_viv: vivienda_type;
    reg_comp: vivienda_compacta_type;
begin
    reset(viviendas); rewrite(f_comp);
    max := -1; max_partido := -1; act := 0;

    leer(viviendas, reg_viv);
    while(reg_viv.codPartido <> valor_alto)do begin
        reg_comp.codPartido := reg_viv.codPartido;
        reg_comp.tipoVivienda := reg_viv.tipoVivienda;
        reg_comp.total := 1;
        leer(viviendas, reg_viv);
        while(reg_comp.tipoVivienda = reg_viv.tipoVivienda)do begin
            reg_comp.total := reg_comp.total + 1;
            leer(viviendas, reg_viv);
        end;

        act := act + reg_comp.total;
        if((reg_comp.codPartido <> reg_viv.codPartido) and (act > max))then begin
            max := reg_comp.total;
            max_partido := reg_comp.codPartido;
        end;

        write(f_comp, reg_comp);
    end;

    close(viviendas); close(f_comp);

    writeln('El partido con mayor cantidad de viviendas es el que tiene el codigo: ', max_partido, '.');
end;

procedure CrearArchivoDeViviendas();
var
    archivo: file_vivienda;
    vivienda: vivienda_type;
begin
    Assign(archivo, 'viviendas.dat');
    Rewrite(archivo);

    vivienda.codPartido := 1;
    vivienda.tipoVivienda := 1;
    Write(archivo, vivienda);
    
    vivienda.codPartido := 1;
    vivienda.tipoVivienda := 1;
    Write(archivo, vivienda);

    vivienda.codPartido := 1;
    vivienda.tipoVivienda := 1;
    Write(archivo, vivienda);
    
    vivienda.codPartido := 1;
    vivienda.tipoVivienda := 2;
    Write(archivo, vivienda);
    
    vivienda.codPartido := 2;
    vivienda.tipoVivienda := 1;
    Write(archivo, vivienda);
    
    vivienda.codPartido := 2;
    vivienda.tipoVivienda := 1;
    Write(archivo, vivienda);
    
    vivienda.codPartido := 2;
    vivienda.tipoVivienda := 2;
    Write(archivo, vivienda);
    
    vivienda.codPartido := 3;
    vivienda.tipoVivienda := 1;
    Write(archivo, vivienda);
    
    vivienda.codPartido := 3;
    vivienda.tipoVivienda := 2;
    Write(archivo, vivienda);
    
    vivienda.codPartido := 3;
    vivienda.tipoVivienda := 2;
    Write(archivo, vivienda);

    vivienda.codPartido := 3;
    vivienda.tipoVivienda := 3;
    Write(archivo, vivienda);

    vivienda.codPartido := 3;
    vivienda.tipoVivienda := 7;
    Write(archivo, vivienda);

    Close(archivo);
    WriteLn('Archivo de viviendas creado exitosamente.');
end;


var
    viviendas: file_vivienda;
    f_comp: file_compacto;
    reg_comp: vivienda_compacta_type;
begin
    CrearArchivoDeViviendas();
    assign(viviendas, 'viviendas.dat');
    assign(f_comp, 'viviendas_compactas.dat');
    compactar(viviendas, f_comp);

    reset(f_comp);
    while(not eof(f_comp))do begin
        read(f_comp, reg_comp);
        writeln('Codigo de partido: ', reg_comp.codPartido, ' - Tipo de vivienda: ', reg_comp.tipoVivienda, ' - Total: ', reg_comp.total);
    end;
    close(f_comp);
end.
