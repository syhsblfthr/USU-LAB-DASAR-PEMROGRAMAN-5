program yes;
uses crt, sysutils;

var is_member_ch : char;
var is_member: boolean;
var metode_pembayaran: string;
var total_belanja, pajak, potongan: real;
var minyak, beras, gula, kecap, telur : real;

begin
    write('Apakah kamu member? ');
    readln(is_member_ch);

    is_member := false;

    if ((is_member_ch = 'y') or (is_member_ch = 'Y')) then
        is_member := true;

    write('Metode pembayaran: ');
    readln(metode_pembayaran);

    if ((metode_pembayaran <> 'qris') and (metode_pembayaran <> 'debit') and (metode_pembayaran <> 'tunai')) then
    begin
        write('yang benar aja');
        exit;
    end;

    write('Minyak: ');
    read(minyak);

    write('Beras: ');
    read(beras);

    write('Gula: ');
    read(gula);

    write('Kecap: ');
    read(kecap);

    write('Telur: ');
    read(telur);

    total_belanja := (minyak * 20000) + (beras * 25000) + (gula * 18000) + (kecap * 15000) + (telur * 3000);
    pajak := total_belanja * 10 / 100;
    potongan := 0;

    if (total_belanja > 200000) then
        potongan := 15000;
    
    if (metode_pembayaran = 'qris') then
        potongan := potongan + 10000
    else if (metode_pembayaran = 'debit') then
        potongan := potongan + 15000
    else if (metode_pembayaran = 'tunai') then
        potongan := potongan + 5000;

    writeln('Daftar harga barang: ');
    writeln('Minyak: Rp 20.000');
    writeln('Beras: Rp 25.000');
    writeln('Gula: Rp 18.000');
    writeln('Kecap: Rp 15.000');
    writeln('Telur: Rp 3.000');

    writeln();

    writeln('Total harga sebelum potongan dan pajak: ', total_belanja : 0 : 2);

    if (is_member = true) then
        writeln('Total harga akhir setelah semua potongan dan pajak: ', total_belanja - potongan : 0 : 2)
    else
        writeln('Total harga akhir setelah semua potongan dan pajak: ', total_belanja + pajak - potongan : 0 : 2);

    if (is_member = true) then
        writeln('Anda adalah member!')
    else
        writeln('Anda bukan member!');

    writeln('Jenis metode pembyaran yang dipakai: ', metode_pembayaran);
end.
