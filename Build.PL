use 5.10.0;
use strict;
use warnings FATAL => 'all';
use Module::Build::Pluggable (
    'CPANfile'
);

my $builder = Module::Build::Pluggable->new(
    module_name         => 'WebService::Lingr::Archives',
    license             => 'perl',
    dist_author         => q{Toshio Ito <toshioito@cpan.org>},
    dist_version_from   => 'lib/WebService/Lingr/Archives.pm',
    release_status      => 'stable',
    add_to_cleanup     => [ 'WebService-Lingr-Archives-*' ],
    no_index => {
        directory => ["t", "xt", "eg", "inc"]
    },
    meta_add => {
        resources => {
            repository => 'git://github.com/debug-ito/WebService-Lingr-Archives.git'
        }
    }
);

$builder->create_build_script();
