program ej2;


type
    vehicle_type = record
        code: integer;
        plate: string;
        motor: string;
        doors: integer;
        price: real;
        desc: string;
    end;
    vehicle_file = file of vehicle_type;


procedure init_file(var v_file: vehicle_file);
var
    v: vehicle_type;
    i: integer;
begin
    Rewrite(v_file);

    writeln('~~~Enter vehicle data~~~');
    v.code := 0;  //0 is the head of the deleted register stack
    write(v_file, v);
    for i:= 1 to 5 do
    begin
        writeln;
        writeln('Enter vehicle code: '); readln(v.code);
        writeln('Enter vehicle plate: '); readln(v.plate);
        writeln('Enter vehicle motor: '); readln(v.motor);
        writeln('Enter vehicle doors: '); readln(v.doors);
        writeln('Enter vehicle price: '); readln(v.price);
        writeln('Enter vehicle description: '); readln(v.desc);
        write(v_file, v);
    end;

    close(v_file);
end;


procedure add_vehicle(var v_file: vehicle_file; new_v: vehicle_type);
var
    rec: vehicle_type;
    freeN: integer;
begin
    Reset(v_file);
    read(v_file, rec);
    freeN := rec.code;
    if(freeN = 0) then
        seek(v_file, filesize(v_file))
    else begin
        seek(v_file, freeN); read(v_file, rec);
        seek(v_file, 0); write(v_file, rec);
        seek(v_file, freeN);
    end;
    write(v_file, new_v);
    close(v_file);
end;


procedure delete_vehicle(var v_file: vehicle_file; code_to_delete: integer);
var
    rec, cur_rec: vehicle_type;
    new_free: integer;

begin
    Reset(v_file);
    read(v_file, rec);
    cur_rec.code:= -1;
    while(not ((cur_rec.code = code_to_delete) or eof(v_file))) do
        Read(v_file, cur_rec);
    
    if(cur_rec.code = code_to_delete)then begin
        new_free := FilePos(v_file) - 1;
        seek(v_file, new_free); write(v_file, rec);
        cur_rec.code := new_free;
        seek(v_file, 0); write(v_file, cur_rec);
    end
    else begin
        writeln('Vehicle not found.');
    end;
    close(v_file);
end;



var
    v_file: vehicle_file;
    v: vehicle_type;

begin
    Assign(v_file, '../tmp/Ej2/vehicles.dat');
    // init_file(v_file);

    // delete_vehicle(v_file, 20);
    // delete_vehicle(v_file, 1);
    // primero y ultimos eliminados, deben estar el 1200 y 1201 en su lugar, 
    // v.code := 1200;
    // v.plate := 'AAA123';
    // v.motor := '1.6';
    // v.doors := 4;
    // v.price := 10000;
    // v.desc := 'An awesome car';
    // add_vehicle(v_file, v);
    // v.code := 1201;
    // v.plate := 'BBB123';
    // v.motor := '1.8';
    // v.doors := 2;
    // v.price := 20000;
    // v.desc := 'Another awesome car';
    // add_vehicle(v_file, v);

    // Reset(v_file);
    // read(v_file, v);
    // Writeln('Head of the deleted register stack: ', v.code);
    // while(not eof(v_file)) do
    // begin
    //     WriteLn;
    //     read(v_file, v);
    //     writeln('Code: ', v.code);
    //     writeln('Plate: ', v.plate);
    //     writeln('Motor: ', v.motor);
    //     writeln('Doors: ', v.doors);
    //     writeln('Price: ', v.price:0:2);
    //     writeln('Description: ', v.desc);
    //     writeln;
    // end;
    // close(v_file);

    {Output: Utilizar el archivo de vehicles_original.dat
        Code: 1200
        Plate: AAA123
        Motor: 1.6
        Doors: 4
        Price: 10000.00
        Description: An awesome car


        Code: 12
        Plate: EEE454
        Motor: 3.3
        Doors: 2
        Price: 234.00
        Description: 


        Code: 90
        Plate: TTT888
        Motor: 2.2
        Doors: 6
        Price: 9000.00
        Description: 


        Code: 1201
        Plate: BBB123
        Motor: 1.8
        Doors: 2
        Price: 20000.00
        Description: Another awesome car


        Code: 18
        Plate: RRR222
        Motor: 9.8
        Doors: 2
        Price: 1200.00
        Description: 

    }
end.