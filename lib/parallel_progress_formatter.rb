require 'drb/drb'
require 'rspec/core/formatters/base_text_formatter'

class ParallelProgressFormatter < RSpec::Core::Formatters::BaseTextFormatter
  RSpec::Core::Formatters.register self, :example_passed, :example_pending, :example_failed, :dump_summary, :dump_failures

  def initialize(*args)
    super
    drb_uri = "druby://localhost:9999"
    @drb_server = DRbObject.new_with_uri(drb_uri)
  end

  def seed(_notification)
  end

  def example_passed(_notification)
    output.print RSpec::Core::Formatters::ConsoleCodes.wrap('.', :success)
    output.flush
  end

  def example_pending(_notification)
    output.print RSpec::Core::Formatters::ConsoleCodes.wrap('*', :pending)
    output.flush
  end

  def example_failed(notification)
    output.print RSpec::Core::Formatters::ConsoleCodes.wrap('F', :failure)
    output.flush
  end

  def dump_summary(notification)
    @drb_server.add_example_count(notification.example_count)
    @drb_server.add_failure_count(notification.failure_count)
    @drb_server.add_pending_count(notification.pending_count)
    @drb_server.add_rerun_commands(rerun_commands(notification))
  end

  def dump_failures(notification)
    if notification.failed_examples.any?
      @drb_server.add_failure_messages([drop_lines(notification.fully_formatted_failed_examples, 2)])
    end
  end

  def dump_pending(notification)
    if notification.pending_examples.any?
      @drb_server.add_pending_messages([drop_lines(notification.fully_formatted_pending_examples, 2)])
    end
  end

  def start(_)
  end

  def close(_)
  end

  private

  def drop_lines(input, lines_to_drop)
    input.split("\n").drop(lines_to_drop).join("\n")
  end

  def rerun_commands(notification)
    notification.colorized_rerun_commands
      .split("\n")
      .drop(3)
  end
end
