program ej1;

const
    finish = 'Cemento';

type
    file_type = file of string;

var
    pFile: text;
    fileName, material: string;

begin
    write('Enter the file name: ');
    readln(fileName);

    assign(pFile, fileName);
    rewrite(pFile);

    material := '';

    while material <> finish do 
    begin
        writeln('Enter the construction material (or "cemento" to finish): '); readln(material);
        writeln(pFile, material);
    end;

    close(pFile);
    writeln('File creation complete.');
end.