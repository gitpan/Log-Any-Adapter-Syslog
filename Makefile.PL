
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Log::Any::Adapter::Syslog',
                       'DISTNAME' => 'Log-Any-Adapter-Syslog',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.31'
                                               },
                       'AUTHOR' => 'Daniel Pittman <daniel@rimspace.net>',
                       'BUILD_REQUIRES' => {
                                             'Test::More' => '0.88',
                                             'Scalar::Util' => '0',
                                             'perl' => '5.004',
                                             'File::Find' => '0',
                                             'File::Temp' => '0',
                                             'Carp' => '0'
                                           },
                       'ABSTRACT' => 'send Log::Any logs to syslog',
                       'EXE_FILES' => [],
                       'VERSION' => '1.0',
                       'PREREQ_PM' => {
                                        'Unix::Syslog' => '0',
                                        'Log::Any::Adapter::Base' => '0',
                                        'File::Basename' => '0',
                                        'Log::Any::Adapter::Util' => '0'
                                      },
                       'LICENSE' => 'perl'
                     );


delete $WriteMakefileArgs{BUILD_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.56) };

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



