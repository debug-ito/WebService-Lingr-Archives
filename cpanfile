
requires 'perl', '5.010';
requires 'Furl', '2.18';
requires 'JSON', '2.53';
requires 'URI',  '1.59';
requires "Carp";

on test => sub {
    requires 'Test::Exception',    '0.31';
    requires 'Test::MockObject',   '1.20120301';
    requires 'Test::More',         '0.98';
    requires 'Try::Tiny',          '0.16';
    requires "lib";
    requires "List::Util";
    requires "Exporter";
};

on 'configure' => sub {
    requires 'Module::Build::Pluggable',           '0.09';
    requires 'Module::Build::Pluggable::CPANfile', '0.02';
};

