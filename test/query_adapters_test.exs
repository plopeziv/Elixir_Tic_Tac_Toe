defmodule QueryAdaptersTest do
  use ExUnit.Case, async: false
  # import ExUnit.CaptureIO
  # import Mock
  # doctest QueryAdapters

#   test "Query for Player" do
#     assert QueryAdapters._query_player_token("Matt") == "M"
#   end

#   test "Is player in database returns True" do
#     assert QueryAdapters._is_player_in_db("Pedro") == true
#   end

#   test "Is player in database returns False" do
#     assert QueryAdapters._is_player_in_db("Sunny") == false
#   end

#   test "Ability to remove players" do
#     QueryAdapters._remove_player("Pedro")

#     assert QueryAdapters._is_player_in_db("Pedro") == false

#     QueryAdapters._create_player("Pedro", "P")
#   end

#   test "Remove player  does nothing if player is not in database" do
#     assert QueryAdapters._remove_player("Chuck") == nil
#   end

#   test "New player is inserted to the database" do
#     assert QueryAdapters._create_player("Brandon", "B")

#     assert QueryAdapters._is_player_in_db("Brandon") == true

#     QueryAdapters._remove_player("Brandon")
#   end

#   test "New player  does nothing if player is in database" do
#     assert QueryAdapters._create_player("Pedro", "G") == nil
#   end

# end
