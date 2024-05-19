Program ej1;

Type
    profesional=Record
        DNI: integer;
        nombre: String;
        apellido: String;
    end;
    tArchivo = File of profesional;

Procedure leer(var info: text; var p: profesional);
begin
    if(not eof(info))then begin
        readln(info, p.DNI);
        readln(info, p.nombre);
        readln(info, p.apellido);
    end
    else
        p.DNI := 0;
end;

Procedure crear(var arch: tArchivo; var info: TEXT);
var
    p: profesional;
begin
    reset(info);
    rewrite(arch);

    p.DNI := 0;
    write(arch, p); //Inicializo la cabecera
    leer(info, p);
    while(p.DNI <> 0)do begin
        write(arch, p);
        leer(info,p);
    end;

    close(info); close(arch);
end;



Procedure agregar(var arch: tArchivo; p: profesional);
var
    cabecera: profesional;
    pos: integer;
begin
    reset(arch);
    read(arch, cabecera); // La cabecera se encuentra si o si
    if(cabecera.DNI <> 0)then begin // Si hay un registro para reutilizar
        pos := -cabecera.DNI;
        seek(arch, pos);
        read(arch, cabecera);
        seek(arch, 0); write(arch, cabecera); // Actualizo la cabecera
        seek(arch, pos);
    end
    else
        seek(arch, filesize(arch)); // Si no hay registros para reutilizar, escribo al final
    
    write(arch, p);
    close(arch);
end;


Procedure eliminar(var arch: tArchivo; DNI: integer; var bajas: TEXT);
var
    libreN: integer;
    cabecera, act: profesional;

begin
    reset(arch);

    write(arch, cabecera);
    act.DNI := -1;
    while((not eof(arch)) and (act.DNI <> DNI))do
        read(arch, act);
    
    if(act.DNI = DNI)then begin // Si existe el profesional a eliminar
        append(bajas);
        writeln(bajas, act.DNI);
        writeln(bajas, act.nombre);
        writeln(bajas, act.apellido);
        close(bajas);

        {Elimino el registro}
        libreN := filepos(arch)-1;
        seek(arch, libreN); write(arch, cabecera);
        cabecera.DNI := -libreN;
        seek(arch, 0); write(arch, cabecera);
    end;

    close(arch);
end;


var
    arch: tArchivo;
    info, bajas: TEXT;
    p: profesional;
begin
    assign(info, 'profesionales.txt');
    assign(arch, 'profesionales.dat');
    assign(bajas, 'bajas.txt');

    crear(arch, info);
    p.DNI := 1235;
    p.nombre := 'Juan';
    p.apellido := 'Perez';
    agregar(arch, p);

    eliminar(arch, 1235, bajas);
    eliminar(arch, 6762, bajas);

    p.DNI := 1234;
    p.nombre := 'Lionel';
    p.apellido := 'Messi';
    agregar(arch, p);

    reset(arch);
    while(not eof(arch))do begin
        read(arch, p);
        writeln(p.DNI, ' ', p.nombre, ' ', p.apellido);
    end;
    close(arch);
end.