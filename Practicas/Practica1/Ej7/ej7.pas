program ej7;
uses sysutils;

type
    student_type = record 
        DNI: longint;
        id_file: string;
        full_name: string;
        address: string;
        current_year: integer;
        date_of_birth: longint;
    end;
    student_tfile = file of student_type;



procedure textToBin(var bin_file: student_tfile; text_filename: string);
var
    student: student_type;
    text_file: text;
begin
    assign(text_file, text_filename); reset(text_file);
    assign(bin_file, '../tmp/students.dat'); rewrite(bin_file);
    while (not eof(text_file)) do
    begin
        readln(text_file, student.DNI);
        readln(text_file, student.id_file);
        readln(text_file, student.full_name);
        readln(text_file, student.address);
        readln(text_file, student.current_year, student.date_of_birth);

        write(bin_file, student);
    end;

    close(bin_file);
    close(text_file);
end;

procedure listStudents(var bin_file: Student_tfile);
var
    student: student_type;
    choice: char;
begin
    assign(bin_file, '../tmp/students.dat'); reset(bin_file);
    WriteLn('Enter a char for searching students: ');
    read(choice);
    while(not eof(bin_file))do
    begin
        read(bin_file, student);
        if(student.full_name[1] = choice)then
            WriteLn(student.full_name, ' | ', student.id_file, ' | ', student.current_year, ' | ', student.date_of_birth);
    end;
    close(bin_file);
end;


procedure listStudentsOnFile(var bin_file: Student_tfile);
var
    student: student_type;
    text_file: text;
begin
    assign(bin_file, '../tmp/students.dat'); reset(bin_file);
    Assign(text_file, '../tmp/students_to_graduate.txt'); Rewrite(text_file);
    while(not eof(bin_file))do
    begin
        read(bin_file, student);
        if(student.current_year = 5)then
            begin
                writeln(text_file, student.DNI);
                writeln(text_file, student.id_file);
                writeln(text_file, student.full_name);
                writeln(text_file, student.address);
                writeln(text_file, student.date_of_birth);
            end;
            
    end;
    close(bin_file);
    close(text_file);
end;


procedure addStudent(var bin_file: Student_tfile);
var
    student: student_type;
begin
    assign(bin_file, '../tmp/students.dat'); reset(bin_file);
    seek(bin_file, FileSize(bin_file));
    
    writeln('Enter student DNI:'); readln(student.DNI);
    writeln('Enter student id file:'); readln(student.id_file);
    writeln('Enter student full name:'); readln(student.full_name);
    writeln('Enter student address:'); readln(student.address);
    writeln('Enter student current year:'); readln(student.current_year);
    writeln('Enter student date of birth:'); readln(student.date_of_birth);
    write(bin_file, student);

    close(bin_file);
end;



procedure modifyStudent(var bin_file: Student_tfile);
var
    student: student_type;
    search_id: string;
    found_id: boolean;
    new_year: integer;
begin
    assign(bin_file, '../tmp/students.dat'); reset(bin_file);
    repeat
        write('Enter student ID file to modify: ');
        readln(search_id);
    until Length(search_id) > 0;

    found_id := false;

    while (not eof(bin_file) and (not found_id)) do
    begin
        read(bin_file, student);
        if student.id_file = search_id then
        begin
            found_id := true;

            writeln('~~~Enter new current year~~~');
            write('Current year (current:', student.current_year, '): ');
            readln(new_year);
            if (new_year <> student.current_year) then
            begin
                student.current_year := new_year;
                seek(bin_file, FilePos(bin_file) - 1);
                write(bin_file, student);
                writeln('Student information modified successfully!');
            end
        end;
    end;
    close(bin_file);

    if not found_id then
        writeln('ID file not found in the file.');
end;


var
    bin_file: Student_tfile;
begin
    textToBin(bin_file, '../tmp/students.txt');
    listStudents(bin_file);
    listStudentsOnFile(bin_file);
    addStudent(bin_file);
    modifyStudent(bin_file);
end.