defmodule Queuer do
  use GenServer

  # PUBLIC API
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def add(pid, item) do
    pid |> GenServer.call({:add, item})
  end

  def remove(pid) do
    pid |> GenServer.call(:remove)
  end

  def reset(pid) do
    pid |> GenServer.call(:reset)
  end

  def get(pid) do
    pid |> GenServer.call(:get)
  end

  # CALLBACKS
  def init(:ok) do
    {:ok, []}
  end

  def handle_call({:add, item}, _from, state) do
    new_list = List.insert_at(state, 0, item)
    {:reply, "#{item} added to queue", new_list}
  end

  def handle_call(:remove, _from, state) do
    new_list = List.delete_at(state, -1)
    {:reply, "#{List.last(state)} removed to queue", new_list}
  end

  def handle_call(:reset, _from, _state) do
    {:reply, "Queue reset", []}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

end
