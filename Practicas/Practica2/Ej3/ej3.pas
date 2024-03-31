program ej3;
uses Sysutils;


const
    N = 3;
    INVALID_CODE = 9999;

type
    footwear_detail = record
        code: integer;
        number: integer;
        amount_sold: integer;
    end;

    footwear_master = record
        code: integer;
        number: integer;
        desc: string[40];
        price: real;
        color: string[20];
        stock: integer;
        min_stock: integer;
    end;

    detail_type = file of footwear_detail;
    master_type = file of footwear_master;

    details = array[1..N] of detail_type;
    det_array_type = array[1..N] of footwear_detail;


procedure createFiles(var master: master_type; var dets: details);
var
    rec_m: footwear_master;
    rec_d: footwear_detail;
    i, detailNumber: integer;
begin
    for i := 1 to N do
        rewrite(dets[i]);

    
    WriteLn('Enter details for 5 footwear items');  
    rewrite(master);


    for i := 1 to 2 do // 5 footwear items
    begin
        writeln('Enter details for footwear item ', i);
        with rec_m do
        begin
            write('Code: ');
            readln(code);
            write('Number: ');
            readln(number);
            write('Description: ');
            readln(desc);
            write('Price: ');
            readln(price);
            write('Color: ');
            readln(color);
            write('Stock: ');
            readln(stock);
            write('Minimum Stock: ');
            readln(min_stock);
        end;

        write(master, rec_m);

        writeln('Enter the detail number (1 to ', N, ') to add the details for footwear item ', i, ': ');
        readln(detailNumber);

        writeln('Enter amount sold for footwear item ', i, ': ');
        readln(rec_d.amount_sold);

        rec_d.code := rec_m.code;

        rec_d.number := rec_m.number;   

        write(dets[detailNumber], rec_d);
    end;

    // Close files
    for i := 1 to N do
        close(dets[i]);

    close(master);
    writeln('Files created successfully.');
end;



procedure readCode(var det:detail_type; var data:footwear_detail);
begin
    if (not eof(det)) then
        read(det, data)
    else
    begin
        data.code := INVALID_CODE;
        data.number := INVALID_CODE;
    end;
end;


function minIndexValue(const arr: det_array_type): integer;
var
    i, min_index: integer;
    min_footwear: footwear_detail;
begin
    min_footwear := arr[1];
    min_index := 1;
    
    for i := 1 to N do
    begin
        if arr[i].code < min_footwear.code then 
        begin
            min_footwear := arr[i];
            min_index := i
        end
        else    if((arr[i].code = min_footwear.code) and (arr[i].number < min_footwear.number))then
                begin
                    min_footwear := arr[i];
                    min_index := i
                end;
    end;
    minIndexValue := min_index;
end;

procedure minCode(var rec_dets: det_array_type; var min: footwear_detail; var dets: details);
var min_index, i: integer;
begin
    min_index := minIndexValue(rec_dets); 
    min := rec_dets[min_index]; 
    readCode(dets[min_index], rec_dets[min_index]);
end;


procedure updateMaster(var master: master_type; var dets: details);
var
    rec_m: footwear_master;
    rec_dets: det_array_type;
    min: footwear_detail;
    aux_code, aux_number, i: integer;
    text_file: text;
begin
    // Init files
    for i:= 1 to N
    do begin
        reset(dets[i]); readCode(dets[i], rec_dets[i]);
    end;
    reset(master);
    rewrite(text_file);

    read(master, rec_m);              
    minCode(rec_dets, min, dets); 

    WriteLn('Footwears without sales: ');
    while(min.code <> INVALID_CODE) do
    begin
        while((rec_m.code <> min.code) or (rec_m.number <> min.number))do
        begin
            // writeln('Code: ', rec_m.code, ' Number: ', rec_m.number, ' has not been sold');
            read(master, rec_m);
        end;
        aux_code := min.code; aux_number := min.number; 
        while((aux_code = min.code) and (aux_number = min.number))do 
        begin
            aux_number := min.number;
            
            WriteLn('rec_m.stock: ', rec_m.stock, ' min.amount_sold: ', min.amount_sold, ' rec_m.stock - min.amount_sold: ', rec_m.stock - min.amount_sold);
            if(rec_m.stock - min.amount_sold < 0)then 
            begin
                writeln('Code: ', rec_m.code, ' Number: ', rec_m.number, ' has not been sold')
            end
            else 
            begin
                rec_m.stock := rec_m.stock - min.amount_sold;
                if(rec_m.stock < rec_m.min_stock)then
                begin
                    WriteLn(text_file, ' ', rec_m.code, ' ', rec_m.number, ' ', rec_m.stock, ' ', rec_m.min_stock);
                end;
            end;
            minCode(rec_dets, min, dets);
        end;
        // Update master
        seek(master, FilePos(master)-1);
        write(master, rec_m);
    end;

    // Close files
    for i:= 1 to N do
        close(dets[i]);

    close(master);
    close(text_file);
end;



var
    master: master_type;
    dets: details;  
    text_file: text;
    i: integer;

begin
    for i:= 1 to N do
        assign(dets[i], concat('../tmp/Ej3/det', IntToStr(i), '.dat')); 
    
    assign(master, '../tmp/Ej3/master.dat'); 
    assign(text_file, '../tmp/Ej3/footwearoutofstock.txt'); 
    createFiles(master, dets);
    updateMaster(master, dets, text_file);
end.