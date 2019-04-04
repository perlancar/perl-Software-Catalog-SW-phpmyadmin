package Software::Catalog::SW::phpmyadmin;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Role::Tiny::With;
with 'Versioning::Scheme::Dotted';
with 'Software::Catalog::Role::Software';

use Software::Catalog::Util qw(extract_from_url);

sub meta {
    return {
        homepage_url => "https://www.phpmyadmin.net/",
    };
}

sub get_latest_version {
    my ($self, %args) = @_;

    extract_from_url(
        url => "https://www.phpmyadmin.net/",
        re  => qr! <a [^>]*href="https://files.phpmyadmin.net/phpMyAdmin/(\d+(?:\.\d+)*)/!,
    );
}

sub canon2native_arch_map {
}

sub get_download_url {
    my ($self, %args) = @_;

    my $version = $args{version} // $self->get_latest_version;

    [200, "OK", "https://files.phpmyadmin.net/phpMyAdmin/$version/phpMyAdmin-$version-all-languages.zip"];
}

sub get_archive_info {
    my ($self, %args) = @_;
    [200, "OK", {
        programs => [
            {name=>"firefox", path=>"/"},
        ],
    }];
}

1;
# ABSTRACT: Firefox

=for Pod::Coverage ^(.+)$
