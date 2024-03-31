program ej7;



type
    employee_type = record
        DNI: integer;
        name: string;
        surname: string;
        salary: real;
    end;

    employees_file = file of employee_type;

procedure textToBin(var txt: text; var bin: employees_file);
var
    employee: employee_type;
begin
    Reset(txt);
    Rewrite(bin);

    employee.DNI := 0;
    write(bin, employee);

    while (not eof(txt)) do begin
        with employee do begin
            readln(txt, DNI);
            readln(txt, name);
            readln(txt, surname);
            readln(txt, salary);
        end;
        write(bin, employee);
    end;

    Close(txt); Close(bin);
end;


procedure add_employee(var emp_file: employees_file; new: employee_type);
var
    rec: employee_type;
    posN: integer;
begin
    Assign(emp_file, '../tmp/Ej7/employees.dat'); Reset(emp_file);
    read(emp_file, rec);
    posN := -rec.DNI;

    if(posN = 0)then
        seek(emp_file, FileSize(emp_file))
    else begin
        seek(emp_file, posN); read(emp_file, rec);
        seek(emp_file, 0); write(emp_file, rec);
        seek(emp_file, posN);
    end;
    write(emp_file, new);
    Close(emp_file);
end;

procedure delete_employee(var emp_file: employees_file; DNI: integer);
var
    rec, cur_rec: employee_type;
    deleted_pos: integer;
begin
    Reset(emp_file);
    read(emp_file, rec);
    cur_rec.DNI := -1;
    while(not eof(emp_file) and (cur_rec.DNI <> DNI))do
        read(emp_file, cur_rec);

    if(cur_rec.DNI = DNI)then begin
        deleted_pos := FilePos(emp_file)-1;
        seek(emp_file, deleted_pos); write(emp_file, rec);
        cur_rec.DNI := -deleted_pos;
        seek(emp_file, 0); write(emp_file, cur_rec);
    end
    else writeln('Employee not found');

    Close(emp_file);
end;




var
    txt: text;
    bin: employees_file;
    emp: employee_type;

begin
    Assign(txt, '../tmp/Ej7/employees.txt');
    Assign(bin, '../tmp/Ej7/employees.dat');
    textToBin(txt, bin);


    delete_employee(bin, 3490);
    delete_employee(bin, 4901);
    delete_employee(bin, -10);

    emp.DNI := 1111;
    emp.name := 'Juan Roman';
    emp.surname := 'Riquelme';
    emp.salary := 10000.0;
    add_employee(bin, emp);

    emp.DNI := 2222;
    emp.name := 'Lionel';
    emp.surname := 'Messi';
    emp.salary := 20000.0;
    add_employee(bin, emp);

    Reset(bin);
    read(bin, emp);
    while(not eof(bin))do begin
        read(bin, emp);
        with emp do
            writeln(DNI, ' | ', name, ' | ', surname, ' | ', salary:0:2);
    end;
    Close(bin);
end.