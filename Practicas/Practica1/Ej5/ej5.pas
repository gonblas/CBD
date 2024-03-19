program ej5;

const
    finish = 'zzz';

type
    Flower = record 
        species_number: integer;
        max_height: real;
        scientific_name: string;
        vulgar_name: string;
    end;

    fileType = file of Flower;


procedure addSpecies(var p_file: fileType);
var
    flower_data: Flower;
begin
    seek(p_file, Filesize(p_file));
    while (true) do 
    begin
        writeln('Enter the scientific name: ');
        readln(flower_data.scientific_name);
        if(flower_data.scientific_name = finish)then
            break;
        writeln('Enter the species number: ');
        readln(flower_data.species_number);
        writeln('Enter the max height: ');
        readln(flower_data.max_height);
        writeln('Enter the vulgar name: ');
        readln(flower_data.vulgar_name);
        write(p_file, flower_data);
    end;
end;


procedure report(var p_file: fileType);
var
    flower_data: Flower;
    minHeight, max_height, species: real;
begin
    seek(p_file, 0);
    minHeight := 32767; max_height := -1;
    while (not eof(p_file)) do 
    begin
        read(p_file, flower_data);
        if(flower_data.max_height < minHeight) then
            minHeight := flower_data.max_height;
        if(flower_data.max_height > max_height) then
            max_height := flower_data.max_height;
    end;

    writeln('Amount of species: ', FileSize(p_file));
    writeln('Min Height: ', minHeight);
    writeln('Max Height: ', max_height);
end;


procedure listSpecies(var p_file: fileType);
var
    flower_data: Flower;
begin
    seek(p_file, 0);
    while (not eof(p_file)) do 
    begin
        read(p_file, flower_data);
        writeln('species number: ', flower_data.species_number, ' max height: ', flower_data.max_height,' scientific name: ', flower_data.scientific_name, ' vulgar name: ', flower_data.vulgar_name);
    end;
end;


procedure replaceName(var p_file: fileType);
var
    flower_data: Flower;
begin
    seek(p_file, 0);
    while (not eof(p_file)) do 
    begin
        read(p_file, flower_data);
        if(flower_data.scientific_name = 'Victoria amazonia') then
            begin
                flower_data.scientific_name := 'Victoria amazónica';
                seek(p_file, Filepos(p_file)-1);
                write(p_file, flower_data);
            end;
    end;
end;


procedure listToTextFile(var p_file: fileType);
var
    flower_data: Flower;
    textFile: text;
begin
    seek(p_file, 0);
    assign(textFile, '../tmp/flowers.txt');
    rewrite(textFile);
    while (not eof(p_file)) do 
    begin
        read(p_file, flower_data);
        writeln(textFile, 'species number: ', flower_data.species_number, ' max height: ', flower_data.max_height,' scientific name: ', flower_data.scientific_name, ' vulgar name: ', flower_data.vulgar_name);
    end;
    close(textFile);
end;


var
    p_file: fileType;

begin
    assign(p_file, '../tmp/flowers.dat');
    rewrite(p_file);
    addSpecies(p_file); //Create file
    report(p_file);
    listSpecies(p_file);
    replaceName(p_file);
    addSpecies(p_file); //Add more species
    listToTextFile(p_file);
    close(p_file);
end.