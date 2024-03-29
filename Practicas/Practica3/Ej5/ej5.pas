program ej5;

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


procedure logical_delete(var articles: sport_file);
var
    art: sport_article_type;
    txt: text;
    nro_to_delete: integer;

begin
    Assign(articles, '../tmp/Ej5/articles.dat'); Reset(articles);
    Assign(txt, '../tmp/Ej5/articles_deleted.txt'); Rewrite(txt);
    writeln('Enter the article number to delete (or -1 to finish): '); read(nro_to_delete);

    while(nro_to_delete <> END_NRO) do
    begin
        art.nro := -1;
        while((not eof(articles)) and (art.nro <> nro_to_delete)) do
            read(articles, art);

        if(art.nro = nro_to_delete)then begin
            Writeln(txt, 'Article number: ', art.nro, ' Description: ', art.desc, ' Color: ', art.color, ' Size: ', art.size, ' Stock: ', art.stock, ' Price: ', art.price:0:2);
            art.nro := DELETE_MARK;
            seek(articles, FilePos(articles)-1);
            write(articles, art);
        end
        else writeln('Article not found');
        writeln('Enter the article number to delete (or -1 to finish): '); read(nro_to_delete);
        seek(articles, 0);
    end;
    Close(articles); Close(txt);
end;


var
    articles: sport_file;
    art: sport_article_type;

begin
    init_file(articles);
    logical_delete(articles);
    Assign(articles, '../tmp/Ej5/articles.dat'); Reset(articles);
    while(not eof(articles)) do
    begin
        read(articles, art);
        if(art.nro <> DELETE_MARK)then
            writeln('Article number: ', art.nro, ' Description: ', art.desc, ' Color: ', art.color, ' Size: ', art.size, ' Stock: ', art.stock, ' Price: ', art.price:0:2);
    end;
    Close(articles);
end.