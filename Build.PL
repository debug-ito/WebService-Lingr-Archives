use 5.006;
use strict;
use warnings;
use Module::Build;
use Module::Build::Prereqs::FromCPANfile;
 
Module::Build->new(
    module_name         => 'WebService::Lingr::Archives',
    license             => 'perl',
    dist_author         => q{Toshio Ito <toshioito@cpan.org>},
    dist_version_from   => 'lib/WebService/Lingr/Archives.pm',
    release_status      => 'stable',
    add_to_cleanup     => [ 'WebService-Lingr-Archives-*' ],
    recursive_test_files => 1,
    dynamic_config => 1,
    (-d "share") ? (share_dir => "share") : (),
    
    mb_prereqs_from_cpanfile(),
    
    no_index => {
        directory => ["t", "xt", "eg", "inc"],
        file => ['README.pod'],
    },
    meta_add => {
        'meta-spec' => {
            version => 2,
            url => 'https://metacpan.org/pod/CPAN::Meta::Spec',
        },
        resources => {
            bugtracker => {
                web => 'https://github.com/debug-ito/WebService-Lingr-Archives/issues',
            },
            repository => {
                url => 'git://github.com/debug-ito/WebService-Lingr-Archives.git',
                web => 'https://github.com/debug-ito/WebService-Lingr-Archives',
            },
        }
    }
)->create_build_script();
