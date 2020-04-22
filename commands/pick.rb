# frozen_string_literal: true

class Nguway::Commands::Pick
  extend Nguway::Command

  command 'pick'
  usage '`!% <start> <end>` - Picks a number/letter between start and end'
  handle_help

  match_command /(\d+|[a-z])\s+(\d+|[a-z])/
  match_empty :help_message

  def execute(m, start, ending)
    start, ending = [start, ending].map(&:upcase).map { |c| c.to_i.positive? ? c.to_i : c }.sort
    m.reply((start..ending).to_a.sample)
  end
end
