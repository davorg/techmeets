use utf8;
package LondonPM::TechMeet::Result::Presentation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

LondonPM::TechMeet::Result::Presentation

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

=head1 TABLE: C<presentation>

=cut

__PACKAGE__->table("presentation");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 meeting_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 talk_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "meeting_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "talk_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 meeting

Type: belongs_to

Related object: L<LondonPM::TechMeet::Result::Meeting>

=cut

__PACKAGE__->belongs_to(
  "meeting",
  "LondonPM::TechMeet::Result::Meeting",
  { id => "meeting_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 presentation_speakers

Type: has_many

Related object: L<LondonPM::TechMeet::Result::PresentationSpeaker>

=cut

__PACKAGE__->has_many(
  "presentation_speakers",
  "LondonPM::TechMeet::Result::PresentationSpeaker",
  { "foreign.presentation_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 talk

Type: belongs_to

Related object: L<LondonPM::TechMeet::Result::Talk>

=cut

__PACKAGE__->belongs_to(
  "talk",
  "LondonPM::TechMeet::Result::Talk",
  { id => "talk_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07048 @ 2018-06-02 20:20:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cL58H8fGXMWnMnaIkJCyxA

__PACKAGE__->many_to_many(
  speakers => presentation_speakers => 'speaker',
);

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
