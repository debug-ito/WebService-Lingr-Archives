use strict;
use warnings;
use Test::More;
use FindBin;
use lib ("$FindBin");
use testlib::MockLing qw(mock_useragent)r;

use WebService::Lingr::Archives;

sub create_lingr {
    my ($ua) = @_;
    return WebService::Lingr::Archives->new(
        user => $testlib::MockLingr::USERNAME,
        password => $testlib::MockLingr::PASSWORD,
        user_agent => $ua
    );
}

{
    my $ua = mock_useragent();
    my $lingr = create_lingr($ua);
    my @messages = $ua->get_archives($testlib::MockLingr::ROOM);
    cmp_ok(int(@messages), ">", 0, "got at least 1 message");
    my $m = $messages[0];
    is($m->{id}, $testlib::MockLingr::MAX_MESSAGE_ID, "max message id OK");

    fail('TODO: examine $ua to check it sent appropriate requests.');
}

fail('TODO: do with various options pattern.');


done_testing();

