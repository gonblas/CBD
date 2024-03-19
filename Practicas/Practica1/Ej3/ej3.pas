program ej3;

const
    finish = 'zzz';

var
    dino_file: text;
    file_name, dinosaur: string;

begin
    write('Enter the file name: '); readln(file_name);

    assign(dino_file, file_name); rewrite(dino_file);

    dinosaur := '';

    while dinosaur <> finish do 
    begin
        writeln('Enter the construction material (or "zzz" to finish): '); readln(dinosaur);
        writeln(dino_file, dinosaur);
    end;

    close(dino_file);
    writeln('File creation complete.');
end.