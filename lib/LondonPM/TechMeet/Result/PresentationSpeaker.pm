use utf8;
package LondonPM::TechMeet::Result::PresentationSpeaker;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

LondonPM::TechMeet::Result::PresentationSpeaker

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

=head1 TABLE: C<presentation_speaker>

=cut

__PACKAGE__->table("presentation_speaker");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 presentation_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 speaker_id

  data_type: 'integer not_null'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "presentation_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "speaker_id",
  { data_type => "integer not_null", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 presentation

Type: belongs_to

Related object: L<LondonPM::TechMeet::Result::Presentation>

=cut

__PACKAGE__->belongs_to(
  "presentation",
  "LondonPM::TechMeet::Result::Presentation",
  { id => "presentation_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 speaker

Type: belongs_to

Related object: L<LondonPM::TechMeet::Result::Speaker>

=cut

__PACKAGE__->belongs_to(
  "speaker",
  "LondonPM::TechMeet::Result::Speaker",
  { id => "speaker_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07048 @ 2018-06-02 20:20:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kihGPlqhJCzCqAGetS5jGw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
