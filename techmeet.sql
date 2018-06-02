DROP TABLE IF EXISTS venue;
CREATE TABLE venue (
  id integer primary key,
  name varchar not null
);

DROP TABLE IF EXISTS meeting;
CREATE TABLE meeting (
  id integer primary key,
  date text not null,
  venue_id integer not null,
  FOREIGN KEY (venue_id) REFERENCES venue(id)
);

DROP TABLE IF EXISTS talk;
CREATE TABLE talk (
  id integer primary key,
  title varchar not null
);

DROP TABLE IF EXISTS presentation;
CREATE TABLE presentation (
  id integer primary key,
  meeting_id integer not null,
  talk_id integer not null,
  FOREIGN KEY (meeting_id) REFERENCES meeting(id),
  FOREIGN KEY (talk_id) REFERENCES talk(id)
);

DROP TABLE IF EXISTS speaker;
CREATE TABLE speaker (
  id integer primary key,
  name varchar not null
);

DROP TABLE IF EXISTS presentation_speaker;
CREATE TABLE presentation_speaker (
  id integer primary key,
  presentation_id integer not null,
  speaker_id integer not_null,
  FOREIGN KEY (presentation_id) REFERENCES presentation(id),
  FOREIGN KEY (speaker_id) REFERENCES speaker(id)
);

