program ej7;

Uses sysutils;  

const   
    N = 3;
    MAX_VALUE = 9999;   


type
    str40 = string[40];
    product_data = record
        code: integer;
        name: str40;
        description: str40;
        price: real;
        stock: integer;
        min_stock: integer;
    end;

    sale_data = record
        code: integer;
        units: integer;
    end;

    master_file = file of product_data; 
    detail_file = file of sale_data;
    detail_array = array[1..N] of sale_data;
    details = array[1..N] of detail_file;


procedure textToMaster(var text_file: text; var master: master_file);
var
    product: product_data;  
begin
    reset(text_file);
    rewrite(master);
    while not eof(text_file) do
    begin
        with product do
        begin
            readln(text_file, code);
            readln(text_file, name);    
            readln(text_file, description); 
            readln(text_file, price);   
            readln(text_file, stock);   
            readln(text_file, min_stock);
        end; 
        write(master, product);
    end;

    close(text_file);
    close(master);
end;

procedure createDetFiles(var dets: details);
var
    rec_d: sale_data;   
    i, detailNumber: Integer;
begin
    for i := 1 to N do
        rewrite(dets[i]);


    WriteLn('Creating detail files...' );

    for i := 1 to 5 do
    begin
        WriteLn('Enter sales details for product ', i, ':');
        Write('Product code: '); ReadLn(rec_d.code);
        Write('Number of units sold: '); ReadLn(rec_d.units);

        writeln('Enter the detail number (1 to ', N, ') to add the info for film ', i, ': ');
        readln(detailNumber);

        if(detailNumber < 1) or (detailNumber > N) then 
            writeln('Invalid detail number.')
        else    
            write(dets[detailNumber], rec_d);
    end;

    for i := 1 to N do
        close(dets[i]);

    writeln('Detail Files created successfully.');
end;




procedure readCode(var det:detail_file; var data:sale_data);
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

procedure minCode(var rec_det: detail_array; var min: sale_data; var dets: details);
var min_index: integer;
begin
    min_index := minIndexValue(rec_det);
    min := rec_det[min_index];
    readCode(dets[min_index], rec_det[min_index]);
end;


procedure updateMaster(var master: master_file; var dets: details);
var
    rec_m: product_data;
    rec_dets: detail_array;
    min: sale_data;
    aux, i: integer;
begin
    // Init files
    for i:= 1 to N
    do begin
        assign(dets[i], concat('../tmp/Ej7/det', IntToStr(i), '.dat')); reset(dets[i]);
        readCode(dets[i], rec_dets[i]);
    end;
    WriteLn('Updating master file');    
    assign(master, '../tmp/Ej7/products.dat'); reset(master);


    read(master, rec_m);              
    minCode(rec_dets, min, dets);
    

    while(min.code <> MAX_VALUE) do
    begin
        while(rec_m.code <> min.code)do
            read(master, rec_m);
        aux := min.code;
        while(aux = min.code)do 
        begin
            rec_m.stock := rec_m.stock - min.units; //Siempre existe stock para las ventas de los archivos detalle
            minCode(rec_dets, min, dets);
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
    text_file: text;
    product: product_data;  
    i: integer;
begin
    Assign(text_file, '../tmp/Ej7/products.txt');
    Assign(master, '../tmp/Ej7/products.dat'); 
    // textToMaster(text_file, master); 
    for i := 1 to N do
        assign(dets[i], concat('../tmp/Ej7/det', IntToStr(i), '.dat'));
    // createDetFiles(dets);
    // updateMaster(master, dets); 

    reset(master);    
    while not eof(master) do
    begin
        read(master, product);
        with product do
        begin
            WriteLn('Code: ', code);
            WriteLn('Name: ', name);
            WriteLn('Description: ', description);
            WriteLn('Price: ', price:0:2);
            WriteLn('Stock: ', stock);
            WriteLn('Min Stock: ', min_stock);
            WriteLn('------------------------');
        end;
    end; 
    close(master);

    {Output:
        Code: 1234
        Name: Taza de cerámica
        Description: Taza de cerámica con diseño floral.
        Price: 10.99
        Stock: 98
        Min Stock: 10
        ------------------------
        Code: 3456
        Name: Juego de herramientas
        Description: Set de herramientas profesionales de 20 
        Price: 8.25
        Stock: 10
        Min Stock: 15
        ------------------------
        Code: 5678
        Name: Libro de cocina
        Description: Libro de cocina con recetas internaciona
        Price: 15.75
        Stock: 50
        Min Stock: 5
        ------------------------
        Code: 7890
        Name: Caja de chocolates
        Description: Caja surtida de chocolates belgas.
        Price: 12.50
        Stock: 30
        Min Stock: 10
        ------------------------
        Code: 9012
        Name: Camiseta de algodón
        Description: Camiseta de algodón orgánico en varios
        Price: 20.49
        Stock: 70
        Min Stock: 8
        ------------------------

    }

end.