use inc::Module::Install;
name 'Git-Repository-Plugin-Config';
all_from 'lib/Git/Repository/Plugin/Config.pm';

requires 'Git::Repository' => '1.25';
requires 'Config::Tiny'    => '2.14';

test_requires 'Test::More' => '0.98';
test_requires 'Test::Git'  => '1.01';

tests 't/*.t t/*/*.t';
author_tests 'xt';

auto_include;
WriteAll;
