program ej7;
uses Sysutils;

type
    student_type = record 
        DNI: integer;
        id_file: string;
        full_name: string;
        address: string;
        current_year: integer;
        date_of_birth: longint;
    end;
    student_tfile = file of student_type;



procedure text_to_bin(var bin_file: student_tfile; text_filename: string);
var
    student: student_type;
    text_file: text;
begin
    assign(text_file, text_filename); reset(text_file);
    assign(bin_file, '../tmp/alumnos.dat'); rewrite(bin_file);

    while not eof(text_file) do
    begin
        readln(text_file, student.DNI, student.id_file);
        writeln(student.DNI, '   ',  student.id_file);
        readln(text_file, student.full_name);
        readln(text_file, student.address);
        readln(text_file, student.current_year, student.date_of_birth);

        write(bin_file, student);
    end;

    close(text_file);
end;

procedure list_students(var bin_file: Student_tfile);
var
    student: student_type;
    choice: char;
begin
    seek(bin_file, 0);
    WriteLn('Enter a char for searching students: ');
    read(choice);
    while(not eof(bin_file))do
    begin
        read(bin_file, student);
        if(student.full_name[1] = choice)then
            WriteLn(student.full_name, ', ', student.DNI,', ', student.id_file, ', ', student.address, ', ', student.current_year, ', ', student.date_of_birth, '.');
    end;
end;


procedure list_students_on_file(var bin_file: Student_tfile);
var
    student: student_type;
    text_file: text;
begin
    Assign(text_file, 'alumnosAEgresar.txt'); Rewrite(text_file);
    seek(bin_file, 0);
    while(not eof(bin_file))do
    begin
        read(bin_file, student);
        if(student.current_year = 5)then
            begin
                writeln(text_file, student.DNI, student.id_file, student.full_name);
                writeln(text_file, student.address);
                writeln(text_file, student.current_year, student.date_of_birth);
            end;
            
    end;
end;


procedure add_student(var bin_file: Student_tfile);
var
    student: student_type;
    input: string;
begin
    seek(bin_file, FileSize(bin_file));
    
    writeln('Enter student DNI:');
    readln(input);
    student.DNI := StrToIntDef(input, 0);
    
    writeln('Enter student id file:');
    readln(student.id_file);
    
    writeln('Enter student full name:');
    readln(student.full_name);
    
    writeln('Enter student address:');
    readln(student.address);
    
    writeln('Enter student current year:');
    readln(input);
    student.current_year := StrToIntDef(input, 0);
    
    writeln('Enter student date of birth:');
    readln(input);
    student.date_of_birth := StrToIntDef(input, 0);
    
    write(bin_file, student);
end;



procedure modifyStudent(var bin_file: Student_tfile);
var
    student: student_type;
    search_id: string;
    found_id: boolean;
    new_year: integer;
begin
    repeat
        write('Enter student ID file to modify: ');
        readln(search_id);
    until Length(search_id) > 0;

    found_id := false;

    seek(bin_file, 0);
    while not eof(bin_file) do
    begin
        read(bin_file, student);
        if student.id_file = search_id then
        begin
            found_id := true;

            writeln('~~~Enter new current year (or leave blank to keep unchanged)~~~');
            write('Current year (current:', student.current_year, '): ');
            readln(new_year);
            if new_year <> student.current_year then
            begin
                student.current_year := new_year;
                seek(bin_file, FilePos(bin_file) - 1);
                write(bin_file, student);
                writeln('Student information modified successfully!');
            end
        end;
    end;
    seek(bin_file, FileSize(bin_file));
    close(bin_file);

    if not found_id then
        writeln('ID file not found in the file.');
end;


var
    bin_file: Student_tfile;
begin
    text_to_bin(bin_file, '../tmp/alumnos.txt');
    // list_students(bin_file);
    // list_students_on_file(bin_file);
    // add_student(bin_file);
    // modifyStudent(bin_file);
    // close(bin_file);
end.