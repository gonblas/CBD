Program algo;


// Suponiendo que se quiere borrar un registro por su id de un archivo no ordenado
Procedure BajaFisica(var a:archivo);
Var
    posBorrar:integer; rp,aux:tipo_reg; id: integer;
begin
    reset(a);
    readln(id); //id es el id que se quiere borrar
    rp.id= -1;
    while ((not eof(a)) and (rp.id <> id)) do
        read(a,rp);
    if(rp.ape = id)then begin       //si se encontro el registro
        posBorrar:=filepos(a)-1;    //posicion del registro a borrar
        seek(a,filesize(a)-1);      //me posiciono en el ultimo registro
        read(a,aux);                //leo el ultimo registro
        seek(a, posBorrar);         //me posiciono en el registro a borrar
        write(a,aux);               //sobreescribo el registro a borrar con el ultimo registro
        seek(a,filesize(a)-1);      //me posiciono en el ultimo registro
        truncate(a);                //borro el ultimo registro
    end;
    close(a);
end;

// Suponiendo que se quiere borrar un registro por su id de un archivo no ordenado
Procedure BajaLogica(var a: archivo);
Var
    posBorrar:integer; rp:tipo_reg;
    id: integer;
begin
    reset(a);
    readln(id);
    rp.id= -1;
    while (not eof(a) and (rp.id <> id)) do //busco el registro a borrar
        read(a,rp);
    If(rp.id = id)then begin                //si se encontro el registro
        posBorrar:=filepos(a)-1;            //posicion del registro a borrar
        rp.id= 0;                           //marco el registro como borrado 
        seek(a, posBorrar);                 //me posiciono en el registro a borrar
        write(a,rp);                        //sobreescribo el registro
    end;
    close(a);
end;

// Se supone que la cabecera tiene un registro con el campo 'code' indicando el proximo libre
procedure AgregarReutilizando(var a: archivo);
var
    r, rb: vehicle_type;
    NLibre: integer;
begin
    Reset(a); read(a, r);
    NLibre := r.code;
    if(NLibre = -1) then 
        seek(a, filesize(a))            //si no hay registros borrados, escribo al final
    else begin
        seek(a, NLibre); read(a, r);    //si hay registros borrados, leo el registro borrado
        seek(a, 0); write(a, r);        //sobreescribo el registro borrado en la cabecera
        seek(a, NLibre);                //me posiciono en el registro borrado
    end;
    // Poner en r los datos del nuevo registro
    write(a, r);                    //escribo el nuevo registro
    close(a);
end;


// Se supone que la cabecera tiene un registro con el campo 'code' indicando el proximo libre
procedure EliminarReutilizando(var a: archivo; valor_a_eliminar: integer);
var
    r, rb: tipo_reg;
    NLibre: integer;

begin
    Reset(a);
    read(a, r);
    rb.code:= -1;
    while(not ((rb.code = valor_a_eliminar) or eof(a))) do //busco el registro a borrar
        Read(a, rb);
    
    if(rb.code = valor_a_eliminar)then begin    //si se encontro el registro
        NLibre := FilePos(a) - 1;               //posicion del registro a borrar
        seek(a, NLibre); write(a, r);           //sobreescribo el registro a borrar con el de la cabecera
        rb.code := NLibre;                      //actualizo el campo code del registro borrado
        seek(a, 0); write(a, rb);               //actualizo la cabecera
    end;
    close(a);
end;



const
    ValorAlto = 9999;
    N = 1234; //cantidad de archivos detalle

procedure Leer(var det:detalle; var regDet:tipo_regDetalle);
begin
    if(not EoF(det))then
        read(det,regDet)
    else
        regDet.codigo:=ValorAlto;
end;


procedure minimo(var det:detalle; var minimos:tipo_arrayRegDetalle; var min:tipo_regDetalle);
var
    posMin, i:integer;
Begin
    min:=minimos[1];
    posMin:=1;
    for i:= 2 to N do begin
        if(minimos[i].codigo < min.codigo)then begin
                min:=minimos[i];
                posMin:=i;
        end;
    end;
    Leer(det[posMin],minimos[posMin]);
end;


procedure ActualizarMaestro(var M:arch_maestro, var det:detalle);
var
    minimos:tipo_arrayRegDetalle; min:tipo_regDetalle; regM:maestro;
begin
    for i:=1 to N do begin //abro los N archivos detalle  
        reset(det[i]);
        Leer(det[i],minimos[i]);
    end;
    reset(M); 
    minimo(det,minimos,min);
    while(min.codigo <> ValorAlto)do begin
        while(min.codigo <> regM.codigo)do begin //leo el maestro hasta encontrar el codigo del detalle minimo
            read(M,regM);
        end;
        while(regM.codigo = min.codigo) and (min.codigo <> ValorAlto)do begin //mientras el codigo del maestro sea igual al del detalle
            // actualizo los valores en el registro maestro
            minimo(det,minimos,min);
        end;
        seek(M,filepos(M)-1);   //me posiciono en el registro a actualizar
        write(M,regM);          //actualizo el registro
    end;
    close(M);                   // Cierro todos los archivos
    for i:=1 to N do
        close(det[i]);
    end;
end;



procedure CorteDeControl(var det:detalle);
var
    posMin, i, campoAct, subcampoAct, cantCampo, cantSubcampo:integer;
Begin
    WriteLn(‘CORTE DE CONTROL’); WriteLn;
    Leer(archivo, reg);
    While (reg.campo <> valorAlto) do begin
        campoAct:=reg.campo;
        cantCampo:=0;
        writeLn('Campo ', campoAct);
        while (reg.campo=campoAct) do begin //corta la ejecución cuando cambia de campo
            subcampoAct:= reg.subcampo;
            cantSubcampo:=0;
            write(' Subcampo ', subcampoAct);
            while (reg.campo = campoAct) and (reg.subcampo = subcampoAct) do begin //corta la ejecución cuando cambia campo o subcampo
                cantSubcampo := cantSubcampo + reg.cantidad;
                Leer(archivo, reg);
            end;
            cantCampo := cantCampo + cantSubcampo;
            writeLn("Cant Subcampo: ", cantSubcampo);
        end;
        writeLn("Cant Campo: ", cantCampo);
    end;
    Close(archivo);
end;


procedure Merge(var M:arch_maestro, var det:detalle);
var
    minimos:tipo_arrayRegDetalle; min:tipo_regDetalle; regM:maestro;
begin
    for i:=1 to N do begin //abro los N archivos detalle  
        reset(det[i]);
        Leer(det[i],minimos[i]);
    end;
    reset(M); 
    minimo(det,minimos,min);
    while(min.codigo <> ValorAlto)do begin
        regM.codigo:= min.codigo;
        regM.cant := 0;
        while(regM.codigo = min.codigo) and (min.codigo <> ValorAlto)do begin //mientras el codigo del maestro sea igual al del detalle
            regM.cant := 0;         // actualizo los valores en el registro maestro
            minimo(det,minimos,min);
        end;
        write(M,regM);              //actualizo el registro
    end;
    close(M);                       // Cierro todos los archivos
    for i:=1 to N do
        close(det[i]);
    end;
end;


begin
  
end.