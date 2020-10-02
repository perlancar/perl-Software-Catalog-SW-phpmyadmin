package Software::Catalog::SW::phpmyadmin;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

use Role::Tiny::With;
with 'Versioning::Scheme::Dotted';
with 'Software::Catalog::Role::Software';

use Software::Catalog::Util qw(extract_from_url);

sub archive_info {
    my ($self, %args) = @_;
    [200, "OK", {
        programs => [],
    }];
}

sub available_versions { [501, "Not implemented"] }

sub canon2native_arch_map {
}

sub download_url {
    my ($self, %args) = @_;

    my $version = $args{version} // $self->get_latest_version->[2];

    [200,
     "OK",
     "https://files.phpmyadmin.net/phpMyAdmin/$version/phpMyAdmin-$version-all-languages.zip",
     {'func.arch' => 'src'}];
}

sub homepage_url { "https://www.phpmyadmin.net/" }

sub is_dedicated_profile { 0 }

sub latest_version {
    my ($self, %args) = @_;

    extract_from_url(
        url => "https://www.phpmyadmin.net/",
        re  => qr! <a [^>]*href="https://files.phpmyadmin.net/phpMyAdmin/(\d+(?:\.\d+)*)/!,
    );
}

sub release_note { [501, "Not implemented"] }

1;
# ABSTRACT: phpMyAdmin

=for Pod::Coverage ^(.+)$
