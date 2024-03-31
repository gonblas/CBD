program ej4;

uses SysUtils;

const
    N = 3;
    MAX_VALUE= 9999;

type
    str30 = string[30]; 
    film_detail = record
        code: integer;
        name: str30;
        genre: str30;
        director: str30;
        duration: integer;
        date: longint;
        audience: integer;
    end;

    film_master = record
        code: integer;
        name: str30;
        genre: str30;
        director: str30;
        duration: integer;
        audience: integer;
    end;

    detail_file = file of film_detail;
    master_file = file of film_master;
    details = array[1..N] of detail_file;
    det_array_type = array[1..N] of film_detail;

procedure createDetFiles(var dets: details;);
var
    rec_d: film_detail;
    i, detailNumber: Integer;
begin
    for i := 1 to N do
        rewrite(dets[i]);


    for i := 1 to 5 do
    begin
        writeln('Enter info for film ', i);
        with rec_d do
        begin
            write('Code: ');
            readln(code);
            write('Name: ');
            readln(name);
            write('Genre: ');
            readln(genre);
            write('Director: ');
            readln(director);
            write('Duration: ');
            readln(duration);
            write('Date: ');
            readln(date);
            write('Audience: ');
            readln(audience);
        end;

        writeln('Enter the detail number (1 to ', N, ') to add the info for film ', i, ': ');
        readln(detailNumber);

        write(dets[detailNumber], rec_d);
    end;

    for i := 1 to N do
        close(dets[i]);

    writeln('Files created successfully.');
end;




procedure readCode(var det:detail_file; var data:film_detail);
begin
    if (not eof(det)) then
        read(det, data)
    else
        data.code := MAX_VALUE;
end;

function minIndexValue(const arr: det_array_type): integer;
var
    i, min_value, min_index: integer;
begin
    min_value := arr[1].code;
    min_index := 1; 
    
    for i := 1 to N do
    begin
        if arr[i].code < min_value then 
        begin
            min_value := arr[i].code;
            min_index := i;
        end;
    end;
    
    minIndexValue := min_index;
end;

procedure minCode(var rec_det: det_array_type; var min: film_detail; var dets: details);
var min_index: integer;
begin
    min_index := minIndexValue(rec_det);
    min := rec_det[min_index];
    readCode(dets[min_index], rec_det[min_index]);
end;


procedure initMaster(master: master_file;; var dets: details);
var
    rec_dets: det_array_type;
    min: film_detail;
    rec_m: film_master;
    i: integer;
    text_file: text;
    master: master_file;
begin
    // Init files
    for i:= 1 to N
    do begin
        reset(dets[i]); readCode(dets[i], rec_dets[i]);
    end;
    rewrite(master);
    minCode(rec_dets, min, dets);


    while(min.code <> MAX_VALUE) do
    begin
        rec_m.code := min.code;
        rec_m.name := min.name; 
        rec_m.genre := min.genre;   
        rec_m.director := min.director; 
        rec_m.duration := min.duration; 
        rec_m.audience := 0;
        while(min.code = rec_m.code)do 
        begin
            rec_m.audience := rec_m.audience + min.audience;
            minCode(rec_dets, min, dets);
        end;
        write(master, rec_m);
    end;

    for i:= 1 to N do
        close(dets[i]);

    close(master);
end;


var
    master: master_file;
    dets: details;
    rec_m: film_master;
    i: integer;

begin
    for i:= 1 to N do
        assign(dets[i], concat('../tmp/Ej4/det', IntToStr(i), '.dat'));

    createDetFiles(dets);
    assign(master, '../tmp/Ej4/master.dat'); 
    initMaster(master, dets);

    reset(master);
    writeln('Code   Name   Genre   Director   Duration   Audience');
    while(not eof(master))do
    begin
        read(master, rec_m);
        writeln(rec_m.code, ' ', rec_m.name, ' ', rec_m.genre, ' ', rec_m.director, ' ', rec_m.duration, ' ', rec_m.audience);
    end;

    close(master);

    {Output:
    Code    Name                Genre               Director            Duration    Audience
    1       Oppenheimer         Drama               Christopher Nolan   4           11000
    2       Barbie              Comedy              Greta Gerwig        3           4500
    12      Kung Fu Panda 4     Animated film       Mith Mitchell       2           2000
    300     Titanic             Drama               James Cameron       1           200
    }

end.
