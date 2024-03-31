program ej4;
uses sysutils;

const
    END_CODE = -1;

type
    str30 = string[30];
    cd_type = record
        code: integer;
        album_name: str30;
        genre: str30;
        artist: str30;
        desc: str30;
        year: integer;
        stock: integer;
    end;

    cd_file = file of cd_type;


procedure init_file(var cds: cd_file);
var
    cd: cd_type;
    i: integer;
begin
    Rewrite(cds);

    for i:= 1 to 5 do
    begin
        cd.code := i;
        cd.album_name := 'Album ' + IntToStr(i);
        cd.genre := 'Genre ' + IntToStr(i);
        cd.artist := 'Artist ' + IntToStr(i);
        cd.desc := 'Description ' + IntToStr(i);
        cd.year := 2000 + i;
        cd.stock := Random(100) + 1;

        Write(cds, cd);
    end;
    Close(cds);
end;

procedure logical_delete(var cds: cd_file);
var
    cd: cd_type;
    code: integer;

begin
    Reset(cds);
    WriteLn('Enter the cd code to delete (or -1 to finish): '); read(code);
    while(code <> END_CODE) do begin
        cd.code := -1;
        while(not eof(cds) and (code <> cd.code) ) do
            read(cds, cd);

        if(code = cd.code)then begin
            Seek(cds, filepos(cds)-1);
            cd.stock := 0;
            write(cds, cd);
        end;

        seek(cds, 0);
        WriteLn('Enter the cd code to delete (or -1 to finish): '); read(code);
    end;
    Close(cds);
end;

procedure compact_file(var cds: cd_file; var cds_tmp: cd_file);
var
    
    cd: cd_type;
begin
    Reset(cds);
    Rewrite(cds_tmp);

    while(not eof(cds))
    do begin
        read(cds, cd);
        if(cd.stock > 0) then
            write(cds_tmp, cd);
    end;
    Close(cds); Close(cds_tmp);
end;


var
    cds, cds_tmp: cd_file;
    cd: cd_type;


begin
    Assign(cds, '../tmp/Ej4/cds.dat');
    init_file(cds);
    logical_delete(cds);

    Assign(cds_tmp, '../tmp/Ej4/cds_compact.dat'); 
    compact_file(cds, cds_tmp);
    Reset(cds_tmp);
    while(not eof(cds)) do begin
        read(cds_tmp, cd);
        WriteLn('Code: ', cd.code);
        WriteLn('Album Name: ', cd.album_name);
        WriteLn('Genre: ', cd.genre);
        WriteLn('Artist: ', cd.artist);
        WriteLn('Description: ', cd.desc);
        WriteLn('Year: ', cd.year);
        WriteLn('Stock: ', cd.stock);
        WriteLn('----------------------');
    end;

    Close(cds_tmp);
end.