program ej5;

const
    FINISH = 'ZZZ';

type
    str30 = string[30];
    population_type = record
        district: str30;
        town: str30;
        neighborhood: str30;
        children: integer;
        adults: integer;
    end;

    population_file_type = file of population_type;

procedure createFile(var pop_file: population_file_type);
var
    i: integer;
    pop_rec: population_type;
begin
    Assign(pop_file, '../tmp/Ej5/population_data.dat');
    Rewrite(pop_file);
    
    for i := 1 to 3 do
    begin
        WriteLn('Enter population details for entry ', i, ':');
        Write('District: '); ReadLn(pop_rec.district);
        Write('Town: '); ReadLn(pop_rec.town);
        Write('Neighborhood: '); ReadLn(pop_rec.neighborhood);
        Write('Number of children: '); ReadLn(pop_rec.children);
        Write('Number of adults: '); ReadLn(pop_rec.adults);

        WriteLn;
        Write(pop_file, pop_rec);
    end;

    Close(pop_file);
end;

procedure readCode(var pop_file:population_file_type; var data:population_type);
begin
    if (not eof(pop_file)) then
        read(pop_file, data)
    else
        data.district := FINISH;
end;

procedure createReport(var pop_file: population_file_type);
var 
    pop_rec: population_type;
    tot_children_district, tot_adults_district, tot_children_town, tot_adults_town: integer;    
    prev_district, prev_town: str30;
begin
    Assign(pop_file, '../tmp/Ej5/population_data.dat'); reset(pop_file);

    readCode(pop_file, pop_rec);
    tot_children_district := 0; tot_adults_district := 0;
    tot_children_town := 0; tot_adults_town := 0;
    WriteLn;

    while(pop_rec.district <> FINISH)do
    begin
        prev_district := pop_rec.district;
        tot_children_district := 0; tot_adults_district := 0;
        WriteLn('District: ', pop_rec.district);
        while((pop_rec.district = prev_district))do
        begin
            prev_town := pop_rec.town;
            tot_children_town := 0; tot_adults_town := 0; 
            WriteLn('Town: ', pop_rec.town);

            while ((pop_rec.district = prev_district) and (prev_town = pop_rec.town)) do
            begin
                tot_children_town := tot_children_town + pop_rec.children;
                tot_adults_town := tot_adults_town + pop_rec.adults;    
                WriteLn('Neighborhood: ', pop_rec.neighborhood, '  #children: ', pop_rec.children, '  #adults: ', pop_rec.adults);   
                readCode(pop_file, pop_rec);  
            end;

            tot_children_district := tot_children_district + tot_children_town;
            tot_adults_district := tot_adults_district + tot_adults_town;
            WriteLn('Total children in ', prev_town, ': ', tot_children_town, '  Total adults in ', prev_town, ': ', tot_adults_town);    

            WriteLn;
        end;
        WriteLn('Total children in ', prev_district, ': ', tot_children_district, '  Total adults in ', prev_district, ': ', tot_adults_district);
    end;

    close(pop_file);
end;

var
    pop_file: population_file_type;
begin
    // createFile(pop_file);
    createReport(pop_file);
end.


