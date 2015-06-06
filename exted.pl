#!/usr/bin/env perl
use Purple;
use strict;
use warnings;
use File::Temp;

our %PLUGIN_INFO = (
 perl_api_version		=> 2,
 name				=> 'exted',
 version			=> '0.2',
 summary			=> 'external editor',
 description		=> 'external editor',
 author			=> 'Dmitry Sukhodoyev <raven428@gmail.com>',
 url				=> 'http://pidgin.im',
 load				=> 'plugin_load',
);

sub plugin_init {
 return %PLUGIN_INFO;
}

sub exted {
 my($conv, $cmd, $data, @args) = @_;
 my $filename = File::Temp::mktemp('/var/tmp/extedXXXXX');
 system("$ENV{EDITOR} $filename");
 my $text = `/bin/cat $filename`;
 unlink($filename);
 $text =~ s/[\n\r]+$//;
 $conv->do_command("say $text", '', 0);
 return Purple::Cmd::Return::OK;
}

sub plugin_load {
 my $plugin = shift;
 Purple::Cmd::register(
  $plugin,
  'exted',
  'ws',
  Purple::Cmd::Priority::DEFAULT,
  Purple::Cmd::Flag::IM |
  Purple::Cmd::Flag::CHAT |
  Purple::Cmd::Flag::ALLOW_WRONG_ARGS,
  0,
  \&exted,
  'run $EDITOR to edit message',
  $plugin
 );
}
