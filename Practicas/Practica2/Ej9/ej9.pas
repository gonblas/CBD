program ej9;

uses SysUtils;

const
    N = 3;
    MAX_VALUE= 9999;

type

    str30 = string[30]; 
    runners_detail = record
        DNI: longint;
        surname: str30;
        name: str30;
        kilometers: real;
        win: integer; {1 if win, 0 if not}
    end;

    runners_master = record
        DNI: longint;
        surname: str30;
        name: str30;
        kilometers: real;
        wins: integer;
    end;

    detail_file = file of runners_detail;
    master_file = file of runners_master;
    details = array[1..N] of detail_file;
    det_array_type = array[1..N] of runners_detail;



procedure createDetFiles(var dets: details);
var
    rec_d: runners_detail;
    i, detailNumber: Integer;
begin
    for i := 1 to N do
        rewrite(dets[i]);


    for i := 1 to 5 do
    begin
        WriteLn('Enter the info for runner ', i, ': ');   
        with rec_d do
        begin
            write('Enter DNI: '); readln(DNI);
            write('Enter surname: '); readln(surname);
            write('Enter name: '); readln(name);
            write('Enter kilometers: '); readln(kilometers);
            write('Enter win (1 if win, 0 if not): '); readln(win); 
        end;

        writeln('Enter the detail number (1 to ', N, ') to add the info for runner ', i, ': ');
        readln(detailNumber);

        write(dets[detailNumber], rec_d);
    end;

    for i := 1 to N do
        close(dets[i]);

    writeln('Files created successfully.');
end;



procedure readCode(var det:detail_file; var data:runners_detail);
begin
    if (not eof(det)) then
        read(det, data)
    else
        data.DNI := MAX_VALUE;
end;


function minIndexValue(const arr: det_array_type): integer;
var
    i, min_value, min_index: integer;
begin
    min_value := arr[1].DNI;
    min_index := 1; 
    
    for i := 1 to N do
    begin
        if arr[i].DNI < min_value then 
        begin
            min_value := arr[i].DNI;
            min_index := i;
        end;
    end;
    
    minIndexValue := min_index;
end;


procedure minCode(var rec_det: det_array_type; var min: runners_detail; var dets: details);
var min_index: integer;
begin
    min_index := minIndexValue(rec_det);
    min := rec_det[min_index];
    readCode(dets[min_index], rec_det[min_index]);
end;


procedure initMaster(var master: master_file; var dets: details);
var
    rec_dets: det_array_type;
    min: runners_detail;
    rec_m: runners_master;
    i: integer;
begin
    // Init files
    for i:= 1 to N
    do begin
        reset(dets[i]); readCode(dets[i], rec_dets[i]);
    end;   

    rewrite(master);
    minCode(rec_dets, min, dets);

    while(min.DNI <> MAX_VALUE) do
    begin
        rec_m.DNI := min.DNI;   
        rec_m.name := min.name;
        rec_m.surname := min.surname;
        rec_m.kilometers := 0;
        rec_m.wins := 0;
        
        while(min.DNI = rec_m.DNI)do 
        begin
            rec_m.kilometers := rec_m.kilometers + min.kilometers;  
            rec_m.wins := rec_m.wins + min.win;
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
    rec_m: runners_master;
    i: integer;

begin
    for i := 1 to N do
        assign(dets[i], concat('../tmp/Ej9/det', IntToStr(i), '.dat'));
    createDetFiles(dets);

    Assign(master, '../tmp/Ej9/master.dat');
    initMaster(master, dets);

    reset(master);
    WriteLn('DNI   Surname    Name     Meters    Wins');
    while(not eof(master))do
    begin
        read(master, rec_m);
        writeln(rec_m.DNI, ' ', rec_m.surname, ' ', rec_m.name, ' ', rec_m.kilometers:0:2, ' ', rec_m.wins);
    end;

    close(master);

    {Output:
        DNI     Surname     Name        Meters      Wins
        1       Blasco      Gonzalo     120.00      1
        2       Blasco      Gabino      123.00      0
        3       Alvarez     Julian      3000.00     1
        12      Messi       Lionel      2300.00     2
    }

end.
