program ej3;

const
    END_CODE = -1;
    MARK = -1;

type
    product_type = record
        code: integer;
        name: string[30];
        desc: string[50];
        stock: integer;
    end;

    product_file = file of product_type;

procedure textToBin(var t_file: text; var bin: product_file);
var
    bin: product_file;
    prod: product_type;
begin
    Reset(t_file);
    Rewrite(bin);

    while not eof(t_file) do begin
        with prod do begin
            readln(t_file, code);
            readln(t_file, name);
            readln(t_file, desc);
            readln(t_file, stock);
        end;
        write(bin,prod);
    end;

    Close(t_file); Close(bin);
end;


procedure logical_delete(var products: product_file);
var
    rec: product_type;
    code, delete_pos: integer;

begin
    Reset(products);
    writeln('Enter the product code to delete (or -1 to finish): '); ReadLn(code);
    rec.code := -1;

    while(code <> END_CODE) do
    begin
        seek(products, 0);
        while((not eof(products)) and (rec.code <> code)) do
            read(products, rec);
        if(rec.code = code)then begin
            delete_pos := filepos(products)-1;
            rec.stock := MARK;
            seek(products, delete_pos);
            write(products, rec);
        end;
        writeln('Enter the product code to delete (or -1 to finish): '); ReadLn(code);
        rec.code := -1;
    end;
    close(products);
end;


procedure add_product(var products: product_file);
var
    rec: product_type;

begin
    Reset(products);
    seek(products, FileSize(products));
    writeln('Enter the product code to add (or -1 to finish): '); ReadLn(rec.code);

    while(rec.code <> END_CODE) do
    begin
        writeln('Enter the product name: '); ReadLn(rec.name);
        writeln('Enter the product description: '); ReadLn(rec.desc);
        writeln('Enter the product stock: '); ReadLn(rec.stock);
        write(products, rec);
        writeln('Enter the product code to add (or -1 to finish): '); ReadLn(rec.code);
    end;
    close(products);
end;

procedure textToBin2(var t_file: text; var bin: product_file);
var
    prod: product_type;
begin
    Reset(t_file);
    Rewrite(bin);

    prod.code := 0;
    prod.stock := -1;
    write(bin,prod);

    while not eof(t_file) do begin
        with prod do begin
            readln(t_file, code);
            readln(t_file, name);
            readln(t_file, desc);
            readln(t_file, stock);
        end;
        write(bin,prod);
    end;

    Close(t_file); Close(bin);
end;

procedure add_product2(var v_file: product_file; new_v: product_type);
var
    rec: product_type;
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


procedure delete_product(var v_file: product_file; code_to_delete: integer);
var
    rec, cur_rec: product_type;
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
        cur_rec.stock := -1;
        seek(v_file, 0); write(v_file, cur_rec);
    end
    else writeln('Product not found.');
    close(v_file);
end;

var
    text_file: text;
    products: product_file;
    prod: product_type;

begin
    Assign(text_file,'../tmp/Ej3/products.txt'); 

    //Inciso A
    // Assign(products,'../tmp/Ej3/products_a.dat'); 
    // textToBin(text_file, products);

    //Inciso B
    // logical_delete(products);

    //Inciso C
    // add_product(products);
    // Reset(products);
    // while(not eof(products)) do begin
    //     read(products, prod);
    //     if(prod.stock >= 0) then
    //         writeln('Code: ', prod.code, ' | Name: ', prod.name, ' | Desc: ', prod.desc, ' | Stock: ', prod.stock);
    // end;

    //Inciso F
    Assign(products,'../tmp/Ej3/products_f.dat'); 
    textToBin2(text_file, products);

    //Inciso D
    delete_product(products, 2);
    delete_product(products, 5);


    //Inciso E
    prod.code := 10;
    prod.name := 'Pollera';
    prod.desc := 'Pollera de jean';
    prod.stock := 10;
    add_product2(products, prod);

    Reset(products);
    while(not eof(products)) do begin
        read(products, prod);
        if(prod.stock >= 0) then
            writeln('Code: ', prod.code, ' | Name: ', prod.name, ' | Desc: ', prod.desc, ' | Stock: ', prod.stock);
    end;
    Close(products);

    {Inciso G:
        Sin utilizacion de recuperacion de espacio libre:
        - Ventajas: Performance, solo se marca el registro como eliminado y no se mueve nada.
        - Desventajas: Si no se utiliza la tecnica de recuperacion de espacio libre siempre nos quedan registros vacios en el archivo, lo cual implica utilizar espacio de más en el disco. Al no utilizar la tecnica de recuperacion de espacio libre, el archivo crece indefinidamente.

        Utilizacion de recuperacion de espacio libre:
        - Ventajas: Se reutiliza el espacio de los registros eliminados, lo cual implica un uso más eficiente del espacio en disco.
        - Desventajas: Se debe llevar un registro de los espacios libres, lo cual implica un costo adicional en tiempo y espacio.
    }
end.