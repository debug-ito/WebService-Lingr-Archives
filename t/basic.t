use strict;
use warnings;
use Test::More;
use FindBin;
use lib ("$FindBin::RealBin");
use testlib::MockLingr qw(mock_useragent);

use WebService::Lingr::Archives;

my $DEFAULT_BEFORE = 99999999;

my $SID = $testlib::MockLingr::SESSION_ID;
my $USER = $testlib::MockLingr::USERNAME;
my $PASS = $testlib::MockLingr::PASSWORD;
my $ROOM = $testlib::MockLingr::ROOM;

sub create_lingr {
    my ($ua) = @_;
    return WebService::Lingr::Archives->new(
        user => $USER,
        password => $PASS,
        user_agent => $ua
    );
}

foreach my $case (
    {label => "no option", options => [], exp_max_id => $testlib::MockLingr::MAX_MESSAGE_ID,
     exp_request => "http://lingr.com/api/room/get_archives?session=$SID&room=$ROOM&before=$DEFAULT_BEFORE"},
    {label => "before option", options => [{before => 300}], exp_max_id => 299,
     exp_request => "http://lingr.com/api/room/get_archives?session=$SID&room=$ROOM&before=300"},
    {label => "before and limit options", options => [{before => 100, limit => 10}],
     exp_max_id => 99,
     exp_request => "http://lingr.com/api/room/get_archives?session=$SID&room=$ROOM&before=100&limit=10"}
){
    note("--- request archives API: case: $case->{label}");
    my $ua = mock_useragent();
    my $lingr = create_lingr($ua);
    my @messages = $lingr->get_archives($ROOM, @{$case->{options}});
    cmp_ok(int(@messages), ">", 0, "got at least 1 message");
    is($messages[-1]{id}, $case->{exp_max_id}, "max message id OK");

    my ($method, $args) = $ua->next_call();
    is($method, "get", "request method OK");
    is($args->[1],
       "http://lingr.com/api/session/create?user=$USER&password=$PASS",
       "request URL ok");

    ($method, $args) = $ua->next_call();
    is($method, "get", "request method OK");
    is($args->[1], $case->{exp_request}, 'request URL OK');

    ($method, $args) = $ua->next_call();
    is($method, undef, "no more call");
}

fail("TODO: email address as user param");
fail("TODO: test api_key param");

done_testing();

