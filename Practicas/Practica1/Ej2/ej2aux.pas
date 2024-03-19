program ej2aux;

const
    finish = -1;

type
    file_type = file of integer;

var
    city_file: file_type;
    cityVotes: integer;

begin
    assign(city_file, 'votes.dat');
    rewrite(city_file);

    writeln('Enter the number of Votes (or -1 to finish): '); readln(cityVotes);

    while (cityVotes <> finish) do 
    begin
        write(city_file, cityVotes);
        writeln('Enter the number of Votes (or -1 to finish): '); read(cityVotes);
    end;

    close(city_file);
    writeln('File creation complete.');
end.