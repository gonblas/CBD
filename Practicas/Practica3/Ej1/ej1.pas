program ej1;


const
    END_CODE = -1;  
    MARK = -1;      // Delete mark

type
    str30 = string[30];
    specie_type = record
        code: integer;
        vulgar_name: str30;
        sci_name: str30;
        avg_high: real;
        desc: str30;
        zone: str30;
    end;

    species_file = file of specie_type;


procedure init_file(var species: species_file);
var
    i: integer;
    specie: specie_type;

begin
    Rewrite(species);
    writeln('~~~Enter species data~~~');
    for i:= 1 to 5 do
    begin
        writeln;
        writeln('Enter code: '); readln(specie.code);
        writeln('Enter vulgar name: '); readln(specie.vulgar_name);
        writeln('Enter scientific name: '); readln(specie.sci_name);
        writeln('Enter average high: '); readln(specie.avg_high);
        writeln('Enter description: '); readln(specie.desc);
        writeln('Enter zone: '); readln(specie.zone);
        write(species, specie);
    end;

    close(species);
end;




procedure logical_delete(var species: species_file);
var
    rec: specie_type;
    code, delete_pos: integer;

begin
    Reset(species);
    writeln('Enter the specie code to delete (or -1 to finish): '); ReadLn(code);
    rec.code := -1;

    while(code <> END_CODE) do
    begin
        seek(species, 0);
        while((not eof(species)) and (rec.code <> code)) do
            read(species, rec);
        if(rec.code = code)then begin
            delete_pos := filepos(species)-1;
            rec.code := MARK;
            seek(species, delete_pos);
            write(species, rec);
        end;
        writeln('Enter the specie code to delete (or -1 to finish): '); ReadLn(code);
        rec.code := -1;
    end;
    close(species);
end;


procedure compact_file(var species: species_file; var compact: species_file);
var
    compact: species_file;
    data: specie_type;

begin
    Reset(species);
    Rewrite(compact);

    while(not eof(species))do
    begin
        read(species, data);
        if(data.code <> MARK)then
            write(compact, data);
    end;
    close(species);
    close(compact);
end;


procedure phisical_delete(var species: species_file);
var
    rec: specie_type;
    code, delete_pos: integer;
begin
    Reset(species);
    writeln('Enter the specie code to delete (or -1 to finish): '); ReadLn(code);
    rec.code := -1;

    while(code <> END_CODE) do
    begin
        seek(species, 0);
        while((not eof(species)) and (rec.code <> code)) do
            read(species, rec);
        if(rec.code = code)then begin
            delete_pos := filepos(species)-1;
            seek(species, FileSize(species)-1);
            read(species, rec);
            seek(species, delete_pos);
            write(species, rec);
            seek(species, FileSize(species)-1);
            truncate(species);
        end;
        writeln('Enter the specie code to delete (or -1 to finish): '); ReadLn(code);
        rec.code := -1;
    end;
    close(species);
end;

var
    species, compact: species_file;
    data: specie_type;

begin
    Assign(species, '../tmp/Ej1/species.dat');
    // init_file(species);

    //Inciso A
    logical_delete(species);
    Assign(compact, '../tmp/Ej1/species_compact.dat'); 
    compact_file(species, compact);

    Reset(compact);
    while(not eof(compact))do
    begin
        read(compact, data);
        writeln('Code: ', data.code);
        writeln('Vulgar name: ', data.vulgar_name);
        writeln('Scientific name: ', data.sci_name);
        writeln('Average high: ', data.avg_high:0:2);
        writeln('Description: ', data.desc);
        writeln('Zone: ', data.zone);
        writeln;
    end;
    close(compact);

    

    //Inciso B
    Assign(species, '../tmp/Ej1/species_b.dat'); 
    phisical_delete(species);
    Reset(species);
    while(not eof(species))do
    begin
        read(species, data);
        writeln('Code: ', data.code);
        writeln('Vulgar name: ', data.vulgar_name);
        writeln('Scientific name: ', data.sci_name);
        writeln('Average high: ', data.avg_high:0:2);
        writeln('Description: ', data.desc);
        writeln('Zone: ', data.zone);
        writeln;
    end;
    close(species);

    {Output: Al borrar el codigo 1 y 3 del archivo species_original.dat
        Code: 2
        Vulgar name: Murainho
        Scientific name: Agumurray
        Average high: 122.00
        Description: Una planta normal
        Zone: Desierto

        Code: 23
        Vulgar name: Ramuelinho
        Scientific name: Ramuelillo
        Average high: 555.00
        Description: Planta normal
        Zone: La boca

        Code: 456
        Vulgar name: matero
        Scientific name: romero
        Average high: 444.00
        Description: Una planta normal
        Zone: Los Hornos
    }

end.
