program ej6;

const
    END_NRO = -1;
    DELETE_MARK = -1;

type
    str30 = string[30];
    sport_article_type = record
        nro: integer;
        desc: str30;
        color: str30;
        size: integer;
        stock: integer;
        price: real;
    end;

    sport_file = file of sport_article_type;


procedure init_file(var articles: sport_file);
var
    art: sport_article_type;
begin
    Assign(articles, '../tmp/Ej5/articles.dat'); Rewrite(articles);
    art.nro := 1; art.desc := 'T-Shirt'; art.color := 'White'; art.size := 1; art.stock := 10; art.price := 100;
    Write(articles, art);
    art.nro := 2; art.desc := 'Short'; art.color := 'Black'; art.size := 2; art.stock := 5; art.price := 200;
    Write(articles, art);
    art.nro := 3; art.desc := 'Socks'; art.color := 'Blue'; art.size := 3; art.stock := 20; art.price := 50;
    Write(articles, art);
    art.nro := 4; art.desc := 'Shoes'; art.color := 'Red'; art.size := 4; art.stock := 3; art.price := 500;
    Write(articles, art);
    art.nro := 5; art.desc := 'Cap'; art.color := 'Green'; art.size := 5; art.stock := 15; art.price := 150;
    Write(articles, art);
    Close(articles);
end;


procedure compact_file(var articles: sport_file; var new: sport_file);
var
    art: sport_article_type;
    new: sport_file;

begin
    Reset(articles);
    Rewrite(new);

    while(not eof(articles)) do
    begin
        read(articles, art);
        if(art.nro <> DELETE_MARK)then
        begin
            write(new, art);
        end;
    end;

    Close(articles); Close(new);

    Erase(articles);

    Rename(new, '../tmp/Ej6/articles.dat');
end;


var
    articles, new sport_file;
    art: sport_article_type;

begin
    Assign(articles, '../tmp/Ej6/articles.dat'); 
    Assign(new, '../tmp/Ej6/articles.tmp'); 
    compact_file(articles, new); 
    Reset(articles);
    while(not eof(articles)) do
    begin
        read(articles, art);
        writeln('Article number: ', art.nro, ' Description: ', art.desc, ' Color: ', art.color, ' Size: ', art.size, ' Stock: ', art.stock, ' Price: ', art.price:0:2);
    end;
    Close(articles);

    {Output: Se debe utilizar el archivo articles_original (con el articulo 1 y 3 eliminados).
        Article number: 2 Description: Short Color: Black Size: 2 Stock: 5 Price: 200.00
        Article number: 4 Description: Shoes Color: Red Size: 4 Stock: 3 Price: 500.00
        Article number: 5 Description: Cap Color: Green Size: 5 Stock: 15 Price: 150.00
    }
end.