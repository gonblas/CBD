program ej2;

type
    file_type = file of integer;

var
    city_file: file_type;
    file_name: string;
    city_votes, min_votes, max_votes: integer;

begin
    write('Enter the file name: '); readln(file_name);
    assign(city_file, file_name); reset(city_file);

    min_votes := 32767; max_votes := -1;

    while (not eof(city_file)) do 
    begin
        read(city_file, city_votes);
        writeln(city_votes);
        if(city_votes < min_votes) then min_votes := city_votes;
        if(city_votes > max_votes) then max_votes := city_votes;
    end;

    writeln('Min: ', min_votes);
    writeln('Max: ', max_votes);

    close(city_file);
end.