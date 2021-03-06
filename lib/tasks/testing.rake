# frozen_string_literal: true
namespace :test do
  task lib: 'test:prepare' do
    $LOAD_PATH << 'test'
    Minitest.rake_run(['test/lib'])
  end

  task units: 'test:prepare' do
    $LOAD_PATH << 'test'
    Minitest.rake_run(['test/models', 'test/helpers', 'test/unit', 'test/lib'])
  end
end
