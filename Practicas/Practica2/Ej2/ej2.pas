program ej2;

const
    FINISH = -1;

type
    str30 = string[30];
    str20 = string[30];
    CD_type = record
        author_code: integer;
        author_name: str30;
        disk_name: str20;
        genre: str20;
        amount_sold: integer;
    end;

    cd_file_type = file of CD_type;

procedure createFile(var cd_file: cd_file_type);
var
    i: integer;
    cd: CD_type;
begin
    Assign(cd_file, '../tmp/Ej2/cds.dat');
    Rewrite(cd_file);

    for i := 1 to 5 do
    begin
        WriteLn('Enter details for CD ', i, ':');
        Write('Author code: '); ReadLn(cd.author_code);
        Write('Author name: '); ReadLn(cd.author_name);
        Write('Disk name: '); ReadLn(cd.disk_name);
        Write('Genre: '); ReadLn(cd.genre);
        Write('Amount sold: '); ReadLn(cd.amount_sold);

        WriteLn;
        Write(cd_file, cd);
    end;

    Close(cd_file);
end;

procedure readCode(var cds:cd_file_type; var data:CD_type);
begin
    if (not eof(cds)) then
        read(cds, data)
    else
        data.author_code := FINISH;
end;

procedure createReport(var cd_file: cd_file_type);
var 
    cd: CD_type;
    text_file: text;
    tot_genre, tot_author, tot_record_company: integer;
    prev_author_code: integer;
    prev_genre: str20;
begin
    Assign(cd_file, '../tmp/Ej2/cds.dat'); reset(cd_file);
    Assign(text_file, '../tmp/Ej2/cds_report.txt'); rewrite(text_file);

    readCode(cd_file, cd);
    tot_genre := 0; tot_author := 0; tot_record_company := 0;
    WriteLn('Author: ', cd.author_name);
    WriteLn('Genre: ', cd.genre);
    WriteLn;

    while(cd.author_code <> FINISH)do
    begin
        prev_author_code := cd.author_code;
        prev_genre := cd.genre;
        writeln(SameText(prev_genre, cd.genre)); //Esto me da falso y no tiene sentido loco
        while((cd.author_code = prev_author_code) and (cd.genre = prev_genre) and (cd.author_code <> FINISH))do
        begin
            WriteLn('Disk Name: ', cd.disk_name, '   amount sold: ', cd.amount_sold); 
            tot_genre := tot_genre + cd.amount_sold;
            WriteLn(text_file, cd.disk_name);
            WriteLn(text_file, cd.author_name);
            WriteLn(text_file, cd.amount_sold);
            readCode(cd_file, cd);
        end;
        WriteLn('Total Genre: ', tot_genre);
        WriteLn;
        tot_author := tot_author + tot_genre;
        tot_genre := 0;
        prev_genre := cd.genre;
        if((cd.author_code <> prev_author_code) or (cd.author_code = FINISH))then
        begin
            WriteLn('Total Author: ', tot_author);
            tot_record_company := tot_record_company + tot_author;
            tot_author := 0; 
        end;
    end;
    WriteLn('Total Record Company: ', tot_record_company);
end;

var
    cd_file: cd_file_type;
begin
    // createFile(cd_file);
    createReport(cd_file);
end.