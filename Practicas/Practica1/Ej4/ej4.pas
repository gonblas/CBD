program ej4;



type
    file_type = file of integer;

procedure duplicateFile(var p_file: file_type; var copy_file: text;);
var
    data: integer;
begin
    rewrite(copy_file);

    while (not eof(p_file)) do 
    begin
        read(p_file, data);
        writeln(copy_file, data);
    end;

    close(copy_file);
end;

var
    p_file: file_type;
    fileName: string;
    copy_file: text;

begin
    write('Enter the file name: ');
    readln(fileName);
    assign(p_file, fileName);
    assign(copy_file, '../tmp/votes_cp.txt'); 
    reset(p_file);
    duplicateFile(p_file);
    close(p_file);
end.