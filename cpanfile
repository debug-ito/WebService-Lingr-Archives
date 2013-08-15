
requires "perl" => "v5.10.0";
requires "Furl";
requires "Carp";
requires 'URI';
requires "JSON";

on 'test' => sub {
    requires 'Test::More';
    requires "FindBin";
    requires "Exporter";
    requires "Test::MockObject";
    requires "URI";
    requires "JSON";
    requires "Try::Tiny";
    requires "List::Util";
    requires "lib";
};
