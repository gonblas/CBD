program ej8;

uses SysUtils;

const
    N = 3;
    MAX_VALUE= 9999;

type

    str30 = string[30]; 
    aqueduct_detail = record
        zone_code: integer;
        name: str30;
        desc: str30;
        date: str30;
        meters: integer;
    end;

    aqueduct_master = record
        zone_code: integer;
        name: str30;
        meters: integer;
    end;

    detail_file = file of aqueduct_detail;
    master_file = file of aqueduct_master;
    details = array[1..N] of detail_file;
    det_array_type = array[1..N] of aqueduct_detail;



procedure createDetFiles();
var
    dets: details;
    rec_d: aqueduct_detail;
    i, detailNumber: Integer;
begin
    for i := 1 to N do
    begin
        assign(dets[i], concat('../tmp/Ej8/det', IntToStr(i), '.dat'));
        rewrite(dets[i]);
    end;

    for i := 1 to 5 do
    begin
        writeln('Enter info for aqueduct ', i);
        with rec_d do
        begin
            write('Enter the zone code: ');
            readln(zone_code);
            write('Enter the name: ');
            readln(name);
            write('Enter the description: ');
            readln(desc);
            write('Enter the date: ');
            readln(date);
            write('Enter the meters: ');
            readln(meters); 
        end;

        writeln('Enter the detail number (1 to ', N, ') to add the info for aqueduct ', i, ': ');
        readln(detailNumber);

        write(dets[detailNumber], rec_d);
    end;

    for i := 1 to N do
        close(dets[i]);

    writeln('Files created successfully.');
end;



procedure readCode(var det:detail_file; var data:aqueduct_detail);
begin
    if (not eof(det)) then
        read(det, data)
    else
        data.zone_code := MAX_VALUE;
end;

function minIndexValue(const arr: det_array_type): integer;
var
    i, min_value, min_index: integer;
begin
    min_value := arr[1].zone_code;
    min_index := 1; 
    
    for i := 1 to N do
    begin
        if arr[i].zone_code < min_value then 
        begin
            min_value := arr[i].zone_code;
            min_index := i;
        end;
    end;
    
    minIndexValue := min_index;
end;


procedure minCode(var rec_det: det_array_type; var min: aqueduct_detail; var dets: details);
var min_index: integer;
begin
    min_index := minIndexValue(rec_det);
    min := rec_det[min_index];
    readCode(dets[min_index], rec_det[min_index]);
end;


procedure initMaster(master_filename: str30; var dets: details);
var
    rec_dets: det_array_type;
    min, last_aqueduct: aqueduct_detail;
    rec_m: aqueduct_master;
    i: integer;
    text_file: text;
    master: master_file;
begin
    // Init files
    for i:= 1 to N
    do begin
        assign(dets[i], concat('../tmp/Ej8/det', IntToStr(i), '.dat')); reset(dets[i]); readCode(dets[i], rec_dets[i]);
    end;

    Assign(text_file, '../tmp/Ej8/aqueducts.txt'); rewrite(text_file);    

    assign(master, master_filename); rewrite(master);
    minCode(rec_dets, min, dets);

    last_aqueduct := min;
    while(min.zone_code <> MAX_VALUE) do
    begin
        rec_m.zone_code := min.zone_code;   
        rec_m.name := min.name;
        rec_m.meters := 0;
        
        while(min.zone_code = rec_m.zone_code)do 
        begin
            rec_m.meters := rec_m.meters + min.meters;  
            minCode(rec_dets, min, dets);
        end;
        write(master, rec_m);
        writeln(text_file, rec_m.zone_code, ' ', rec_m.name, ' ', last_aqueduct.desc, ' ', rec_m.meters);    
    end;

    for i:= 1 to N do
        close(dets[i]);

    close(master);
    close(text_file);   
end;


var
    master: master_file;
    dets: details;
    rec_m: aqueduct_master;

begin
    createDetFiles();

    initMaster('../tmp/Ej8/master.dat', dets);

    assign(master, '../tmp/Ej8/master.dat'); reset(master);
    WriteLn('Code Zone    Name                Meters');
    while(not eof(master))do
    begin
        read(master, rec_m);
        writeln(rec_m.zone_code, ' ', rec_m.name, ' ', rec_m.meters);
    end;

    // Output

    {Output:
    Code Zone       Name        Meters
    1               LP          20
    7               CB          100
    22              LH          300
    }

    close(master);
end.
