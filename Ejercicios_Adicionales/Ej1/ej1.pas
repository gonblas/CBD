program ej1;
uses
    sysutils;

const
    N = 3;
    HIGH_VALUE = 9999;

type
    votes_detail = record
        prov_code: integer;
        loc_code: integer;
        valid: integer;
        blank: integer;
        invalid: integer;
    end;

    votes_master = record
        prov_code: integer;
        prov_name: string;
        valid: integer;
        blank: integer;
        invalid: integer;
    end;

    detail_file = file of votes_detail;
    master_file = file of votes_master;
    det_file_array = array[1..N] of detail_file;
    det_votes_array = array[1..N] of votes_detail;


procedure readCode(var det: detail_file; var rec_det: votes_detail);
begin
    if(not eof(det))then
        read(det, rec_det)
    else begin
        rec_det.prov_code := HIGH_VALUE;
        rec_det.loc_code := HIGH_VALUE;
    end;
end;

function minIndex(const arr: det_votes_array): integer;
var
    i, min_prov, min_loc, min_index: integer;
begin
    min_prov := arr[1].prov_code; min_loc := arr[1].loc_code;
    min_index := 1;

    for i:= 2 to N do
    begin
        if(arr[i].prov_code < min_prov)then begin
            min_prov := arr[i].prov_code;
            min_loc := arr[i].loc_code;
            min_index := i;
        end
        else begin
            if((arr[i].prov_code = min_prov) and (arr[i].loc_code < min_loc))then begin
                min_loc := arr[i].loc_code;
                min_index := i;
            end;
        end;
    end;
    minIndex := min_index;
end;


procedure minCode(var arr: det_votes_array; var min: votes_detail; var dets: det_file_array);
var
    idx: integer;
begin
    idx := minIndex(arr);
    min := arr[idx];
    readCode(dets[idx], arr[idx]);
end;


procedure updateMaster(var master: master_file; dets: det_file_array; var txt: text);
var
    rec_m: votes_master;
    arr: det_votes_array;
    min: votes_detail;
    i, tot_votes, tot_valid, tot_invalid, tot_blank, cur_valid, cur_invalid, cur_blank: integer;

begin
    for i:= 1 to N
    do begin
        reset(dets[i]); readCode(dets[i], arr[i]);
    end;
    reset(master);
    rewrite(txt);


    tot_votes := 0; tot_valid := 0; tot_invalid := 0; tot_blank := 0;
    read(master, rec_m);
    minCode(arr, min, dets);
    writeln('Processing province ', rec_m.prov_code, ' - ', rec_m.prov_name);
    writeln('min prov code: ', min.prov_code, ' min loc code: ', min.loc_code);

    while(min.prov_code <> HIGH_VALUE)do
    begin
        while(rec_m.prov_code <> min.prov_code)do begin
            read(master, rec_m);
        end;
        cur_valid := 0; cur_invalid := 0; cur_blank := 0; 
        while(min.prov_code = rec_m.prov_code)do
        begin
            cur_valid := cur_valid + min.valid; 
            cur_invalid := cur_invalid + min.invalid; 
            cur_blank := cur_blank + min.blank;
            minCode(arr, min, dets);
        end;
        //Update master register
        rec_m.valid := rec_m.valid + cur_valid; 
        rec_m.invalid := rec_m.invalid + cur_invalid;
        rec_m.blank := rec_m.blank + cur_blank;
        seek(master, FilePos(master)-1);
        write(master, rec_m);

        //Update tot votes
        tot_valid := tot_valid + cur_valid;
        tot_invalid := tot_invalid + cur_invalid;
        tot_blank := tot_blank + cur_blank;
    end;

    for i:= 1 to N do
        close(dets[i]);
    close(master);
    tot_votes := tot_valid + tot_invalid + tot_blank;

    Writeln(txt, 'Amount of files processed: ', N);
    Writeln(txt, 'Total votes: ', tot_votes);
    Writeln(txt, 'Total valid votes: ', tot_valid);
    Writeln(txt, 'Total invalid votes: ', tot_invalid);
    Writeln(txt, 'Total blank votes: ', tot_blank);

    close(txt);

end;


procedure generateFiles(var dets: det_file_array; var master: master_file);
var
    i: integer;
    rec_m: votes_master;
    rec_d: votes_detail;
begin
    rewrite(master);
    for i:= 1 to N do
    begin
        rec_m.prov_code := i;
        rec_m.prov_name := 'Province ' + IntToStr(i);
        rec_m.valid := 0;
        rec_m.invalid := 0;
        rec_m.blank := 0;
        write(master, rec_m);
    end;

    for i:= 1 to N do
    begin
        rewrite(dets[i]);
        rec_d.prov_code := i;
        rec_d.loc_code := 1;
        rec_d.valid := 10;
        rec_d.invalid := 2;
        rec_d.blank := 3;
        write(dets[i], rec_d);
        rec_d.loc_code := 2;
        rec_d.valid := 5;
        rec_d.invalid := 1;
        rec_d.blank := 1;
        write(dets[i], rec_d);
        close(dets[i]);
    end;
    close(master);
end;


var
    dets: det_file_array;
    master: master_file;
    txt: text;
    rec_d: votes_detail;
    rec_m: votes_master;
    i, j: integer;
begin
    for i:= 1 to N do
        assign(dets[i], '../tmp/Ej1/det' + IntToStr(i) + '.dat');
    assign(master, '../tmp/Ej1/master.dat');
    assign(txt, '../tmp/Ej1/votes.txt');
    generateFiles(dets, master);
    for i:= 1 to N do begin
        Writeln('Detail File ', i);
        reset(dets[i]);
        while(not Eof(dets[i]))do
        begin
            read(dets[i], rec_d);
            writeln('Province code: ', rec_d.prov_code);
            writeln('Location code: ', rec_d.loc_code);
            writeln('Valid votes: ', rec_d.valid);
            writeln('Invalid votes: ', rec_d.invalid);
            writeln('Blank votes: ', rec_d.blank);
            Writeln;
        end;
        Writeln('-------------------');
        close(dets[i]);
    end;
    updateMaster(master, dets, txt);
    Reset(master);
    while(not eof(master))do
    begin
        read(master, rec_m);
        writeln('Province code: ', rec_m.prov_code);
        writeln('Province name: ', rec_m.prov_name);
        writeln('Valid votes: ', rec_m.valid);
        writeln('Invalid votes: ', rec_m.invalid);
        writeln('Blank votes: ', rec_m.blank);
        Writeln;
    end;
    close(master);
end.

