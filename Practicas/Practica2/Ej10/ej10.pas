program ej10;
uses sysutils;

const
    N = 3; //For testing (N = 8)
    MAX_VALUE = 9999;

type
    product_detail = record
        code: integer;
        sold: integer;
    end;

    product_master = record
        code: integer;
        name: string;
        desc: string;
        price: real;
        sold: integer;
        max_sold: integer;
    end;

    master_file = file of product_master;
    detail_file = file of product_detail;
    detail_array = array[1..N] of product_detail;
    details = array[1..N] of detail_file;


procedure createMaster();
var
    master: master_file;
    rec_m: product_master;
    i: integer;
begin
    assign(master, '../tmp/Ej10/master.dat');
    rewrite(master);

    for i := 1 to 3 do 
    begin
        writeln('Enter details for product ', i);
        with rec_m do
        begin
            write('Code: '); readln(code);
            write('Name: '); readln(name);
            write('Description: '); readln(desc);
            write('Price: '); readln(price);
            write('Sold: '); readln(sold);
            write('Max sold: '); readln(max_sold);
        end;

        write(master, rec_m);
    end;

    close(master);
end;


procedure createDetails();
var
    dets: details;
    rec_d: product_detail;
    i, detailNumber: Integer;
begin
    for i := 1 to N do
    begin
        assign(dets[i], concat('../tmp/Ej10/det', IntToStr(i), '.dat'));
        rewrite(dets[i]);
    end;
    detailNumber := 1;


    for i := 1 to 5 do 
    begin
        writeln('Enter details for product ', i);
        with rec_d do
        begin
            write('Code: '); readln(code);
            write('Enter the extra sold amount for product ', i, ': '); readln(sold);
            write(dets[detailNumber], rec_d);

            // Choose the detail number to add the details
            writeln('Enter the detail number (1 to ', N, ') to add the details for employee ', i, ': ');
            readln(detailNumber);
        end;
    end;

    for i := 1 to N do
        close(dets[i]);
end;



procedure readCode(var det:detail_file; var data:product_detail);
begin
    if (not eof(det)) then
        read(det, data)
    else
        data.code := MAX_VALUE;
end;


function minIndexValue(const arr: detail_array): integer;
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


procedure minCode(var rec_det: detail_array; var min: product_detail; var dets: details);
var min_index: integer;
begin
    min_index := minIndexValue(rec_det);
    min := rec_det[min_index];
    readCode(dets[min_index], rec_det[min_index]);
end;


procedure updateMaster(var master: master_file; var dets: details);
var
    rec_m: product_master;
    rec_dets: detail_array;
    min: product_detail;
    aux, i,last_sold: integer;
begin
    // Init files
    for i:= 1 to N
    do begin
        assign(dets[i], concat('../tmp/Ej10/det', IntToStr(i), '.dat')); reset(dets[i]);
        readCode(dets[i], rec_dets[i]);
    end;
    WriteLn('Updating master file');    
    assign(master, '../tmp/Ej10/master.dat'); reset(master);


    read(master, rec_m);              
    minCode(rec_dets, min, dets);
    WriteLn('Products with better sales than before: ()');
    WriteLn('Product code | Name | Last max sold | New max sold');
    Writeln;

    while(min.code <> MAX_VALUE) do
    begin
        while(rec_m.code <> min.code)do
            read(master, rec_m);
        aux := min.code;
        while(aux = min.code)do 
        begin
            rec_m.sold := rec_m.sold + min.sold;
            minCode(rec_dets, min, dets);
        end;
        if(rec_m.sold > rec_m.max_sold) then
            begin
                last_sold := rec_m.max_sold;
                rec_m.max_sold := rec_m.sold;
                WriteLn(rec_m.code, ' | ', rec_m.name, ' | ', last_sold, ' | ', rec_m.sold);
            end;  
        seek(master, FilePos(master)-1);
        write(master, rec_m);
    end;

    for i:= 1 to N do
        close(dets[i]);

    close(master);
end;



var
    master: master_file;
    dets: details;


begin
    // createMaster();
    // createDetails();
    // updateMaster(master, dets); 

    WriteLn;
    WriteLn;
    // Assign(master, '../tmp/Ej10/master.dat'); reset(master);
    // while not eof(master) do
    // begin
    //     read(master, product);
    //     writeln(product.code, ' | ', product.name, ' | ', product.desc, ' | ', product.price, ' | ', product.sold, ' | ', product.max_sold);
    // end;
    // close(master);


    {Output:
        Product code | Name | Last max sold | New max sold
        1 | Microondas | 30 | 35
        3 | Lavarropas | 35 | 38
    }

end.