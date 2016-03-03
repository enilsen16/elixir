defmodule SipsMatcher do
  @behaviour :gen_fsm

  def start_link do
    {:ok, fsm} = :gen_fsm.start_link(__MODULE__, [], [])
    fsm
  end

  def consume_s(fsm) do
    :gen_fsm.sync_send_event(fsm, :s)
  end

  def consume_not_s(fsm) do
    :gen_fsm.sync_send_event(fsm, :not_s)
  end

  def consume_i(fsm) do
    :gen_fsm.sync_send_event(fsm, :i)
  end

  def consume_p(fsm) do
    :gen_fsm.sync_send_event(fsm, :p)
  end

  def got_s(:i, _from, state_data) do
    { :reply, :got_si, :got_si, state_data }
  end

  def got_si(:p, _from, state_data) do
    { :reply, :got_sip, :got_sip, state_data }
  end

  def got_sip(:s, _from, state_data) do
    { :reply, :got_sips, :got_sips, state_data }
  end

  def got_sip(:not_s, _from, state_data) do
    { :reply, :starting, :starting, state_data }
  end

  def got_sips(_, _from, state_data) do
    { :reply, :got_sips, :got_sips, state_data }
  end

### API
  def init(_) do
    { :ok, :starting, [] }
  end

  def starting(:s, _from, state_data) do
    { :reply, :got_s, :got_s, state_data }
  end

  def starting(:not_s, _from, state_data) do
    { :reply, :starting, :starting, state_data }
  end
end

defmodule SipsMatcherTest do
  use ExUnit.Case

  test "[:starting] it successfully consumes the string 's'" do
    fsm = SipsMatcher.start_link
    assert SipsMatcher.consume_s(fsm) == :got_s
  end

  test "[:starting] it successfully consumes strings other than 's'" do
    fsm = SipsMatcher.start_link
    assert SipsMatcher.consume_not_s(fsm) == :starting
  end

  test "it successfully consumes the string 'sips'" do
    fsm = SipsMatcher.start_link
    SipsMatcher.consume_s(fsm)
    SipsMatcher.consume_i(fsm)
    SipsMatcher.consume_p(fsm)
    assert SipsMatcher.consume_s(fsm) == :got_sips
  end

  test "it successfully consumes strings without a match" do
    fsm = SipsMatcher.start_link
    SipsMatcher.consume_s(fsm)
    SipsMatcher.consume_i(fsm)
    SipsMatcher.consume_p(fsm)
    assert SipsMatcher.consume_not_s(fsm) == :starting
  end

  test "it can't fall out of the `got_sips` state" do
    fsm = SipsMatcher.start_link
    SipsMatcher.consume_s(fsm)
    SipsMatcher.consume_i(fsm)
    SipsMatcher.consume_p(fsm)
    SipsMatcher.consume_s(fsm)
    assert SipsMatcher.consume_i(fsm) == :got_sips
  end
end
