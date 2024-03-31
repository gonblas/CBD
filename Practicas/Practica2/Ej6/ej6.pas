program ej6;

const
    MAX_VALUE = 9999;
    FINISH = -1;


type
    waiter_type = record
        code: integer;
        date: longint;
        service_amount: real;
    end;

    waiter_compact_type = record
        code: integer;
        total: real;
    end;

    master_file = file of waiter_type;  
    compact_file = file of waiter_compact_type;


procedure create_master_file(var master: master_file);
var
    waiter: waiter_type;
begin
    rewrite(master); 
    
    writeln('Enter waiter code (or -1 to finish): '); readln(waiter.code);
    while (waiter.code <> FINISH) do
    begin
        writeln('Enter the date: '); readln(waiter.date);
        writeln('Enter the service amount: '); readln(waiter.service_amount);
        write(master, waiter); 
        writeln('Enter waiter code (or -1 to finish): '); readln(waiter.code);
    end;
    close(master);
end;

procedure readCode(var det:master_file; var data:waiter_type);
begin
    if (not eof(det)) then
        read(det, data)
    else
        data.code := MAX_VALUE;
end;


procedure compactFile(var master: master_file; var compact: compact_file);
var
    waiter: waiter_type;
    compact_waiter: waiter_compact_type;    

begin
    reset(master);
    rewrite(compact);
    readCode(master, waiter);
    while (waiter.code <> MAX_VALUE) do
    begin
        compact_waiter.code := waiter.code;
        compact_waiter.total := 0;
        while (waiter.code = compact_waiter.code) do
        begin
            compact_waiter.total := compact_waiter.total + waiter.service_amount;
            readCode(master, waiter);
        end;
        write(compact, compact_waiter);
    end;
    close(master);
    close(compact); 
end;


var
    master: master_file; 
    compact: compact_file;
    waiter: waiter_type;    
    waiter_compact: waiter_compact_type;    

begin
    Assign(master, '../tmp/Ej6/master.dat'); 
    // create_master_file(master); 
    Assign(compact, '../tmp/Ej6/compact.dat');
    compactFile(master, compact);

    reset(compact); 
    while (not eof(compact)) do
    begin
        read(compact, waiter_compact);
        writeln('Waiter code: ', waiter_compact.code, ' Total: ', waiter_compact.total:0:2);
    end;
    close(compact); 
    {Output:
        Waiter code: 1 Total: 250.00
        Waiter code: 3 Total: 600.00
        Waiter code: 7 Total: 2450.00
    }  
end.
