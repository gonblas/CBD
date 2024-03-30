program ej6;
uses Sysutils;

type
    str13 = string[13];
    book_record = record
        ISBN: str13;
        title: string;
        year: Integer;
        publisher: string;
        gender: string;
    end;
    book_file = file of book_record;
    

procedure textToBinFile(var bin_file: book_file; text_filename: string);
var
    book: book_record;
    text_file: text;
    text_line: string;
begin
    assign(text_file, text_filename); 
    reset(text_file);
    rewrite(bin_file);

    while not eof(text_file) do
    begin
        readln(text_file, text_line);
        book.ISBN := copy(text_line, 1, 13);
        book.title := copy(text_line, 15, length(text_line));

        readln(text_file, text_line);
        book.year := StrToInt(copy(text_line, 1, 4));
        book.publisher := copy(text_line, 6, length(text_line));

        readln(text_file, text_line);
        book.gender := text_line;

        write(bin_file, book);
    end;

    close(text_file);
end;



procedure addBook(var bin_file: book_file);
var
    book: book_record;
    text_line: string;
begin
    repeat  
        write('Enter ISBN (13 digits): ');
        readln(text_line);
    until Length(text_line) = 13;

    book.ISBN := text_line;

    write('Enter book title: ');
    readln(book.title);

    write('Enter book gender: ');
    readln(book.gender);

    write('Enter publisher name: ');
    readln(book.publisher);

    write('Enter publication year: ');
    readln(book.year);

    Reset(bin_file);
    Seek(bin_file, filesize(bin_file));
    write(bin_file, book);
    Close(bin_file);

    writeln('Book added successfully!');
end;

procedure modifyBook(var bin_file: book_file);
var
    book: book_record;
    text_line: string;
    foundISBN: boolean;  
begin
    repeat  
        write('Enter ISBN (13 digits) to modify: ');
        readln(text_line);
    until Length(text_line) = 13;

    foundISBN := false;  

    reset(bin_file); 
    while (not eof(bin_file)) do 
    begin
        read(bin_file, book);  
        if book.ISBN = text_line then  
        begin
            foundISBN := true;  

            write('~~~Enter new book data (or leave blank to keep unchanged)~~~');
            writeln;

            write('Book title (current:', book.title, '): ');
            readln(text_line);
            if (text_line <> '') then  
                book.title := text_line;

    
            write('Book gender (current:', book.gender, '): ');
            readln(text_line);
            if (text_line <> '') then
                book.gender := text_line;

            write('publisher name (current:', book.publisher, '): ');
            readln(text_line);
            if (text_line <> '') then
                book.publisher := text_line;

            write('Publication year (current:', book.year, '): ');
            readln(text_line);
            if (text_line <> '') then  
                book.year := StrToInt(text_line);  
            seek(bin_file, FilePos(bin_file) - 1); 
            write(bin_file, book);
            writeln('Book information modified successfully!');
            break;
        end;  
    end;

    close(bin_file);

    if not foundISBN then 
        writeln('ISBN not found in the file.');
end;



var
    text_file: text;
    bin_file: file of book_record;
    user_choice: char;


begin 
    assign(bin_file, '../tmp/libros.dat');
    textToBinFile(bin_file, '../tmp/libros.txt');
    while(true)do
        begin
            repeat
                writeln('Book Management Menu:');
                writeln('(M)odify a book');
                writeln('(A)dd a new book');
                writeln('(E)xit');
                write('Enter your choice: ');
                readln(user_choice);
            until ((user_choice = 'M') or (user_choice = 'm') or (user_choice = 'A') or (user_choice = 'a') or (user_choice = 'E') or (user_choice = 'e')); 

            case user_choice of
                'M', 'm':
                    modifyBook(bin_file);
                'A', 'a':
                    addBook(bin_file);
                'E', 'e':
                    begin
                        writeln('Exiting Book Management System.');
                        break;
                    end;
            end;
        end;
end.