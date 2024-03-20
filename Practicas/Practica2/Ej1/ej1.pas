program ej1;
uses Sysutils;

const
    N = 3; // For testing
    MAX_VALUE = 9999;

type
    employe_detail = record
        code: integer;
        date: string[10];
        days: integer;
    end;

    employe_master = record 
        code: integer;
        fullname: string[30];
        address: string[30];
        children: integer;
        phone_num: longint;
        holiday_days: integer;
    end;

    detail_type = file of employe_detail;
    master_type = file of employe_master;

    details = array[1..N] of detail_type;
    det_array_type = array[1..N] of employe_detail;
    int_array_type = array[1..N] of integer;


procedure createFiles();
var
    master: file of employe_master;
    dets: array[1..N] of file of employe_detail;
    rec_m: employe_master;
    rec_d: employe_detail;
    i, detailNumber: Integer;
begin
    for i := 1 to N do
    begin
        assign(dets[i], concat('../tmp/Ej1/det', IntToStr(i), '.dat'));
        rewrite(dets[i]);
    end;
    
    assign(master, '../tmp/Ej1/master.dat');
    rewrite(master);

    for i := 1 to 5 do // For each of the 5 master employees
    begin
        // Read details for each employee
        writeln('Enter details for employee ', i);
        with rec_m do
        begin
            write('Code: ');
            readln(code);
            write('Full name: ');
            readln(fullname);
            write('Address: ');
            readln(address);
            write('Number of children: ');
            readln(children);
            write('Phone number: ');
            readln(phone_num);
            write('Holiday days: ');
            readln(holiday_days);
        end;

        // Write into master file
        write(master, rec_m);

        // Choose the detail number to add the details
        writeln('Enter the detail number (1 to ', N, ') to add the details for employee ', i, ': ');
        readln(detailNumber);

        rec_d.code := rec_m.code;
        write('Enter date for the employee ', i, ': ');
        readln(rec_d.date);
        write('Enter number of days for vacation for employee ', i, ': ');
        readln(rec_d.days);
        write(dets[detailNumber], rec_d);
    end;

    // Close files
    close(master);
    for i := 1 to N do
        close(dets[i]);

    writeln('Files created successfully.');
end;

procedure readCode(var det:detail_type; var data:employe_detail);
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
    min_index := 1; // Inicializar min_index correctamente
    
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

procedure minCode(var rec_det: det_array_type; var min: employe_detail; var dets: details);
var min_index: integer;
begin
    min_index := minIndexValue(rec_det);
    min := rec_det[min_index];
    readCode(dets[min_index], rec_det[min_index]);
end;


procedure updateMaster(var master: master_type; var dets: details);
var
    rec_m: employe_master;
    rec_dets: det_array_type;
    min: employe_detail;
    aux, i: integer;
    text_file: text;
begin
    // Init files
    for i:= 1 to N
    do begin
        assign(dets[i], concat('../tmp/Ej1/det', IntToStr(i), '.dat')); reset(dets[i]);
        readCode(dets[i], rec_dets[i]);
    end;
    assign(master, '../tmp/Ej1/master.dat'); reset(master);
    assign(text_file, '../tmp/Ej1/employes.txt'); rewrite(text_file);

    read(master, rec_m);              
    minCode(rec_dets, min, dets);
    

    while(min.code <> MAX_VALUE) do
    begin
        while(rec_m.code <> min.code)do
            read(master, rec_m);
        aux := min.code;
        while(aux = min.code)do //Supongo que puede una misma persona trabajar en multiples direcciones generales
        begin
            if(rec_m.holiday_days - min.days < 0)then 
            begin
                WriteLn(text_file, rec_m.code);
                WriteLn(text_file, rec_m.fullname);
                WriteLn(text_file, rec_m.holiday_days);
                WriteLn(text_file, min.days)
            end
            else
                rec_m.holiday_days := rec_m.holiday_days - min.days;
            minCode(rec_dets, min, dets);
        end;
        seek(master, FilePos(master)-1);
        write(master, rec_m);
    end;

    for i:= 1 to N do
        close(dets[i]);

    close(master);
    close(text_file);
end;


var
    master: master_type;
    dets: details;
    rec_m: employe_master;

begin
    createFiles();
    updateMaster(master, dets);
    assign(master, '../tmp/Ej1/master.dat'); reset(master);
    writeln('Code   Fullname   Address   Children   Phone Number   Available Days');
    while(not eof(master))do
    begin
        read(master, rec_m);
        writeln(rec_m.code, ' ', rec_m.fullname, ' ', rec_m.address, ' ', rec_m.children, ' ', rec_m.phone_num, ' ', rec_m.holiday_days);
    end;

    close(master);
end.