# frozen_string_literal: true

PuppetLint.new_check(:summary_comment) do
  def warn(message, line = 1)
    notify :warning, { message: message, line: line, column: 1 }
    false
  end

  def check_token_types
    return warn('No header comment found') unless tokens[0].type == :COMMENT
    return warn('No newline after summary', 2) unless tokens[1].type == :NEWLINE
    return warn('No comment after summary', 2) unless tokens[2].type == :COMMENT

    true
  end

  def check_tokens
    return warn('Summary line contains summary text.') if tokens[0].value =~ / @summary./
    return warn('Summary line not found') unless tokens[0].value == ' @summary'
    return warn('No summary found', 2) unless tokens[2].value =~ /^ {3}./

    true
  end

  def check
    return warn('Not enough tokens') if tokens.length < 3

    return unless check_token_types

    return unless check_tokens
  end
end
