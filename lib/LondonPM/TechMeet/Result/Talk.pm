use utf8;
package LondonPM::TechMeet::Result::Talk;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

LondonPM::TechMeet::Result::Talk

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<talk>

=cut

__PACKAGE__->table("talk");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 title

  data_type: 'varchar'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "title",
  { data_type => "varchar", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 presentations

Type: has_many

Related object: L<LondonPM::TechMeet::Result::Presentation>

=cut

__PACKAGE__->has_many(
  "presentations",
  "LondonPM::TechMeet::Result::Presentation",
  { "foreign.talk_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07048 @ 2018-06-02 20:20:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yOaGDTUM1hEGHsqxDfIhhQ

__PACKAGE__->many_to_many(
  meetings => presentation => 'meeting',
);

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
