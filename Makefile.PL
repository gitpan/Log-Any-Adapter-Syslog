
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "send Log::Any logs to syslog",
  "AUTHOR" => "Daniel Pittman <daniel\@rimspace.net>",
  "BUILD_REQUIRES" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "Log::Any" => 0,
    "Log::Any::Adapter" => 0,
    "Test::Exception" => 0,
    "Test::MockModule" => 0,
    "Test::More" => "0.88",
    "Test::Warn" => 0,
    "vars" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Log-Any-Adapter-Syslog",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Log::Any::Adapter::Syslog",
  "PREREQ_PM" => {
    "Carp" => 0,
    "File::Basename" => 0,
    "Log::Any::Adapter::Base" => 0,
    "Log::Any::Adapter::Util" => 0,
    "Unix::Syslog" => 0,
    "base" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.3",
  "test" => {
    "TESTS" => "t/*.t t/options/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



