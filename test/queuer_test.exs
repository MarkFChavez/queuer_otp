defmodule QueuerTest do
  use ExUnit.Case
  doctest Queuer

  test "adding to queue" do
    {_, pid} = Queuer.start_link
    assert Queuer.add(pid, "mark") == "mark added to queue"
  end

  test "removing to queue" do
    {_, pid} = Queuer.start_link
    Queuer.add(pid, "one")
    Queuer.add(pid, "two")

    assert Queuer.remove(pid) == "one removed to queue"
  end

  test "resetting the queue shows a helpful message" do
    {_, pid} = Queuer.start_link
    Queuer.add(pid, "one")
    Queuer.add(pid, "two")

    assert Queuer.reset(pid) == "Queue reset"
  end

  test "get the queue value" do
    {_, pid} = Queuer.start_link
    Queuer.add(pid, "one")
    Queuer.add(pid, "two")
    Queuer.add(pid, "three")
    Queuer.add(pid, "four")

    assert length(Queuer.get(pid)) == 4
  end

  test "resetting the queue, gives back an empty queue" do
    {_, pid} = Queuer.start_link
    Queuer.add(pid, "one")
    Queuer.add(pid, "two")
    Queuer.add(pid, "three")
    Queuer.add(pid, "four")

    Queuer.reset(pid)

    assert length(Queuer.get(pid)) == 0
  end

end
