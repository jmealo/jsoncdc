\set ECHO none
SET client_min_messages TO error;
\t on
\x off
SELECT 'created logical replication slot' FROM pg_create_logical_replication_slot('jsoncdc', 'jsoncdc');
CREATE SCHEMA IF NOT EXISTS jsoncdc;
SET LOCAL search_path TO jsoncdc, public;
BEGIN;
SELECT 'msg1' FROM pg_logical_emit_message(true, 'jsoncdc', 'msg1');
SELECT 'msg2' FROM pg_logical_emit_message(false, 'jsoncdc', 'msg2');
SELECT 'msg3' FROM pg_logical_emit_message(true, 'jsoncdc', 'msg3');
SELECT 'msg4' FROM pg_logical_emit_message(false, 'jsoncdc', 'msg4');
SELECT 'msg5' FROM pg_logical_emit_message(true, 'jsoncdc', 'msg5');
SELECT 'msg6' FROM pg_logical_emit_message(false, 'jsoncdc', 'msg6');
SELECT 'msg7' FROM pg_logical_emit_message(true, 'jsoncdc', 'msg7');
SELECT 'žluťoučký kůň' FROM pg_logical_emit_message(false, 'jsoncdc', 'žluťoučký kůň');
COMMIT;
SELECT 'deleted logical replication slot'
  FROM pg_drop_replication_slot('jsoncdc');
DROP SCHEMA jsoncdc CASCADE;
