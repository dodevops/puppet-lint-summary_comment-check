# frozen_string_literal: true

require 'spec_helper'

describe 'summary_comment' do
  context 'code containing the summary' do
    let(:code) { "# @summary\n#   Test" }

    it 'should not detect any problems' do
      expect(problems).to have(0).problems
    end
  end

  context 'empty code' do
    let(:code) { '' }
    it 'should detect a single problem' do
      expect(problems).to have(1).problem
    end

    it 'should create a warning' do
      expect(problems).to contain_warning('Not enough tokens').on_line(1).in_column(1)
    end
  end

  context 'code not containing a head comment' do
    let(:code) { '\n\n\n' }
    it 'should detect a single problem' do
      expect(problems).to have(1).problem
    end

    it 'should create a warning' do
      expect(problems).to contain_warning('No header comment found').on_line(1).in_column(1)
    end
  end

  context 'code not containing the summary' do
    let(:code) { "# Test\n#" }

    it 'should detect a single problem' do
      expect(problems).to have(1).problem
    end

    it 'should create a warning' do
      expect(problems).to contain_warning('Summary line not found').on_line(1).in_column(1)
    end
  end

  context 'code containing the summary in the same line' do
    let(:code) { "# @summary Test\n#" }

    it 'should detect a single problems' do
      expect(problems).to have(1).problems
    end

    it 'should create a warning' do
      expect(problems).to contain_warning('Summary line contains summary text.')
                            .on_line(1)
                            .in_column(1)
    end
  end

  context 'code only containing the summary comment' do
    let(:code) { "# @summary\n\n" }

    it 'should detect a single problems' do
      expect(problems).to have(1).problems
    end

    it 'should create a warning' do
      expect(problems).to contain_warning('No comment after summary').on_line(2).in_column(1)
    end
  end

  context 'code containing the summary comment but no indented summary' do
    let(:code) { "# @summary\n#" }

    it 'should detect a single problems' do
      expect(problems).to have(1).problems
    end

    it 'should create a warning' do
      expect(problems).to contain_warning('No summary found').on_line(2).in_column(1)
    end
  end
end
